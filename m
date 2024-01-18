Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDC3C47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 10:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A864E10E76A;
	Thu, 18 Jan 2024 10:36:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA5810E76C
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705574210; x=1737110210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KvuOtTaEyQ8ageNQL0I1CiNNJEXh3upCI4/DXAWL5UA=;
 b=U63innVUQtmZmSA0ixYTlwuZzmPtzFrUMg5UEA7ZK1E76FunSiQVHaW1
 Js1LVPvDaR09WOoqCL3KBMPvGmExhLoElz6+uv/zK6hvPIAQOorEQw9N+
 boeF3IesuQALmNXUVoC5uy18E1Uckr9oUs8Y/8fcHQZt/sIFzUO2vCrVG
 USr2t+VkSs1yvo5G1rWplbCKbMqbpfHH05dbsPWITjQCNYo/xJAv07+VN
 HEDEui/IUIv8twYBiZ0e33IM3Cm3kqnQnQTR5lx9iV7ih0oMJ2SOFx+Vo
 H+XreGS1onLNi4z2HH5a77Cw7lMx2BHamVKdIPDWkj2i61oTb07FgHAZz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13761000"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="13761000"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 02:36:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="369809"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 02:36:49 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] lib/igt_kms: add support for choosing big joiner
 mode
Date: Thu, 18 Jan 2024 16:16:16 +0530
Message-Id: <20240118104616.988247-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118104616.988247-1-kunal1.joshi@intel.com>
References: <20240118104616.988247-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

add support to choose big joiner mode with environment
variable, use mode with highest clock if no mode with big joiner
found.

v2: reuse bigjoiner_mode_found (Bhanu)
v3: avoid returning from multiple places (Bhanu)
    avoid frequent debugfs reads (Bhanu)
v4: use default mode (Bhanu)

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7a07e62f8..77059dd34 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1771,8 +1771,9 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode)
 {
+	bool found;
 	char *env;
-	int i;
+	int i, max_dotclock;
 
 	if (!connector->count_modes) {
 		igt_warn("no modes for connector %d\n",
@@ -1781,14 +1782,23 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 	}
 
 	env = getenv("IGT_KMS_RESOLUTION");
+	max_dotclock = igt_get_max_dotclock(drm_fd);
 	if (env) {
 		/*
-		 * Only (0 or 1) and (lowest or highest) are allowed.
+		 * Only (0 or 1 or 2) and (lowest or highest or joiner) are allowed.
 		 *
 		 * 0/lowest: Choose connector mode with lowest possible resolution.
 		 * 1/highest: Choose connector mode with highest possible resolution.
+		 * 2/joiner: Choose connector mode with bigjoiner support or default
+		 *	     mode if can't support  big joiner
 		 */
-		if (!strcmp(env, "highest") || !strcmp(env, "1"))
+		if (!strcmp(env, "joiner") || !strcmp(env, "2")) {
+			found = bigjoiner_mode_found(drm_fd, connector,
+						     max_dotclock);
+			if (!found)
+				goto default_mode;
+		}
+		else if (!strcmp(env, "highest") || !strcmp(env, "1"))
 			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
 		else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
 			igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
-- 
2.25.1

