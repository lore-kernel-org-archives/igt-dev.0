Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3A6C27C5F
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 14:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E0110EC98;
	Fri,  7 Jun 2024 14:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I38aHr2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D2A10EC98
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717772280; x=1749308280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zmve+XlUgN3jMaweU0f6Py64aA0XXfQkREhaHkyfSIM=;
 b=I38aHr2C1p1fXcNoCN7P7UkWvthTCjNj4E5NwmLO16tKWp591zxxAHKR
 TAKioob5gttLNbLk2k0ox3Tr+DYG9Fz1FmHtXOchRZm+Sy1ExK1UgVgB5
 GLAFrrDBl+s4n1L9UmduHyLCpb2DBQV80EWF24bPPZYMIYbZ6JXYRTUce
 xRkTg1BCu7cqmg6jihqTk8fqMX101sqdr2Q+cPrfzm0wHq+LLHgf7bPf7
 4rP2TT7XokEitD62HUO0AydGVcEeIA129A+NE7xihOof1X3NndsgeBvpf
 yxVIqy/NJBoq3ANNil+kHl7KkNdYKyJR0voAUgg7WB4/Ch/F2/cYRiPL7 g==;
X-CSE-ConnectionGUID: Cqj4ehUwR4SuXys87xlTaw==
X-CSE-MsgGUID: nji4w4H1SN6i+ok5crrT8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14331630"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14331630"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:58:00 -0700
X-CSE-ConnectionGUID: bpgf/VxxQfiquLMIpOBIQw==
X-CSE-MsgGUID: +54n/RRSQ1+vow3Isd4OTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38926814"
Received: from unknown (HELO vgovind2-mobl3..) ([10.245.244.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:57:59 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH i-g-t 4/4] tests/kms_dirtyfb: ensure plane size is within fbc
 supported limit
Date: Fri,  7 Jun 2024 17:57:32 +0300
Message-Id: <20240607145732.285557-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607145732.285557-1-vinod.govindapillai@intel.com>
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

When FBC tests are performed, ensure that plane size is within the
FBC supported plane size limit. Skip the iteration if the plane
size is bigger that FBC enforced restrictions.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_dirtyfb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 2a32fab56..83042e206 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -102,7 +102,14 @@ static bool check_support(data_t *data)
 	case FEATURE_NONE:
 		return true;
 	case FEATURE_FBC:
-		return intel_fbc_supported_on_chipset(data->drm_fd, data->pipe);
+		drmModeModeInfo *mode = igt_output_get_mode(data->output);
+
+		if (!intel_fbc_supported_on_chipset(data->drm_fd, data->pipe))
+			return false;
+
+		return intel_fbc_plane_size_supported(data->drm_fd,
+						      mode->hdisplay,
+						      mode->vdisplay);
 	case FEATURE_PSR:
 		if (data->output->config.connector->connector_type !=
 		    DRM_MODE_CONNECTOR_eDP)
-- 
2.34.1

