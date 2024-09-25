Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4662CCF9E7
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 18:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA4A10E2F9;
	Wed, 25 Sep 2024 18:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzCqrTIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AAD10E2F9
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 18:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727288268; x=1758824268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uu3+3b6CfCfke5Cj6o2CdbqMGwQ4g5GgLQ79HFI0v2s=;
 b=PzCqrTIGJ5w/9hSSU/f4n0/6N1VjiUvKB9Oq8cxp4iDLiaf3cU2sFFdI
 4nU4laQxqvvpW8Irn7VvZI71l+ohBjWIdK7jXJCiWnXSwjR9jMaPbts1g
 1n7Bq1v+i8ZGd+zRHiRp/djQuf6VgiGyTR3d7plNDRv3D/tjcGoOA+4pn
 Qh1jx6Ez/YNKyk6YOOhSh6kwNEpqQCTyftbjfzZq7druXPId36Hf/RTYz
 qTENymtDMksnGcXzpq8ebqFaY2c5sM3pwK4Rbla4VTP+bgRLQXPuq6Rnm
 k2xqurV/Z9KFD8Pz4dHmh9p26ds37BTg4DY6f+BOrKC7goEYDONXg88wr w==;
X-CSE-ConnectionGUID: hzg9RzjTTv+8KKBkdVsjtg==
X-CSE-MsgGUID: sYy8b4kmTRu9o9XOAIsK8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37032356"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="37032356"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 11:17:48 -0700
X-CSE-ConnectionGUID: 4veJ18dLSBGEJjU6nrLLZQ==
X-CSE-MsgGUID: wm8a/bMnTr+yBdQoAyQQyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="72324308"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 11:17:47 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 2/7] lib/igt_kms: allow set and reset value to be same
Date: Wed, 25 Sep 2024 23:59:39 +0530
Message-Id: <20240925182944.1603015-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925182944.1603015-1-kunal1.joshi@intel.com>
References: <20240925182944.1603015-1-kunal1.joshi@intel.com>
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
index b49991d90..0582d4d25 100644
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

