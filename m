Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91429C02187
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 15:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6BC10E37C;
	Tue, 14 Jan 2025 15:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbqANkiC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0E110E362
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736867421; x=1768403421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lyKtK0xAPT2y1NY/ld9wB8O78HQ0VVeBy/DU7KWjjeM=;
 b=gbqANkiCQJHAMXLExL1HD0fJC20Y+X+Ql/cPaHdLDZTeuzzbC+sZ4Q4D
 FrTs8UZTTYwbY5QQ/46jzPCgTNirzqWlDSSxIWA2M4/+NBVvrqATKwyAY
 M4uJdyPiKGdpLhxGas/tDkJVa7gZSOlKh4LfXV1cfgZaVy8hFyc7UpHTc
 9FZKvTJ2SzYP5EV9m2f5yGdZ2qU+oxOkcDQomnCfRMa/Tv5rMs44a4BuI
 +8A58h1a5m8I3dcCXgh5mHgS0ezWB7Cspp+CgYs/JSE5GXspDxcYEyR94
 6cLJloRUTUrNZJ/D7Ad2zUoFOoDeQxtgHqOGXeUjsu1sEH0BV+b+log5N Q==;
X-CSE-ConnectionGUID: dXvOQ7wtS9mOyZDn44tAOw==
X-CSE-MsgGUID: gkZMU7FqQBO0xYxS2e4D3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37323225"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="37323225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:12 -0800
X-CSE-ConnectionGUID: 1dQCb8yuRES0D37+YRUvcA==
X-CSE-MsgGUID: 0WHT/o2rS5a/vOTdVR4TqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="104660808"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.29])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:09 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 i-g-t 1/7] lib/xe/xe_sriov_debugfs: Add debugfs get/set
 functions for u32, u64, bool
Date: Tue, 14 Jan 2025 16:08:42 +0100
Message-Id: <20250114150848.332708-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
References: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
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

Add helper functions to get and set SR-IOV debugfs attributes for u32,
u64, and boolean types.

Functions added:
- __xe_sriov_pf_debugfs_get_u32
- __xe_sriov_pf_debugfs_set_u32
- __xe_sriov_pf_debugfs_get_u64
- __xe_sriov_pf_debugfs_set_u64
- __xe_sriov_pf_debugfs_get_boolean
- __xe_sriov_pf_debugfs_set_boolean

v2: Updated DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC macro comment (Lukasz)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 lib/xe/xe_sriov_debugfs.c | 151 ++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h |  18 +++++
 2 files changed, 169 insertions(+)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index c87f91492..92a477764 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -9,6 +9,7 @@
 #include "drmtest.h"
 #include "igt_debugfs.h"
 #include "igt_sriov_device.h"
+#include "igt_sysfs.h"
 #include "xe/xe_query.h"
 #include "xe/xe_sriov_debugfs.h"
 #include "xe/xe_sriov_provisioning.h"
@@ -204,3 +205,153 @@ cleanup:
 
 	return ret;
 }
