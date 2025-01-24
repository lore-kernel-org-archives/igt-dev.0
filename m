Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4E0C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 08:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D3910E916;
	Fri, 24 Jan 2025 08:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R42NKiZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F96910E916
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737706251; x=1769242251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ULSn5PAp0bTrd9bdHg+D8rtXKte8NNjdLg98a8lqMY8=;
 b=R42NKiZ7qsjJhv8KYnau0DQvc+LHgnerABfrL82RxtkgGWB09xq0r+2n
 tG/3Gs32N7BX2h72p7ZUCARyXTr9lFfgCEOu5M7RBexlKKfNBix0+mUHG
 gf/YEUG6mrAuO3XEKUZ6p6rdY5iGdmLhqjMXDQlmkBUUu7cVxBW1Ltwsr
 0o0I6gucNApF5nUiQBYCQlZP2AgzpF3stjYCGy+HnJAjkQogNtrNasFaV
 6BsyjuwoPMZYQgVJUrv1eel0UIFqBEPMX1y65YMc0gF1N7sjTfkEZwM15
 LTfbSzJ0/cYs6D/8EbQmXFk4ZzW3bRz8p2d3LxO6gitCx99pqlg09zmg4 Q==;
X-CSE-ConnectionGUID: ztmdR9NqQ+25S8csn05X4g==
X-CSE-MsgGUID: gEhWSrLYQwe1DslOVSMB3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63587300"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="63587300"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 00:10:51 -0800
X-CSE-ConnectionGUID: yqAPh5noTzCpuShRD97LUA==
X-CSE-MsgGUID: nrKMAgR8S4+vrx3R31Vlvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112340316"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 00:10:49 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v1 1/4] lib/xe/xe_sriov_provisioning: Add helper to read
 VF's configuration data
Date: Fri, 24 Jan 2025 09:10:36 +0100
Message-Id: <20250124081039.31201-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250124081039.31201-1-lukasz.laguna@intel.com>
References: <20250124081039.31201-1-lukasz.laguna@intel.com>
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

Add helper allowing to read configuration data that VF queried from GuC
during probe.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_sriov_provisioning.c | 80 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  5 +++
 2 files changed, 85 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 22035ffd8..5ba348131 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -4,8 +4,10 @@
  */
 
 #include <errno.h>
+#include <fcntl.h>
 
 #include "igt_core.h"
+#include "igt_debugfs.h"
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
 #include "xe/xe_mmio.h"
@@ -296,3 +298,81 @@ bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res,
 
 	return true;
 }
+
+/**
+ * __xe_sriov_vf_get_shared_res_selfconfig - Read VF's configuration data.
+ * @vf: VF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @gt_num: GT number
+ * @value: Pointer to store the read value
+ *
+ * Reads the specified shared resource @res from selfconfig of given VF device
+ * @vf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_vf_get_shared_res_selfconfig(int vf, enum xe_sriov_shared_res res,
+					    unsigned int gt_num, uint64_t *value)
+{
+	FILE *file;
+	size_t n = 0;
+	char *line = NULL;
+	int fd, ret = 0;
+
+	fd = igt_debugfs_gt_open(vf, gt_num, "vf/self_config", O_RDONLY);
+	if (fd < 0)
+		return fd;
+	file = fdopen(fd, "r");
+	if (!file) {
+		close(fd);
+		return -errno;
+	}
+
+	while (getline(&line, &n, file) >= 0) {
+		switch (res) {
+		case XE_SRIOV_SHARED_RES_CONTEXTS:
+			ret = sscanf(line, "GuC contexts: %lu", value);
+			break;
+		case XE_SRIOV_SHARED_RES_DOORBELLS:
+			ret = sscanf(line, "GuC doorbells: %lu", value);
+			break;
+		case XE_SRIOV_SHARED_RES_GGTT:
+			ret = sscanf(line, "GGTT size: %lu", value);
+			break;
+		case XE_SRIOV_SHARED_RES_LMEM:
+			ret = sscanf(line, "LMEM size: %lu", value);
+			break;
+		}
+
+		if (ret > 0)
+			break;
+	}
+
+	free(line);
+	fclose(file);
+	close(fd);
+
+	return ret ? 0 : -1;
+}
+/**
+ * xe_sriov_vf_get_shared_res_selfconfig - Read VF's configuration data.
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_vf_get_shared_res_selfconfig().
+ * Instead of returning an error code, it returns the quota value and asserts
+ * in case of an error.
+ *
+ * Return: The quota for the given shared resource.
+ *         Asserts in case of failure.
+ */
+uint64_t xe_sriov_vf_get_shared_res_selfconfig(int vf, enum xe_sriov_shared_res res,
+					       unsigned int gt_num)
+{
+	uint64_t value;
+
+	igt_fail_on(__xe_sriov_vf_get_shared_res_selfconfig(vf, res, gt_num, &value));
+
+	return value;
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index b4300ec2e..1a05c2c59 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -90,4 +90,9 @@ void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 				     unsigned int vf_num, unsigned int gt_num,
 				     uint64_t value);
 
+int __xe_sriov_vf_get_shared_res_selfconfig(int vf, enum xe_sriov_shared_res res,
+					    unsigned int gt_num, uint64_t *value);
+uint64_t xe_sriov_vf_get_shared_res_selfconfig(int vf, enum xe_sriov_shared_res res,
+					       unsigned int gt_num);
+
 #endif /* __XE_SRIOV_PROVISIONING_H__ */
-- 
2.40.0

