Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EA4C28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 11:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1E110E5E1;
	Thu, 20 Mar 2025 11:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WN3vNQ3q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAEA10E5E1
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 11:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742468963; x=1774004963;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Slzc5YAZW55/z3LeWl0bXv8NJL7tPeQ+82MNiF1gTc8=;
 b=WN3vNQ3qBdq2keuKef+2q01V2sMhhiYB70cX/9TG5sr6fDEDWwW8Pz9l
 2pjeExeFeUBIZLRdcE5fXZAVZZNkM9x/k1D9Py0JOWegowGK3WNHZnoYV
 Kf2vdj2iMMEJCmPCXTL0/fSXBq+1des2V+pJT2lCVAz+fQJv0j4eAM2R0
 bfbGl9o/dhQlz3vu4DHC8QoOwFBWA/GMETqzPZbN7myyqBQn7bTyFG1ct
 u0nHsFFsuEs1lOG5FmYWusfvEVSlijcvh/b4/JgMRfuUwHG/98tAHvuDP
 V5SeSYPKii+XjR74e+jYxbS4BfANtu4fb6O3laeHuTppDH24GoeQbE0bK Q==;
X-CSE-ConnectionGUID: yQIgnUiWQPeRCvQoj8icQg==
X-CSE-MsgGUID: okttaK0hT4KoxjlroJfiLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43881125"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="43881125"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:23 -0700
X-CSE-ConnectionGUID: Per5I8cPSie3k5uRm5CKQg==
X-CSE-MsgGUID: fY5Bjm8RSfO9cZcJZ/fGcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123819302"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.96])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:21 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v1] lib/i915/fbc: Disable FBC in case of selective
 update in xe2lpd
Date: Thu, 20 Mar 2025 13:09:08 +0200
Message-ID: <20250320110908.175867-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
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

In xe2lpd onwards, FBC and PSR2 selective update should be
selectively enabled based on the dirty rect threshold. Display
driver lacks such a logic at the moment and instead disables
FBC in case selective update is on. So replicate the same
in related IGT cases as well.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 3971e4920..b0b4278ad 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -167,11 +167,16 @@ bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t height)
  */
 bool intel_fbc_psr_combo_supported(int device)
 {
-	int ver = intel_display_ver(intel_get_drm_devid(device));
-
-	/* In Xe3 FBC PSR combo not supported because of FBC dirty rect */
-	if (ver >= 20 && ver < 30)
-		return true;
+	/*
+	 * Because of some random underruns, FBC is disabled when selective
+	 * update is enabled for xe2lpd onwards. The display driver should
+	 * implement a selection logic between FBC and PSR2 / PR selective
+	 * update from xe2lpd onwards. Until that is implemented, keep
+	 * FBC disabled if PSR2 selective update is on.
+	 *
+	 * Though right now this function is empty, keep this for the future
+	 * display version based variations for FBC and PSR
+	 */
 
 	return false;
 }
-- 
2.43.0

