Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E58C04FFF
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 11:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D7510F495;
	Wed, 17 Apr 2024 11:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5ar5x2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2889310E1A2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713353561; x=1744889561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PXD4zDlMRN0Rb3DrjI5wq1Gb7T9FFRKBPS8wNK2hKRA=;
 b=Q5ar5x2BvKL/pLKF+/MJdWNyk5eHATV9MP/NCWdKONwUovk88Hoqj5X9
 4oNXzwa7PduGv2psWKlDdRpa3zN/nWfI2H1cFMk4QeQUYIFFMNnWpKMj/
 wa7P6oJasQW6ZwhvqHQHWnuOc2QpFIUN6CWnALc82RseUkEKr8hoWJn9p
 YuWExAej/qRu0wPrHCE4EdyTvx7iJVuVFsfLfARRaRgO+rOSiCsjby7sc
 Sk270jcExCO242gR/N+ToCHY95VDklRPxHBmcGBGuTL3iZhiDgVKCWzIo
 chlfWj77e8bbK2CIVobO1lwZA2xMvz8vhHgfFt1mIa6OWMl7wZIvquPoL A==;
X-CSE-ConnectionGUID: pnXR2jXSTVOuuPMwprJARw==
X-CSE-MsgGUID: Cn+ST6+3T8OVlmbSgRO5Bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8719254"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8719254"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:32:41 -0700
X-CSE-ConnectionGUID: 7gNhx8o/R/eDfhKJbWmWzg==
X-CSE-MsgGUID: a+zAYFQ6Q3SR2ubEehoFeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22658131"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 04:32:39 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/6] lib/igt_kms: add support for forcing bigjoiner on
 particular connector
Date: Wed, 17 Apr 2024 17:13:23 +0530
Message-Id: <20240417114326.2245087-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240417114326.2245087-1-kunal1.joshi@intel.com>
References: <20240417114326.2245087-1-kunal1.joshi@intel.com>
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

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 89 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3216fe7e4..5332a7a9a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1458,6 +1458,11 @@ static void reset_connectors_at_exit(int sig)
 	igt_reset_connectors();
 }
 
+static void reset_force_joiner_state_at_exit(int sig)
+{
+	igt_reset_force_joiner_state();
+}
+
 static char *kmstest_connector_dirname(int idx,
 				       uint32_t connector_type,
 				       uint32_t connector_type_id,
@@ -1607,6 +1612,30 @@ static bool connector_attr_set_sysfs(int drm_fd,
 	return true;
 }
 
+static bool connector_attr_set_debugfs(int drm_fd,
+				     drmModeConnector *connector,
+				     const char *attr, const char *value,
+				     const char *reset_value)
+{
+	char name[80];
+	int idx, dir;
+
+	snprintf(name, sizeof(name), "%s-%d",
+			 kmstest_connector_type_str(connector->connector_type),
+			 connector->connector_type_id);
+	dir = igt_debugfs_connector_dir(drm_fd, name, O_DIRECTORY);
+	if (dir < 0)
+		return false;
+
+	if (!connector_attr_set(idx, connector, dir,
+				igt_sysfs_set, attr, value, reset_value))
+		return false;
+
+	igt_debug("Connector %s/%s is now %s\n", name, attr, value);
+
+	return true;
+}
+
 static void dump_connector_attrs(void)
 {
 	char name[80];
@@ -1690,6 +1719,49 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
 	return true;
 }
 
+static bool force_connector_bigjoiner(int drm_fd,
+			    drmModeConnector *connector,
+			    const char *value)
+{
+	return connector_attr_set_debugfs(drm_fd, connector,
+					"i915_bigjoiner_force_enable", value, "0");
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
+	const char *value;
+	drmModeConnector *temp;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	value = "1";
+
+	if (!force_connector_bigjoiner(drm_fd, connector, value))
+		return false;
+
+	dump_connector_attrs();
+
+	igt_install_exit_handler(reset_force_joiner_state_at_exit);
+
+	/* To allow callers to always use GetConnectorCurrent we need to force a
+	 * redetection here. */
+	temp = drmModeGetConnector(drm_fd, connector->connector_id);
+	drmModeFreeConnector(temp);
+
+	return true;
+}
+
 /**
  * kmstest_force_edid:
  * @drm_fd: drm file descriptor
@@ -5367,6 +5439,21 @@ void igt_reset_connectors(void)
 	}
 }
 
+void igt_reset_force_joiner_state(void)
+{
+	/*
+	 * reset force joiner state on the connectors stored in
+	 * i915_bigjoiner_force_enable debugfs attr of the forced connectors
+	 */
+	for (int i = 0; i < ARRAY_SIZE(connector_attrs); i++) {
+		struct igt_connector_attr *c = &connector_attrs[i];
+
+		if (!c->attr)
+			continue;
+		c->set(c->dir, c->attr, c->reset_value);
+	}
+}
+
 /**
  * igt_watch_uevents:
  *
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6d13e5851..8951fccfd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -262,6 +262,7 @@ struct edid;
 
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
+bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
 
@@ -1083,6 +1084,7 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
 
 void igt_enable_connectors(int drm_fd);
 void igt_reset_connectors(void);
+void igt_reset_force_joiner_state(void);
 
 uint32_t kmstest_get_vbl_flag(int crtc_offset);
 
-- 
2.25.1

