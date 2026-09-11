Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83777C88E45
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 07:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C1510E39C;
	Fri, 11 Sep 2026 07:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGuKXwo5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B2D10E39C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 07:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789110864; x=1820646864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=feSXGhnKd+sikUPhfOpxvN9JlVuLFjAEKv/ppnBGwn0=;
 b=bGuKXwo5OuusGYaSrAf3yTVtXiAYnmaZAjqJ5ogtewCDy8b74bS8koDV
 xgEk2EcqhD3ilHKYBAb4czFbkJMH8QZInAaO2tIU9v/68iAw/sZfVr0hZ
 IeBklVYK0RqDBk98GkqDxiF+No0mIXal5mjdnOqSmiH5mfZlFQ4DN88z2
 EEFZ5PqDVwP0VlvQJC8EViWJp+dmq41OpukshdGdUIXgHIXvorukj3ap8
 qyrT46eeO+XAglC7QKFtEWPM3oWwpKeJ/b7AqcTYXDlt6fXbzJYWw81kr
 cDORVHbzQr0V+ZicghwilM3L5CMjLaXAOkx2dk4XR8XB438Rn4mo4iFhK g==;
X-CSE-ConnectionGUID: ynAKhq+OSzGjVToj42uZPQ==
X-CSE-MsgGUID: YWGBgsLmRz+3CnelMz23iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115112139"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="115112139"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 00:14:23 -0700
X-CSE-ConnectionGUID: XC3RLY6KSsWR4Cgj03xNag==
X-CSE-MsgGUID: Cn/WGRJjQ+O0qgmJt1ohuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275989659"
Received: from dut1231bmgfrd.igk.intel.com ([10.211.177.56])
 by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 00:14:21 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v6 1/3] lib/igt_sysfs: add vram d3cold threshold helpers
Date: Fri, 11 Sep 2026 07:13:31 +0000
Message-ID: <20260911071409.56112-2-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
References: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Refactor vram_d3cold_threshold helper functions
into igt_sysfs to allow reuse across tests.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 lib/igt_sysfs.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 53 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 3646dbacb..9952c1c0d 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1012,6 +1012,56 @@ void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value)
 		     value, attr, strerror(errno));
 }
 
+/**
+ * igt_sysfs_get_vram_d3cold_threshold:
+ * @sysfs: sysfs directory corresponding to the device
+ *
+ * Reads the value of the vram_d3cold_threshold sysfs attribute.
+ *
+ * Returns:
+ * Current vram_d3cold_threshold value.
+ */
+uint64_t igt_sysfs_get_vram_d3cold_threshold(int sysfs)
+{
+	uint64_t threshold;
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+
+	igt_require_f(!faccessat(sysfs, path, R_OK, 0),
+		      "vram_d3cold_threshold is not present\n");
+
+	ret = igt_sysfs_scanf(sysfs, path, "%" PRIu64, &threshold);
+	igt_assert_lt(0, ret);
+
+	return threshold;
+}
+
+/**
+ * igt_sysfs_set_vram_d3cold_threshold:
+ * @sysfs: sysfs directory corresponding to the device
+ * @threshold: value to set
+ *
+ * Convenience wrapper to write a value to the
+ * vram_d3cold_threshold sysfs attribute.
+ * It asserts on failure.
+ */
+void igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
+{
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+
+	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
+		ret = igt_sysfs_printf(sysfs, path, "%" PRIu64, threshold);
+	else
+		igt_warn("vram_d3cold_threshold is not present\n");
+
+	igt_assert_lt(0, ret);
+}
+
 /**
  * __igt_sysfs_get_boolean:
  * @dir: directory corresponding to attribute
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 9cbd216e6..8bdf97060 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -135,6 +135,9 @@ uint64_t igt_sysfs_get_u64(int dir, const char *attr);
 bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
 void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
 
+uint64_t igt_sysfs_get_vram_d3cold_threshold(int sysfs);
+void igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold);
+
 bool __igt_sysfs_get_boolean(int dir, const char *attr, bool *value);
 bool igt_sysfs_get_boolean(int dir, const char *attr);
 bool __igt_sysfs_set_boolean(int dir, const char *attr, bool value);
-- 
2.43.0

