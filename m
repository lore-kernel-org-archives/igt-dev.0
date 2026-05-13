Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2BECD4F21
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 20:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D64810E177;
	Wed, 13 May 2026 20:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUVByw4F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F0D10E177
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 20:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778702619; x=1810238619;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JMPmLpudbonROqMkEQXGQjiJQSABj4h93c7IJnKXQOo=;
 b=UUVByw4F2Wwf6S/J1vEy+q8Q1qh6mKym9vy4YSYuvJuRc83tuX0Kq1VL
 IsTSHub8Juzl5zR3sfH0+kYBDSBTTwfNthN2QZea689HpJatxFUum8bOP
 aJtQudhbu1iCcauneHfKtPxRgJwoNRUXS1Y602kNlOH1vWhpPkAUzq3RX
 RSK2CXsXTp3Qdlt0kDbhB8cMfabLvYDzXlG4pcMfH3cSGMXygQAedsAZW
 evsQJN31YSwhGy8ICm6FSdeqw98N9N8utocDZfbTTZuar0T5kVlNATKNZ
 9pPRpfEhH1PhXyqducqZSDXqXfED2uOwamVFEYPKF+OcTz9gVID33zFHa w==;
X-CSE-ConnectionGUID: x7nWIZcjQp6dAjGEjVXS8Q==
X-CSE-MsgGUID: 1GgG3opyTg+HMcCGlGhjfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78783013"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="78783013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 13:03:38 -0700
X-CSE-ConnectionGUID: kbN2P2FvRKeioQ1N3b13IQ==
X-CSE-MsgGUID: 1q6Dc22tTQSsoDr32RKHOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="231779607"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:03:37 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dsc: Sort modes by clock to pick
 highest bandwidth mode
Date: Thu, 14 May 2026 01:42:24 +0530
Message-Id: <20260513201224.2421654-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Replace igt_output_get_highres_mode() with sort_drm_modes_by_clk_dsc()
to select the mode with the highest pixel clock. When multiple modes
share the same resolution but differ in refresh rate, the resolution-based
sort is ambiguous and may pick the wrong mode. Sorting by clock descending
ensures the highest bandwidth mode is selected, which is most likely to
trigger DSC.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 69f335da3..605ad2d5c 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -170,7 +170,12 @@ static void update_display(data_t *data, uint32_t test_type)
 	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
 		    DRM_FORMAT_MOD_LINEAR));
 
-	mode = igt_output_get_highres_mode(output);
+	/* Sort modes by clock descending to pick the highest bandwidth mode,
+	 * which is most likely to trigger DSC. This handles cases where
+	 * multiple modes share the same resolution but differ in refresh rate.
+	 */
+	igt_sort_connector_modes(output->config.connector, sort_drm_modes_by_clk_dsc);
+	mode = &output->config.connector->modes[0];
 
 	do {
 		if (data->output_format != DSC_FORMAT_RGB && index > 0)
-- 
2.25.1

