Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2E9CE8D76
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 19:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048B910EAE6;
	Fri, 14 Nov 2025 19:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSdFNgRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0075010EAE6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763147308; x=1794683308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fR4627Mf23VTj9IKE8KwunzT3U6c2aLOgaCMPGxH/9I=;
 b=QSdFNgRcNE239ImgdfzOIskYe0r59syAZtCF8I4vCfOyG/GRs4RlGo5H
 ogsDjKryJHDRzG7oe90dgTpYTZhUl3fB1o+2hUSoPnmFgxvqiwgK4N8X5
 AuwTMvcS6+stq45FFJcuwdDa7+JCRVly9D9cf/XwzLWSyl+Ts9zGOQHSk
 O06tvD88+oq5M6dNYT8DSaQiGNHZIRrlkONR2Zdl9wrRkVWtu0ecKujOt
 SQL8QQj0CsBVRb1JR4ihAN+R9fOZP19+0AOuZNNf5y52SMCdV5NqsNELu
 KFRchevHk7MolMI0k9OzA9CaRKByf7vuuH8psTYvvycr0IAxinA2agp+v w==;
X-CSE-ConnectionGUID: yECyoWzlSKSNrXLZPAqocQ==
X-CSE-MsgGUID: 2UQZ+rq4RRWI7L4c//7Vlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75569644"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="75569644"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:08:28 -0800
X-CSE-ConnectionGUID: C/YL17GxS9ipVGwWDSnQjw==
X-CSE-MsgGUID: puP2opF7ScKNHXJxCIE4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194839955"
Received: from mkrakus-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.23.186])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:08:25 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/5] lib/xe/xe_sriov_admin: Add SR-IOV admin sysfs
 accessors
Date: Fri, 14 Nov 2025 20:07:53 +0100
Message-ID: <20251114190757.2295174-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
References: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
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
 lib/xe/xe_sriov_admin.c | 670 ++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_admin.h |  56 ++++
 3 files changed, 727 insertions(+)
 create mode 100644 lib/xe/xe_sriov_admin.c
 create mode 100644 lib/xe/xe_sriov_admin.h

