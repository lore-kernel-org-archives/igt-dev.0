Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD185D41C06
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 12:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E99910E6DB;
	Wed, 13 Nov 2024 12:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQGGXkO7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1884210E6DD
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731499219; x=1763035219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RGJZQBozIgs7wWK9wAQCV3EmF8GEt/zr+8KBKBhsvP4=;
 b=OQGGXkO7jCxnVThWXSBFKiuswgxSFVkabOOzSmAWgbooycrPxOL8+ZJ2
 JyK6YEbxKR+ihFmcQmH6XtSKL35AVE9vjA+mjZNek1aWsZG2kHJnYuFKH
 UZhDwzuV5HHhO8JlpKsBhxm4jTcePc2gXR32C7ZQ+h1K0/uIMrZeBqoU2
 c7CUTnEth1GYvY6C2Ttlj8bV5vzmcwnYnx8fqakMP1vX1x1Z5a2o+OQZ1
 KHGTtM9o2GAMwRv8j3U21wwdh9WOWQIbeGOoejF3uoRWb4/bhbvgTRoeZ
 LVDG0Z13BkysRGkQU7IB6YNoLhvM1c6+eK3ZLOCaB2Q9XxpwQsDph2UsM g==;
X-CSE-ConnectionGUID: FAwfJQWiTSawerUpR6on6w==
X-CSE-MsgGUID: 5C2bwoqSSoSepzaqiee+7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35097087"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35097087"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 04:00:19 -0800
X-CSE-ConnectionGUID: kxtN3GXBRyS56fDO7ZdLYA==
X-CSE-MsgGUID: 0j9MKFQAQaCyAySiiT5gXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="92794455"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.140])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 04:00:16 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 3/5] lib/xe/xe_sriov_debugfs: Add function to read
 provisioned ranges
Date: Wed, 13 Nov 2024 12:59:46 +0100
Message-Id: <20241113115948.287709-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241113115948.287709-1-marcin.bernatowicz@linux.intel.com>
References: <20241113115948.287709-1-marcin.bernatowicz@linux.intel.com>
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

Implement xe_sriov_pf_debugfs_read_provisioned_ranges() to read and
parse VFs provisioned ranges from the debug filesystem. Introduce
xe_sriov_debugfs_provisioned_attr_name() to get the debugfs attribute
name for a given shared resource type.

v2: Correct function description (Adam)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 lib/xe/xe_sriov_debugfs.c | 139 +++++++++++++++++++++++++++++++++++++-
 lib/xe/xe_sriov_debugfs.h |   8 +++
 2 files changed, 146 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index dc6ef9da3..c87f91492 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -9,8 +9,9 @@
 #include "drmtest.h"
 #include "igt_debugfs.h"
 #include "igt_sriov_device.h"
-#include "xe/xe_sriov_debugfs.h"
 #include "xe/xe_query.h"
+#include "xe/xe_sriov_debugfs.h"
+#include "xe/xe_sriov_provisioning.h"
 
 #define SRIOV_DEBUGFS_PATH_MAX 96
 
@@ -67,3 +68,139 @@ int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_n
 
 	return debugfs;
 }
