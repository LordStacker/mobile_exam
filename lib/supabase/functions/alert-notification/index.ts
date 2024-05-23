// import { createClient } from "npm:@supabase/supabase-js@2";

// interface AlertNotification {
//   id: string;
//   created_at: string;
//   alert_body: string;
// }

// interface WebhookPayload {
//   type: "INSERT";
//   table: string;
//   record: string;
//   schema: "public";
// }

// const supabase = createClient(
//   Deno.env.get("SUPABASE_URL")!,
//   Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
// );

// Deno.serve(async (req) => {
//   const payload: WebhookPayload = await req.json();

//   const {data} = await supabase.from('')

//   return new Response(JSON.stringify(data), {
//     headers: { "Content-Type": "application/json" },
//   });
// });
