Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926EECD1283
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 14:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDB4112458;
	Thu, 28 Mar 2024 14:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEhB7ecs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ABE112458
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711636515; x=1743172515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vPnrJvLBxSbzQ413Wf0HwTKNzJKCdFv6a8zncHYqnRI=;
 b=bEhB7ecs1Ag6RI97oAX++5D4/nQ9s2dIem473c8xu9sPOn0LzDsy1wto
 gAfLeYkMtDn1plBm8H+CAF8b37NiFVHMcPZZJoTNPbtIaeOXq6g+s2aPT
 CdgpNT59bVa2oB4p6nX3FnF176ysvflZAkHJucXnVL6X3IcFTGAUUD7yd
 X9smxMDSe767qxI8rlYoBLqYEAgkqlGfjt6+sTr9AYdOT/ozxQ8VyOiPg
 lBNQYwo3Ce3QYT+Ufw2sq1IjjqhAzj8fgfHpwDvk5oEWrlHW1o8KYCqVK
 Shw4TXnSrJyacus4NXXvryHmcJ7HU/q024Awu3k0KixF5FcNmAsbkD+SF Q==;
X-CSE-ConnectionGUID: gFhRwNStR9W/4fX36Uo98Q==
X-CSE-MsgGUID: I43XrH1tTq2GI82HPBDKmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10602450"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="10602450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 07:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17114905"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 07:35:13 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/5] lib/igt_kms: add helper to enable/disable force
 joiner
Date: Thu, 28 Mar 2024 20:15:52 +0530
Message-Id: <20240328144554.1371727-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328144554.1371727-1-kunal1.joshi@intel.com>
References: <20240328144554.1371727-1-kunal1.joshi@intel.com>
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

add helpers to check whether force joiner debugfs exists
and to enable/disable force joiner for a specific connector.

v2: Add documentation and rename (Ankit)
    Combine enable/disable and status check (Ankit)
    Don't assert in igt_has_force_joiner_debugfs (Ankit)

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 548c9d1f3..c38021dd7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6171,6 +6171,57 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * Checks if the force big joiner debugfs is available
+ * for a specific connector.
+ *
+ * @drmfd: file descriptor of the DRM device.
+ * @output: output to check.
+ * Returns:
+ *  true if the debugfs is available, false otherwise.
+ */
+bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
+{
+	char buf[512];
+	int debugfs_fd, ret;
+
+	igt_assert_f(output->name, "Connector name cannot be NULL\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
+	if (debugfs_fd < 0)
+		return false;
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	close(debugfs_fd);
+	return ret >= 0;
+}
+
+/**
+ * Forces the enable/disable state of big joiner for a specific connector.
+ *
+ * @drmfd The file descriptor of the DRM device.
+ * @connector_name The name of the connector.
+ * @enable The desired state of big joiner (true for enable, false for disable).
+ * Returns:
+ *  true if writing the debugfs was successful
+ *  and the state was set as requested, false otherwise.
+ */
+bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable)
+{
+	int debugfs_fd, ret;
+	char buf[512];
+
+	igt_assert_f(connector_name, "Connector name cannot be NULL\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
+	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
+	ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
+	igt_assert_f(ret > 0, "Could not write i915_bigjoiner_force_enable for connector %s\n", connector_name);
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	close(debugfs_fd);
+	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
+
+	return enable ? strstr(buf, "Bigjoiner enable: 1") :
+		    strstr(buf, "Bigjoiner enable: 0");
+}
+
 /**
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0fa7a2ea1..6d13e5851 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1214,6 +1214,8 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
+bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
+bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
-- 
2.25.1

