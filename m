Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3FD89F4F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:39:24 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e1so6865288plh.8
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:39:24 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:38:45 -0500
Message-Id: <20210614163902.366168-11-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 60/77] tests/i915/gem_vm_create: Use
 intel_ctx_t in the execbuf test
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
 tests/i915/gem_vm_create.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
index 4b77920bc..3005d347c 100644
--- a/tests/i915/gem_vm_create.c
+++ b/tests/i915/gem_vm_create.c
@@ -220,9 +220,8 @@ static void execbuf(int i915)
 		.buffers_ptr = to_user_pointer(&batch),
 		.buffer_count = 1,
 	};
-	struct drm_i915_gem_context_param arg = {
-		.param = I915_CONTEXT_PARAM_VM,
-	};
+	intel_ctx_cfg_t cfg = {};
+	const intel_ctx_t *ctx;
 
 	/* First verify that we try to use "softpinning" by default */
 	batch.offset = 48 << 20;
@@ -230,20 +229,24 @@ static void execbuf(int i915)
 	igt_assert_eq_u64(batch.offset, 48 << 20);
 	gem_sync(i915, batch.handle);
 
-	arg.value = gem_vm_create(i915);
-	gem_context_set_param(i915, &arg);
+	cfg.vm = gem_vm_create(i915);
+	ctx = intel_ctx_create(i915, &cfg);
+	eb.rsvd1 = ctx->id;
 	gem_execbuf(i915, &eb);
 	igt_assert_eq_u64(batch.offset, 48 << 20);
-	gem_vm_destroy(i915, arg.value);
+	gem_vm_destroy(i915, cfg.vm);
+	intel_ctx_destroy(i915, ctx);
 
 	gem_sync(i915, batch.handle); /* be idle! */
 
-	arg.value = gem_vm_create(i915);
-	gem_context_set_param(i915, &arg);
+	cfg.vm = gem_vm_create(i915);
+	ctx = intel_ctx_create(i915, &cfg);
 	batch.offset = 0;
+	eb.rsvd1 = ctx->id;
 	gem_execbuf(i915, &eb);
 	igt_assert_eq_u64(batch.offset, 0);
-	gem_vm_destroy(i915, arg.value);
+	gem_vm_destroy(i915, cfg.vm);
+	intel_ctx_destroy(i915, ctx);
 
 	gem_sync(i915, batch.handle);
 	gem_close(i915, batch.handle);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
