Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89600C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 15:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A2710FE41;
	Thu, 18 Apr 2024 15:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mP3CUaN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1010FE41
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713453457; x=1744989457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OaTjJUxIv9BaBAdROdyinO0Un0jZQz34ifVHTEccWnU=;
 b=mP3CUaN+FeBrsi+oHO10qa+J07Cd9qnCkvlo32OfaZ9FOrcr4z7zkav0
 /nGeQqFcn66/JXebbygWlQcES2Xs05DOoiDGY9mnmkovt+nYrWeMGiAD0
 7axJ4YLSKxhz9pWastbkxN+4VBK1qlhESFhkXVQhnLti+ag7jGU8MMZXn
 M0xFMfVrkr2pnwhyjyYUTHAcLNFJBqZL6qUnrJgrzfMHLbByAh0edOiwA
 VVfFU2AWmsXOl1VCYca0e6f+p2L8O9nwkRbdUp7XzLCTj9IC+9JS0/H4w
 1IqbU6MaSdaApzIf4HSOmgVGan18D8y22l0POMfLGelN8JdV4yeM8VtX3 A==;
X-CSE-ConnectionGUID: gyQXfX6SRHysafk2vxuRBg==
X-CSE-MsgGUID: TfJyYqETQlaB3JTMb38Iuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26465814"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="26465814"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:17:37 -0700
X-CSE-ConnectionGUID: 5/aeQahcTOO3wT1ZF+CleQ==
X-CSE-MsgGUID: DVwaJFCKRieWOJT2NJdQnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23463267"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 08:17:35 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/7] lib/igt_kms: add support for forcing bigjoiner on
 particular connector
Date: Thu, 18 Apr 2024 20:58:14 +0530
Message-Id: <20240418152817.2352850-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240418152817.2352850-1-kunal1.joshi@intel.com>
References: <20240418152817.2352850-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

add kmstest_force_connector_bigjoiner function which
force bigjoiner on provided connector as well as resets on exit.

v2: remove redundant function (Bhanu)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 70 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6f093fed7..6ee049551 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1607,6 +1607,32 @@ static bool connector_attr_set_sysfs(int drm_fd,
 	return true;
 }
 
+static bool connector_attr_set_debugfs(int drm_fd,
+				       drmModeConnector *connector,
+				       const char *attr, const char *value,
+				       const char *reset_value)
+{
+	char name[80];
+	int idx, dir;
+
+	snprintf(name, sizeof(name), "%s-%d",
+		 kmstest_connector_type_str(connector->connector_type),
+		 connector->connector_type_id);
+
+	dir = igt_debugfs_connector_dir(drm_fd, name, O_DIRECTORY);
+	if (dir < 0)
+		return false;
+
+	if (!connector_attr_set(idx, connector, dir,
+				igt_sysfs_set, attr,
+				value, reset_value))
+		return false;
+
+	igt_info("Connector %s/%s is now %s\n", name, attr, value);
+
+	return true;
+}
+
 static void dump_connector_attrs(void)
 {
 	char name[80];
@@ -1690,6 +1716,49 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
 	return true;
 }
 
+static bool force_connector_bigjoiner(int drm_fd,
+				      drmModeConnector *connector,
+				      const char *value)
+{
+	return connector_attr_set_debugfs(drm_fd, connector,
+					  "i915_bigjoiner_force_enable",
+					  value, "0");
+}
+
+/**
+ * kmstest_force_connector_bigjoiner:
+ * @fd: drm file descriptor
+ * @connector: connector
+ *
+ * Enable force bigjoiner state on the specified connector
+ * and install exit handler for resetting
+ *
+ * Returns: True on success
+ */
+bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector)
+{
+	const char *value = "1";
+	drmModeConnector *temp;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	if (!force_connector_bigjoiner(drm_fd, connector, value))
+		return false;
+
+	dump_connector_attrs();
+	igt_install_exit_handler(reset_connectors_at_exit);
+
+	/*
+	 * To allow callers to always use GetConnectorCurrent we need to force a
+	 * redetection here.
+	 */
+	temp = drmModeGetConnector(drm_fd, connector->connector_id);
+	drmModeFreeConnector(temp);
+
+	return true;
+}
+
 /**
  * kmstest_force_edid:
  * @drm_fd: drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6d13e5851..0abf450c1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -262,6 +262,7 @@ struct edid;
 
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
+bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
 
-- 
2.25.1

