Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4276BD73EBD
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 05:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F7D10E903;
	Fri, 30 Jan 2026 05:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAMh8/gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF8410E903
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 05:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769752462; x=1801288462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jcIDJUibz9Z6G0j4KGh94WfgDTWb+7uQrvMIm7w+i2Q=;
 b=bAMh8/gp/qdsFgOmMRQcwmk4g8lN8lo0Wov26W+MFQUA3z4X6EN4XWW1
 gusNZxCHfwxMMMLM60y+E7YsujBHXjiQDoKGUL7tsLzhHpouSF7nqWvOA
 xl8iqNn38yBXhRlQt7LxuAH/RmelHIqWUYdeOofN4BuAI2radvHvjFsLc
 wtQBdSTRx/uYmILaeX7IVC4YCJLmLqwAsZnoHmqKvfc5p1RWjbA/p2KuW
 MlKfnYKWFlqqBDzZ6+OkS2AqMJsPOfVJheB/AFl3ylW1M++T5xDrXZGtn
 1murso2GLYhdTI6yxz/UpgJr8pGN5U1/widL2bjv6rU2lcBhQMYpkfigq g==;
X-CSE-ConnectionGUID: HzplefMXRCGGT0K5C2X6pg==
X-CSE-MsgGUID: GU/FMUXrTiSUb8lbng7UXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71038275"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="71038275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 21:54:22 -0800
X-CSE-ConnectionGUID: 4lkGWZZVQie7x/DrVg5l6g==
X-CSE-MsgGUID: ZTykuyyTS2+t4s5gfwA2Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208779749"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 21:54:20 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_setmode: Add HDMI 2.0 clock limit for mode
 selection
Date: Fri, 30 Jan 2026 11:24:16 +0530
Message-ID: <20260130055416.198799-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 9c0649e17..4b2f16751 100644
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
@@ -270,8 +273,25 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 				if (conn->modes[j].clock < mode->clock)
 					mode = &conn->modes[j];
 			}
-			*mode_ret = *mode;
-			return;
+
+			/* Check clock limit for HDMI 2.0 */
+			bool hdmi_compatible = true;
+
+			for (int k = 0; k < crtc->connector_count; k++) {
+				drmModeConnector *other_conn = crtc->cconfs[k].connector;
+
+				if ((other_conn->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+				    other_conn->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
+				    mode->clock > HDMI_2_0_MAX_CLOCK_KHZ) {
+					hdmi_compatible = false;
+					break;
+				}
+			}
+
+			if (hdmi_compatible && crtc_supports_mode(crtc, mode)) {
+				*mode_ret = *mode;
+				return;
+			}
 		}
 	}
 
-- 
2.43.0

