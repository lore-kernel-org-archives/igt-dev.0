Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2F76E19A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:19 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so627529pjb.1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:19 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:34 -0500
Message-Id: <20210413035350.261794-59-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 58/74] tests/i915/module_load: Convert to
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
