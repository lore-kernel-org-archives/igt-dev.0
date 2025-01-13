Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7969DE7719F
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 13:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F4610E317;
	Mon, 13 Jan 2025 13:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjWVsmfq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F069C10E317
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 13:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736776153; x=1768312153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YQgvLZp540SXDjaK5pO7xx1+gR6XeX4bxCkNfp9dIcM=;
 b=PjWVsmfqpaH4aglO6L4mivIj7skIFrbLvvPjUZShQfQ/baDIdhCml0cv
 DU733klPwjVDCre856D3QUMKYukymePgXn/PRss82Ok8uB0pswkyTdIky
 5UQMfXj9G3hOjSLUfr8GGUdSv0safiL4LValUxO5+9jDComwaEUM2gtfA
 Fvy5xy3+b9IjBrRwEgzrKXXJ8KxIB67AwLo4V8CXoT7u2UOgulhI7v0iR
 Rg+tPvAIgHDmyCBBG8PWeodUgnIzyyWuylt1OX88f0TJ4kwz7sivG+uXg
 1R426tanGx5zhYMJC/pxOd2sserB6jPULhx9CYYbm0ev1yv6O2thAfumH Q==;
X-CSE-ConnectionGUID: nDn2sUa3TG++g9kyRWsUTQ==
X-CSE-MsgGUID: /OsUvAByTqyjKCwr8LVo2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37269711"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37269711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 05:49:13 -0800
X-CSE-ConnectionGUID: plkZc9l0RX2iHcQ25OTDGA==
X-CSE-MsgGUID: W3/Tp+ZMQ0mTRADLQ4l4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104998374"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2025 05:49:11 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, kamil.konieczny@linux.intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v2] tests/xe_debugfs: Improve test_gt subtest
Date: Mon, 13 Jan 2025 19:15:58 +0530
Message-Id: <20250113134558.947544-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Read the debugfs entries in the loop to improve the readability.
Added library function to check whether the debugfs is a directory or not.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 lib/igt_debugfs.c        | 27 +++++++++++++
 lib/igt_debugfs.h        |  1 +
 tests/intel/xe_debugfs.c | 82 ++++++----------------------------------
 3 files changed, 40 insertions(+), 70 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index f4f749e30..cd604e7c6 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -376,6 +376,33 @@ igt_debugfs_gt_open(int device, unsigned int gt, const char *filename, int mode)
 	return ret;
 }
 
+/**
+ * igt_debugfs_is_dir:
+ * @drm_fd: fd of the device
+ * @name: name of the debugfs node to check
+ * @gt: gt instance number
+ *
+ * This helps to find the debugfs file is  a directory or not
+ *
+ * Returns:
+ * true if the debugfs is a directory
+ */
+bool igt_debugfs_is_dir(int drm_fd, const char *name, int gt_id)
+{
+	char path[128];
+	struct stat st;
+
+	if (fstat(drm_fd, &st) != 0)
+		return false;
+
+	snprintf(path, sizeof(path), "/sys/kernel/debug/dri/%d/gt%d/%s",
+						minor(st.st_rdev), gt_id, name);
+	if (!stat(path, &st) && S_ISDIR(st.st_mode))
+		return true;
+
+	return false;
+}
+
 /**
  * igt_debugfs_simple_read:
  * @dir: fd of the debugfs directory
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 3e6194ade..f4044d545 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -39,6 +39,7 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
 int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
+bool igt_debugfs_is_dir(int drm_fd, const char *name, int gt_id);
 bool igt_debugfs_exists(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
 void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index bcbb5036a..c653daae4 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -180,77 +180,19 @@ test_gt(int fd, int gt_id)
 //		"guc_ct_selftest"
 	};
 
-	sprintf(name, "gt%d/hw_engines", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/sa_info", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/steering", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/topology", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/pat", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/mocs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/ggtt", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/register-save-restore", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/workarounds", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_rcs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_ccs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_bcs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_vecs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/default_lrc_vcs", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/hwconfig", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/uc/guc_info", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
-
-	sprintf(name, "gt%d/uc/huc_info", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
+	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
+		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
+		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+		if (igt_debugfs_is_dir(fd, expected_files[i], gt_id))
+			continue;
+		igt_debugfs_dump(fd, name);
+	}
 
-	sprintf(name, "gt%d/uc/guc_log", gt_id);
-	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
-	igt_debugfs_dump(fd, name);
+	for (int i = 0; i < ARRAY_SIZE(expected_files_uc); i++) {
+		sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[i]);
+		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+		igt_debugfs_dump(fd, name);
+	}
 
 	sprintf(name, "/gt%d", gt_id);
 	validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
-- 
2.34.1

