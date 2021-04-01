Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813186EC14
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 02:13:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id w8so287062pjf.4
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 19:13:21 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 31 Mar 2021 21:12:32 -0500
Message-Id: <20210401021243.4147604-20-jason@jlekstrand.net>
In-Reply-To: <20210401021243.4147604-1-jason@jlekstrand.net>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 19/30] tests/amdgpu/amd_prime: Convert to intel_ctx_t
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

Written totally blind but I'm pretty sure it's right.
---
 tests/amdgpu/amd_prime.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
index 537b0bcd..31ca209f 100644
--- a/tests/amdgpu/amd_prime.c
+++ b/tests/amdgpu/amd_prime.c
@@ -172,6 +172,7 @@ static void unplug(struct cork *c)
 static void i915_to_amd(int i915, int amd, amdgpu_device_handle device)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	intel_ctx_cfg_t cfg;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	const struct intel_execution_engine2 *e;
@@ -180,8 +181,10 @@ static void i915_to_amd(int i915, int amd, amdgpu_device_handle device)
 	unsigned long count;
 	struct cork c;
 
+	cfg = intel_ctx_cfg_all_physical(i915);
+
 	nengine = 0;
-	__for_each_physical_engine(i915, e)
+	for_each_ctx_cfg_engine(i915, &cfg, e)
 		engines[nengine++] = e->flags;
 	igt_require(nengine);
 
@@ -198,14 +201,15 @@ static void i915_to_amd(int i915, int amd, amdgpu_device_handle device)
 
 	count = 0;
 	igt_until_timeout(5) {
-		execbuf.rsvd1 = gem_context_clone_with_engines(i915, 0);
+		intel_ctx_t *ctx = intel_ctx_create(i915, &cfg);
+		execbuf.rsvd1 = ctx->id;
 
 		for (unsigned n = 0; n < nengine; n++) {
 			execbuf.flags = engines[n];
 			gem_execbuf(i915, &execbuf);
 		}
 
-		gem_context_destroy(i915, execbuf.rsvd1);
+		intel_ctx_destroy(i915, ctx);
 		count++;
 
 		if (!gem_uses_full_ppgtt(i915))
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
