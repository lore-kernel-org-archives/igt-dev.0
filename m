Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2658F89F71
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:38:13 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id t17so9099880pga.5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:38:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:58 -0500
Message-Id: <20210614163704.365989-44-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 43/77] tests/i915/module_load: Convert to
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
index 281454a5b..98ceb5d85 100644
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
