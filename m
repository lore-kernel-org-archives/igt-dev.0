Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CEFD2D0E0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6792710E4B7;
	Tue, 13 Jan 2026 12:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+vslleA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523A610E4B7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768305905; x=1799841905;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VkPeOO4IHUo0rEIvDNI2zwT8qJvy2hfQ7Q8+NiRFo48=;
 b=Z+vslleAlLmQPH0SVNFls/SgQ07WY8tRg6/qOmG7k7N88hQd7C+0RAEU
 P5dDqu9YE14nP0Ritu7PD+URPS1X9EdmmJuKuic+q33rfxQ8hpum9s902
 Ma+MUwt5zsNviK2iuDPM2/4JCPt6KU1+0w5pIWQ3CjBYRbyLRqhboUEz5
 F5Ahdgh92yHTatmM+k+iDkIvbUmvA45WPq9t0/d0Xc9b/Cbm4tt+pE0aE
 pAJzC4i0VExUXJ86+qxFTK4LCkJ0+45W2PDuYJjHFKIOtLbEjpPpzsdED
 aOVjglxp+M0mfahkNjGiU4hn+uKdLcw+/PDC4z7MM2qy8On2MpUkXI2aT A==;
X-CSE-ConnectionGUID: 5zFChoO8SaaMDixzqsun0g==
X-CSE-MsgGUID: im4VT16hRhaEmLZ2t0eZRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92256392"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="92256392"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:05:05 -0800
X-CSE-ConnectionGUID: 1/sXgEaQTougyBriCpLoEw==
X-CSE-MsgGUID: nUXglLTWSFudvKY/vUC0Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208835827"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.52])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:05:04 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/8] tests/kms_async_flips: Use designated initializers
 in wait_for_vblank()
Date: Tue, 13 Jan 2026 14:04:37 +0200
Message-ID: <20260113120439.12577-7-ville.syrjala@linux.intel.com>
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

Clean up wait_vblank() by using designated initializers.
The non-blocking queue_vblank() counterpart already does
it this way.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 71570385c32e..92246037ca87 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -555,18 +555,14 @@ static void test_async_flip(data_t *data)
 
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int *seq)
 {
-	drmVBlank wait_vbl;
-	uint32_t pipe_id_flag;
-	int pipe;
-
-	memset(&wait_vbl, 0, sizeof(wait_vbl));
-	pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
-	pipe_id_flag = kmstest_get_vbl_flag(pipe);
-
-	wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
-	wait_vbl.request.sequence = 1;
+	int pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
+	drmVBlank wait_vbl = {
+		.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(pipe),
+		.request.sequence = 1,
+	};
 
 	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl);
+
 	*vbl_time = wait_vbl.reply.tval_sec * 1000000 + wait_vbl.reply.tval_usec;
 	*seq = wait_vbl.reply.sequence;
 }
-- 
2.51.2

