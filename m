Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C6CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 07:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB81510E2D8;
	Tue, 26 Aug 2025 07:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHyhyz/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569CC10E2D8
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756192264; x=1787728264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aFr6KOC+2D5NwI+OrxxCLXV9nqTWpVQAaD+HlGk5dTo=;
 b=lHyhyz/4vbc/6/vb+DdUMjtD+GYgUfsvVRSft44oMcovWP6Dr39wSASn
 jdAaZIhUh82syzL/F+p263KltWEcby7vObtK+n0BbHJMOxWWdYgk+S15+
 SihnvCxNFLcDoIXcP2e6sOlfnStBq0Z8zqK0hR98A5w1RjtkuFVy1b72n
 +OCGljri6VaPGsmE3QGShfaIz5N8Nc9UakR/ST4MN53YnDWdONrySgTbA
 d9sYDVXN0pTQOJJAB21ijkDmF8ySCMejr1+nxK5TFHN/y5fX6uiKe4qKK
 o1uOIMzDn2gIAKcPTF+xdCaR/iH333/0805eSpl0uerbd3ROrieOtaZgv A==;
X-CSE-ConnectionGUID: ZMRyJiLoSrCaUCgRA7lVlg==
X-CSE-MsgGUID: CaDxkEcgR0mBlW0vD6D17g==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69130495"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69130495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 00:11:04 -0700
X-CSE-ConnectionGUID: 4lsFkLjhSvCqG9A5jbH2mw==
X-CSE-MsgGUID: IbbcednNRXuUsAqKRNQI/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169404872"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 00:11:02 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, vinod.govindapillai@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_fbc_dirty_rect: Limit to single pipe
 on simulation
Date: Tue, 26 Aug 2025 12:37:34 +0530
Message-Id: <20250826070734.1117429-1-santhosh.reddy.guddati@intel.com>
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

Limit the subtests to execute only on the first valid pipe/output
as execution is slow on simulation environments.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 07d616d90..61c0555c6 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -73,6 +73,7 @@ typedef struct {
 		FEATURE_COUNT = 8,
 		FEATURE_DEFAULT = 8,
 	} feature;
+	bool is_simulation;
 } data_t;
 
 static void set_damage_clip_w(struct drm_mode_rect *damage, int x1, int y1, int width, int height)
@@ -449,12 +450,16 @@ igt_main
 		igt_display_require_output(&data.display);
 		igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 30,
 			      "FBC with dirty region is not supported\n");
+		data.is_simulation = igt_run_in_simulation();
 	}
 
 	igt_subtest_with_dynamic("fbc-dirty-rectangle-out-visible-area") {
+		bool single_pipe = false;
 		data.feature = FEATURE_FBC;
 
 		for_each_pipe(&data.display, data.pipe) {
+			if (data.is_simulation && single_pipe)
+				break;
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
 				data.format = DRM_FORMAT_XRGB8888;
 
@@ -464,14 +469,20 @@ igt_main
 					fbc_dirty_rectangle_test(&data,
 						fbc_dirty_rectangle_outside_visible_region);
 				}
+				single_pipe = true;
+				if (data.is_simulation)
+					break;
 			}
 		}
 	}
 
 	igt_subtest_with_dynamic("fbc-dirty-rectangle-dirtyfb-tests") {
+		bool single_pipe = false;
 		data.feature = FEATURE_FBC;
 
 		for_each_pipe(&data.display, data.pipe) {
+			if (data.is_simulation && single_pipe)
+				break;
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
 				data.format = DRM_FORMAT_XRGB8888;
 
@@ -481,6 +492,9 @@ igt_main
 					fbc_dirty_rectangle_test(&data,
 							fbc_dirty_rectangle_dirtyfb);
 				}
+				single_pipe = true;
+				if (data.is_simulation)
+					break;
 			}
 		}
 	}
@@ -488,13 +502,16 @@ igt_main
 	igt_subtest_with_dynamic("fbc-dirty-rectangle-different-formats") {
 		uint32_t formats[] = {DRM_FORMAT_XRGB8888, DRM_FORMAT_ARGB8888, DRM_FORMAT_RGB565};
 		int num_formats = ARRAY_SIZE(formats);
-
+		bool single_pipe = false;
 		data.feature = FEATURE_FBC;
 
 		for_each_pipe(&data.display, data.pipe) {
+			if (data.is_simulation && single_pipe)
+				break;
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
-
 				for (int i = 0; i < num_formats; i++) {
+					if (data.is_simulation && i > 0)
+						break;
 					igt_dynamic_f("pipe-%s-%s-format-%s",
 						       kmstest_pipe_name(data.pipe),
 						       igt_output_name(data.output),
@@ -504,6 +521,9 @@ igt_main
 							fbc_dirty_rectangle_basic);
 					}
 				}
+				single_pipe = true;
+				if (data.is_simulation)
+					break;
 			}
 		}
 	}
-- 
2.34.1

