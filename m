Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5107CD5BA4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 09:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939C910E3F6;
	Thu, 21 May 2026 09:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCb4YVOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B533610E3F6
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779354144; x=1810890144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5mQEujRmiQiRmibUyYv2JckN3QHGoeRw56Ax//Po/qw=;
 b=BCb4YVOQvUoXmvQ3p7DkZQK5cziCOgHSqA57USrV2ZmXvvR+ljjMIrLm
 Dph1XLuYB+av0PpwApUVUrCCzvVFfT9BlbdQd/8h1MB4qtJ6I7yPIKmVc
 3zZ4auAB6alc20A7uOATf372LokPOindf5R/Bh8W/V9Zd05TYqBfxd5hM
 gl7PHwuFZMiKwk6NpbApPphzHPAlKiVyYamqAoZX0hHDUU4MFV1BdGhYy
 Q2HHmQ4s/nGSS2CFaUL/ahDr+Kv8mLLenkA14mvS2mTlxtghJJX5fXcEm
 I39m2Q2egjzCafm9Swi9wHTfqtaPXlWFIfe8+2JqOmjLxIeQJ9KmPgBE7 Q==;
X-CSE-ConnectionGUID: 1GtMf6JZRfKU2X5V1GJt6g==
X-CSE-MsgGUID: ruM9dhXqR4a8bPDLINwL3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79296146"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="79296146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 02:02:23 -0700
X-CSE-ConnectionGUID: m3gdWENCRvuLZRCDafLCdA==
X-CSE-MsgGUID: 2ZT78LN2S8a73zt561TCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="244763934"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 02:02:22 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_setmode: Add HDMI 2.0 clock limit for mode
 selection
Date: Thu, 21 May 2026 14:30:48 +0530
Message-ID: <20260521090048.1378306-1-jeevan.b@intel.com>
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
v4: Remove connector_supports_mode function and rename variable.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_setmode.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 1f2849bc2..3adc4534c 100644
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
@@ -165,6 +168,32 @@ static bool connector_supports_mode(drmModeConnector *connector,
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
+	int i;
+
+	for (i = 0; i < crtc->connector_count; i++) {
+		drmModeConnector *conn = crtc->cconfs[i].connector;
+
+		/* Check HDMI 2.0 clock + per-connector compatibility */
+		if (hdmi_connector_mode_exceeds_hdmi20_limit(conn, mode))
+			return false;
+	}
+
+	return true;
+}
+
 static bool crtc_supports_mode(struct crtc_config *crtc, drmModeModeInfo *mode)
 {
 	int i;
@@ -270,8 +299,11 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
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

