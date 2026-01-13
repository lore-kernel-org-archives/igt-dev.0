Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDF3D2D0E0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCAD10E334;
	Tue, 13 Jan 2026 12:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIgj158b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B633810E334
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 12:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768305898; x=1799841898;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VDp8Ut9lOWNpL6XsfIw/hxkWWTTHCs2TTUd3fso0HaQ=;
 b=mIgj158bsGxI55bVU2tTDOPPRnRltqL6ZOJnWHMh/ZV9vLPveT9Yg30m
 cCbEVyoYd1Mbd/lL5RmpHy8WIwB+rNKSvBPRWLNx1ud+1STRDZh7dEENf
 j8uWT7+1A3D9Un9f1rky/ASeMkrxVcQk0jhoUXbdtSmwNA9gRV6YulXhA
 usfWhbSlkxrRO6oYhlDgNvTSbFl1vzpG3W9QClwKmpzJ3+SEsPnTPrYFe
 0he6FkUr/1w+QvXLdBbaOcBfr5TddtanTIPN5ZOWUphgE1dTVJQf9JwRU
 70Fq3GMmMBUqJt/29jOd5KyLBqi7Q0+461oSAuP0XAa+dE0SNjC1O4BZ2 Q==;
X-CSE-ConnectionGUID: pTTbAdZbTEaoHUYQxyxJVA==
X-CSE-MsgGUID: HUjaZq/SRKSZY5RmI0miyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92256388"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="92256388"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:57 -0800
X-CSE-ConnectionGUID: AP9/gc8NTH+a0fk9V1VQOw==
X-CSE-MsgGUID: W2WvS39wTNWNsh5a6UyYlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208835726"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.52])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:56 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/8] lib/kms: Nuke pipe_select()
Date: Tue, 13 Jan 2026 14:04:35 +0200
Message-ID: <20260113120439.12577-5-ville.syrjala@linux.intel.com>
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

pipe_select() is just a second implementation of
kmstest_get_vbl_flag(). Get rid of the duplicated
function.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 77b3ae2afa01..8581a218a83c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2484,16 +2484,6 @@ int kmstest_get_crtc_idx(drmModeRes *res, uint32_t crtc_id)
 	igt_assert(false);
 }
 
-static inline uint32_t pipe_select(int pipe)
-{
-	if (pipe > 1)
-		return pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
-	else if (pipe > 0)
-		return DRM_VBLANK_SECONDARY;
-	else
-		return 0;
-}
-
 /**
  * kmstest_get_vblank:
  * @fd: Opened drm file descriptor
@@ -2509,7 +2499,7 @@ unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags)
 	union drm_wait_vblank vbl;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE | pipe_select(pipe) | flags;
+	vbl.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(pipe) | flags;
 	if (drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl))
 		return 0;
 
-- 
2.51.2

