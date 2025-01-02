Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96528E7718B
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 13:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F9A10E268;
	Thu,  2 Jan 2025 13:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNigsXCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFCE10E24F
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735823261; x=1767359261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6AUeGA1QjPIZCc+CZN5G14MudvvwOUMi1USvkspX1mc=;
 b=hNigsXCDrxdNQ3N7LDkFvt7FQhngvEA1XWJWKoToMlobgReED1AtjkvL
 7Kt4pzI9oRN3Oi9cptOoPbxysqG8CmMrI9mXFO3Ir1WCVoW+phm8nMs8d
 FZnI0E88JLXhVrjxaF22VLugZ9hbM+UYF9hjVgjiVdoo+4cp0ZmjUdqTX
 vUpBdDh0/Pcf2ntJjRzkLJwxZ/PpFO0RSKg7+T6+HANlQA9LCH6QGsZHi
 BcBcU3SZxS2N2QKyq2JyQgZQSYCv4QLMD9OwcMB8APIzhHRyl/A8rJgFd
 I9UJyTTp31cnzSxTioLcdmxBygQAd01AxbV/rZrSV6oLZN5J0kzrjNQ1+ w==;
X-CSE-ConnectionGUID: VZi2Z+d6Q7i5mX8JB5/P/Q==
X-CSE-MsgGUID: ou40FRaBRsSV7GP0AIgrDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35364693"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="35364693"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 05:07:40 -0800
X-CSE-ConnectionGUID: MNWzfYy1QUeQVFwzTG9dHw==
X-CSE-MsgGUID: PCNBjT30T8WjwXJEckFN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101939483"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 02 Jan 2025 05:07:38 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Add logs to skips
Date: Thu,  2 Jan 2025 18:42:47 +0530
Message-Id: <20250102131247.258388-1-pranay.samala@intel.com>
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
index 35df9be3b..19dd283d5 100644
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
+			igt_info("Output doesn't supports PSR\n");
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
+			igt_info("Output doesn't supports DRRS\n");
+			return false;
+		}
+		return true;
+
 	case FEATURE_DEFAULT:
 		return true;
 	default:
-- 
2.34.1

