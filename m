Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DB2CAC592
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 01:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E5810E407;
	Wed, 17 Sep 2025 01:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/MfuWd4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE5E10E3F9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 01:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758074307; x=1789610307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AGDyoYZ+Kw6X2bJcHJD/46+8dxZstsAurJNtJwMHntE=;
 b=Q/MfuWd4YPEkOPy1V4/L4cUDx1B8dRnyeSy2bRtFNLkIkILHTaj61wC4
 bqJgHrmTfSRKVNZFRnqaZL29SaZDTNXbmD8526at4cXc2Kgqdfq8auurC
 GIGsA7anhPhjGPeVl0dp89PUOXI1mSnR4mOOrF8ASm919f4eNBRkQZw5v
 jUGO5AaxQss65tfwTG/XSNBtniBnQ9pl6Tn037q9BhsCDTiOZI/pglQlo
 c0k6P/KA7IG0Y3FLvaqYWUGat6bKdf59oII78+tj5xSjtX5NLTLKk95ne
 Ah2Ikm7S1jEhLrjLCHg1m9LY/h1v9lXEvsk9jGJBmWtEW22/8qXYjFJCn g==;
X-CSE-ConnectionGUID: rz2B5lOASSa3NIIvSwJiSg==
X-CSE-MsgGUID: eTHmjYrMT0eKsm+E3UNZhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60436098"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="60436098"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 18:58:25 -0700
X-CSE-ConnectionGUID: /FE1N9aqSl+3QRaNCYKVzw==
X-CSE-MsgGUID: MDum1msnTlGyphNgJPe6tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="174668620"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:58:23 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, vinod.govindapillai@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/2] tests/intel/kms_fbc_dirty_rect: Limit to single
 pipe on simulation
Date: Wed, 17 Sep 2025 07:26:10 +0530
Message-Id: <20250917015611.283588-1-santhosh.reddy.guddati@intel.com>
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

V2: Refactor logic to use single_pipe and split patch(vinod)
v3: Remove data.is_simulation redundant check (vinod)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 07d616d90..d2330bd4a 100644
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
+			if (single_pipe)
+				break;
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
 				data.format = DRM_FORMAT_XRGB8888;
 
@@ -464,14 +469,20 @@ igt_main
 					fbc_dirty_rectangle_test(&data,
 						fbc_dirty_rectangle_outside_visible_region);
 				}
+				single_pipe = data.is_simulation;
+				if (single_pipe)
+					break;
 			}
 		}
 	}
 
 	igt_subtest_with_dynamic("fbc-dirty-rectangle-dirtyfb-tests") {
+		bool single_pipe = false;
 		data.feature = FEATURE_FBC;
 
 		for_each_pipe(&data.display, data.pipe) {
+			if (single_pipe)
+				break;
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
 				data.format = DRM_FORMAT_XRGB8888;
 
@@ -481,6 +492,9 @@ igt_main
 					fbc_dirty_rectangle_test(&data,
 							fbc_dirty_rectangle_dirtyfb);
 				}
+				single_pipe = data.is_simulation;
+				if (single_pipe)
+					break;
 			}
 		}
 	}
@@ -488,12 +502,13 @@ igt_main
 	igt_subtest_with_dynamic("fbc-dirty-rectangle-different-formats") {
 		uint32_t formats[] = {DRM_FORMAT_XRGB8888, DRM_FORMAT_ARGB8888, DRM_FORMAT_RGB565};
 		int num_formats = ARRAY_SIZE(formats);
-
+		bool single_pipe = false;
 		data.feature = FEATURE_FBC;
 
 		for_each_pipe(&data.display, data.pipe) {
+			if (single_pipe)
+				break;
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
-
 				for (int i = 0; i < num_formats; i++) {
 					igt_dynamic_f("pipe-%s-%s-format-%s",
 						       kmstest_pipe_name(data.pipe),
@@ -504,6 +519,9 @@ igt_main
 							fbc_dirty_rectangle_basic);
 					}
 				}
+				single_pipe = data.is_simulation;
+				if (single_pipe)
+					break;
 			}
 		}
 	}
-- 
2.34.1

