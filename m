Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C7CE77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 15:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BE610E38E;
	Tue, 14 Jan 2025 15:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ll72jNi2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EECC10E384
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736867423; x=1768403423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9/YjrO4NN3ZT/l5+U3+R/5D5jL1H6I2sGYk7hxHPN60=;
 b=Ll72jNi2yFNLvWMXgHXxg16IKWzAoOvU8c1TP6XYFnk8U7fmxaYT2asX
 zhGLDUGli+QG9PRJP11sFJGgbDiZFnAhQdbap+fxCCxRaXRqHSm2t1l5n
 pyxGtuBwfCP9Sfggwaz1B+prlatc3HcnUr0j2nRVrEO2aM2A2gLwiZ9G3
 6A8QvYjosJClADJLPKEZZsLXuLIznmb1g9U7sW1J2A4AvO0jYBXyOfDJT
 ADOrK49oz+1OeJAYjp3QVxAwQQlaKMDK7kSdOy0E1eVRZOWWUo5psdtHf
 1fdaj+dfnT5UJyHOztZXE6ztGDHpf8B4PdhO7XR1HQlhpiyEjmWlWyMwR g==;
X-CSE-ConnectionGUID: ez8BnMBvRnml2zYFHhs+NQ==
X-CSE-MsgGUID: fB++G5IxSmem5ZpeXcHXQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37323252"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="37323252"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:20 -0800
X-CSE-ConnectionGUID: sAXMXHUrS6qUkZ1tHrZG9w==
X-CSE-MsgGUID: mO8GFxU3TlG0pDr2D3bzvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="104661092"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.29])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:15 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 i-g-t 2/7] lib/xe/xe_sriov_debugfs: Add validation for
 provisioned ranges
Date: Tue, 14 Jan 2025 16:08:43 +0100
Message-Id: <20250114150848.332708-3-marcin.bernatowicz@linux.intel.com>
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

Introduce `xe_sriov_pf_debugfs_read_check_ranges`, adding a validation
step on top of `xe_sriov_pf_debugfs_read_provisioned_ranges`.

Enforce checks for:
- Ranges when no VFs are expected.
- Duplicate, missing, or out-of-range VF IDs.

The function ensures the returned ranges are sorted by VF ID.

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
 lib/xe/xe_sriov_debugfs.c | 116 ++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h |   4 ++
 2 files changed, 120 insertions(+)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index 92a477764..abb1bf7d5 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -206,6 +206,122 @@ cleanup:
 	return ret;
 }
 
+static int compare_ranges_by_vf_id(const void *a, const void *b)
+{
+	const struct xe_sriov_provisioned_range *range_a = a;
+	const struct xe_sriov_provisioned_range *range_b = b;
+
+	return (range_a->vf_id - range_b->vf_id);
+}
+
+#define MAX_DEBUG_ENTRIES 70U
+
+static int validate_vf_ids(enum xe_sriov_shared_res res,
+			   struct xe_sriov_provisioned_range *ranges,
+			   unsigned int nr_ranges, unsigned int expected_num_vfs)
+{
+	unsigned int current_vf_id = 0;
+
+	/* If no VFs are expected, ensure no ranges are provided */
+	if (expected_num_vfs == 0) {
+		if (nr_ranges > 0) {
+			unsigned int limit = min(nr_ranges, MAX_DEBUG_ENTRIES);
+
+			igt_debug("%s: Unexpected %u ranges when expected num_vfs == 0\n",
+				  xe_sriov_debugfs_provisioned_attr_name(res),
+				  nr_ranges);
+			for (unsigned int i = 0; i < limit; i++) {
+				igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
+						  "%s:VF%u: %lx-%lx\n" :
+						  "%s:VF%u: %lu-%lu\n",
+					  xe_sriov_shared_res_to_string(res),
+					  ranges[i].vf_id, ranges[i].start, ranges[i].end);
+			}
+			igt_debug_on_f(nr_ranges > MAX_DEBUG_ENTRIES,
+				       "%s: Output truncated to first %u ranges out of %u\n",
+				       xe_sriov_debugfs_provisioned_attr_name(res),
+				       MAX_DEBUG_ENTRIES, nr_ranges);
+
+			return -ERANGE;
+		}
+		return 0; /* Valid case: no VFs, no ranges */
+	}
+
+	if (igt_debug_on_f(nr_ranges == 0,
+			   "%s: No VF ranges\n",
+			   xe_sriov_debugfs_provisioned_attr_name(res)))
+		return -ENOENT;
+
+	igt_assert(ranges);
+	qsort(ranges, nr_ranges, sizeof(ranges[0]), compare_ranges_by_vf_id);
+
+	for (unsigned int i = 0; i < nr_ranges; i++) {
+		unsigned int vf_id = ranges[i].vf_id;
+
+		if (igt_debug_on_f(vf_id == current_vf_id,
+				   "%s: Duplicate VF%u entry found\n",
+				   xe_sriov_debugfs_provisioned_attr_name(res), vf_id))
+			return -EEXIST;
+
+		if (igt_debug_on_f(vf_id < 1 || vf_id > expected_num_vfs,
+				   "%s: Out of range VF%u\n",
+				   xe_sriov_debugfs_provisioned_attr_name(res), vf_id))
+			return -ERANGE;
+
+		if (igt_debug_on_f(vf_id > current_vf_id + 1,
+				   "%s: Missing VF%u\n",
+				   xe_sriov_debugfs_provisioned_attr_name(res),
+				   current_vf_id + 1))
+			return -ESRCH;
+
+		current_vf_id = vf_id;
+	}
+
+	if (igt_debug_on_f(current_vf_id != expected_num_vfs,
+			   "%s: Missing VF%u\n",
+			   xe_sriov_debugfs_provisioned_attr_name(res), expected_num_vfs))
+		return -ESRCH;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_debugfs_read_check_ranges:
+ * @pf_fd: PF device file descriptor
+ * @res: resource
+ * @gt_id: GT number
+ * @ranges: pointer to array of provisioned ranges
+ * @expected_num_vfs: expected number of provisioned VFs
+ *
+ * Reads and validates provisioned ranges of shared resources.
+ * If successfully validated, returns num_vfs allocated ranges
+ * sorted by VF id.
+ * The caller should free the allocated space.
+ *
+ * Return: 0 if successful in reading valid ranges, otherwise negative error code.
+ */
+int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res res,
+					  unsigned int gt_id,
+					  struct xe_sriov_provisioned_range **ranges,
+					  unsigned int expected_num_vfs)
+{
+	unsigned int nr_ranges;
+	int ret;
+
+	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt_id,
+							  ranges, &nr_ranges);
+	if (ret)
+		return ret;
+
+	ret = validate_vf_ids(res, *ranges, nr_ranges, expected_num_vfs);
+	if (ret) {
+		free(*ranges);
+		*ranges = NULL;
+	}
+
+	return ret;
+}
+
 static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
 					 unsigned int gt_num)
 {
diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
index 2db965f9b..cd5f932be 100644
--- a/lib/xe/xe_sriov_debugfs.h
+++ b/lib/xe/xe_sriov_debugfs.h
@@ -16,6 +16,10 @@ int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_
 						unsigned int gt_id,
 						struct xe_sriov_provisioned_range **ranges,
 						unsigned int *nr_ranges);
+int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res res,
+					  unsigned int gt_id,
+					  struct xe_sriov_provisioned_range **ranges,
+					  unsigned int expected_num_vfs);
 int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
 				  unsigned int gt_num, const char *attr,
 				  uint32_t *value);
-- 
2.31.1

