Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03F1EDA698
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 16:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817E110E099;
	Tue,  3 Mar 2026 16:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFw6l3BR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FA310E099
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772553931; x=1804089931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dDwTxjtE9kj9gLY6Cz8pz+j+/XLWXNRgD/1gxyLsIFA=;
 b=TFw6l3BRLDEsKTu6grAtcUOSv/UzP4O3oujc+zqQErM/5RICyVQYdXHq
 iXqdUxWYzFCfLFibE3Yu3lh0JCMByOz32/T7JvvHpXXCdtSVQumnKSMnk
 b3kRv8qF58UVxblPUhXT+nIAITT2t3neujTn89eDFtbj7jbxEbt+6LPhW
 oPY7vuxxWz/Px1v4BAhsleQhLCfo03JKzSyzlx3dtKZFFh1FdVfTgnAeV
 bQzrjxuyWd8SMciPNdQaWu6mz8gO98XhsYteSCkMCMxbtFiRWpYNJjoKq
 uZWT4b/tDc3WG9VloUVx1RfHarjqiqqVSlQudVkt1x6pbSMTsuYswwPb0 g==;
X-CSE-ConnectionGUID: +RRt6s1qRHmskVvAM0mHFg==
X-CSE-MsgGUID: j96OsqDQSmWA3FsrzZb/Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84940462"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84940462"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:05:31 -0800
X-CSE-ConnectionGUID: NwIEO41nT/SrEutF3upi8Q==
X-CSE-MsgGUID: wHW12eVRTcmD2FjShd9H/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215104653"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:05:30 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/intel/kms_pipe_stress: Clamp the source
 size to the FB bounds
Date: Tue,  3 Mar 2026 21:56:23 +0530
Message-ID: <20260303162623.324721-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303162623.324721-1-sowmiya.s@intel.com>
References: <20260303162623.324721-1-sowmiya.s@intel.com>
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

Use min_t(int, ...) for source size calculations
to start scaling from a size guaranteed to fit in the FB.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_pipe_stress.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 416757c9b..c2d9de1b7 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -458,12 +458,14 @@ static int pipe_stress(struct data *data, igt_output_t *output,
 			plane_width = cursor_width;
 			plane_height = cursor_height;
 		} else {
-			universal_plane_set_fb(plane,
-					       &data->fb[crtc->pipe * MAX_PLANES + i],
-					       mode->hdisplay, mode->vdisplay);
+			struct igt_fb *fb = &data->fb[crtc->pipe * MAX_PLANES + i];
+			int src_width = min_t(int, mode->hdisplay, fb->width);
+			int src_height = min_t(int, mode->vdisplay, fb->height);
 
-			plane_width = (mode->hdisplay * 3) / 4;
-			plane_height = (mode->vdisplay * 3) / 4;
+			universal_plane_set_fb(plane, fb, src_width, src_height);
+
+			plane_width = (src_width * 3) / 4;
+			plane_height = (src_height * 3) / 4;
 
 			ret = try_plane_scaling(data, plane, plane_width, plane_height);
 
-- 
2.43.0

