Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1853C83F22
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 09:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537C810E13F;
	Thu, 17 Jul 2025 09:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+UAm05k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC5C10E13F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 09:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752744531; x=1784280531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R0EDRYJ7HgGxaodBudLeqhWwDfE2/krHqFbdZzx1gpU=;
 b=h+UAm05kerGphBmdFdiiOcryIRFhMv/aGDNIBmq+oadu7cthG730tZRn
 5nmOFthVoFxGYqi9TLnfMsCOu4F0RmYXZEkvQEvLeeoDsBUgidhK3R4MH
 xKH3YW5k+1kedNzqtAfCYuHQwF0tWB51g58lvpZLZdiDSXtsDntOGHbsO
 SUSPROQ/2W2QKzI6A4T4EHFgRMp5rd1U6E5mgXc00nVEzmdJ+WXdK2SP1
 TzZufQlFIDDNMRGZx9D0L03x8rfJaJeLIUhq+XmSBiWTr/sITtVazEfAo
 xdl9HAnNIqHqVAwkKY5dfW1aCU8J1T8eIFK3HauW1D3icUffFr2/divah A==;
X-CSE-ConnectionGUID: fF8B9XiSRM+QVnhXIgnpTQ==
X-CSE-MsgGUID: A/JX0u1YRrSW2IW2TVVdlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54872003"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="54872003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 02:28:50 -0700
X-CSE-ConnectionGUID: OtUUcxN1QK+sgc0I9fa0Yw==
X-CSE-MsgGUID: 6hYbZV5cTsGcfdUbx2Vixg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="162039845"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2025 02:28:48 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/intel/kms_frontbuffer_tracking: Reduce test
 complexity for simulation
Date: Thu, 17 Jul 2025 15:06:33 +0530
Message-Id: <20250717093633.1293628-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Reduce the number of iterations, draw_method combinations, and limit
execution to a single pipe to enable this test to run on simulation.

v2:
- Cache igt_run_in_simulation() in a global variable (Santhosh)
- Reduce the duration of the loops (Jonathan)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 66dcdc281..061e996cc 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -890,6 +890,9 @@ struct test_mode {
 	enum igt_draw_method method;
 };
 
+static bool in_simulation;
+static int r_max;
+
 enum color {
 	COLOR_RED,
 	COLOR_GREEN,
@@ -2858,6 +2861,7 @@ static void multidraw_subtest(const struct test_mode *t)
 	struct fb_region *target;
 	enum igt_draw_method m1, m2, used_method;
 	bool wc_used = false;
+	int draw_count, pattern_rects;
 
 	switch (t->plane) {
 	case PLANE_PRI:
@@ -2874,8 +2878,11 @@ static void multidraw_subtest(const struct test_mode *t)
 	prepare_subtest(t, pattern);
 	target = pick_target(t, params);
 
-	for (m1 = 0; m1 < IGT_DRAW_METHOD_COUNT; m1++) {
-		for (m2 = m1 + 1; m2 < IGT_DRAW_METHOD_COUNT; m2++) {
+	draw_count = in_simulation ? 1 : IGT_DRAW_METHOD_COUNT;
+	pattern_rects = in_simulation ? 1 : pattern->n_rects;
+
+	for (m1 = 0; m1 < draw_count; m1++) {
+		for (m2 = m1 + 1; m2 < draw_count; m2++) {
 
 			igt_debug("Methods %s and %s\n",
 				  igt_draw_get_method_name(m1),
@@ -2885,7 +2892,7 @@ static void multidraw_subtest(const struct test_mode *t)
 			    !igt_draw_supports_method(drm.fd, m2))
 				continue;
 
-			for (r = 0; r < pattern->n_rects; r++) {
+			for (r = 0; r < pattern_rects; r++) {
 				used_method = (r % 2 == 0) ? m1 : m2;
 
 				igt_debug("Used method %s\n",
@@ -3248,12 +3255,12 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  */
 static void move_subtest(const struct test_mode *t)
 {
-	int r;
 	int assertions = ASSERT_NO_ACTION_CHANGE;
 	struct modeset_params *params = pick_params(t);
 	struct draw_pattern_info *pattern = &pattern3;
 	struct fb_region *reg = pick_target(t, params);
 	bool repeat = false;
+	r_max = in_simulation ? 2 : pattern->n_rects;
 
 	prepare_subtest(t, pattern);
 
@@ -3263,7 +3270,7 @@ static void move_subtest(const struct test_mode *t)
 
 	do_assertions(assertions);
 
-	for (r = 1; r < pattern->n_rects; r++) {
+	for (int r = 1; r < r_max; r++) {
 		struct rect rect = pattern->get_rect(&params->primary, r);
 
 		igt_plane_set_fb(reg->plane, reg->fb);
@@ -3301,11 +3308,12 @@ static void move_subtest(const struct test_mode *t)
  */
 static void onoff_subtest(const struct test_mode *t)
 {
-	int r;
 	int assertions = ASSERT_NO_ACTION_CHANGE;
 	struct modeset_params *params = pick_params(t);
 	struct draw_pattern_info *pattern = &pattern3;
 
+	r_max = in_simulation ? 1 : 4;
+
 	prepare_subtest(t, pattern);
 
 	/* Just paint the right color since we start at 0x0. */
@@ -3313,7 +3321,7 @@ static void onoff_subtest(const struct test_mode *t)
 	update_wanted_crc(t, &pattern->crcs[t->format][0]);
 	do_assertions(assertions);
 
-	for (r = 0; r < 4; r++) {
+	for (int r = 0; r < r_max; r++) {
 		struct fb_region *reg = pick_target(t, params);
 
 		if (r % 2 == 0) {
@@ -4100,6 +4108,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			opt.tiling = drm.display_ver >= 30 ? TILING_4 : TILING_X;
 
 		setup_environment();
+		in_simulation = igt_run_in_simulation();
 	}
 
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
@@ -4184,6 +4193,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 					break; /* One output is enough. */
 				}
+				if (in_simulation)
+					break;
 			}
 		}
 
-- 
2.34.1

