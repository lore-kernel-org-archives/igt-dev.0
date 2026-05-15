Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414AFCD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 08:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB3210E0E4;
	Fri, 15 May 2026 08:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHrhMhnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF4F10E0E4
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778832872; x=1810368872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4rEUUia0avaPczBX8SVpnkq91hGWLUDEiXtf5kL0Ya4=;
 b=kHrhMhnrWUO03daZ+zObRI8tXT3s5vCPRlozauCDv6Jmdq+mHrVPDGSK
 P28+NTrsGUAHrv5yuk6oGqb/kP9BIdh3Az4a+51UGRag4eeY/xbdpO9N0
 SoYPKGf6+A09J5lvhmdWLvn70qwsKaWGBvQmHQj1wTdq3m38FLxNV2Nmn
 IZkSBBA6ObEkJEDTkAu7w/B4ak/kjPIB+LOhwYhtB/F6F1xtY+FVSAyTo
 Qp2+ayWmF46o7TOdzwliS0HBsMoacNoHQHY+C74BdSgAiGimd0Xl5IeSh
 vAz/CGr6LFCZzferyztQoT4s6IabZOFa64C3xUbcOXjFydd2EZ19/KPRE Q==;
X-CSE-ConnectionGUID: MzbWkoypR2e8CYDWFuRtZA==
X-CSE-MsgGUID: OtQr/iC0TfmFKpgweCYaBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="67315076"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="67315076"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:14:32 -0700
X-CSE-ConnectionGUID: CuOJw9waSpms8lyjSo/BlQ==
X-CSE-MsgGUID: Q8qJzuOzQr6cQ1FXwgxkDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242973227"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 15 May 2026 01:14:30 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
Subject: [PATCH i-g-t] tests/kms_content_protection: clamp plane src/dst to
 output mode
Date: Fri, 15 May 2026 13:44:27 +0530
Message-Id: <20260515081427.973496-1-suraj.kandpal@intel.com>
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

create_fbs() sizes the shared red/green FBs to the max width and
height across all connected outputs. With panels of differing native
resolutions (e.g. 3504x2190 and 3840x2160), the FB ends up larger than
at least one panel in some dimension. igt_plane_set_fb() resets the
plane src and dst rectangles to the full FB size, so subsequent
commits submit a source rect that exceeds the CRTC active area and
atomic check rejects them with -EINVAL before HDCP authentication can
start.

Clamp the plane source (igt_fb_set_size) and destination
(igt_plane_set_size) to the output's current mode after every
igt_plane_set_fb() in modeset_with_fb(), test_cp_enable(),
test_cp_disable() and test_mst_cp_disable().

Tested-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index c59441f11..d1b7c5863 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -264,16 +264,22 @@ static void modeset_with_fb(igt_output_t *output,
 	igt_display_t *display = &data.display;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
+	int width, height;
 
 	mode = igt_output_get_mode(output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data.red);
-	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
+	igt_fb_set_size(&data.red, primary, width, height);
+	igt_plane_set_size(primary, width, height);
 
 	igt_display_commit2(display, commit_style);
 
 	igt_plane_set_fb(primary, &data.green);
+	igt_fb_set_size(&data.green, primary, width, height);
+	igt_plane_set_size(primary, width, height);
 
 	/* Wait for Flip completion before starting the HDCP authentication */
 	commit_display_and_wait_for_flip(commit_style);
@@ -284,6 +290,8 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
 {
 	igt_display_t *display = &data.display;
 	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	int width, height;
 	bool ret;
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -302,7 +310,12 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
 	ret = wait_for_prop_value(output, CP_ENABLED,
 				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 	if (ret) {
+		mode = igt_output_get_mode(output);
+		width = mode->hdisplay;
+		height = mode->vdisplay;
 		igt_plane_set_fb(primary, &data.green);
+		igt_plane_set_size(primary, width, height);
+		igt_fb_set_size(&data.green, primary, width, height);
 		igt_display_commit2(display, commit_style);
 	}
 
@@ -315,13 +328,20 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
 {
 	igt_display_t *display = &data.display;
 	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	int width, height;
 	bool ret;
 	int count;
 	u64 val;
 
 	for (count = 0; count < valid_outputs; count++) {
 		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
+		mode = igt_output_get_mode(hdcp_mst_output[count]);
+		width = mode->hdisplay;
+		height = mode->vdisplay;
 		igt_plane_set_fb(primary, &data.red);
+		igt_fb_set_size(&data.red, primary, width, height);
+		igt_plane_set_size(primary, width, height);
 		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
 					  CP_UNDESIRED);
 	}
@@ -343,10 +363,15 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
 {
 	igt_display_t *display = &data.display;
 	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	int width, height;
 	bool ret;
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
+	mode = igt_output_get_mode(output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
 	/*
 	 * Even on HDCP enable failed scenario, IGT should exit leaving the
 	 * "content protection" at "UNDESIRED".
@@ -354,6 +379,8 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
 				  CP_UNDESIRED);
 	igt_plane_set_fb(primary, &data.red);
+	igt_plane_set_size(primary, width, height);
+	igt_fb_set_size(&data.red, primary, width, height);
 	igt_display_commit2(display, commit_style);
 
 	/* Wait for HDCP to be disabled, before crtc off */
-- 
2.34.1

