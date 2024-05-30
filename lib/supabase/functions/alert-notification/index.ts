import { createClient } from "npm:@supabase/supabase-js@2";
import { JWT } from "npm:google-auth-library@9";

interface AlertNotification {
  id: string;
  user_id: string;
  created_at: string;
  alert_body: string;
}

interface WebhookPayload {
  type: "INSERT";
  table: string;
  record: AlertNotification;
  schema: "public";
  old_record: null | AlertNotification;
}

const supabase = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
);

Deno.serve(async (req) => {
  const payload: WebhookPayload = await req.json();

  const { data } = await supabase
    .from("user_tokens")
    .select("fcm_token")
    .eq("user_id", payload.record.user_id)
    .single();
  const fcmToken = data!.fcm_token as string;

  const { default: serviceAccount } = await import("../service-account.json", {
    with: { type: "json" },
  });

  const accessToken = await getAccessToken({
    clientEmail: serviceAccount.client_email,
    privateKey: serviceAccount.private_key,
  });

  const res = await fetch(
    `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${accessToken}`,
      },
      body: JSON.stringify({
        message: {
          token: fcmToken,
          notification: {
            title: payload.record.created_at,
            body: payload.record.alert_body,
          },
        },
      }),
    }
  );

  const resData = await res.json();
  if (resData.status < 200 || 299 < resData.status) {
    throw resData;
  }

  return new Response(JSON.stringify(resData), {
    headers: { "Content-Type": "application/json" },
  });
});

const getAccessToken = ({
  clientEmail,
  privateKey,
}: {
  clientEmail: string;
  privateKey: string;
}): Promise<string> => {
  return new Promise((resolve, reject) => {
    const jwtClient = new JWT({
      email: clientEmail,
      key: privateKey,
      scopes: ["https://www.googleapis.com/auth/firebase.messaging"],
    });
    jwtClient.authorize((err, tokens) => {
      if (err) {
        reject(err);
        return;
      }
      resolve(tokens!.access_token!);
    });
  });
};
