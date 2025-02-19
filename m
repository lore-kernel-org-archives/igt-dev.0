Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D59BC021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E932610E7BC;
	Wed, 19 Feb 2025 10:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHpY/yEd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000C510E7B7
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739960734; x=1771496734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ksxg1wYEb9Cb6u8gTYwdP5Ln5V9pqHDX9hPEIbH6Fi4=;
 b=BHpY/yEdhq+sx55zdeSPlREkxFgwlu6upUXL8YSAEIKqzRvPrEQ20xlY
 o+/CfwiVmc5Yb2jTIAPKdmYFdwg+5CBe4HB4UZvMti0lC1LV9WiAIwS4Y
 /kh+KY2EJ7ynW6Ssh/vAbIX+kKEnqW9yTr4+GM2un8PPbOkzho4FlcciK
 gdlaSuJwwo03sQsqG6xzv2PrlnjVRW1rzkMblTnzIHl8NuCVT/oARYaq8
 aqi0phHNpfOfPI6BSFbx5Exoh/DABiUHMQdNjtp64SMge1hYcS+xu2g6U
 uN4/P+xHXnnd/rxfGRGK3XBkqNgq3IjOh7uCGMFBoT2KEr3FFM1wJR3HF w==;
X-CSE-ConnectionGUID: Lf7BmouVQtSTXGtEhbjYgg==
X-CSE-MsgGUID: DvUY10BYRbmq4cqgPFiakQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40613316"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40613316"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:25:33 -0800
X-CSE-ConnectionGUID: QuaxTwncTeOesoW7eO75pg==
X-CSE-MsgGUID: E2HrDEodQy2mQDPL/0oudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137921461"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:25:31 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tomasz.lis@intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com, satyanarayana.k.v.p@intel.com
Subject: [PATCH i-g-t 1/2] lib/xe/xe_sriov_debugfs: Add VF save/restore
 related functions
Date: Wed, 19 Feb 2025 11:25:33 +0100
Message-Id: <20250219102534.2630181-2-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250219102534.2630181-1-adam.miszczak@linux.intel.com>
References: <20250219102534.2630181-1-adam.miszczak@linux.intel.com>
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

Provide helpers required to exercise VF (fake) migration:
- control VF state (stop/pause/resume/restore)
- read/write GuC, GGTT and LMEM state
- initiate GGTT address relocation

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 lib/xe/xe_sriov_debugfs.c | 252 ++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h |  31 +++++
 2 files changed, 283 insertions(+)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index 8f30fa312..2e33871ad 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -15,6 +15,10 @@
 #include "xe/xe_sriov_provisioning.h"
 
 #define SRIOV_DEBUGFS_PATH_MAX 96
+/* Maximum size of buffers used to read GuC, GGTT, LMEM state */
+#define SRIOV_GUC_STATE_BUF_SIZE_MAX SZ_4M
+#define SRIOV_GGTT_RAW_BUF_SIZE_MAX SZ_4M
+#define SRIOV_LMEM_STATE_BUF_SIZE_MAX SZ_512M
 
 static char *xe_sriov_pf_debugfs_path(int pf, unsigned int vf_num, unsigned int gt_num, char *path,
 				      int pathlen)
@@ -285,6 +289,254 @@ static int validate_vf_ids(enum xe_sriov_shared_res res,
 	return 0;
 }
 
