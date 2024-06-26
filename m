Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECF8C3064D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 19:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E3410E24D;
	Wed, 26 Jun 2024 19:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzoXk1Cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DC510E9AC
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 19:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719428637; x=1750964637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6+Sx1nVaqMP8fjOXVBXYL32mvigV7Y5euN01Cag6jeE=;
 b=MzoXk1CuXiLW+fJZ6LduVxzIiWBLquV0oo/i/E8Kxmvtmm8BlfpqA7iP
 2Gic0yil1SBJ5y/CYieHEk58iR4wE2RwUIMUc/mcXCcpbDzzb/k1msUI+
 OKhPpjMPujP/gVfPCI+L7ZJO9V569nzutd0QdPyzTnvXjLz3dK61DLbUk
 ilwETAB5YP/SNhJzJgRIq9dXyY9b1C1WX+hqOYMVnmk3qzsdU7kC5ip7q
 55VJ3fjla3n/32KwKlHPenCKFsdv/cLvR44A3HiI6TtqrEVVgC+tgj6X5
 ZbLKTRB8tRjSbiX9T3GVtyc/2pjdbhg1A8MUPceP7mgU0lAO7IUaGaaeW Q==;
X-CSE-ConnectionGUID: 7uj4DUpoTqSz+3GjeX0gwg==
X-CSE-MsgGUID: MjV8fH7mQFWxwHhiYg3BGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27111852"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="27111852"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 12:03:52 -0700
X-CSE-ConnectionGUID: n92JwjQTT12MKeJxP+qYag==
X-CSE-MsgGUID: uTEQHXr1Syybwlx8tb4syQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48467622"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 12:03:50 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, animesh.manna@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] RFC: tests/kms_vrr: Add new test to validate LOBF
Date: Thu, 27 Jun 2024 00:45:37 +0530
Message-Id: <20240626191537.1507452-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626191537.1507452-1-jeevan.b@intel.com>
References: <20240626191537.1507452-1-jeevan.b@intel.com>
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

Validate pseudo static refresh rate changes in the VRR with
fixed refresh rate framework.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 2ea90cd8e..2134e8668 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -37,6 +37,11 @@
 #include <signal.h>
 
 /**
+ * SUBTEST: lobf
+ * Description: Test to validate link-off between active frames in non-psr
+ *              operation
+ * Functionality: LOBF
+ *
  * SUBTEST: cmrr
  * Description: Test to validate the content rate to exactly match with the
  * 		requested rate without any frame drops.
@@ -106,7 +111,8 @@ enum {
 	TEST_FASTSET = 1 << 7,
 	TEST_MAXMIN = 1 << 8,
 	TEST_CMRR = 1 << 9,
-	TEST_NEGATIVE = 1 << 10,
+	TEST_LINK_OFF = 1 << 10,
+	TEST_NEGATIVE = 1 << 11,
 };
 
 enum {
@@ -784,6 +790,41 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	}
 }
 
+static void
+test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	bool change_mode = false;
+	time_t startTime = time(NULL);
+	time_t secs = 4, change_time = 3;
+	igt_plane_t *primary;
+	drmModeModeInfo mode = *igt_output_get_mode(output);
+
+	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
+		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
+
+	igt_require(output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP);
+	igt_require(!igt_get_i915_edp_lobf_info(data->drm_fd, output->name));
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1, 1, 1, &data->fb[0]);
+
+	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+
+	while (time(NULL) - startTime < secs) {
+		igt_plane_set_fb(primary, &data->fb[0]);
+		igt_display_commit(&data->display);
+		if (!change_mode && time(NULL) - startTime >= change_time) {
+			igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
+			change_time = true;
+		}
+	}
+
+	igt_assert_f(igt_get_i915_edp_lobf_info(data->drm_fd, output->name),
+		     "LOBF not enabled\n");
+}
+
 static void
 test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
@@ -1030,13 +1071,20 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
 			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 
-		igt_describe("Test to validate the the content rate exactly match with the "
+		igt_describe("Test to validate the content rate exactly match with the "
 			     "requested rate without any frame drops.");
 		igt_subtest_with_dynamic("cmrr") {
 			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
 
 			run_vrr_test(&data, test_cmrr, TEST_CMRR);
 		}
+		igt_describe("Test to validate the link-off between active frames in "
+			     "non-PSR operation.");
+		igt_subtest_with_dynamic("lobf") {
+			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
+
+			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