+
+/**
+ * xe_sriov_debugfs_provisioned_attr_name:
+ * @res: The shared resource type
+ *
+ * Returns the name of the debugfs provisioned attribute corresponding
+ * to the given shared resource type.
+ *
+ * Return: A string representing the debugfs provisioned attribute name if the
+ *         resource type is valid, otherwise NULL.
+ */
+const char *xe_sriov_debugfs_provisioned_attr_name(enum xe_sriov_shared_res res)
+{
+	switch (res) {
+	case XE_SRIOV_SHARED_RES_CONTEXTS:
+		return "contexts_provisioned";
+	case XE_SRIOV_SHARED_RES_DOORBELLS:
+		return "doorbells_provisioned";
+	case XE_SRIOV_SHARED_RES_GGTT:
+		return "ggtt_provisioned";
+	case XE_SRIOV_SHARED_RES_LMEM:
+		return "lmem_provisioned";
+	}
+
+	return NULL;
+}
+
+static int parse_provisioned_range(const char *line,
+				   struct xe_sriov_provisioned_range *range,
+				   enum xe_sriov_shared_res res)
+{
+	int ret = -1;
+
+	switch (res) {
+	case XE_SRIOV_SHARED_RES_CONTEXTS:
+	case XE_SRIOV_SHARED_RES_DOORBELLS:
+		if (sscanf(line, "VF%u: %lu-%lu", &range->vf_id, &range->start, &range->end) == 3)
+			ret = 0;
+		break;
+	case XE_SRIOV_SHARED_RES_GGTT:
+		if (sscanf(line, "VF%u: %lx-%lx", &range->vf_id, &range->start, &range->end) == 3)
+			ret = 0;
+		break;
+	case XE_SRIOV_SHARED_RES_LMEM:
+		/* Convert to an inclusive range as is the case for other resources.
+		 * The start is always 0 and the end is the value read - 1.
+		 */
+		if (sscanf(line, "VF%u: %lu", &range->vf_id, &range->end) == 2)
+			ret = 0;
+		if (!range->end)
+			return -1;
+		range->end -= 1;
+		range->start = 0;
+		break;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_debugfs_pf_read_provisioned_ranges:
+ * @pf_fd: PF device file descriptor
+ * @res: resource
+ * @gt_id: GT number
+ * @ranges: pointer to array of provisioned ranges
+ * @nr_ranges: pointer to number of read provisioned VFs
+ *
+ * Reads provisioned ranges of shared resources.
+ * Allocates the space for ranges and updates
+ * the nr_ranges to the number of read ranges.
+ * The caller should free the allocated space.
+ *
+ * Return: 0 if successful in reading ranges, otherwise negative error code.
+ */
+int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_res res,
+						unsigned int gt_id,
+						struct xe_sriov_provisioned_range **ranges,
+						unsigned int *nr_ranges)
+{
+	struct xe_sriov_provisioned_range *new_ranges;
+	struct xe_sriov_provisioned_range range;
+	FILE *file;
+	size_t n = 0;
+	const char *fname;
+	char *line = NULL;
+	int fd, ret = 0;
+	ssize_t nread;
+
+	*nr_ranges = 0;
+	*ranges = NULL;
+
+	fname = xe_sriov_debugfs_provisioned_attr_name(res);
+	if (!fname)
+		return -EINVAL;
+
+	fd = xe_sriov_pf_debugfs_attr_open(pf_fd, 0, gt_id, fname, O_RDONLY);
+	if (fd < 0)
+		return -ENOENT;
+	file = fdopen(fd, "r");
+	if (!file) {
+		close(fd);
+		return -errno;
+	}
+
+	while ((nread = getline(&line, &n, file)) != -1) {
+		ret = parse_provisioned_range(line, &range, res);
+		if (ret) {
+			igt_debug("Failed to parse line: %s\n", line);
+			goto cleanup;
+		}
+
+		new_ranges = realloc(*ranges, sizeof(range) * (*nr_ranges + 1));
+		if (!new_ranges) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+		*ranges = new_ranges;
+		memcpy(&(*ranges)[*nr_ranges], &range, sizeof(range));
+		(*nr_ranges)++;
+	}
+
+	if (ferror(file))
+		ret = -EIO;
+
+cleanup:
+	free(line);
+	fclose(file);
+
+	if (ret < 0) {
+		free(*ranges);
+		*ranges = NULL;
+		*nr_ranges = 0;
+	}
+
+	return ret;
+}
diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
index 9f4ba8f43..856445e76 100644
--- a/lib/xe/xe_sriov_debugfs.h
+++ b/lib/xe/xe_sriov_debugfs.h
@@ -6,7 +6,15 @@
 #ifndef __XE_SRIOV_DEBUGFS_H__
 #define __XE_SRIOV_DEBUGFS_H__
 
+enum xe_sriov_shared_res;
+struct xe_sriov_provisioned_range;
+
 int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
 				  const char *attr, int mode);
+const char *xe_sriov_debugfs_provisioned_attr_name(enum xe_sriov_shared_res res);
+int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_res res,
+						unsigned int gt_id,
+						struct xe_sriov_provisioned_range **ranges,
+						unsigned int *nr_ranges);
 
 #endif /* __XE_SRIOV_DEBUGFS_H__ */
-- 
2.31.1

