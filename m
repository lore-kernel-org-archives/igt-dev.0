Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDA2CFD37F
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6627510E3A6;
	Tue, 25 Nov 2025 10:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AA+uoEYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA93510E3A6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066230; x=1795602230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mEjkzlZCLWjYm1y/KU4w4nLpG68jar681oVDC0stjyo=;
 b=AA+uoEYAvgzH842HRm08d3RkYti2P40/lSG355f4+WyhH4AmtGH5/Bwe
 keZ+gx5u6qA1YdWVhMF/Hs/Xb/I+acKK36J2t1iT5hfel/f/g1OA9rtV+
 d3Zk1RTjMnuRZldC0c1QoZ0AQDlfMH7C9MOVLTwfzgIlpmN2Arbq472oW
 tmrZTOjAr0taL3L1pH00K0KcqDsOcle86vEdQbnKxpqzqvLHcMcAqN5kS
 TkikIGIW99Rl/tGCQTK3TTFy2ylJFiO4GoPzvKzUguI0kzYB9siwSqJy7
 OXaFM4ChXxssUmhZeEs/We9zYkDFKr+7SQXzi7jSsoiCmd8VIG1dq0RQ/ A==;
X-CSE-ConnectionGUID: 4jKRnub+T7OoeTShWu1QpA==
X-CSE-MsgGUID: 3r0DyyEoRqqdJzxzTt6sYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65968433"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65968433"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:49 -0800
X-CSE-ConnectionGUID: XEhziFzzRsaQnphpGxbTcQ==
X-CSE-MsgGUID: fYAwOdNnRlaRM3Dh63YsJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192235374"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:48 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 06/10] lib/xe/xe_sriov_admin: Add SR-IOV admin sysfs
 accessors
Date: Tue, 25 Nov 2025 11:23:05 +0100
Message-ID: <20251125102312.43142-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
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

Reflect recent kernel changes and expose SR-IOV admin sysfs helpers for
scheduling control. Add per-VF and bulk accessors for execution quantum,
preemption timeout, scheduling priority, VF stop and restoring defaults.

Link: https://lore.kernel.org/intel-xe/20251030222348.186658-1-michal.wajdeczko@intel.com/
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/meson.build         |   1 +
 lib/xe/xe_sriov_admin.c | 623 ++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_admin.h |  60 ++++
 3 files changed, 684 insertions(+)
 create mode 100644 lib/xe/xe_sriov_admin.c
 create mode 100644 lib/xe/xe_sriov_admin.h

