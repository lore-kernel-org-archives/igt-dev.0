Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE992CD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222E31131C2;
	Wed, 10 Apr 2024 06:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkqlXXX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A441131C1
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730833; x=1744266833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KamuR+qOBhCtYDJg5KHTssOPmBbAh/ddDPi9VVjRyyk=;
 b=nkqlXXX6w5VufgZ+uIEdy4iSBa+kvUZ3MMwyz93pZ+MNbSfQoXsosp3R
 K0F4zegVoF0mebN/wzoud4anGeJ++kUd9bYywS/1YHCO39aGAZ+SR2mQb
 JvfXAaT2Ckn4WrUx/766OOAAehuz0OstdI38iWjGqROdb61yyhQwWAMnZ
 FsOuit5O85PKfgGX7NTAZhTcVjAJCO0uL9CcTDsPVzI/xwLxJHYRFNOne
 yTAXLDUd7sJzo2VTHmf/BzK9rG48C23V5w4pNocbIyGAtsfd/Fzl/E23e
 7s08Ggfr1rwdEG1ZbKeoVhIWMoyAZu8USIdccmcIeyrCJ3cm2hu9fz3Ib A==;
X-CSE-ConnectionGUID: R+wpe+TmQ3ah+UzRvionQQ==
X-CSE-MsgGUID: Nzl3z3HASCGGqolPAog/aQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948182"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948182"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:53 -0700
X-CSE-ConnectionGUID: +UURDDN8ROSFog69Bi1peA==
X-CSE-MsgGUID: SM5qkCiJTDKJZt1eXYgN1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138206"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:51 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 7/9] lib/igt_kms: add kmstest_force_connector_debugfs
Date: Wed, 10 Apr 2024 12:14:24 +0530
Message-Id: <20240410064426.1968399-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410064426.1968399-1-kunal1.joshi@intel.com>
References: <20240410064426.1968399-1-kunal1.joshi@intel.com>
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

allow to set debugfs for a connector with particular value and install
exit handler for cleanup.

This is same kmstest_force_connector just that one uses sysfs and
limited to only status sysfs.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 82 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 80070d935..56c9dae9b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1600,6 +1600,52 @@ static bool force_connector(int drm_fd,
 	return true;
 }
 
+static bool force_connector_debugfs(int drm_fd,
+				    drmModeConnector *connector,
+				    const char *attr, const char *value)
+{
+	char name[80];
+	int i, idx, dir;
+
+	if (!connector)
+		return false;
+
+	snprintf(name, sizeof(name), "%s-%d",
+		 kmstest_connector_type_str(connector->connector_type),
+		 connector->connector_type_id);
+
+	dir = igt_debugfs_connector_dir(drm_fd, name, O_DIRECTORY);
+	if (dir < 0)
+		return false;
+
+	if (!igt_sysfs_set(dir, attr, value)) {
+		close(dir);
+		return false;
+	}
+
+	igt_debug("Debugfs %s of Connector %s is now forced %s\n", attr, name, value);
+
+	/* already tracked? */
+	if (connector_is_forced(idx, connector, FORCED_CONNECTOR_DEBUGFS)) {
+		close(dir);
+		return true;
+	}
+
+	i = forced_connector_free_index(FORCED_CONNECTOR_DEBUGFS);
+	if (i < 0) {
+		igt_warn("Connector limit reached, %s will not be reset\n", name);
+		close(dir);
+		return true;
+	}
+
+	forced_connectors_debugfs[i].idx = idx;
+	forced_connectors_debugfs[i].connector_type = connector->connector_type;
+	forced_connectors_debugfs[i].connector_type_id = connector->connector_type_id;
+	forced_connectors_debugfs[i].dir = dir;
+
+	return true;
+}
+
 static void dump_forced_connectors(enum kmstest_force_type type)
 {
 	char name[80];
@@ -1674,6 +1720,40 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
 	return true;
 }
 
+/**
+ * kmstest_force_connector_debugfs:
+ * @fd: drm file descriptor
+ * @connector: connector
+ * @attr: debugfs of the connector
+ * @value: value to set
+ *
+ * Force the specified state on the specified connector.
+ *
+ * Returns: True on success
+ */
+bool kmstest_force_connector_debugfs(int drm_fd, drmModeConnector *connector,
+				     enum kmstest_force_debugfs debugfs, const char *value)
+{
+	drmModeConnector *temp;
+	const char *attr = get_debugfs_default_attr(debugfs);
+
+	if (!force_connector_debugfs(drm_fd, connector, attr, value))
+		return false;
+
+	dump_forced_connectors(FORCED_CONNECTOR_DEBUGFS);
+
+	igt_install_exit_handler(reset_connectors_debugfs_at_exit);
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
index f676de737..4980d4791 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -283,6 +283,8 @@ struct edid;
 
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
+bool kmstest_force_connector_debugfs(int drm_fd, drmModeConnector *connector,
+				     enum kmstest_force_debugfs debugfs, const char *value);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
 
-- 
2.34.1

