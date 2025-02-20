Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BB0C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 12:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF3610E4BD;
	Thu, 20 Feb 2025 12:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQrH5VmV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BC510E4BD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740054124; x=1771590124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=em3a9fd5jFeg5krbjDxUsjEV3Ym3eMPfXXflg+cVd3Y=;
 b=RQrH5VmVvYs3Q8YNcUlVXaluCEuDj4U5NomLhu1v8ElFbIK68LU5WPcj
 egMr1EreUQQyJotBKBO0NPGC5f6djRdRUjO1pj+iDGrvu3WijrPOICvKl
 aT5rJMrPvIeLV/Gt5Y8b5L9tmzD6LNtdTMoe4+JIgCKMRYzBGWBAlQ+6s
 Yfc5K459tFsEaBUiPV4ZwuJx1D7GkYbDubwatSryWRcf/6dLBRIEhpdWd
 MZY2+EE3ncurQX05koB1xwGLqv/Z7s5IaSR3sd8mUd2DDV9gyJzDR03s6
 88FFwp5JSS6l6yHhrWyV2+wg0jdtbOIP+hPfaGbZdRc1VusykNK5zKL2g Q==;
X-CSE-ConnectionGUID: Zt/536O3TXqqA7uegsRXxw==
X-CSE-MsgGUID: dmwQPRQjRLubAM44zuGMtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40697045"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40697045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:22:04 -0800
X-CSE-ConnectionGUID: +bXmnEgrRdeWmyetACzcMw==
X-CSE-MsgGUID: ug8n8bycSKSQwq+pty3EPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120251412"
Received: from slindbla-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:22:02 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v1 5/5] lib/i915/fbc: fbc psr combo support update for
 xe3
Date: Thu, 20 Feb 2025 14:21:31 +0200
Message-ID: <20250220122131.221907-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220122131.221907-1-vinod.govindapillai@intel.com>
References: <20250220122131.221907-1-vinod.govindapillai@intel.com>
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

Because of the FBC dirty rect support in xe3, the FBC and PSR
are not recommended to be enabled together. So if PSR2 selective
fetch is enabled, FBC will not be activated in xe3.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 90fe5943c..3971e4920 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -167,7 +167,10 @@ bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t height)
  */
 bool intel_fbc_psr_combo_supported(int device)
 {
-	if (intel_display_ver(intel_get_drm_devid(device)) >= 20)
+	int ver = intel_display_ver(intel_get_drm_devid(device));
+
+	/* In Xe3 FBC PSR combo not supported because of FBC dirty rect */
+	if (ver >= 20 && ver < 30)
 		return true;
 
 	return false;
-- 
2.43.0

