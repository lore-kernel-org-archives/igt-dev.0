Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852CF109B463
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 13:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3918810E393;
	Tue, 31 Mar 2026 13:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixWb/POr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665A410E393
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774962045; x=1806498045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oix+2r0iZbFqINWYbqljEzM41aGLGLalu6BJHCpT3VU=;
 b=ixWb/POrSeEisyyfoCXknCvL0rvQ8ut0Jg8GyPDDoOb0ku7As86NVWVl
 2nehoYkcUox1vBUaeKug/xyMl1vX7915lQ8evel9Q5CQ3OuOjo8Yu3wJm
 vUajrpQA37klr0bSHmH/ULK9P5QHf/YSxgOf+/NuqM3U/9YQtIUmStk8+
 NECg1L8YiHftAQjygI9l6AG+jcKGvpjc514KIaLc2rdSIGYJXR7lWJP0K
 qZSQDG34CxiiXGa3FrehOEuISa25OM8W/az7sJq1sQyo4aH2dJk8U17vm
 uMQyi0bQFho4odS12nwQ/eYLsjSJuwD+k5Z2lh9rXETvmrvNd1cEyhOi9 Q==;
X-CSE-ConnectionGUID: xd9XC20ZQ6Kyly5ddj2LTA==
X-CSE-MsgGUID: PWV93O8cTUKXI/LiIlBQ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76035626"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="76035626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:00:43 -0700
X-CSE-ConnectionGUID: Jl8CBEX6Sqiklbat+UOelw==
X-CSE-MsgGUID: LOsH9kegTZictMVNN5+b7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="264294757"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:00:41 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_setmode: Add HDMI 2.0 clock limit for mode
 selection
Date: Tue, 31 Mar 2026 18:29:19 +0530
Message-ID: <20260331125919.615218-1-jeevan.b@intel.com>
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

