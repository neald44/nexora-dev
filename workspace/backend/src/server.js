import Fastify from "fastify";

const app = Fastify({ logger: true });

app.get("/api/health", async () => {
  return { status: "ok", service: "nexora-backend" };
});

app.listen({ port: 3001, host: "0.0.0.0" });