+static const char *xe_sriov_debugfs_control_value(enum xe_sriov_vf_control operation)
+{
+	switch (operation) {
+	case XE_SRIOV_VF_CONTROL_STOP:
+		return "stop";
+	case XE_SRIOV_VF_CONTROL_PAUSE:
+		return "pause";
+	case XE_SRIOV_VF_CONTROL_RESUME:
+		return "resume";
+	case XE_SRIOV_VF_CONTROL_RESTORE:
+		return "restore!";
+	}
+
+	return NULL;
+}
+
+/**
+ * xe_sriov_set_vf_control - Controls VF's state.
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @operation: VF control command to perform
+ *
+ * Allows to send control VF state commands: pause, resume and stop.
+ * Additionally, restore! action is provided to restore previosusly
+ * saved GuC state for VF migration enabling and testing purposes.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_sriov_set_vf_control(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						enum xe_sriov_vf_control operation)
+{
+	char path[PATH_MAX];
+	const char *op_name;
+
+	igt_assert(igt_sriov_is_pf(pf_fd) && is_xe_device(pf_fd));
+	igt_assert(gt_num < xe_number_gt(pf_fd));
+	igt_assert(vf_num > 0);
+
+	if (!xe_sriov_pf_debugfs_path(pf_fd, vf_num, gt_num, path, sizeof(path)))
+		return -ENOENT;
+
+	op_name = xe_sriov_debugfs_control_value(operation);
+	if (!op_name)
+		return -EINVAL;
+
+	strncat(path, "control", sizeof(path) - strlen(path));
+
+	igt_debug("Set VF%d control: %s (%s)\n", vf_num, op_name, path);
+	igt_debugfs_write(pf_fd, path, op_name);
+
+	return 0;
+}
+
+/**
+ * xe_sriov_relocate_ggtt - Enforce VF's GGTT address relaction.
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ *
+ * Triggers move of the existing GGTT allocation to other location.
+ */
+void xe_sriov_relocate_ggtt(int pf_fd, unsigned int vf_num, unsigned int gt_num)
+{
+	char path[PATH_MAX];
+
+	igt_assert(vf_num > 0);
+
+	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/relocate_ggtt", gt_num, vf_num);
+	__igt_debugfs_write(pf_fd, path, "1", 1);
+
+	igt_debug("Set VF%d GGTT relocate (%s)\n", vf_num, path);
+}
+
+/**
+ * xe_sriov_get_guc_state - Read VF's GuC state data.
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @lmem_state_size: Pointer to store the size of a returned buffer
+ *
+ * Reads the GuC state of given VF device @vf on GT @gt_num.
+ * Allocates an output buffer with a size limited to SRIOV_GUC_STATE_BUF_SIZE_MAX.
+ * The caller should free the allocated space.
+ *
+ * Return: pointer to the GuC state buffer on success, negative error code on failure.
+ */
+void *xe_sriov_get_guc_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						int *guc_state_size)
+{
+	char path[PATH_MAX];
+	int dir;
+	void *buf;
+
+	igt_assert(vf_num > 0);
+
+	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/guc_state", gt_num, vf_num);
+
+	buf = malloc(SRIOV_GUC_STATE_BUF_SIZE_MAX);
+	dir = igt_debugfs_dir(pf_fd);
+
+	*guc_state_size = igt_debugfs_simple_read(dir, path, buf, SRIOV_GUC_STATE_BUF_SIZE_MAX);
+	close(dir);
+
+	igt_debug("Read VF%d GuC state: %d B (%s)\n", vf_num, *guc_state_size, path);
+
+	return buf;
+}
+
+/**
+ * xe_sriov_set_guc_state - Write VF's GuC state data.
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @guc_state: Pointer to a buffer to write
+ * @guc_state_size: Size of a buffer to write
+ *
+ * Writes the GuC state of given VF device @vf on GT @gt_num.
+ */
+void xe_sriov_set_guc_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						void *guc_state, int guc_state_size)
+{
+	char path[PATH_MAX];
+
+	igt_assert(vf_num > 0);
+
+	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/guc_state", gt_num, vf_num);
+	__igt_debugfs_write(pf_fd, path, guc_state, guc_state_size);
+
+	igt_debug("Write VF%d GuC state: %d B (%s)\n", vf_num, guc_state_size, path);
+}
+
+/**
+ * xe_sriov_get_ggtt_raw - Read VF's GGTT state data.
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @ggtt_raw_size: Pointer to store the size of a returned buffer
+ *
+ * Reads the GGTT state of given VF device @vf on GT @gt_num.
+ * Allocates an output buffer with a size limited to SRIOV_GGTT_RAW_BUF_SIZE_MAX.
+ * The caller should free the allocated space.
+ *
+ * Return: pointer to the GGTT state buffer on success, negative error code on failure.
+ */
+void *xe_sriov_get_ggtt_raw(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						int *ggtt_raw_size)
+{
+	char path[PATH_MAX];
+	int dir;
+	void *buf;
+
+	igt_assert(vf_num > 0);
+
+	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/ggtt_raw", gt_num, vf_num);
+
+	buf = malloc(SRIOV_GGTT_RAW_BUF_SIZE_MAX);
+	dir = igt_debugfs_dir(pf_fd);
+
+	*ggtt_raw_size = igt_debugfs_simple_read(dir, path, buf, SRIOV_GGTT_RAW_BUF_SIZE_MAX);
+	close(dir);
+
+	igt_debug("Read VF%d GGTT raw: %d B (%s)\n", vf_num, *ggtt_raw_size, path);
+
+	return buf;
+}
+
+/**
+ * xe_sriov_set_ggtt_raw - Write VF's GGTT state data.
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @ggtt_raw: Pointer to a buffer to write
+ * @ggtt_raw_size: Size of a buffer to write
+ *
+ * Writes the GGTT state of given VF device @vf on GT @gt_num.
+ */
+void xe_sriov_set_ggtt_raw(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						void *ggtt_raw, int ggtt_raw_size)
+{
+	char path[PATH_MAX];
+
+	igt_assert(vf_num > 0);
+
+	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/ggtt_raw", gt_num, vf_num);
+	__igt_debugfs_write(pf_fd, path, ggtt_raw, ggtt_raw_size);
+
+	igt_debug("Write VF%d GGTT raw: %d B (%s)\n", vf_num, ggtt_raw_size, path);
+}
+
+/**
+ * xe_sriov_get_lmem_state - Read VF's LMEM state data.
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @lmem_state_size: Pointer to store the size of a returned buffer
+ *
+ * Reads the LMEM state of given VF device @vf on GT @gt_num.
+ * Allocates an output buffer with a size limited to SRIOV_LMEM_STATE_BUF_SIZE_MAX.
+ * The caller should free the allocated space.
+ *
+ * Return: pointer to the LMEM state buffer on success, negative error code on failure.
+ */
+void *xe_sriov_get_lmem_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						int *lmem_state_size)
+{
+	char path[PATH_MAX];
+	int dir;
+	void *buf;
+
+	igt_assert(vf_num > 0);
+
+	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/lmem_state", gt_num, vf_num);
+
+	buf = malloc(SRIOV_LMEM_STATE_BUF_SIZE_MAX);
+	dir = igt_debugfs_dir(pf_fd);
+
+	*lmem_state_size = igt_debugfs_simple_read(dir, path, buf, SRIOV_LMEM_STATE_BUF_SIZE_MAX);
+	close(dir);
+
+	igt_debug("Read VF%d LMEM state: %d B (%s)\n", vf_num, *lmem_state_size,  path);
+
+	return buf;
+}
+
+/**
+ * xe_sriov_set_lmem_state - Write VF's LMEM state data.
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @lmem_state: Pointer to a buffer to write
+ * @lmem_state_size: Size of a buffer to write
+ *
+ * Writes the LMEM state of given VF device @vf on GT @gt_num.
+ */
+void xe_sriov_set_lmem_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						void *lmem_state, int lmem_state_size)
+{
+	char path[PATH_MAX];
+
+	igt_assert(vf_num > 0);
+
+	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/lmem_state", gt_num, vf_num);
+	__igt_debugfs_write(pf_fd, path, lmem_state, lmem_state_size);
+
+	igt_debug("Write VF%d LMEM state: %d B (%s)\n", vf_num, lmem_state_size, path);
+}
+
 /**
  * xe_sriov_pf_debugfs_read_check_ranges:
  * @pf_fd: PF device file descriptor
diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
index 4983afbb3..d801084a9 100644
--- a/lib/xe/xe_sriov_debugfs.h
+++ b/lib/xe/xe_sriov_debugfs.h
@@ -9,6 +9,20 @@
 enum xe_sriov_shared_res;
 struct xe_sriov_provisioned_range;
 
+/**
+ * enum xe_sriov_vf_control - VF control
+ * @XE_SRIOV_VF_CONTROL_STOP: stop VF
+ * @XE_SRIOV_VF_CONTROL_PAUSE: pause VF
+ * @XE_SRIOV_VF_CONTROL_RESUME: resume VF
+ * @XE_SRIOV_VF_CONTROL_RESTORE: restore VF GuC state
+ */
+enum xe_sriov_vf_control {
+	XE_SRIOV_VF_CONTROL_STOP,
+	XE_SRIOV_VF_CONTROL_PAUSE,
+	XE_SRIOV_VF_CONTROL_RESUME,
+	XE_SRIOV_VF_CONTROL_RESTORE,
+};
+
 int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
 				  const char *attr, int mode);
 const char *xe_sriov_debugfs_provisioned_attr_name(enum xe_sriov_shared_res res);
@@ -20,6 +34,23 @@ int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res re
 					  unsigned int gt_id,
 					  struct xe_sriov_provisioned_range **ranges,
 					  unsigned int expected_num_vfs);
+
+int xe_sriov_set_vf_control(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						enum xe_sriov_vf_control operation);
+void xe_sriov_relocate_ggtt(int pf_fd, unsigned int vf_num, unsigned int gt_num);
+void *xe_sriov_get_guc_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						int *guc_state_size);
+void xe_sriov_set_guc_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						void *guc_state, int guc_state_size);
+void *xe_sriov_get_ggtt_raw(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						int *ggtt_raw_size);
+void xe_sriov_set_ggtt_raw(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						void *ggtt_raw, int ggtt_raw_size);
+void *xe_sriov_get_lmem_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						int *lmem_state_size);
+void xe_sriov_set_lmem_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
+						void *lmem_state, int lmem_state_size);
+
 int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
 				  unsigned int gt_num, const char *attr,
 				  uint32_t *value);
-- 
2.39.1

