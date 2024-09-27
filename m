Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B06CDD1AE
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 13:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABC610EC53;
	Fri, 27 Sep 2024 13:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kH2q/O6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AB510EC53
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445031; x=1758981031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gyAgf7oF/51RhvqS49QO7BsBQKe6CDy4BXxFyywdV6c=;
 b=kH2q/O6pnBrpU1HZVRhTwSGqxUxorHAjYMqIQhx1IXH9U0awK2kPRmex
 QmAwAPQVd2fHumwB1vPWRmCB+l9tmJESulr1TzIeNP7skP2mPq5kdrOC1
 kVuD8KiRYml3cGAzimdAdJabOA8NpN+qfv/OXePmpDJ1Qg8VUxqOq2qyI
 d/N/W7OwuGokBavOSremaJu8C75Mqrq4yuKvOynwtyx+Hz/NW+SCzEkdT
 z85GEd1Wv5aBzVPBNnsbANSg1W9iw9XBS51aU68F+JL5Rl79uU70BmbnP
 bIWYEf4/Zqc5edXGvLxxN7PeigTsrbvuHYsH1f67VVcwkJG7J6haQxfKM Q==;
X-CSE-ConnectionGUID: Kxxfw2K6RfW8D1eG45DLjw==
X-CSE-MsgGUID: mla0AgvlRv2ri0dE8Ei0Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49116003"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="49116003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:50:26 -0700
X-CSE-ConnectionGUID: BEY/G5yVSXqxcXc0V9qyvw==
X-CSE-MsgGUID: hCbFRaJLSeiefI5kh82D0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72850018"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:50:25 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 2/6] lib/igt_kms: allow set and reset value to be same
Date: Fri, 27 Sep 2024 19:32:18 +0530
Message-Id: <20240927140222.1688565-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927140222.1688565-1-kunal1.joshi@intel.com>
References: <20240927140222.1688565-1-kunal1.joshi@intel.com>
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

v3: rename allow_set_equals_reset -> force_reset (Imre)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 571f78eb9..c219aa0b1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1557,7 +1557,8 @@ static void connector_attr_free(struct igt_connector_attr *c)
 static bool connector_attr_set(int idx, drmModeConnector *connector,
 			       int dir, igt_connector_attr_set set,
 			       const char *attr, const char *value,
-			       const char *reset_value)
+			       const char *reset_value,
+			       bool force_reset)
 {
 	struct igt_connector_attr *c;
 
@@ -1573,7 +1574,7 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
 		return false;
 	}
 
-	if (!strcmp(c->value, c->reset_value))
+	if (!force_reset && !strcmp(c->value, c->reset_value))
 		connector_attr_free(c);
 
 	return true;
@@ -1582,7 +1583,8 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
 static bool connector_attr_set_sysfs(int drm_fd,
 				     drmModeConnector *connector,
 				     const char *attr, const char *value,
-				     const char *reset_value)
+				     const char *reset_value,
+				     bool force_reset)
 {
 	char name[80];
 	int idx, dir;
@@ -1600,7 +1602,8 @@ static bool connector_attr_set_sysfs(int drm_fd,
 		return false;
 
 	if (!connector_attr_set(idx, connector, dir,
-				igt_sysfs_set, attr, value, reset_value))
+				igt_sysfs_set, attr, value, reset_value,
+				force_reset))
 		return false;
 
 	igt_debug("Connector %s/%s is now %s\n", name, attr, value);
@@ -1611,7 +1614,8 @@ static bool connector_attr_set_sysfs(int drm_fd,
 static bool connector_attr_set_debugfs(int drm_fd,
 				       drmModeConnector *connector,
 				       const char *attr, const char *value,
-				       const char *reset_value)
+				       const char *reset_value,
+				       bool force_reset)
 {
 	char name[80];
 	int idx, dir;
@@ -1630,7 +1634,7 @@ static bool connector_attr_set_debugfs(int drm_fd,
 
 	if (!connector_attr_set(idx, connector, dir,
 				igt_sysfs_set, attr,
-				value, reset_value))
+				value, reset_value, force_reset))
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
2.40.1

