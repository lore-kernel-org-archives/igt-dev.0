Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640F3CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 04:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFA110E16E;
	Tue, 19 May 2026 04:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f42mMJXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590BC10E16E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 04:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779164367; x=1810700367;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oix+2r0iZbFqINWYbqljEzM41aGLGLalu6BJHCpT3VU=;
 b=f42mMJXRKFiRpDp+BHKsUlx2qwgi+ToQe/HbniJSF6319+ATaIQ5/RMf
 Dqdnb7GWE2MN0YzHamJooFSaPHLJr+ROlEqr1wZfiNoFtIynH8mv+lUL/
 go/hCkcQ4WZ6d3GWuGPrl+ZZDAA6aVGUx2aRUXSCKW+Dq8K1ksg980h3n
 hz+UIn7fF02lP7hZQZoeihfk+/nUJ1n4jB6Any5Umn00ufVailE4r6PQ1
 XARkHSVMtKX/xT+dZfKtJWFuowLyML/dYnsfyC6sfCfW9TSmiALaKvVLj
 0Gcsx8QoxRhj9PGtR7O2heQLoRgSR6F9Z5c6DuTMA2SaLcVIX16YkXnoD g==;
X-CSE-ConnectionGUID: XYKr4JiGQvGUta9e+E1TCQ==
X-CSE-MsgGUID: M+Vot4v8SUGGBdeFZ0ISIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="105491992"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="105491992"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 21:19:27 -0700
X-CSE-ConnectionGUID: BuVeivncRVSpEk3R5rbIVA==
X-CSE-MsgGUID: xMbCk+ApQ26tpr7P5rvTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="235191768"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 21:19:25 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_setmode: Add HDMI 2.0 clock limit for mode
 selection
Date: Tue, 19 May 2026 09:47:50 +0530
Message-ID: <20260519041750.1199802-1-jeevan.b@intel.com>
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
v3: Refactor connector compatibility checks into helper for clarity.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 1f2849bc2..4d4f980f6 100644
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
@@ -165,6 +168,35 @@ static bool connector_supports_mode(drmModeConnector *connector,
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
+static bool mode_compatible_with_connectors(struct crtc_config *crtc,
+					    drmModeModeInfo *mode)
+{
+	int k;
+
+	for (k = 0; k < crtc->connector_count; k++) {
+		drmModeConnector *conn = crtc->cconfs[k].connector;
+
+		/* Check HDMI 2.0 clock + per-connector compatibility */
+		if (hdmi_connector_mode_exceeds_hdmi20_limit(conn, mode))
+			return false;
+
+		if (!connector_supports_mode(conn, mode))
+			return false;
+	}
+
+	return true;
+}
+
 static bool crtc_supports_mode(struct crtc_config *crtc, drmModeModeInfo *mode)
 {
 	int i;
@@ -270,8 +302,11 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 				if (conn->modes[j].clock < mode->clock)
 					mode = &conn->modes[j];
 			}
-			*mode_ret = *mode;
-			return;
+
+			if (mode_compatible_with_connectors(crtc, mode)) {
+				*mode_ret = *mode;
+				return;
+			}
 		}
 	}
 
-- 
2.43.0