diff --git a/lib/meson.build b/lib/meson.build
index 604ffd782..3dec593b3 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -126,6 +126,7 @@ lib_sources = [
 	'xe/xe_mmio.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
+	'xe/xe_sriov_admin.c',
 	'xe/xe_sriov_debugfs.c',
 	'xe/xe_sriov_provisioning.c',
 	'xe/xe_util.c',
diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
new file mode 100644
index 000000000..489dbec5c
--- /dev/null
+++ b/lib/xe/xe_sriov_admin.c
@@ -0,0 +1,623 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2025 Intel Corporation. All rights reserved.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include "igt.h"
+#include "igt_sriov_device.h"
+#include "igt_sysfs.h"
+#include "igt_sysfs_choice.h"
+#include "xe_sriov_admin.h"
+
+static const char SRIOV_ADMIN[] = "device/sriov_admin";
+
+static int fmt_profile_rel_path(char *buf, size_t sz, unsigned int vf_num,
+				const char *attr)
+{
+	igt_assert(buf && attr && sz);
+
+	return snprintf(buf, sz, "%s/%s/%s", SRIOV_ADMIN, igt_sriov_func_str(vf_num), attr);
+}
+
+static int fmt_bulk_rel_path(char *buf, size_t sz, const char *attr)
+{
+	igt_assert(buf && attr && sz);
+
+	return snprintf(buf, sz, "%s/.bulk_profile/%s", SRIOV_ADMIN, attr);
+}
+
+static int ret_from_printf(int ret)
+{
+	return ret > 0 ? 0 : ret;
+}
+
+static int ret_from_scanf_items(int ret, int want_items)
+{
+	/* igt_sysfs_scanf: returns number of assigned items, or <0 on -errno */
+	if (ret < 0)
+		return ret;
+	return (ret == want_items) ? 0 : -EIO;
+}
+
+/**
+ * xe_sriov_admin_is_present - Check if SR-IOV admin sysfs interface is available
+ * @pf_fd: PF device file descriptor.
+ *
+ * Returns: true if the PF exposes the SR-IOV admin tree, false otherwise.
+ */
+bool xe_sriov_admin_is_present(int pf_fd)
+{
+	int sysfs;
+	bool ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return -1;
+
+	ret = igt_sysfs_has_attr(sysfs, SRIOV_ADMIN);
+	close(sysfs);
+	return ret;
+}
+
+/**
+ * __xe_sriov_profile_set_exec_quantum_ms - Set execution quantum for a VF
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @eq_ms:   Execution quantum in milliseconds.
+ *
+ * Writes the new execution quantum to sysfs.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_profile_set_exec_quantum_ms(int pf_fd, unsigned int vf_num,
+					   uint32_t eq_ms)
+{
+	char path[PATH_MAX];
+	int sysfs;
+	bool ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return -1;
+
+	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/exec_quantum_ms");
+
+	ret = igt_sysfs_printf(sysfs, path, "%u", eq_ms);
+
+	close(sysfs);
+
+	return ret_from_printf(ret);
+}
+
+/**
+ * xe_sriov_profile_set_exec_quantum_ms - Assert wrapper for setting VF execution quantum
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @eq_ms:   Execution quantum in milliseconds.
+ *
+ * Calls __xe_sriov_profile_set_exec_quantum_ms() and asserts on error.
+ */
+void xe_sriov_profile_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms)
+{
+	igt_assert_eq(0, __xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num,
+								eq_ms));
+}
+
+/**
+ * __xe_sriov_profile_get_exec_quantum_ms - Read execution quantum for a VF
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @eq_ms:   Output pointer for the execution quantum (ms).
+ *
+ * Reads current VF execution quantum from sysfs.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_profile_get_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t *eq_ms)
+{
+	char path[PATH_MAX];
+	unsigned int val = 0;
+	int sysfs, ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/exec_quantum_ms");
+	ret = igt_sysfs_scanf(sysfs, path, "%u", &val);
+	close(sysfs);
+
+	ret = ret_from_scanf_items(ret, 1);
+	if (ret)
+		return ret;
+
+	*eq_ms = val;
+	return 0;
+}
+
+/**
+ * xe_sriov_profile_get_exec_quantum_ms - Assert wrapper for reading VF execution quantum
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ *
+ * Returns: execution quantum (ms); asserts on error.
+ */
+uint32_t xe_sriov_profile_get_exec_quantum_ms(int pf_fd, unsigned int vf_num)
+{
+	uint32_t v = 0;
+
+	igt_assert_eq(0,
+		      __xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num, &v));
+	return v;
+}
+
+/**
+ * __xe_sriov_profile_set_preempt_timeout_us - Set preemption timeout for a VF
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @pt_us:   Preemption timeout in microseconds.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_profile_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us)
+{
+	char path[PATH_MAX];
+	int sysfs, ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/preempt_timeout_us");
+	ret = igt_sysfs_printf(sysfs, path, "%u", pt_us);
+	close(sysfs);
+	return ret_from_printf(ret);
+}
+
+/**
+ * xe_sriov_profile_set_preempt_timeout_us - Assert wrapper for setting VF preemption timeout
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @pt_us:   Preemption timeout in microseconds.
+ */
+void xe_sriov_profile_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us)
+{
+	igt_assert_eq(0, __xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, pt_us));
+}
+
+/**
+ * __xe_sriov_profile_get_preempt_timeout_us - Read preemption timeout for a VF
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @pt_us:   Output pointer for preemption timeout (µs).
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_profile_get_preempt_timeout_us(int pf_fd, unsigned int vf_num,
+					      uint32_t *pt_us)
+{
+	char path[PATH_MAX];
+	unsigned int val = 0;
+	int sysfs, ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_profile_rel_path(path, sizeof(path), vf_num,
+			     "profile/preempt_timeout_us");
+	ret = igt_sysfs_scanf(sysfs, path, "%u", &val);
+	close(sysfs);
+
+	ret = ret_from_scanf_items(ret, 1);
+	if (ret)
+		return ret;
+	*pt_us = val;
+	return 0;
+}
+
+/**
+ * xe_sriov_profile_get_preempt_timeout_us - Assert wrapper for reading VF preemption timeout
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ *
+ * Returns: preemption timeout (µs); asserts on error.
+ */
+uint32_t xe_sriov_profile_get_preempt_timeout_us(int pf_fd, unsigned int vf_num)
+{
+	uint32_t v = 0;
+
+	igt_assert_eq(0, __xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num, &v));
+	return v;
+}
+
+/**
+ * __xe_sriov_profile_set_sched_priority_string - Set VF priority from string
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @prio:    String value ("low", "normal", "high").
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_profile_set_sched_priority_string(int pf_fd, unsigned int vf_num,
+						 const char *prio)
+{
+	char path[PATH_MAX];
+	int sysfs, ret;
+
+	if (!prio)
+		return -EINVAL;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_profile_rel_path(path, sizeof(path), vf_num,
+			     "profile/sched_priority");
+	ret = igt_sysfs_printf(sysfs, path, "%s", prio);
+	close(sysfs);
+	return ret_from_printf(ret);
+}
+
+/**
+ * __xe_sriov_profile_set_sched_priority - Set VF scheduling priority
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @prio:    Priority enum value.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_profile_set_sched_priority(int pf_fd, unsigned int vf_num,
+					  enum xe_sriov_sched_priority prio)
+{
+	const char *p = xe_sriov_sched_priority_to_string(prio);
+
+	return __xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num, p);
+}
+
+/**
+ * xe_sriov_profile_set_sched_priority - Assert wrapper for setting VF priority
+ * @pf_fd:   PF device file descriptor.
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @prio:    Priority enum value.
+ */
+void xe_sriov_profile_set_sched_priority(int pf_fd, unsigned int vf_num,
+					 enum xe_sriov_sched_priority prio)
+{
+	igt_assert_eq(0, __xe_sriov_profile_set_sched_priority(pf_fd, vf_num, prio));
+}
+
+/**
+ * __xe_sriov_profile_get_sched_priority_choice - Read sched_priority tokens
+ * @pf_fd:   PF device file descriptor
+ * @vf_num:  VF index (0 for PF, >0 for VFs).
+ * @choice:  Output choice structure with parsed tokens and selected index
+ *
+ * Reads the sched_priority sysfs attribute for the given PF/VF and parses it
+ * into an igt_sysfs_choice.
+ *
+ * Returns: 0 on success or a negative errno code.
+ */
+int __xe_sriov_profile_get_sched_priority_choice(int pf_fd, unsigned int vf_num,
+						 struct igt_sysfs_choice *choice)
+{
+	char path[PATH_MAX];
+	int sysfs, ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/sched_priority");
+	ret = igt_sysfs_choice_read(sysfs, path, choice);
+	close(sysfs);
+
+	return ret;
+}
+
+/**
+ * __xe_sriov_profile_get_sched_priority - Read VF scheduling priority + mask
+ * @pf_fd:     PF device file descriptor.
+ * @vf_num:    VF index (0 for PF, >0 for VFs).
+ * @prio:      Output pointer for the effective priority.
+ * @prio_mask: Output mask of allowed priorities.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
+					  enum xe_sriov_sched_priority *prio,
+					  unsigned int *prio_mask)
+{
+	struct igt_sysfs_choice prio_ch = {};
+	int ret;
+
+	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &prio_ch);
+	if (ret)
+		return ret;
+
+	ret = xe_sriov_sched_priority_from_string(prio_ch.tokens[prio_ch.selected], prio);
+	if (igt_debug_on_f(ret, "unknown selected value '%s' (err=%d)\n",
+			   prio_ch.tokens[prio_ch.selected], ret))
+		return ret;
+
+	if (prio_mask) {
+		ret = xe_sriov_sched_priority_choice_to_mask(&prio_ch, prio_mask, NULL);
+		if (igt_debug_on_f(ret, "mask conversion failed (err=%d)\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_sriov_profile_get_sched_priority - Assert wrapper for reading VF priority
+ * @pf_fd:     PF device file descriptor.
+ * @vf_num:    VF index (0 for PF, >0 for VFs).
+ * @prio_mask: Output mask of supported priorities.
+ *
+ * Returns: effective priority; asserts on error.
+ */
+enum xe_sriov_sched_priority
+xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
+				    unsigned int *prio_mask)
+{
+	enum xe_sriov_sched_priority cur_prio;
+
+	igt_assert_eq(0,
+		      __xe_sriov_profile_get_sched_priority(pf_fd, vf_num, &cur_prio, prio_mask));
+
+	return cur_prio;
+}
+
+/**
+ * __xe_sriov_bulk_set_exec_quantum_ms - Set execution quantum for PF and all VFs
+ * @pf_fd: PF device file descriptor.
+ * @eq_ms: Execution quantum in milliseconds.
+ *
+ * Applies the value to PF and all VFs.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms)
+{
+	char path[PATH_MAX];
+	int sysfs, ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_bulk_rel_path(path, sizeof(path), "exec_quantum_ms");
+	ret = igt_sysfs_printf(sysfs, path, "%u", eq_ms);
+	close(sysfs);
+	return ret_from_printf(ret);
+}
+
+/**
+ * xe_sriov_bulk_set_exec_quantum_ms - Assert wrapper for bulk execution quantum update
+ * @pf_fd: PF device file descriptor.
+ * @eq_ms: Execution quantum in milliseconds.
+ */
+void xe_sriov_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms)
+{
+	igt_assert_eq(0, __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, eq_ms));
+}
+
+/**
+ * __xe_sriov_bulk_set_preempt_timeout_us - Set preemption timeout for PF and all VFs
+ * @pf_fd: PF device file descriptor.
+ * @pt_us: Preemption timeout in microseconds.
+ *
+ * Applies the value to PF and all VFs.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us)
+{
+	char path[PATH_MAX];
+	int sysfs, ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_bulk_rel_path(path, sizeof(path), "preempt_timeout_us");
+	ret = igt_sysfs_printf(sysfs, path, "%u", pt_us);
+	close(sysfs);
+	return ret_from_printf(ret);
+}
+
+/**
+ * xe_sriov_bulk_set_preempt_timeout_us - Assert wrapper for bulk preemption timeout update
+ * @pf_fd: PF device file descriptor.
+ * @pt_us: Preemption timeout in microseconds.
+ */
+void xe_sriov_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us)
+{
+	igt_assert_eq(0, __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, pt_us));
+}
+
+/**
+ * __xe_sriov_bulk_set_sched_priority_string - Set scheduling priority for PF and all VFs
+ * @pf_fd: PF device file descriptor.
+ * @prio:  String priority ("low", "normal", "high").
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_bulk_set_sched_priority_string(int pf_fd, const char *prio)
+{
+	char path[PATH_MAX];
+	int sysfs, ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_bulk_rel_path(path, sizeof(path), "sched_priority");
+	ret = igt_sysfs_printf(sysfs, path, "%s", prio);
+	close(sysfs);
+	return ret_from_printf(ret);
+}
+
+/**
+ * xe_sriov_bulk_set_sched_priority_string - Assert wrapper for bulk priority update
+ * @pf_fd: PF device file descriptor.
+ * @prio:  String priority.
+ */
+void xe_sriov_bulk_set_sched_priority_string(int pf_fd, const char *prio)
+{
+	igt_assert_eq(0, __xe_sriov_bulk_set_sched_priority_string(pf_fd, prio));
+}
+
+/**
+ * __xe_sriov_bulk_set_sched_priority - Set numeric priority for PF and all VFs
+ * @pf_fd: PF device file descriptor.
+ * @prio:  Enum priority value.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_bulk_set_sched_priority(int pf_fd,
+				       enum xe_sriov_sched_priority prio)
+{
+	const char *s = xe_sriov_sched_priority_to_string(prio);
+
+	if (!s)
+		return -EINVAL;
+	return __xe_sriov_bulk_set_sched_priority_string(pf_fd, s);
+}
+
+/**
+ * xe_sriov_bulk_set_sched_priority - Assert wrapper for bulk priority update
+ * @pf_fd: PF device file descriptor.
+ * @prio:  Enum priority value.
+ */
+void xe_sriov_bulk_set_sched_priority(int pf_fd,
+				      enum xe_sriov_sched_priority prio)
+{
+	igt_assert_eq(0, __xe_sriov_bulk_set_sched_priority(pf_fd, prio));
+}
+
+/**
+ * __xe_sriov_vf_stop - Issue stop command for a VF
+ * @pf_fd:  PF device file descriptor.
+ * @vf_num: VF index.
+ *
+ * Triggers VF stop via sysfs.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_vf_stop(int pf_fd, unsigned int vf_num)
+{
+	char path[PATH_MAX];
+	int sysfs, ret;
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_profile_rel_path(path, sizeof(path), vf_num, "stop");
+	ret = igt_sysfs_printf(sysfs, path, "%u", 1u);
+	close(sysfs);
+	return ret_from_printf(ret);
+}
+
+/**
+ * xe_sriov_vf_stop - Assert wrapper for VF stop command
+ * @pf_fd:  PF device file descriptor.
+ * @vf_num: VF index.
+ */
+void xe_sriov_vf_stop(int pf_fd, unsigned int vf_num)
+{
+	igt_assert_eq(0, __xe_sriov_vf_stop(pf_fd, vf_num));
+}
+
+/**
+ * __xe_sriov_profile_restore_defaults - Restore scheduling defaults for a VF
+ * @pf_fd:  PF device file descriptor.
+ * @vf_num: VF index (0 for PF, >0 for VFs).
+ *
+ * Resets execution quantum, preemption timeout, and priority to driver defaults.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_profile_restore_defaults(int pf_fd, unsigned int vf_num)
+{
+	int ret_eq, ret_pt, ret_prio;
+	int ret = 0;
+
+	ret_eq = __xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num, 0);
+	igt_warn_on(ret_eq);
+	if (!ret)
+		ret = ret_eq;
+
+	ret_pt = __xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, 0);
+	igt_warn_on(ret_pt);
+	if (!ret)
+		ret = ret_pt;
+
+	ret_prio = __xe_sriov_profile_set_sched_priority(pf_fd, vf_num,
+							 XE_SRIOV_SCHED_PRIORITY_LOW);
+	igt_warn_on(ret_prio);
+	if (!ret)
+		ret = ret_prio;
+
+	return ret;
+}
+
+/**
+ * xe_sriov_profile_restore_defaults - Assert wrapper restoring VF defaults
+ * @pf_fd:  PF device file descriptor.
+ * @vf_num: VF index (0 for PF, >0 for VFs).
+ */
+void xe_sriov_profile_restore_defaults(int pf_fd, unsigned int vf_num)
+{
+	igt_assert_eq(0, __xe_sriov_profile_restore_defaults(pf_fd, vf_num));
+}
+
+/**
+ * __xe_sriov_bulk_restore_defaults - Restore scheduling defaults for PF and all VFs
+ * @pf_fd: PF device file descriptor.
+ *
+ * Resets PF and all VFs to driver default scheduling parameters.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_bulk_restore_defaults(int pf_fd)
+{
+	int ret_eq, ret_pt, ret_prio;
+	int ret = 0;
+
+	ret_eq = __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, 0);
+	igt_warn_on(ret_eq);
+	if (!ret)
+		ret = ret_eq;
+
+	ret_pt = __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, 0);
+	igt_warn_on(ret_pt);
+	if (!ret)
+		ret = ret_pt;
+
+	ret_prio = __xe_sriov_bulk_set_sched_priority(pf_fd,
+						      XE_SRIOV_SCHED_PRIORITY_LOW);
+	igt_warn_on(ret_prio);
+	if (!ret)
+		ret = ret_prio;
+
+	return ret;
+}
+
+/**
+ * xe_sriov_bulk_restore_defaults - Assert wrapper for restoring defaults on PF and all VFs
+ * @pf_fd: PF device file descriptor.
+ */
+void xe_sriov_bulk_restore_defaults(int pf_fd)
+{
+	igt_assert_eq(0, __xe_sriov_bulk_restore_defaults(pf_fd));
+}
diff --git a/lib/xe/xe_sriov_admin.h b/lib/xe/xe_sriov_admin.h
new file mode 100644
index 000000000..6dfd0f7d4
--- /dev/null
+++ b/lib/xe/xe_sriov_admin.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2025 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_SRIOV_ADMIN_H__
+#define __XE_SRIOV_ADMIN_H__
+
+#include <stdbool.h>
+#include <stdint.h>
+#include <stddef.h>
+#include "xe_sriov_provisioning.h" /* for enum xe_sriov_sched_priority */
+
+struct igt_sysfs_choice;
+
+bool xe_sriov_admin_is_present(int pf_fd);
+
+int  __xe_sriov_profile_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms);
+void  xe_sriov_profile_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms);
+int  __xe_sriov_profile_get_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t *eq_ms);
+uint32_t xe_sriov_profile_get_exec_quantum_ms(int pf_fd, unsigned int vf_num);
+int  __xe_sriov_profile_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us);
+void  xe_sriov_profile_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us);
+int  __xe_sriov_profile_get_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t *pt_us);
+uint32_t xe_sriov_profile_get_preempt_timeout_us(int pf_fd, unsigned int vf_num);
+int __xe_sriov_profile_set_sched_priority_string(int pf_fd, unsigned int vf_num,
+						 const char *prio);
+int __xe_sriov_profile_get_sched_priority_choice(int pf_fd, unsigned int vf_num,
+						 struct igt_sysfs_choice *choice);
+int __xe_sriov_profile_set_sched_priority(int pf_fd, unsigned int vf_num,
+					  enum xe_sriov_sched_priority prio);
+void xe_sriov_profile_set_sched_priority(int pf_fd, unsigned int vf_num,
+					 enum xe_sriov_sched_priority prio);
+int __xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
+					  enum xe_sriov_sched_priority *prio,
+					  unsigned int *prio_mask);
+enum xe_sriov_sched_priority
+xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
+				    unsigned int *prio_mask);
+
+int  __xe_sriov_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms);
+void  xe_sriov_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms);
+int  __xe_sriov_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us);
+void  xe_sriov_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us);
+int  __xe_sriov_bulk_set_sched_priority_string(int pf_fd, const char *prio);
+void  xe_sriov_bulk_set_sched_priority_string(int pf_fd, const char *prio);
+int __xe_sriov_bulk_set_sched_priority(int pf_fd,
+				       enum xe_sriov_sched_priority prio);
+void xe_sriov_bulk_set_sched_priority(int pf_fd,
+				      enum xe_sriov_sched_priority prio);
+
+int  __xe_sriov_vf_stop(int pf_fd, unsigned int vf_num);
+void  xe_sriov_vf_stop(int pf_fd, unsigned int vf_num);
+
+int  __xe_sriov_profile_restore_defaults(int pf_fd, unsigned int vf_num);
+void  xe_sriov_profile_restore_defaults(int pf_fd, unsigned int vf_num);
+int  __xe_sriov_bulk_restore_defaults(int pf_fd);
+void  xe_sriov_bulk_restore_defaults(int pf_fd);
+
+#endif /* __XE_SRIOV_ADMIN_H__ */
-- 
2.43.0