+
+static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
+					 unsigned int gt_num)
+{
+	char path[PATH_MAX];
+
+	if (igt_debug_on_f(!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path,
+						     sizeof(path)),
+			   "path: %s\n", path))
+		return -1;
+
+	return open(path, O_RDONLY);
+}
+
+/**
+ * DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC - Define a function for accessing debugfs attributes
+ * @type: Data type of the value to read or write (e.g., `uint32_t`, `bool`, etc.)
+ * @suffix: Function name suffix appended to `__xe_sriov_pf_debugfs_`
+ * @sysfs_func: The sysfs helper function to perform the actual read or write operation
+ *
+ * Generates a function for accessing a debugfs attribute of a PF device.
+ * It handles opening the debugfs path, performing the sysfs operation, and closing the
+ * debugfs directory.
+ *
+ * The generated function has the following signature:
+ *
+ *	int __xe_sriov_pf_debugfs_<suffix>(int pf, unsigned int vf_num,
+ *					   unsigned int gt_num,
+ *					   const char *attr, type value)
+ *
+ * where:
+ * - `pf` is the PF device file descriptor.
+ * - `vf_num` is the VF number.
+ * - `gt_num` is the GT number.
+ * - `attr` is the name of the debugfs attribute.
+ * - `value` is the data to read or write, depending on the sysfs function.
+ *
+ * Example:
+ *
+ *	DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint32_t, set_u32, __igt_sysfs_set_u32);
+ *
+ * This expands to a function:
+ *
+ *	int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
+ *					  unsigned int gt_num,
+ *					  const char *attr, uint32_t value);
+ *
+ * The function returns:
+ * - `0` on success
+ * - Negative error code on failure
+ */
+#define DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(type, suffix, sysfs_func)		\
+	int __xe_sriov_pf_debugfs_##suffix(int pf, unsigned int vf_num,		\
+					   unsigned int gt_num,			\
+					   const char *attr, type value)	\
+	{									\
+		bool ret;							\
+		int dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);	\
+										\
+		if (igt_debug_on(dir < 0))					\
+			return dir;						\
+										\
+		ret = sysfs_func(dir, attr, value);				\
+		close(dir);							\
+		return ret ? 0 : -1;						\
+	}
+
+/**
+ * __xe_sriov_pf_debugfs_get_u32 - Get a 32-bit unsigned integer from debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to read
+ * @value: Pointer to store the retrieved value
+ *
+ * Reads a 32-bit unsigned integer from the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint32_t *, get_u32, __igt_sysfs_get_u32)
+
+/**
+ * __xe_sriov_pf_debugfs_set_u32 - Set a 32-bit unsigned integer in debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to write to
+ * @value: The value to set
+ *
+ * Writes a 32-bit unsigned integer to the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint32_t, set_u32, __igt_sysfs_set_u32)
+
+/**
+ * __xe_sriov_pf_debugfs_get_u64 - Get a 64-bit unsigned integer from debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to read
+ * @value: Pointer to store the retrieved value
+ *
+ * Reads a 64-bit unsigned integer from the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint64_t *, get_u64, __igt_sysfs_get_u64)
+
+/**
+ * __xe_sriov_pf_debugfs_set_u64 - Set a 64-bit unsigned integer in debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to write to
+ * @value: The value to set
+ *
+ * Writes a 64-bit unsigned integer to the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(uint64_t, set_u64, __igt_sysfs_set_u64)
+
+/**
+ * __xe_sriov_pf_debugfs_get_boolean - Get a boolean value from debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to read
+ * @value: Pointer to store the retrieved value
+ *
+ * Reads a boolean value from the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool *, get_boolean, __igt_sysfs_get_boolean)
+
+/**
+ * __xe_sriov_pf_debugfs_set_boolean - Set a boolean value in debugfs
+ * @pf: PF device file descriptor
+ * @vf_num: VF number
+ * @gt_num: GT number
+ * @attr: Debugfs attribute to write to
+ * @value: The value to set
+ *
+ * Writes a boolean value to the specified debugfs attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool, set_boolean, __igt_sysfs_set_boolean)
diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
index 856445e76..2db965f9b 100644
--- a/lib/xe/xe_sriov_debugfs.h
+++ b/lib/xe/xe_sriov_debugfs.h
@@ -16,5 +16,23 @@ int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_
 						unsigned int gt_id,
 						struct xe_sriov_provisioned_range **ranges,
 						unsigned int *nr_ranges);
+int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint32_t *value);
+int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint32_t value);
+int __xe_sriov_pf_debugfs_get_u64(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint64_t *value);
+int __xe_sriov_pf_debugfs_set_u64(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint64_t value);
+int __xe_sriov_pf_debugfs_get_boolean(int pf, unsigned int vf_num,
+				      unsigned int gt_num, const char *attr,
+				      bool *value);
+int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
+				      unsigned int gt_num, const char *attr,
+				      bool value);
 
 #endif /* __XE_SRIOV_DEBUGFS_H__ */
-- 
2.31.1

