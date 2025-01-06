Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21B5E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 03:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803CA10E12B;
	Mon,  6 Jan 2025 03:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8OrdtqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D6410E12B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 03:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736135630; x=1767671630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TPmpVO/20mmIH0ITguc+orMg2EbctNH3auL4ZAODLEI=;
 b=m8OrdtqFlRsU3tBuY51LOfyenjYxeRCgx0Bg9lvLXckm+1FyAzV8R8ip
 iSMZl43Ejz7cwE6SlAxmilMmZqPLwRETa9aurSm8oZHzNRzEFYd07H1b9
 ot1uJDOm9jKddNhxIpeQsVfKCiwES6m184rBrGEBOMTokNCYKCCZefeR9
 DGf9bfChaV5r6r+pUDy56zPLzowcNrzxrhNso/S88pNgxmXftidmpGqg6
 XkVgIgqUjQbV129Uhys1vOQCj/ULA4r7zs+DRawwijgkrd8Tmf68803WW
 72AossarSBkp1FCpGssheeDhQ2A3e98CNg2qLeXGfWCmmuSrFW9MtQfEG A==;
X-CSE-ConnectionGUID: RrXmU4VMQ2iCLAewCAxsUg==
X-CSE-MsgGUID: YRK4ZYVkT9WPTB2MUNPl8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="39960951"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="39960951"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 19:53:50 -0800
X-CSE-ConnectionGUID: 2ioA6FV1TuKojD4B36dkMQ==
X-CSE-MsgGUID: ugUAAONsQFGNm7tIoqFaHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106364816"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa003.fm.intel.com with ESMTP; 05 Jan 2025 19:53:47 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/intel/kms_dirtyfb: Add logs to skips
Date: Mon,  6 Jan 2025 09:29:03 +0530
Message-Id: <20250106035903.22776-1-pranay.samala@intel.com>
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

Having some logs for test failures & skips would
make debugging much easier.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_dirtyfb.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 35df9be3b..4cbd1a2f9 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -102,21 +102,40 @@ static bool check_support(data_t *data)
 	case FEATURE_NONE:
 		return true;
 	case FEATURE_FBC:
-		if (!intel_fbc_supported_on_chipset(data->drm_fd, data->pipe))
+		if (!intel_fbc_supported_on_chipset(data->drm_fd, data->pipe)) {
+			igt_info("FBC is not supported on this chipset\n");
 			return false;
+		}
+
+		if (!intel_fbc_plane_size_supported(data->drm_fd,
+						    data->mode->hdisplay,
+						    data->mode->vdisplay)) {
+			igt_info("Plane size not supported as per FBC size restrictions\n");
+			return false;
+		}
+		return true;
 
-		return intel_fbc_plane_size_supported(data->drm_fd,
-						      data->mode->hdisplay,
-						      data->mode->vdisplay);
 	case FEATURE_PSR:
 		if (data->output->config.connector->connector_type !=
-		    DRM_MODE_CONNECTOR_eDP)
+		    DRM_MODE_CONNECTOR_eDP) {
+			igt_info("Output is not an eDP\n");
+			return false;
+		}
+		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
+				      PSR_MODE_1, NULL)) {
+			igt_info("Output doesn't support PSR\n");
 			return false;
-		return psr_sink_support(data->drm_fd, data->debugfs_fd,
-					PSR_MODE_1, NULL);
+		}
+		return true;
+
 	case FEATURE_DRRS:
-		return intel_is_drrs_supported(data->drm_fd, data->pipe) &&
-			intel_output_has_drrs(data->drm_fd, data->output);
+		if (!(intel_is_drrs_supported(data->drm_fd, data->pipe) &&
+		      intel_output_has_drrs(data->drm_fd, data->output))) {
+			igt_info("Output doesn't support DRRS\n");
+			return false;
+		}
+		return true;
+
 	case FEATURE_DEFAULT:
 		return true;
 	default:
-- 
2.34.1

