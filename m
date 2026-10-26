Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A45606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SWUfRxFS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F96A10E2F1;
	Mon, 26 Oct 2026 17:21:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9576F10E1FD
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793035115; x=1824571115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nFTJFCXYW12pt8X+sYRb9hDJvMDeuDXzh8XV6cJFrqA=;
 b=SWUfRxFS5uY3qV3v70MtcWvL57SrOL0A3jfEuJzTt3xJBIRWPXfvR1af
 EoxST/VB3gCX9ZQa0wuQUbsEJV+in+JBqLxZPnYq8mrEQygN+5OHnN4Sk
 kKSGjkknZDwPwbiZJ3VSR3UAdDipHK9PKRCTNkO759CDAm7X5pfJM0+Ik
 A4rJeksSMg9kkD7nYC1xn6d9Qd0cJJvt2v4QgqqUTaEYgAkgqmJEfAvN9
 KdMvvHUm5V6Er1AQR48mWppp0NFtd+MeW//87ebMSOcpLz922uXzic8qa
 7HN6JDorvdIxkIOLMjrzD4Bc2/Wzl4t3NNk29kKt2BkNQW6X/mYxP2p2i Q==;
X-CSE-ConnectionGUID: 6zsukPzmSwScXOM+tqgoQw==
X-CSE-MsgGUID: zoLNGtJ+RHOR4B6cA8q3ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1589206"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1589206"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:18:34 -0700
X-CSE-ConnectionGUID: CA2xD1JAS/uhb72B3rTb3A==
X-CSE-MsgGUID: Pvxx0cfqRy+BPFwe/N0GJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4275176"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:18:33 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH 3/3] tests/kms_rotation_crc: reduce multiplane CI debug output
Date: Mon, 26 Oct 2026 22:48:36 +0530
Message-ID: <20261026171836.1434992-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026171836.1434992-1-jeevan.b@intel.com>
References: <20261026171836.1434992-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use DRM_UT_CORE in CI for multiplane-rotation and both cropping variants
to suppress KMS debug logs while retaining CORE diagnostics. Restore the
original mask after the group and on exit; other subtests are unchanged.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16184
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 96 ++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 43 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index a01aac78f..c3481880b 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -31,6 +31,7 @@
  */
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "igt_vec.h"
 #include <math.h>
 
@@ -1437,6 +1438,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_display_require(&data.display, data.gfx_fd);
 		igt_require(data.display.is_atomic);
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 	}
 
 	igt_describe("Rotation test with 90/270 degree for primary and sprite planes of gen9+");
@@ -1502,51 +1504,59 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_describe("Rotation test on both planes by making them fully visible");
-	igt_subtest_f("multiplane-rotation") {
-		igt_crtc_t *crtc = igt_first_crtc(&data.display);
-
-		igt_require(gen >= 9);
-		cleanup_crtc(&data);
-		data.planepos[0].origo = p_top | p_left;
-		data.planepos[0].x = .2f;
-		data.planepos[0].y = .1f;
-		data.planepos[1].origo = p_top | p_right;
-		data.planepos[1].x = -.4f;
-		data.planepos[1].y = .1f;
-		test_multi_plane_rotation(&data, crtc);
-	}
+	igt_subtest_group() {
+		igt_fixture()
+			update_debug_mask_if_ci(DRM_UT_CORE);
 
-	igt_describe("Rotation test on both planes by cropping left/top corner of primary plane and"
-			"right/top corner of sprite plane");
-	igt_subtest_f("multiplane-rotation-cropping-top") {
-		igt_crtc_t *crtc = igt_first_crtc(&data.display);
-
-		igt_require(gen >= 9);
-		cleanup_crtc(&data);
-		data.planepos[0].origo = p_top | p_left;
-		data.planepos[0].x = -.05f;
-		data.planepos[0].y = -.15f;
-		data.planepos[1].origo = p_top | p_right;
-		data.planepos[1].x = -.15f;
-		data.planepos[1].y = -.15f;
-		test_multi_plane_rotation(&data, crtc);
-	}
+		igt_describe("Rotation test on both planes by making them fully visible");
+		igt_subtest_f("multiplane-rotation") {
+			igt_crtc_t *crtc = igt_first_crtc(&data.display);
+
+			igt_require(gen >= 9);
+			cleanup_crtc(&data);
+			data.planepos[0].origo = p_top | p_left;
+			data.planepos[0].x = .2f;
+			data.planepos[0].y = .1f;
+			data.planepos[1].origo = p_top | p_right;
+			data.planepos[1].x = -.4f;
+			data.planepos[1].y = .1f;
+			test_multi_plane_rotation(&data, crtc);
+		}
 
-	igt_describe("Rotation test on both planes by cropping left/bottom corner of primary plane"
-			"and right/bottom corner of sprite plane");
-	igt_subtest_f("multiplane-rotation-cropping-bottom") {
-		igt_crtc_t *crtc = igt_first_crtc(&data.display);
-
-		igt_require(gen >= 9);
-		cleanup_crtc(&data);
-		data.planepos[0].origo = p_bottom | p_left;
-		data.planepos[0].x = -.05f;
-		data.planepos[0].y = -.20f;
-		data.planepos[1].origo = p_bottom | p_right;
-		data.planepos[1].x = -.15f;
-		data.planepos[1].y = -.20f;
-		test_multi_plane_rotation(&data, crtc);
+		igt_describe("Rotation test on both planes by cropping left/top corner of primary "
+			     "plane and right/top corner of sprite plane");
+		igt_subtest_f("multiplane-rotation-cropping-top") {
+			igt_crtc_t *crtc = igt_first_crtc(&data.display);
+
+			igt_require(gen >= 9);
+			cleanup_crtc(&data);
+			data.planepos[0].origo = p_top | p_left;
+			data.planepos[0].x = -.05f;
+			data.planepos[0].y = -.15f;
+			data.planepos[1].origo = p_top | p_right;
+			data.planepos[1].x = -.15f;
+			data.planepos[1].y = -.15f;
+			test_multi_plane_rotation(&data, crtc);
+		}
+
+		igt_describe("Rotation test on both planes by cropping left/bottom corner of "
+			     "primary plane and right/bottom corner of sprite plane");
+		igt_subtest_f("multiplane-rotation-cropping-bottom") {
+			igt_crtc_t *crtc = igt_first_crtc(&data.display);
+
+			igt_require(gen >= 9);
+			cleanup_crtc(&data);
+			data.planepos[0].origo = p_bottom | p_left;
+			data.planepos[0].x = -.05f;
+			data.planepos[0].y = -.20f;
+			data.planepos[1].origo = p_bottom | p_right;
+			data.planepos[1].x = -.15f;
+			data.planepos[1].y = -.20f;
+			test_multi_plane_rotation(&data, crtc);
+		}
+
+		igt_fixture()
+			igt_drm_debug_mask_reset();
 	}
 
 	igt_describe("Rotation test on primary plane with concurrent cursor movement");
-- 
2.43.0

