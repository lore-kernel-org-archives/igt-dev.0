Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8FAD2D0E3
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8456110E337;
	Tue, 13 Jan 2026 12:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvyCc+7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E54110E337
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 12:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768305901; x=1799841901;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JHMoClZwPsvb8Djt+cHUrHo+0WRMo/l1wKVmtT2Fz+g=;
 b=LvyCc+7axGOULVHrVBV6gL7DKLifbJIm9Kgray72EUjIwosKTxDum/Uk
 gg6DhTEdBUZ1BgVIJLRAgltc551Onw12LoEsp6XGEY4fXq66Og/EDElbu
 s0YHDm5+7oPOhg/O6+BbBlYiYV/3tLEmmDo3ZAC9Bta1A3d73plFmP3t0
 qyQiCNTOCx5XQn+qWPpuRskzFfLSgwO1hcsFepSsqPxqUFQCwejCT4oWP
 8XhhAaK10mPWkxOZ8RZRNGianWeD3mKEJdiYFxW4bBFqLzrm2rdkcpQOj
 e6cEj7oDG0Sx8TgloymNZEGlb5qehI5q9UdHa4ldFO4xtjFhS97ubaoM4 Q==;
X-CSE-ConnectionGUID: 9tccSCdjQOqFjbipi5F3aA==
X-CSE-MsgGUID: nJLZUEQDQxmU0giJ0KTYNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92256391"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="92256391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:05:01 -0800
X-CSE-ConnectionGUID: y16s03dSRoOoTxWbb2ixdg==
X-CSE-MsgGUID: +BPAzQoXQFKr3/X2UNY5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208835737"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.52])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:05:00 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/8] lib/kms: Simplify kmstest_get_vbl_flag()
Date: Tue, 13 Jan 2026 14:04:36 +0200
Message-ID: <20260113120439.12577-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Simplify kmstest_get_vbl_flag() by observing that:
- '0 << DRM_VBLANK_HIGH_CRTC_SHIFT == 0' so we don't
  have to have special treatment for crtc_offset==0
- the kernel will treat '1 << DRM_VBLANK_HIGH_CRTC_SHIFT'
  and 'DRM_VBLANK_SECONDARY' identically, so the
  crtc_offset==1 special case can also go away.

DRM_VBLANK_HIGH_CRTC_* was added in 2011, so there is no real
point in keeping support for old kernels that don't have it.
And in case someone is crazy enoguh to run igt on a kernel older
than that we can toss in a DRM_CAP_VBLANK_HIGH_CRTC check into
igt_display_require().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8581a218a83c..3cb1273f3041 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3186,6 +3186,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	display->drm_fd = drm_fd;
 	is_intel_dev = is_intel_device(drm_fd);
 
+	igt_require(igt_has_drm_cap(drm_fd, DRM_CAP_VBLANK_HIGH_CRTC));
+
 	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
 		display->is_atomic = 1;
 
@@ -6125,19 +6127,13 @@ void igt_cleanup_uevents(struct udev_monitor *mon)
  */
 uint32_t kmstest_get_vbl_flag(int crtc_offset)
 {
-	uint32_t pipe_id;
+	uint32_t flag;
 
-	if (crtc_offset == 0)
-		pipe_id = 0;
-	else if (crtc_offset == 1)
-		pipe_id = _DRM_VBLANK_SECONDARY;
-	else {
-		uint32_t pipe_flag = crtc_offset << 1;
-		igt_assert(!(pipe_flag & ~DRM_VBLANK_HIGH_CRTC_MASK));
-		pipe_id = pipe_flag;
-	}
+	flag = crtc_offset << DRM_VBLANK_HIGH_CRTC_SHIFT;
+
+	igt_assert_eq(flag & ~DRM_VBLANK_HIGH_CRTC_MASK, 0);
 
-	return pipe_id;
+	return flag;
 }
 
 static inline const uint32_t *
-- 
2.51.2

