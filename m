Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799496EA1B
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:37:24 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id l1so20134797pgm.1
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:37:24 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:36:14 -0500
Message-Id: <20210609173632.248880-32-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 31/93] tests/amdgpu/amd_prime: Convert to
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

Written totally blind but I'm pretty sure it's right.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/amdgpu/amd_prime.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
index 3e5cc1a7..248fbc35 100644
--- a/tests/amdgpu/amd_prime.c
+++ b/tests/amdgpu/amd_prime.c
@@ -173,6 +173,7 @@ static void unplug(struct cork *c)
 static void i915_to_amd(int i915, int amd, amdgpu_device_handle device)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	intel_ctx_cfg_t cfg;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	const struct intel_execution_engine2 *e;
@@ -181,8 +182,10 @@ static void i915_to_amd(int i915, int amd, amdgpu_device_handle device)
 	unsigned long count;
 	struct cork c;
 
+	cfg = intel_ctx_cfg_all_physical(i915);
+
 	nengine = 0;
-	__for_each_physical_engine(i915, e)
+	for_each_ctx_cfg_engine(i915, &cfg, e)
 		engines[nengine++] = e->flags;
 	igt_require(nengine);
 
@@ -199,14 +202,15 @@ static void i915_to_amd(int i915, int amd, amdgpu_device_handle device)
 
 	count = 0;
 	igt_until_timeout(5) {
-		execbuf.rsvd1 = gem_context_clone_with_engines(i915, 0);
+		const intel_ctx_t *ctx = intel_ctx_create(i915, &cfg);
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
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
