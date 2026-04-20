Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6192EF55810
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BAE10E50E;
	Mon, 20 Apr 2026 11:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwGz3dkr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1EA10E518
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776685024; x=1808221024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0A+zlQKrd1WioUCQB9KytIjhhl7BeX0Uh2HaaTDaS3w=;
 b=GwGz3dkrUn+/tx2wSrhqWZWLTRdJ+ueh3TDMg+G4AjxutU7ZDoiKRaTi
 JJquKI22Bg+7tRJSvw9oAvKwcocJ7JUaD0lXX/8DwaiwLH9ajI5AyktsZ
 7p7ihjSh2PqU3GskaPsfpK/GSeMsoedx0CecjPhBp1XIpmhY36y+1KZlO
 x7J7eSMDJHcvfTCpW7cjXQjEPt5NIIWmqcV65nqoD7zc0T2+qgQ2j/Eck
 Vjiei8E1GpcV53Q0/LyCHAedzZvhbvliJep80w8FoyFzHCLw9yhZ4RsZO
 ZiZvdvtE8tzswY412lkrni7eREd5xdXFRXe8yXGhHth/P+7qhEUs8oeTv Q==;
X-CSE-ConnectionGUID: XzBSk/O7RNiJdq7pipLIDA==
X-CSE-MsgGUID: JDi7LBSATvqmhmWiYc4Hrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89064533"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="89064533"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:37:03 -0700
X-CSE-ConnectionGUID: TUkzxS72RC+PDOpnOKGhtA==
X-CSE-MsgGUID: qiqCmIqJSSeiW9vqHPnBxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228550972"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2026 04:37:01 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, jani.nikula@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 1/6] Revert "tests/intel/kms_pm_dc: Ensure eDP detection
 before skipping test"
Date: Mon, 20 Apr 2026 16:58:21 +0530
Message-ID: <20260420112826.35220-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420112826.35220-1-mohammed.thasleem@intel.com>
References: <20260420112826.35220-1-mohammed.thasleem@intel.com>
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

v3: Fix compilation issue. (Jani)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 8138933d4..2d6fa794f 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -543,7 +543,7 @@ static void test_deep_pkgc_state(data_t *data)
 	time_t delay;
 	igt_crtc_t *crtc;
 	bool pkgc_flag = false;
-	bool flip = true, edp_found = false;
+	bool flip = true;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
@@ -551,30 +551,22 @@ static void test_deep_pkgc_state(data_t *data)
 	drmModeModeInfo *mode;
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
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
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			igt_skip("No eDP output found, skipping the test.\n");
+		/* Check VRR capabilities before setting up */
+		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
+		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
+			/*
+			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
+			 * when KMD allows for such capability.
+			 */
+			igt_crtc_set_prop_value(crtc, IGT_CRTC_VRR_ENABLED, false);
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

