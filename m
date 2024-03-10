Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4A5C54791
	for <igt-dev@archiver.kernel.org>; Sun, 10 Mar 2024 14:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1080810E07A;
	Sun, 10 Mar 2024 14:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5Nx/Tfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335CD10E07A
 for <igt-dev@lists.freedesktop.org>; Sun, 10 Mar 2024 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710080220; x=1741616220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cGdBk3z4frpoAbi0Dppn9jBJ5yYP/9yi7Y/WAxFXp4Y=;
 b=X5Nx/Tfl54sT3wJRQgFnNinbZ5rUqVh13zyQLmOOkk0vEHkMEia+CJ39
 YxOVhlUjcyD3rPLm8YYmM2P49HdWt2gxMRmsq+vjVaA1Ovl8T7SLsfnG0
 GbaucouObRpSA1fpQjY3i+6Z9rHMpW4CMqugwe/k4e77xOUeNMUFfdEJo
 WnpQIKsQw07G/HSAUlzwQ/1Cq5gXa8eaEc+naZGU8ps3oKUGTeR4SlA2S
 eo3/5lfnX535eJfM3ogIRWsmno8qA9EZUfOStIaBN4bqRk0T3WhJwCq2W
 C0phhzE+r7gOTGvBk89/v/jfG7HobpPh69VSm4+QxgACn5ePrtoa434/J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4916454"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="4916454"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 07:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; d="scan'208";a="11324257"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 07:16:58 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/4] lib/igt_kms: add helper to enable/disable force
 joiner
Date: Sun, 10 Mar 2024 19:57:20 +0530
Message-Id: <20240310142721.874315-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240310142721.874315-1-kunal1.joshi@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
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

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 61 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 63c8045c7..9d0cbd329 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6168,6 +6168,65 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * Checks if the force big joiner is enabled for a specific connector.
+ *
+ * @drmfd The file descriptor of the DRM device.
+ * @connector_name The name of the connector.
+ * Returns:
+ *  true if status equals enable, false otherwise.
+ */
+static bool igt_check_force_bigjoiner_status(int drmfd, char *connector_name, bool enable)
+{
+	char buf[512];
+	int debugfs_fd, ret;
+
+	igt_assert_f(connector_name, "Connector name cannot be NULL\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	close(debugfs_fd);
+	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
+	return enable ? strstr(buf, "Bigjoiner enable: 1") :
+					strstr(buf, "Bigjoiner enable: 0");
+}
+
+bool has_force_joiner_debugfs(int drmfd, igt_output_t *output)
+{
+	char buf[512];
+	int debugfs_fd, ret;
+
+	igt_assert_f(output->name, "Connector name cannot be NULL\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
+	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", output->name);
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
+ *  true on success, false otherwise.
+ */
+bool igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable)
+{
+	int debugfs_fd, ret;
+
+	igt_assert_f(connector_name, "Connector name cannot be NULL\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
+	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
+	ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
+	close(debugfs_fd);
+	igt_assert_f(ret > 0, "Could not write i915_bigjoiner_force_enable for connector %s\n", connector_name);
+
+	return igt_check_force_bigjoiner_status(drmfd, connector_name, enable);
+}
+
 /**
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index bab8487d3..f13b7fd53 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1214,6 +1214,8 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock);
+bool has_force_joiner_debugfs(int drmfd, igt_output_t *output);
+bool igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
-- 
2.34.1

