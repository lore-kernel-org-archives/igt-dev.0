Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBF71061B21
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 10:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A474610EA52;
	Tue, 31 Mar 2026 10:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hp6yyTmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE61510EA52
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 10:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774953744; x=1806489744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6pgtilMGgLt+mMC1R7xlxVJGgiiR63CAswS0btwjuI4=;
 b=hp6yyTmck8/YCA2ulMIPu92/Czt4O7LkcYsZhCG0CkzR9beJRtmPm5nx
 UMzu/4ygNx1/YOKVts1giZePfp1x69shjgW34WT5JGlB9vfpaBNlyIg8N
 dQIBd2KCMdQ7HTlOP0tMR5n+MFCQQhdGOmOFlfHgO6sbo7wzsymsSIJCj
 ER44/ySzNMRn8UVk55khRvpFs3TDqDpoMkji7TuAvumAW2a5j8oqanfHX
 QLuZb2CTK8HIDltd9GHiDCTVA9/WVtV9FOrPb8VdIToPJWcv7DFHD7eZp
 dj+gb1p4MOoepNTuV9m5WejmQ7JOusVyccc4eW/Y7fbpMlOFNVVx3SizK Q==;
X-CSE-ConnectionGUID: xsJkZjq/TsiFrRBGw5iR4w==
X-CSE-MsgGUID: 6gUlqgqQQVORsP5Fbfqwmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="78555267"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="78555267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 03:42:24 -0700
X-CSE-ConnectionGUID: ZVEJTf1+TdWJieM0c6Sv+A==
X-CSE-MsgGUID: E3c2Yq+WRcussPCGAsTPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="256828259"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:42:21 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_setmode: Add HDMI 2.0 clock limit for mode
 selection
Date: Tue, 31 Mar 2026 16:11:00 +0530
Message-ID: <20260331104100.614718-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

eDP modes with high clock rates were being forced on HDMI 2.0 displays,
causing kernel to reject with EINVAL. Add clock validation to skip
incompatible eDP modes and fall back to supported modes.

v2: Add HDMI 2.0 clock limit helper, drop crtc_supports_mode(),
    and ensure per-connector compatibility to avoid invalid modes.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 1f2849bc2..f1c1afe45 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -79,6 +79,9 @@
 /* restricted pipe count */
 #define CRTC_RESTRICT_CNT 2
 
+/* Clock limit for HDMI 2.0 */
+#define HDMI_2_0_MAX_CLOCK_KHZ 600000
+
 static int drm_fd;
 static drmModeRes *drm_resources;
 static int filter_test_id;
@@ -165,6 +168,16 @@ static bool connector_supports_mode(drmModeConnector *connector,
 	return false;
 }
 
+static bool hdmi_connector_mode_exceeds_hdmi20_limit(drmModeConnector *connector,
+						     drmModeModeInfo *mode)
+{
+	if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
+	    connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
+		return false;
+
+	return mode->clock > HDMI_2_0_MAX_CLOCK_KHZ;
+}
+
 static bool crtc_supports_mode(struct crtc_config *crtc, drmModeModeInfo *mode)
 {
 	int i;
@@ -270,8 +283,35 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 				if (conn->modes[j].clock < mode->clock)
 					mode = &conn->modes[j];
 			}
-			*mode_ret = *mode;
-			return;
+
+			/* Check HDMI 2.0 clock + per-connector compatibility */
+			{
+				int k;
+				bool compatible = true;
+
+				for (k = 0; k < crtc->connector_count; k++) {
+					drmModeConnector *other_conn =
+						crtc->cconfs[k].connector;
+
+					/* HDMI 2.0 clock constraint */
+					if (hdmi_connector_mode_exceeds_hdmi20_limit(other_conn,
+										     mode)) {
+						compatible = false;
+						break;
+					}
+
+					/* Ensure connector supports the mode */
+					if (!connector_supports_mode(other_conn, mode)) {
+						compatible = false;
+						break;
+					}
+				}
+
+				if (compatible) {
+					*mode_ret = *mode;
+					return;
+				}
+			}
 		}
 	}
 
-- 
2.43.0

