Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E39CF9C6D
	for <igt-dev@archiver.kernel.org>; Sun, 22 Sep 2024 21:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C7410E354;
	Sun, 22 Sep 2024 21:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8vDwlzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8138D10E354
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Sep 2024 21:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727039635; x=1758575635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EdqdppUlNSyZUFhLtwk0GlHU45lg8izitmxl34vlKfo=;
 b=l8vDwlzExXp1wxIMbh59cEkbv/Exg+ToIilrddQBnv53e5Xs+Tynq1Tk
 JDXwyOuQyOEl3ijbQ6h/oKLegzng0BVspAPhSah+1d5IFqLkMjiAZkHLY
 8KgShK1qbpPSYLloEjvJ7y6AU1tGSvpmSsiMhAajn980GHLX8O9jXkp4k
 awNdggIjgqMWtkvSZ5tqbRAxmTrJ+am9FWEQJ6RYiomPTpovcU7NMvyJ5
 ZzjnnWG36rybnEJZLwh6Z2OA1tbRX64xPD3Zu103qtRDsQi8meI1GbAKX
 xngF7Yal+24UmHI4fVkuK8rVXPVWm2A6bNkz8HTqTMYZiQl9l1NkoO5tj Q==;
X-CSE-ConnectionGUID: rIvkKNTmRwGCoeEmPu+xEw==
X-CSE-MsgGUID: VHRWLqMfSyeh3uUjKk4F+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36641011"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="36641011"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 14:13:55 -0700
X-CSE-ConnectionGUID: w7c5eS+uQr2RrsnCyITIww==
X-CSE-MsgGUID: /lWgdyZ3R6uMcrcwYcSh2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71188107"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 14:13:53 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/7] lib/igt_kms: allow set and reset value to be same
Date: Mon, 23 Sep 2024 02:55:45 +0530
Message-Id: <20240922212549.1361889-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240922212549.1361889-1-kunal1.joshi@intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
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
---
 lib/igt_kms.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 53c6db7f3..011f3768a 100644
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
2.43.0

