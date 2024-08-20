Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52FCC3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 08:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E8A10E4EF;
	Tue, 20 Aug 2024 08:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chlYRa5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396AE10E4F7
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724141710; x=1755677710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7hdGmU1UAAstPrOzEN5WOILfgOcPc0q6vUO1LuZ1ZY=;
 b=chlYRa5nx3cUjZ682ZIsEqeYA/yQB93pXjTJF3F1lRLQgtayTOsvaHt+
 AjtBjv1uNly7DVB8eC/+HvBTJCPh7FY6V9thiQiiNOvNm02Ey/CwXP2qX
 IzQrXJw38RY5opISQBNIb+VQspCUfyAziZEHgVqukeTo3Pkk+I9WvK/IK
 HGnzTYZqXcCYe+vMJlGyh1MYXEVDBAMNhU9Qd1bud69LiuA5dXhEVQR3C
 AcbUD4fqOVXHDc13I6sD/br6Y3uq2XS85ZFY47//3P/Hz+LzCs312xcQM
 UKy9Cu8l+87rCajlzrnSiaiae6Y5mzaRLvsR2KQPBdXY2KVCoH/KkN1Hd Q==;
X-CSE-ConnectionGUID: sm1wJwGuSxeQRP9bua2D3Q==
X-CSE-MsgGUID: SGXSNxZsQDi4VTFJ7GFsDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="44948250"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="44948250"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:15:10 -0700
X-CSE-ConnectionGUID: 6CneJi5dTGOo9N+NkFOpIg==
X-CSE-MsgGUID: ageBuFbiQZCGfHzb9ym/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="91418400"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2024 01:15:08 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 5/5] tests/kms_content_protection: Set screen red/green
 based on CP Status
Date: Tue, 20 Aug 2024 13:42:32 +0530
Message-ID: <20240820081233.4092203-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240820081233.4092203-1-suraj.kandpal@intel.com>
References: <20240820081233.4092203-1-suraj.kandpal@intel.com>
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

Set fb as red when HDCP is disabled and green when HDCP is enabled
rather than randomly setting the color. This helps to visually
verify HDCP's enablement status rather than having to look at the
logs.

--v2
-Add reason for this change in commit message [Jeevan]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 87d7526ee..3d158fbd8 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -523,12 +523,11 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	return strstr(buf, "HDCP2.2");
 }
 
-static void prepare_modeset_on_mst_output(igt_output_t *output)
+static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int width, height;
-	enum pipe pipe = output->pending_pipe;
 
 	mode = igt_output_get_mode(output);
 
@@ -537,8 +536,8 @@ static void prepare_modeset_on_mst_output(igt_output_t *output)
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
-	igt_fb_set_size(pipe % 2 ? &data.red : &data.green, primary, width, height);
+	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
+	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width, height);
 	igt_plane_set_size(primary, width, height);
 }
 
@@ -735,7 +734,7 @@ test_content_protection_mst(int content_type)
 		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
 
 		igt_output_set_pipe(output, pipe);
-		prepare_modeset_on_mst_output(output);
+		prepare_modeset_on_mst_output(output, false);
 		dp_mst_outputs++;
 		if (output_hdcp_capable(output, content_type))
 			hdcp_mst_output[valid_outputs++] = output;
@@ -752,7 +751,7 @@ test_content_protection_mst(int content_type)
 		igt_require_f(found, "No valid mode combo found for MST modeset\n");
 
 		for (count = 0; count < valid_outputs; count++)
-			prepare_modeset_on_mst_output(hdcp_mst_output[count]);
+			prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
 
 		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
@@ -762,6 +761,13 @@ test_content_protection_mst(int content_type)
 
 	ret = test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
 
+	if (ret) {
+		for (i = 0; i < valid_outputs; i++)
+			prepare_modeset_on_mst_output(hdcp_mst_output[count], true);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+	}
+
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
 
-- 
2.43.2

