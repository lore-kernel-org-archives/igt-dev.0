Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F428C4828E
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 20:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEE610EE5A;
	Thu,  1 Feb 2024 20:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOmJ+VOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2795610EC7B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 20:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706817825; x=1738353825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pMOttkJC0sFfwQTKq6+XOGJNOFVS0wexjcP3BHxrqG4=;
 b=kOmJ+VOPMEyY4FDojlPjFRiB75fMf+pnLZp5EzvCvWxM2cIlttxc3k0L
 eIN7A+YBdRk6+hJOYvz4TP7o8NhL8EmuKLiebx0qm8za9smjjpKI7V+uT
 EzujSBWWoFx007Wu3Basuigf/BCzo03hG3ZJSIkrflA5cGKw9FpJH+0OA
 jzixyuY8sSktqj79gWVLlkvCA/rhuMh3/IdnIS6PYS9SpD1TLZV3H9D1W
 5zh1jq9CaDHVGKO0zuRM1ViRjLrV5sC6CFCV9W8YtSAHI29ZBtMsMrYDU
 Fvr0w62dl+F/UhFPx4fahojji/zROGLnyQCVddr1vUXboj1YKshKLrFD9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="191419"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="191419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4494245"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:03:42 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Drobnik <karolina.drobnik@intel.com>
Subject: [PATCH i-g-t v5 5/5] tests/xe_exercise_blt: Exercise small to large
 fast-copy blits
Date: Thu,  1 Feb 2024 21:03:12 +0100
Message-Id: <20240201200312.428474-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201200312.428474-1-zbigniew.kempczynski@intel.com>
References: <20240201200312.428474-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Testing blitter with large size like 512x512 may be not enough
to verify small or unaligned blits works properly. Add subtest
which spread fast-copy blits from small to large.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
---
v5: Remove double whitespace line (Karolina)
---
 tests/intel/xe_exercise_blt.c | 62 ++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index ddf9d188a7..253edec7fa 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -25,6 +25,10 @@
  *   Check fast-copy blit
  *   blitter
  *
+ * SUBTEST: fast-copy-inc-dimension
+ * Description:
+ *   Check fast-copy blit with sizes from small to large
+ *
  * SUBTEST: fast-copy-emit
  * Description:
  *   Check multiple fast-copy in one batch
@@ -40,6 +44,8 @@ static struct param {
 	bool print_surface_info;
 	int width;
 	int height;
+	int width_increment;
+	int width_steps;
 } param = {
 	.tiling = -1,
 	.write_png = false,
@@ -111,6 +117,7 @@ static int fast_copy_one_bb(int xe,
 }
 
 static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
+			   uint32_t width, uint32_t height,
 			   uint32_t region1, uint32_t region2,
 			   enum blt_tiling_type mid_tiling)
 {
@@ -122,7 +129,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
 	uint64_t ahnd = intel_allocator_open_full(xe, ctx->vm, 0, 0,
 						  INTEL_ALLOCATOR_SIMPLE,
 						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
-	uint32_t bb, width = param.width, height = param.height;
+	uint32_t bb;
 	int result;
 
 	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
@@ -170,6 +177,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
 }
 
 static void fast_copy(int xe, const intel_ctx_t *ctx,
+		      uint32_t width, uint32_t height,
 		      uint32_t region1, uint32_t region2,
 		      enum blt_tiling_type mid_tiling)
 {
@@ -181,7 +189,6 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
 						  INTEL_ALLOCATOR_SIMPLE,
 						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
 	uint32_t bb;
-	uint32_t width = param.width, height = param.height;
 	int result;
 
 	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
@@ -241,14 +248,20 @@ enum fast_copy_func {
 };
 
 static char
-	*full_subtest_str(char *regtxt, enum blt_tiling_type tiling,
+	*full_subtest_str(char *regtxt, uint32_t width, uint32_t height,
+			  enum blt_tiling_type tiling,
 			  enum fast_copy_func func)
 {
 	char *name;
 	uint32_t len;
 
-	len = asprintf(&name, "%s-%s%s", blt_tiling_name(tiling), regtxt,
-		       func == FAST_COPY_EMIT ? "-emit" : "");
+	if (!width || !height)
+		len = asprintf(&name, "%s-%s%s", blt_tiling_name(tiling), regtxt,
+			       func == FAST_COPY_EMIT ? "-emit" : "");
+	else
+		len = asprintf(&name, "%s-%s%s-%ux%u", blt_tiling_name(tiling), regtxt,
+			       func == FAST_COPY_EMIT ? "-emit" : "",
+			       width, height);
 
 	igt_assert_f(len >= 0, "asprintf failed!\n");
 
@@ -264,6 +277,7 @@ static void fast_copy_test(int xe,
 	};
 	struct igt_collection *regions;
 	void (*copy_func)(int xe, const intel_ctx_t *ctx,
+			  uint32_t width, uint32_t height,
 			  uint32_t r1, uint32_t r2, enum blt_tiling_type tiling);
 	intel_ctx_t *ctx;
 	int tiling;
@@ -286,16 +300,32 @@ static void fast_copy_test(int xe,
 
 			copy_func = (func == FAST_COPY) ? fast_copy : fast_copy_emit;
 			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
-			test_name = full_subtest_str(regtxt, tiling, func);
 
-			igt_dynamic_f("%s", test_name) {
-				copy_func(xe, ctx,
-					  region1, region2,
-					  tiling);
+			if (!param.width_increment) {
+				test_name = full_subtest_str(regtxt, 0, 0, tiling, func);
+				igt_dynamic_f("%s", test_name) {
+					copy_func(xe, ctx,
+						  param.width, param.height,
+						  region1, region2,
+						  tiling);
+				}
+				free(test_name);
+			} else {
+				for (int w = param.width;
+				     w < param.width + param.width_steps;
+				     w += param.width_increment) {
+					test_name = full_subtest_str(regtxt, w, w, tiling, func);
+					igt_dynamic_f("%s", test_name) {
+						copy_func(xe, ctx,
+							  w, w,
+							  region1, region2,
+							  tiling);
+					}
+					free(test_name);
+				}
 			}
 
 			free(regtxt);
-			free(test_name);
 			xe_exec_queue_destroy(xe, exec_queue);
 			xe_vm_destroy(xe, vm);
 			free(ctx);
@@ -367,6 +397,16 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		fast_copy_test(xe, set, FAST_COPY);
 	}
 
+	igt_describe("Check fast-copy with increment width/height");
+	igt_subtest_with_dynamic("fast-copy-inc-dimension") {
+		param.width = 1;
+		param.height = 1;
+		param.width_increment = 15;
+		param.width_steps = 512;
+
+		fast_copy_test(xe, set, FAST_COPY);
+	}
+
 	igt_describe("Check multiple fast-copy in one batch");
 	igt_subtest_with_dynamic("fast-copy-emit") {
 		fast_copy_test(xe, set, FAST_COPY_EMIT);
-- 
2.34.1

