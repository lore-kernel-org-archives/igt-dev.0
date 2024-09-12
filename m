Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71A5EE644D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 06:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E628910EAD5;
	Thu, 12 Sep 2024 06:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQKxKUzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5000210EAD5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 06:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726121807; x=1757657807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BDW2QGdXE9stHlHcNSluFq+rI7aAv//BBZeh+87JvV8=;
 b=OQKxKUzKhfyckLkihcTmPqMaCs1iMf5woDT5XdLUQ+nTJTWbJzx0Plha
 DOpwRM6V3RRRZoNq2Ie22U2pkThv+mlHGx0IRjKCVXSkFRKbalcqqsBNF
 39oy254tY6yQA6LfTN7E5hsWR9ECaMPx/LCz643a9F+G205RTL2CZ631r
 CG1PZRyuUOe1sEbx0kmUhoJ24hTggGCxDB2xtFPcatMwjEBeqM8w27bm7
 xbc81Ts1duAE2+kqRrwIQ52m41fm6s2v2G5lB98gD2MGEFbHYd5xxnWFh
 xD428x8A1+VR2Rzh52FGUcvhw6XLu0GcAgEGcDwC8Zlvb/NHYS8aWJlFc Q==;
X-CSE-ConnectionGUID: NsikaokbTMeQp4Sv/PKTUQ==
X-CSE-MsgGUID: J4Hrzu/9S1S5nJcFd1lnpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25056617"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25056617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 23:16:47 -0700
X-CSE-ConnectionGUID: HyZ9EMGpRG2GN6t0mC8QWQ==
X-CSE-MsgGUID: tiI1TVtmR86MAgRXgvV1Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="98310273"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 23:16:45 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/6] lib/igt_kms: allow set and reset value to be same
Date: Thu, 12 Sep 2024 11:58:36 +0530
Message-Id: <20240912062839.760661-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912062839.760661-1-kunal1.joshi@intel.com>
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
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

allow set and reset value to be same, let the caller handle
this scenario instead.

example scenario where this is required.
i915_dp_force_link_rate should be auto before starting test
should be auto at exit

v2: handle the scenario at caller side

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 863eb5331..a7f8d0f83 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1557,7 +1557,8 @@ static void connector_attr_free(struct igt_connector_attr *c)
 static bool connector_attr_set(int idx, drmModeConnector *connector,
 			       int dir, igt_connector_attr_set set,
 			       const char *attr, const char *value,
-			       const char *reset_value)
+			       const char *reset_value,
+			       bool allow_set_equals_reset)
 {
 	struct igt_connector_attr *c;
 
@@ -1573,7 +1574,7 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
 		return false;
 	}
 
-	if (!strcmp(c->value, c->reset_value))
+	if (!allow_set_equals_reset && !strcmp(c->value, c->reset_value))
 		connector_attr_free(c);
 
 	return true;
@@ -1582,7 +1583,8 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
 static bool connector_attr_set_sysfs(int drm_fd,
 				     drmModeConnector *connector,
 				     const char *attr, const char *value,
-				     const char *reset_value)
+				     const char *reset_value,
+				     bool allow_set_equals_reset)
 {
 	char name[80];
 	int idx, dir;
@@ -1600,7 +1602,8 @@ static bool connector_attr_set_sysfs(int drm_fd,
 		return false;
 
 	if (!connector_attr_set(idx, connector, dir,
-				igt_sysfs_set, attr, value, reset_value))
+				igt_sysfs_set, attr, value, reset_value,
+				allow_set_equals_reset))
 		return false;
 
 	igt_debug("Connector %s/%s is now %s\n", name, attr, value);
@@ -1611,7 +1614,8 @@ static bool connector_attr_set_sysfs(int drm_fd,
 static bool connector_attr_set_debugfs(int drm_fd,
 				       drmModeConnector *connector,
 				       const char *attr, const char *value,
-				       const char *reset_value)
+				       const char *reset_value,
+				       bool allow_set_equals_reset)
 {
 	char name[80];
 	int idx, dir;
@@ -1630,7 +1634,7 @@ static bool connector_attr_set_debugfs(int drm_fd,
 
 	if (!connector_attr_set(idx, connector, dir,
 				igt_sysfs_set, attr,
-				value, reset_value))
+				value, reset_value, allow_set_equals_reset))
 		return false;
 
 	igt_info("Connector %s/%s is now %s\n", name, attr, value);
@@ -1662,7 +1666,8 @@ static bool force_connector(int drm_fd,
 			    const char *value)
 {
 	return connector_attr_set_sysfs(drm_fd, connector,
-					"status", value, "detect");
+					"status", value, "detect",
+					false);
 }
 
 /**
@@ -1727,7 +1732,7 @@ static bool force_connector_bigjoiner(int drm_fd,
 {
 	return connector_attr_set_debugfs(drm_fd, connector,
 					  "i915_bigjoiner_force_enable",
-					  value, "0");
+					  value, "0", false);
 }
 
 /**
-- 
2.43.0

