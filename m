Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4D8C25B76
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 08:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DAD10E573;
	Tue, 11 Jun 2024 08:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhqMri8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F179210E573
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718093082; x=1749629082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7qkEc1WzgiWhgiBjUbKX1z6Rzd11OD3Laqcyiu5fpCw=;
 b=ZhqMri8CQG0Imlw+Har9+kjGqzgQCgHrdnwCyy35kTI0T46Gr/2vNu6V
 eJW4/CpLXV4Zz3VWs1kNNsC/2/47eZZ9YqkEsAbVkWjOW2nXet/K0OGkE
 ZnSkDXrMpN0M2McE0drJRttcriJfkQ2osx4pqh2vgI7Bb5m4vcn+bZGGT
 lPE1TZQ8plhgueS5P4uEHdzf2l+t2aMbY+A1WfmkTqrNg3NJfs7ADBR8q
 DTPQVgR6s68lwn0itXyzMiTIHL9rVW0wd0j97gSLZo4qciXIpHHsZoLuv
 RLLMyJIqSmwzHtGB3UYwlZVj7gP0ZLC7q39TyTPPTQuPx3G2rBnCwNPLl Q==;
X-CSE-ConnectionGUID: X7WWzNx/TUq1DVWC5y3YxQ==
X-CSE-MsgGUID: VoctXV+3QKammMcjMDxxiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25907345"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="25907345"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:41 -0700
X-CSE-ConnectionGUID: nwg/AhjLT3G6npSe/YQRQw==
X-CSE-MsgGUID: sFSTGuz9TR6iOA9+1no98A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39336153"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.127])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:40 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v3 5/5] tests/kms_dirtyfb: ensure plane size is within
 fbc supported limit
Date: Tue, 11 Jun 2024 11:04:16 +0300
Message-Id: <20240611080416.56878-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611080416.56878-1-vinod.govindapillai@intel.com>
References: <20240611080416.56878-1-vinod.govindapillai@intel.com>
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

v2: update the usage of drmmmodeinfo

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_dirtyfb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index c0eacda9b..75047ec63 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -102,7 +102,12 @@ static bool check_support(data_t *data)
 	case FEATURE_NONE:
 		return true;
 	case FEATURE_FBC:
-		return intel_fbc_supported_on_chipset(data->drm_fd, data->pipe);
+		if (!intel_fbc_supported_on_chipset(data->drm_fd, data->pipe))
+			return false;
+
+		return intel_fbc_plane_size_supported(data->drm_fd,
+						      data->mode->hdisplay,
+						      data->mode->vdisplay);
 	case FEATURE_PSR:
 		if (data->output->config.connector->connector_type !=
 		    DRM_MODE_CONNECTOR_eDP)
-- 
2.34.1

