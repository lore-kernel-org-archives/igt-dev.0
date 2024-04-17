Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEC2C001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECDE1135C1;
	Wed, 17 Apr 2024 14:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IP7xooy4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A381135C1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713364779; x=1744900779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nO88N6pjyx+NYHkzRYu39Zj+S31C1xFtNAZYAYKN2zU=;
 b=IP7xooy43YFMR+4kBnkx6hShtNSqEsfknA2MwjlYr8QfmVgp3Hppi+kl
 R3wVeJg1/FRtNsnDTc+6mTa3LB6szB8jOJMoi8dxnI7wyxraZfKz4N5JX
 RNnroXoF2PwKfgIsOr/KSZIYRLAjYJiM4UaE8bQ3YsP+7T6i3S+cXFo54
 JPUdLgPy2BPwmc0uuSP/Qq6kDB9Qj/TBbZqf7SV7q5ycyNWIZm57FozgL
 HgFlDMWC12zyGZIauZQc5khJdiN8WTLK+b3RT/IFO7kNKmf4ddA94+nJu
 MBryZI987+V2KJpzlDSgA/Hb4y7QeCQsaYRu4vaQsmaCDAXtTrOYpyjSj A==;
X-CSE-ConnectionGUID: ZplPSzuXQJamTg7mgcGyAw==
X-CSE-MsgGUID: sRT466I7SI2BDZSSAdJbBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9083644"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9083644"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:39 -0700
X-CSE-ConnectionGUID: 9rawJ5xZTAmnUEgHOqDgrA==
X-CSE-MsgGUID: Z8qxninbSh6YAAsWeglAWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53859882"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:37 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/6] lib/igt_kms: New helper to check force joiner status
Date: Wed, 17 Apr 2024 20:03:20 +0530
Message-ID: <20240417143325.720515-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
References: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
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

Add a new function to check the force joiner status
on selected connecter, so that it would be helpful to
check the force joiner status from other places too.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 30 ++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3216fe7e4..5271010be 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6283,6 +6283,36 @@ bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool
 			strstr(buf, "N");
 }
 
+/**
+ * igt_check_force_joiner_status
+ * @drmfd: file descriptor of the DRM device.
+ * @connector_name: connector to check.
+ *
+ * Checks if the force big joiner is enabled.
+ *
+ * Returns: True if the force big joiner is enabled, False otherwise.
+ */
+bool igt_check_force_joiner_status(int drmfd, char *connector_name)
+{
+	char buf[512];
+	int debugfs_fd, ret;
+
+	if (!connector_name)
+		return false;
+
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	if (debugfs_fd < 0)
+		return false;
+
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	close(debugfs_fd);
+
+	if (ret < 0)
+		return false;
+
+	return strstr(buf, "Y");
+}
+
 /**
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6d13e5851..b8f7c745b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1216,6 +1216,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
 bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable);
+bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
-- 
2.43.2

