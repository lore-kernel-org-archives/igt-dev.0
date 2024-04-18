Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926ECC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 09:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C9510E6B4;
	Thu, 18 Apr 2024 09:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYbIwSpR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04BE10E6B4
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 09:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713432372; x=1744968372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KxHWhzOKbJ8Pubnw7m6mHerijzDbq+Tw/3Fi/wMZbuA=;
 b=LYbIwSpRZq+5xaJuWwOrJWnwWcPjMwVFP0tDU7GzJRU7EgqrI0DY/XLi
 w1jKspQIt7ZY5RC1UvHYu0x42hovVbz/vNyLbkfse2GO21BGrZceBqSQw
 HLcuzT+Te3DuHNQyJ7Nhu3HVQev3Zq4PbOv1BeJ2/oH4hY+LeIh72swSi
 COnrotisVvQfUo/yHkQCF/0HgfgT9uENnA/qBCTVYqOyUJdGJXv7XI7Z1
 JLNvMrMWNONUBcXK7p+ejja2IBpdL8qMN9WHxB8lN6iKATU2ZRIdj9z8l
 O2t1zzUbJk9ikXnvFCYGsqtE2j5ZzVjsxnhUQjH4ByyRtRdOe+8JSfhPk g==;
X-CSE-ConnectionGUID: njxdyT5FQXa4GLanpFcH8A==
X-CSE-MsgGUID: hQ08EtOmQkWggodwK2B0pQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31447789"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31447789"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:12 -0700
X-CSE-ConnectionGUID: /1szgKHJRHeSBoP239nv3w==
X-CSE-MsgGUID: PyyjjrjeRXe9bPTlG7HYkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="53855379"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:10 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V2 1/6] lib/igt_kms: New helper to check force joiner status
Date: Thu, 18 Apr 2024 14:49:54 +0530
Message-ID: <20240418091959.781560-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
References: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
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

V2: - Add few debug prints

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3216fe7e4..4c43921ce 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6283,6 +6283,40 @@ bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool
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
+	if (debugfs_fd < 0) {
+		igt_debug("Could not open debugfs for connector: %s\n", connector_name);
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	close(debugfs_fd);
+
+	if (ret < 0) {
+		igt_debug("Could not read i915_bigjoiner_force_enable for connector: %s\n", connector_name);
+		return false;
+	}
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

