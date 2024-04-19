Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FA3C04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4433410FDA2;
	Fri, 19 Apr 2024 06:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8ntvATm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C7510FDA2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508160; x=1745044160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4WNuqmF1Va+iGRTrR6CGkHFVu4A+94OzF5pAcguGf6c=;
 b=C8ntvATmecPND7L0rAhTj0oqBBme2OGK7uCR+b/HScVuCHdk4cIZE/az
 9ge9N4wpXjoMcUF27RJ1E4L35kmr8+z8SrJLnuGfj5v8TrWovDqkdCyUm
 cq1Menxss04lNYvtzfJ7gvRMx3QVRvwrmQNxugPgAnaJoKgANXWrJD+Bh
 zRNBKnS6CaQoJFBw/hzjcat90R2foF8R3fXc+PKKs3BEZrQesH8WqjNAW
 UJeJnJjcp56p7f5UmcSx5feB9Gne1dtN6ypdiqEKsc54tKUKYLQms+OM3
 ux7X2WfCSw7Dw42WB4ZPSAf56O8si4HlQPCyerp1orKXlnYzuE7nOf74F w==;
X-CSE-ConnectionGUID: N/tBjDUxQrqspqEITFIpAg==
X-CSE-MsgGUID: U8+AZ26URo+2+MNc/UMe3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9637571"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9637571"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:29:20 -0700
X-CSE-ConnectionGUID: 9rQ6rHX7Tpqh88d1r7Hnew==
X-CSE-MsgGUID: WtJtlzwGREe0tuMXuk60aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23310796"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 23:29:18 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/7] lib/igt_kms: add support for forcing bigjoiner on
 particular connector
Date: Fri, 19 Apr 2024 12:09:58 +0530
Message-Id: <20240419064001.2401850-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419064001.2401850-1-kunal1.joshi@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
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
index 378c97f88..324b0527f 100644
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

