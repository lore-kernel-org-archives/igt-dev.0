Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36C9CA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 06:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E6E10E03D;
	Thu,  1 Oct 2026 06:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8exNw3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FD910E03D
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 05:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790834355; x=1822370355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gx2TMc8+seCGDs4KxHXtV5qLNLq3CwtIU9DuzrsjUIk=;
 b=h8exNw3D/r7MLhqvpEJ63AGRxlSmzLbJaxWLHeyRx2qZvmr6EgzfoSdK
 wwQZooLPQRoBNjPYX1r9EW/YIpE+XrvrDKWJXPk047ynx/HRpT2qqbSlU
 QTBUBhD+UZUssh/M0WkGNDkzHGGL4MPOsMtmkKt2YhnqAyqp4VHDl9BS8
 3npRG2dkrBcqd6nRsLhJzL9BO30S6qF4REkfIcKb6vht8U6KEo5I40WZI
 20U5TgP3hdekRPTdOpy+MPaOWwhcPISkKMN6MiuQO1QKSQ2KxR9wajgde
 wfv+3trJha7FvoVadTIq6hAz2R5gQAh2OaA2BjIaQGCszh/e1rMKh1l/T w==;
X-CSE-ConnectionGUID: lZ/4Up8fTIeGpvWMKoeqhw==
X-CSE-MsgGUID: cXK14v35Q+KeaBdGKY0nuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102156727"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102156727"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 22:59:14 -0700
X-CSE-ConnectionGUID: s6tuO38SSoekp0POGGNyuw==
X-CSE-MsgGUID: 1cdOc3pwR8OBM0StBSbCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275444692"
Received: from dut1129bmgfrd.igk.intel.com ([10.211.178.46])
 by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 22:59:13 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v8 1/3] lib/igt_sysfs: add vram d3cold threshold helpers
Date: Thu,  1 Oct 2026 05:59:00 +0000
Message-ID: <20261001055902.5430-2-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001055902.5430-1-shivtej.eknath.patil@intel.com>
References: <20261001055902.5430-1-shivtej.eknath.patil@intel.com>
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

Add vram_d3cold_threshold helper functions

Add helper functions to read and write the
vram_d3cold_threshold sysfs attribute.

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