diff --git a/lib/meson.build b/lib/meson.build
index 707ce6ff9..ce9a33e85 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -125,6 +125,7 @@ lib_sources = [
 	'xe/xe_mmio.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
+	'xe/xe_sriov_admin.c',
 	'xe/xe_sriov_debugfs.c',
 	'xe/xe_sriov_provisioning.c',
 	'xe/xe_util.c',
diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
new file mode 100644
index 000000000..a4d2d0372
--- /dev/null
+++ b/lib/xe/xe_sriov_admin.c
@@ -0,0 +1,670 @@
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
+#include "igt_sysfs.h"
+#include "xe_sriov_admin.h"
+
+static const char SRIOV_ADMIN[] = "device/sriov_admin";
+
+static int fmt_profile_rel_path(char *buf, size_t sz, unsigned int vf_num,
+				const char *attr)
+{
+	igt_assert(buf && attr && sz);
+
+	if (vf_num == 0)
+		return snprintf(buf, sz, "%s/pf/%s", SRIOV_ADMIN, attr);
+
+	return snprintf(buf, sz, "%s/vf%d/%s", SRIOV_ADMIN, vf_num, attr);
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
+/* Parse a raw sched_priority line into current priority enum (required) and optional mask.
+ * Behavior:
+ *  - If prio_mask == NULL: validate only the bracketed (current) priority; ignore unknown others.
+ *  - If prio_mask != NULL: validate all priorities; unknown priority causes -EOPNOTSUPP.
+ * Returns 0 on success, -EOPNOTSUPP on semantic issues, or other -errno from callers.
+ */
+static int parse_sched_prio_line(const char *line,
+				 enum xe_sriov_sched_priority *cur_prio,
+				 unsigned int *prio_mask)
+{
+	enum xe_sriov_sched_priority e;
+	const char *p = line, *start;
+	unsigned int mask = 0;
+	bool bracketed, have_cur = false;
+	char tok[16];
+	size_t len;
+
+	igt_assert(line && cur_prio);
+
+	while (*p) {
+		while (*p == ' ' || *p == '\t')
+			p++;
+		if (!*p)
+			break;
+
+		bracketed = (*p == '[');
+		start = p + (bracketed ? 1 : 0);
+
+		if (bracketed) {
+			while (*p && *p != ']')
+				p++;
+		} else {
+			while (*p && *p != ' ' && *p != '\t')
+				p++;
+		}
+
+		/* token bounds: [start, p) */
+		len = (size_t)(p - start);
+		if (len >= sizeof(tok))
+			len = sizeof(tok) - 1;
+		memcpy(tok, start, len);
+		tok[len] = '\0';
+
+		/* map token -> enum */
+		if (!xe_sriov_sched_priority_from_string(tok, &e)) {
+			if (e == XE_SRIOV_SCHED_PRIORITY_LOW)
+				mask |= XE_SRIOV_SCHED_PRIORITY_MASK_LOW;
+			else if (e == XE_SRIOV_SCHED_PRIORITY_NORMAL)
+				mask |= XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL;
+			else if (e == XE_SRIOV_SCHED_PRIORITY_HIGH)
+				mask |= XE_SRIOV_SCHED_PRIORITY_MASK_HIGH;
+
+			if (bracketed) {
+				*cur_prio = e;
+				have_cur = true;
+			}
+		} else {
+			if (bracketed) {
+				igt_debug("unknown current scheduling priority '%s' (line='%s')\n",
+					  tok, line);
+				return -EOPNOTSUPP;
+			}
+
+			if (prio_mask) {
+				igt_debug("unknown scheduling priority '%s' (line='%s')\n",
+					  tok, line);
+				return -EOPNOTSUPP;
+			}
+
+			igt_debug("ignoring unknown scheduling priority '%s' (line='%s')\n",
+				  tok, line);
+		}
+
+		if (*p)
+			p++; /* skip ']' or the delimiter */
+	}
+
+	if (!have_cur)
+		return -EOPNOTSUPP;
+
+	if (prio_mask)
+		*prio_mask = mask;
+
+	return 0;
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
+					  enum xe_sriov_sched_priority *cur_prio,
+					  unsigned int *prio_mask)
+{
+	char path[PATH_MAX];
+	char line[256] = { 0 };
+	int sysfs, ret;
+
+	igt_assert(cur_prio);
+
+	sysfs = igt_sysfs_open(pf_fd);
+	if (sysfs < 0)
+		return sysfs;
+
+	fmt_profile_rel_path(path, sizeof(path), vf_num,
+			     "profile/sched_priority");
+	ret = igt_sysfs_scanf(sysfs, path, "%255[^\n]", line);
+	close(sysfs);
+
+	ret = ret_from_scanf_items(ret, 1);
+	if (ret)
+		return ret;
+
+	ret = parse_sched_prio_line(line, cur_prio, prio_mask);
+	if (ret)
+		igt_debug("sched prio: parse/map failed (err=%d), line='%s'\n",
+			  ret, line);
+	return ret;
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
+	int ret;
+
+	ret = __xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num, 0);
+	if (ret)
+		return ret;
+	ret = __xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, 0);
+	if (ret)
+		return ret;
+	ret = __xe_sriov_profile_set_sched_priority(pf_fd, vf_num, XE_SRIOV_SCHED_PRIORITY_LOW);
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
+	int ret;
+
+	ret = __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, 0);
+	if (ret)
+		return ret;
+	ret = __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, 0);
+	if (ret)
+		return ret;
+
+	ret = __xe_sriov_bulk_set_sched_priority(pf_fd, XE_SRIOV_SCHED_PRIORITY_LOW);
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
index 000000000..d9bf5624b
--- /dev/null
+++ b/lib/xe/xe_sriov_admin.h
@@ -0,0 +1,56 @@
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

