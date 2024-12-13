Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA192E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 09:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911FF10E25C;
	Fri, 13 Dec 2024 09:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlNn4O9w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA58F10EF86
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734083632; x=1765619632;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B/PPtduEMUOUpBE7NGs9nI/y0Oa56GYx75pEhjpabNw=;
 b=HlNn4O9wIdRGtHsjYoAUvBqn17BcVqnTzA4FZNm8/rZK1krsV/OgRkNg
 xFnvOI2ZKKs9vltnMeKbW70eGA+VnlnyjvvX+aUz67gWkPVhCDw3CITl9
 OOTx4nV9iJ5SoWVdTbF8ubMhecVZjunXIPQzmajtqccK6eS4H1DsMjhUV
 sRter6n8ghwjCTlXL40HQyZkSuBs0HJU8hQ4vvWCJD426NOIlMseeAeZp
 Xg6R0A8usv8QwTXcPVbMu6RcTx4etLKkM2mVFKXVq7+ErVSg0NSrtTFVU
 RyFMiqNBjVtvHEONkX5AnIgHv2lWii4wqGOA1ggUcxIODuheL0mLCiLO+ Q==;
X-CSE-ConnectionGUID: yopzDclXQLW+Ed113US5GQ==
X-CSE-MsgGUID: YhNJ//+hQri8/10bnc3rRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45005280"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45005280"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 01:53:52 -0800
X-CSE-ConnectionGUID: PNYtzBYdThGjJxp0IgK10A==
X-CSE-MsgGUID: OlohReIzRgOILcxIoERD9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97282544"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa008.jf.intel.com with ESMTP; 13 Dec 2024 01:53:50 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, Mark Yacoub <markyacoub@google.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_edid: Limit the number of
 EDIDs tested to prevent CI timeout.
Date: Fri, 13 Dec 2024 15:24:32 +0530
Message-Id: <20241213095432.2323965-1-pranay.samala@intel.com>
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

This patch reduces the number of non-4K HDMI EDIDs to 25 when
the extended flag is not used, as CI does not use this flag.
DP EDID tests are not reduced due to existing limited EDIDs.
The change ensures that only HDMI non-4K EDIDs are limited,
improving test efficiency and avoiding CI timeouts.

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 5db8204d5..e572a6468 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -267,7 +267,8 @@ static const char igt_edid_stress_resolution_desc[] =
 static void edid_stress_resolution(chamelium_data_t *data,
 				   struct chamelium_port *port,
 				   monitor_edid edids_list[],
-				   size_t edids_list_len)
+				   size_t edids_list_len,
+				   bool limit)
 {
 	int i;
 	struct chamelium *chamelium = data->chamelium;
@@ -280,7 +281,7 @@ static void edid_stress_resolution(chamelium_data_t *data,
 	 * if there is environment variable in CI when executing with igt_runner
 	 */
 
-	if (!extended && is_intel_device(data->drm_fd))
+	if (!extended && is_intel_device(data->drm_fd) && limit)
 		edids_list_len = CI_LIMIT;
 
 	for (i = 0; i < edids_list_len; ++i) {
@@ -559,13 +560,13 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_describe(igt_edid_stress_resolution_desc);
 		connector_subtest("dp-edid-stress-resolution-4k", DisplayPort)
 			edid_stress_resolution(&data, port, DP_EDIDS_4K,
-					       ARRAY_SIZE(DP_EDIDS_4K));
+					       ARRAY_SIZE(DP_EDIDS_4K), false);
 
 		igt_describe(igt_edid_stress_resolution_desc);
 		connector_subtest("dp-edid-stress-resolution-non-4k",
 				  DisplayPort)
 			edid_stress_resolution(&data, port, DP_EDIDS_NON_4K,
-					       ARRAY_SIZE(DP_EDIDS_NON_4K));
+					       ARRAY_SIZE(DP_EDIDS_NON_4K), false);
 
 		igt_describe(igt_edid_resolution_list_desc);
 		connector_subtest("dp-edid-resolution-list", DisplayPort)
@@ -613,12 +614,12 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_describe(igt_edid_stress_resolution_desc);
 		connector_subtest("hdmi-edid-stress-resolution-4k", HDMIA)
 			edid_stress_resolution(&data, port, HDMI_EDIDS_4K,
-					       ARRAY_SIZE(HDMI_EDIDS_4K));
+					       ARRAY_SIZE(HDMI_EDIDS_4K), false);
 
 		igt_describe(igt_edid_stress_resolution_desc);
 		connector_subtest("hdmi-edid-stress-resolution-non-4k", HDMIA)
 			edid_stress_resolution(&data, port, HDMI_EDIDS_NON_4K,
-					       ARRAY_SIZE(HDMI_EDIDS_NON_4K));
+					       ARRAY_SIZE(HDMI_EDIDS_NON_4K), true);
 
 		igt_describe(test_suspend_resume_edid_change_desc);
 		connector_subtest("hdmi-edid-change-during-suspend", HDMIA)
-- 
2.34.1

