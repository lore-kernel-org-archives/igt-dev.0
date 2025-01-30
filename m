Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D43FC0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E4910E37B;
	Thu, 30 Jan 2025 17:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqgV2ZaJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2507410E37B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738256716; x=1769792716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dvC5f61keSNBHp/dwZv//TNPj3TsMD1InJMmCUICK2k=;
 b=cqgV2ZaJzixX95qxb8HK6YzOTZ4QLuMfCIJEBYGh5hWsN9BwtsQJxo8x
 ucoEfwdtha2Q3Yn8iJJzaYTITUxmcaDXNlHjItQU1jkGJsKApRFcItnay
 7fDPRaSK2wTxbjyYSsN2Mv94X2BZl9OMTeN7RqbxKSzgdfSWHShnXx0S3
 SthTD3nmfDWvrMEKTezdiqtEDd8PFV0lfT/6+XrfuNgPwMuUVMSFC7klS
 M9uuNkaM3w7HS17RseJqzKmeNg7n/Cv1vhRWvtBcof5SajAHZpVlt2kbR
 kGqxv/grngVc7wS5t3S7Rucu8Ub6Yfv4Jyjlm6fVzwI8dO/1UUBxg8U5d g==;
X-CSE-ConnectionGUID: 1Be9PWkhR6y4CEFF76Z9Kg==
X-CSE-MsgGUID: Ifh0nVENRGG0pwKO/0q5Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38953402"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38953402"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:05:16 -0800
X-CSE-ConnectionGUID: aac5QV19T167yI/pFF5EIA==
X-CSE-MsgGUID: KkLU98bFRVWGshcUvjHepw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109241158"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 09:05:13 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/kms_joiner_helper: Add lib changes to
 check joiner is enabled
Date: Thu, 30 Jan 2025 22:50:29 +0530
Message-Id: <20250130172031.4126606-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250130172031.4126606-1-jeevan.b@intel.com>
References: <20250130172031.4126606-1-jeevan.b@intel.com>
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

Added a library change where we if joiner is enabled or not.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_joiner_helper.c | 38 +++++++++++++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index af89be777..a86099fb7 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -3,6 +3,44 @@
 #include "igt_kms.h"
 #include "intel_chipset.h"
 
+/**
+ * is_joiner_has
+ * @drmfd: A drm file descriptor
+ *
+ * Returns: True if joiner is enabled, false otherwise.
+ */
+bool is_joiner_has(int drmfd)
+{
+	if (!igt_check_joiner_enabled(drmfd)) {
+		igt_debug("Joiner is NOT Enabled\n");
+		return false;
+	}
+
+	return true;
+}
+
+/**
+ * igt_check_joiner_enabled:
+ * @drmfd: A drm file descriptor
+ *
+ * Returns: True if joiner is enabled, false otherwise.
+ */
+bool igt_check_joiner_enabled(int drmfd)
+{
+	char buf[4096];
+	int dir, res;
+
+	dir = igt_debugfs_dir(drmfd);
+	igt_assert(dir >= 0);
+
+	res = igt_debugfs_simple_read(dir, "i915_display_info",
+					    buf, sizeof(buf));
+	close(dir);
+
+	return res > 0 ? (strstr(buf, "pipes as a master") &&
+			  strstr(buf, "pipes as a slave")) : 0;
+}
+
 /*
  * Detect if the output needs 1, 2, or 4 pipes (non-joiner, big joiner, ultra).
  * This re-uses your existing logic from:
diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
index 95e71a229..e38b9f61b 100644
--- a/tests/intel/kms_joiner_helper.h
+++ b/tests/intel/kms_joiner_helper.h
@@ -3,6 +3,8 @@
 
 #include "igt_kms.h"
 
+bool is_joiner_has(int drmfd);
+bool igt_check_joiner_enabled(int drmfd);
 void igt_set_all_master_pipes_for_platform(igt_display_t *display,
 					   uint32_t *master_pipes);
 bool igt_assign_pipes_for_outputs(int drm_fd,
-- 
2.25.1

