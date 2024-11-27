Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA9DD6D237
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 20:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0461010EBE9;
	Wed, 27 Nov 2024 20:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgGQKU9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E4110EBE9
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 20:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732737796; x=1764273796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xneto0o8WCNTeJCQxxuVSBMxEDA1JmkklBVqGi7qhZo=;
 b=VgGQKU9NJLGQ3LNsqf+3Bo91o5eAkBEfWviKGEf3/YDHmvwEq5zxA/Mo
 1LZ4ejvKbsAXEf4HW0GB4DLeDCaxg9iZkE0bV2gFD9uRivcGAscmiTIHJ
 dPtXVVsRLyrEUmAGn8dSER7YgBizK2WKm4Ey4LISg4VdAcIMmjOQcuiDD
 Dlm1dDYS2ooipoLtrLQlBPcpXNMZQhjN07Dss/ePlf0JqW1VOpraA3TNq
 62DK9shwGHlWWXtfzEBcCZ8dLCxGVT80dYxZFkfebY7G5M7l12sVVrgDS
 YQT6sVrFoIV/Sl5jrND3AWi0XuSy3cxeXlz/W6AnJauj68oOAekRAt+Da g==;
X-CSE-ConnectionGUID: fewwC1TbTAiEsUCUNPEk+Q==
X-CSE-MsgGUID: fBvv9AAtSjKuaTrHeo3flA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44344233"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="44344233"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:16 -0800
X-CSE-ConnectionGUID: WFXHwknfSESW22sdAyLm6g==
X-CSE-MsgGUID: fcI55qQUTrSAVyHo1myx4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="96484685"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.81.89])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:13 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 1/4] lib/xe/xe_sriov_debugfs: Add debugfs get/set
 functions for u32, u64, bool
Date: Wed, 27 Nov 2024 21:02:59 +0100
Message-Id: <20241127200302.1376594-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
References: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
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

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
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
 lib/xe/xe_sriov_debugfs.c | 194 ++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h |  18 ++++
 2 files changed, 212 insertions(+)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index c87f91492..038912f23 100644
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
@@ -204,3 +205,196 @@ cleanup:
 
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
+ * __xe_sriov_pf_debugfs_get_u32:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @attr: debugfs attribute name
+ * @value: pointer to read value
+ *
+ * Reads SR-IOV debugfs attribute @attr for given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success and negative error on failure.
+ */
+int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint32_t *value)
+{
+	bool ret;
+	int dir;
+
+	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
+	if (igt_debug_on(dir < 0))
+		return false;
+
+	ret = __igt_sysfs_get_u32(dir, attr, value);
+	close(dir);
+
+	return ret ? 0 : -1;
+}
+
+/**
+ * __xe_sriov_pf_debugfs_set_u32:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @attr: debugfs attribute name
+ * @value: u32 value to be set
+ *
+ * Writes @value to SR-IOV debugfs attribute @attr for given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success and negative error on failure.
+ */
+int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint32_t value)
+{
+	bool ret;
+	int dir;
+
+	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
+	if (igt_debug_on(dir < 0))
+		return dir;
+
+	ret = __igt_sysfs_set_u32(dir, attr, value);
+	close(dir);
+
+	return ret ? 0 : -1;
+}
+
+/**
+ * __xe_sriov_pf_debugfs_get_u64:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @attr: debugfs attribute name
+ * @value: pointer to read value
+ *
+ * Reads SR-IOV debugfs attribute @attr for given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success and negative error on failure.
+ */
+int __xe_sriov_pf_debugfs_get_u64(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint64_t *value)
+{
+	bool ret;
+	int dir;
+
+	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
+	if (igt_debug_on(dir < 0))
+		return dir;
+
+	ret = __igt_sysfs_get_u64(dir, attr, value);
+	close(dir);
+
+	return ret ? 0 : -1;
+}
+
+/**
+ * __xe_sriov_pf_debugfs_set_u64:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @attr: debugfs attribute name
+ * @value: u64 value to be set
+ *
+ * Writes @value to SR-IOV debugfs attribute @attr for given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success and negative error on failure.
+ */
+int __xe_sriov_pf_debugfs_set_u64(int pf, unsigned int vf_num,
+				  unsigned int gt_num, const char *attr,
+				  uint64_t value)
+{
+	bool ret;
+	int dir;
+
+	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
+	if (igt_debug_on(dir < 0))
+		return dir;
+
+	ret = __igt_sysfs_set_u64(dir, attr, value);
+	close(dir);
+
+	return ret ? 0 : -1;
+}
+
+/**
+ * __xe_sriov_pf_debugfs_get_boolean:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @attr: debugfs attribute name
+ * @value: pointer to read value
+ *
+ * Reads SR-IOV debugfs attribute @attr for given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success and negative error on failure.
+ */
+int __xe_sriov_pf_debugfs_get_boolean(int pf, unsigned int vf_num,
+				      unsigned int gt_num, const char *attr,
+				      bool *value)
+{
+	bool ret;
+	int dir;
+
+	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
+	if (igt_debug_on(dir < 0))
+		return dir;
+
+	ret = __igt_sysfs_get_boolean(dir, attr, value);
+	close(dir);
+
+	return ret ? 0 : -1;
+}
+
+/**
+ * __xe_sriov_pf_debugfs_set_boolean:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @attr: debugfs attribute name
+ * @value: u64 value to be set
+ *
+ * Writes @value to SR-IOV debugfs attribute @attr for given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success and negative error on failure.
+ */
+int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
+				      unsigned int gt_num, const char *attr,
+				      bool value)
+{
+	bool ret;
+	int dir;
+
+	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
+	if (igt_debug_on(dir < 0))
+		return dir;
+
+	ret = __igt_sysfs_set_boolean(dir, attr, value);
+	close(dir);
+
+	return ret ? 0 : -1;
+}
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

