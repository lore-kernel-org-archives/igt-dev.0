Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432DFF8DFE9
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335C10E992;
	Fri, 17 Apr 2026 08:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWe4v07T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA2E10E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776415428; x=1807951428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFod9V1U/XZTG/J7OSoyovQhMoEKgRslXQNbdojxbeI=;
 b=jWe4v07TO2QzZGBa6fh+g5pmtSrcDadhOqOavOMXnIvJwCJvQgkLAT1d
 vUHluQ0gXapDrNRQvTfRrQBI7HBl/EfYMqgkpJ3IP9rtNQ9UvRrF43RdW
 O3RieSNgxfXjKM9ToZfTmIX9Y5gNRtx1eTMy/GwqQGgiNATaSJDRE7X8B
 AJBa/juoG8JdZTXR7vsxr4BgldCYAagikbVjwki8QCIhLQwKl3FZ/seVU
 HVqmg4exbNNbrXetvUfNLfLw4tvgemltCqYS4lX0gWfGPgJ53FNNkJTWy
 7KPugu12kkB6RLH09LOD0a/H5ySx5CF7oQr2bwr5zQhvs9eRxxlq8Pntm w==;
X-CSE-ConnectionGUID: tfRII7NITzq5Vr0ZjBiBzA==
X-CSE-MsgGUID: mCEX38g4RLCo4YICvQzgAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81308436"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81308436"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:43:47 -0700
X-CSE-ConnectionGUID: 0KD8D3WTSZq+Vj5wa3G/Wg==
X-CSE-MsgGUID: wTZ2NSykQEW2NI2Bpoz+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235361717"
Received: from unknown (HELO linux-Meteor-Lake-Client-Platform.iind.intel.com)
 ([10.223.55.75])
 by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 01:43:47 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 1/7] Revert "tests/intel/kms_pm_dc: Ensure eDP detection
 before skipping test"
Date: Fri, 17 Apr 2026 14:05:00 +0530
Message-ID: <20260417083506.33404-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417083506.33404-1-mohammed.thasleem@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
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

This reverts commit d063ceaeaf2d2d561670945e9e81b8976a16f080.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 8138933d4..da74a21ce 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -543,38 +543,31 @@ static void test_deep_pkgc_state(data_t *data)
 	time_t delay;
 	igt_crtc_t *crtc;
 	bool pkgc_flag = false;
-	bool flip = true, edp_found = false;
+	bool flip = true;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_output_t *output = NULL;
 	drmModeModeInfo *mode;
 
-	for_each_crtc_with_valid_output(display, crtc, output) {
-		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
-
-			edp_found = true;
-			/* Check VRR capabilities before setting up */
-			if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
-			    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-				/*
-				 * TODO: Add check for vmin = vmax = flipline if VRR enabled
-				 * when KMD allows for such capability.
-				 */
-				igt_crtc_set_prop_value(crtc, IGT_CRTC_VRR_ENABLED, false);
-				igt_assert(igt_display_try_commit_atomic(display,
-									 DRM_MODE_ATOMIC_ALLOW_MODESET,
-									 NULL) == 0);
-			}
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			igt_skip("No eDP output found, skipping the test.\n");
+		/* Check VRR capabilities before setting up */
+		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
+		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
+			/*
+			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
+			 * when KMD allows for such capability.
+			 */
+			igt_pipe_set_prop_value(display, pipe,
+						IGT_CRTC_VRR_ENABLED, false);
+			igt_assert(igt_display_try_commit_atomic(display,
+								 DRM_MODE_ATOMIC_ALLOW_MODESET,
+								 NULL) == 0);
 			break;
 		}
 	}
-
-	if (!edp_found) {
-		igt_skip("No eDP output found, skipping the test.\n");
-		return;
-	}
-
 	igt_display_reset(display);
 
 	igt_output_set_crtc(output, crtc);
-- 
2.43.0

