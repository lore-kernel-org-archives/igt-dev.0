Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583A16EC84
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:50:38 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id p12so36075656pgj.10
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:38 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:48:24 -0500
Message-Id: <20210423214853.876911-61-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 60/89] tests/i915/module_load: Convert to
 intel_ctx_t
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/i915_module_load.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index 03dec60d..35696366 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -64,6 +64,7 @@ static void store_all(int i915)
 		.buffer_count = 2,
 	};
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	int reloc_sz = sizeof(uint32_t);
 	unsigned int nengine, value;
 	void *cs;
@@ -88,7 +89,9 @@ static void store_all(int i915)
 
 	nengine = 0;
 	cs = gem_mmap__device_coherent(i915, obj[1].handle, 0, sz, PROT_WRITE);
-	__for_each_physical_engine(i915, e) {
+
+	ctx = intel_ctx_create_all_physical(i915);
+	for_each_ctx_engine(i915, ctx, e) {
 		uint64_t addr;
 
 		igt_assert(reloc.presumed_offset != -1);
@@ -103,6 +106,7 @@ static void store_all(int i915)
 		if (gen < 6)
 			execbuf.flags |= I915_EXEC_SECURE;
 		execbuf.flags |= I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT;
+		execbuf.rsvd1 = ctx->id;
 
 		memcpy(cs + execbuf.batch_start_offset, batch, sizeof(batch));
 		memcpy(cs + reloc.offset, &addr, reloc_sz);
@@ -121,6 +125,7 @@ static void store_all(int i915)
 	memset(engines, 0xdeadbeef, sizeof(engines));
 	gem_read(i915, obj[0].handle, 0, engines, nengine * sizeof(engines[0]));
 	gem_close(i915, obj[0].handle);
+	intel_ctx_destroy(i915, ctx);
 
 	for (i = 0; i < nengine; i++)
 		igt_assert_eq_u32(engines[i], i);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
