Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F9FC3ABDD
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 17:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA0B10E6CD;
	Wed, 14 May 2025 17:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jz+3TaV+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0F510E6CE
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 17:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747245146; x=1778781146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0zQNjSA/twS8WqEoGJTqT6CBANeDGTgyqkcuH2o5vBs=;
 b=jz+3TaV+YaKUQWReafCZFofdf+ZSLmIELpuC3PIvecRGbL8OIOJoUrvj
 fOef4wwSU6luBMv7qpfnZcxrgS+AYC7/eILgnfAjYYsm7A/aeAhNpyDvK
 6HNdIM1YOb7Tz8+ccZ9kZR9WvbMf1Qh5wEgKK/aCOh9FWNUz07Om8rOKi
 fmSojj9r60grtKzF1sCXVETYUB4+/8zNrQ6LwWFQBFAirxdizdRarT+Fp
 NygmWcmtaetxQsNuUBR9umYF5DAfb3ignkTJSJQQaybLfBBzqnMIbz1St
 PkA41+6OGWrslOXRFDmUnSOMQnskH1xecXD73inKmfKd6EWOWwvGD8aWD A==;
X-CSE-ConnectionGUID: VZdhZevhSMqaXkiF9E8AyQ==
X-CSE-MsgGUID: qvbftUw8TP+4zkvrgjE+jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49025958"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49025958"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:52:26 -0700
X-CSE-ConnectionGUID: /xeXPE9qSDGFERmjlpVVnQ==
X-CSE-MsgGUID: iIG2sPRSQLCLwIvKeq1rAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142998454"
Received: from amiron-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.81.154])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:52:23 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, himanshu.girotra@intel.com,
 aditya.chauhan@intel.com, pravalika.gurram@intel.com,
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com
Subject: [RFC i-g-t 4/5] tests/core_sysfs: Add GPU-agnostic sysfs testing
Date: Wed, 14 May 2025 19:51:36 +0200
Message-ID: <20250514175140.115033-5-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514175140.115033-1-peter.senna@linux.intel.com>
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
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

Introduces core_sysfs, a GPU-agnostic test designed to work with any
GPU, not limited to i915 and Xe.

The test scans the sysfs directory associated with the GPU, reads all
files, and discards the content.

Cc: marcin.bernatowicz@intel.com
Cc: himanshu.girotra@intel.com
Cc: aditya.chauhan@intel.com
Cc: pravalika.gurram@intel.com
Cc: sai.gowtham.ch@intel.com
Cc: ramadevi.gandi@intel.com
Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/core_sysfs.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 tests/core_sysfs.c

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
new file mode 100644
index 000000000..9c408275e
--- /dev/null
+++ b/tests/core_sysfs.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_dir_explorer.h"
+#include "igt_sysfs.h"
+
+struct {
+	bool warn_on_not_hit;
+} opt = { 0 };
+
+/**
+ * TEST: sysfs test
+ * Description: Read entries from sysfs path.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: sysfs
+ * Feature: core
+ * Test category: uapi
+ *
+ * SUBTEST: sysfs-read-all-entries
+ * Description: Read all entries from sysfs path
+ *
+ */
+
+IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
+
+igt_main
+{
+	int fd = -1;
+	int sysfs = -1;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		sysfs = igt_sysfs_open(fd);
+		igt_require(sysfs >= 0);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_describe("Read all entries from sysfs path.");
+	igt_subtest("sysfs-read-all-entries")
+		igt_dir_explorer_read_and_discard_all(sysfs, 0);
+
+	igt_fixture {
+		close(sysfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index c7a689ab3..eac77fb81 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -8,6 +8,7 @@ test_progs = [
 	'core_hotunplug',
 	'core_setmaster',
 	'core_setmaster_vs_auth',
+	'core_sysfs',
 	'dmabuf',
 	'dmabuf_sync_file',
 	'device_reset',
-- 
2.43.0

