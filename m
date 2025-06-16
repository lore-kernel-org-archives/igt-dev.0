Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4E7C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 07:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2808710E2CF;
	Mon, 16 Jun 2025 07:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huznSrj7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A9410E2D8
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750059825; x=1781595825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=unEfngqU/PXARaGMUdN3xfzvG65zhC3xwEKRBsgsq60=;
 b=huznSrj7Kd1DamXsfuNt/uc2KQZCiUvLMCoxTxDrdwqmDa13eSPHwYNe
 9kC/1iQJnsi5cxZV1ufH490z3/fivyLPWzgNEiugYGq1vZyn2hXsbkjOJ
 huyX3SMeEPr2f3zCm+vqbtsqvM0iqydkv2F4bcX4vSDj1psjDCwDT+V+y
 xvpMpjQ5GVcJu8WsyfSCujubf6lFytIzetEFDR7Y/3u7g6e5V1IU3xI/C
 BtRZespzh10OF3ug79Ep9zfoHh+q2gJxoGjoYQmlcXEwMaGD25rDhFbni
 4JZycV0gaWTPvkRs7mpS3ohSfFo/48FDmc3HUZbstI/9awSzqw3mSi7Vj A==;
X-CSE-ConnectionGUID: wZbuUikvQKG+foknwGl/rA==
X-CSE-MsgGUID: lxEu+0rGRKe4l2l/wHpvcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77589899"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="77589899"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:43:45 -0700
X-CSE-ConnectionGUID: u2dKlJSpSsiq0ZbY0s3Oxw==
X-CSE-MsgGUID: sRjizkdXTZS4rPKTJxzjJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153360447"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:43:43 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 michal.wajdeczko@intel.com, marcin.bernatowicz@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, ewelina.musial@intel.com
Subject: [PATCH v3 resend i-g-t 4/6] tests: Add core_sysfs
Date: Mon, 16 Jun 2025 09:42:36 +0200
Message-ID: <20250616074240.45818-5-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616074240.45818-1-peter.senna@linux.intel.com>
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
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

core_sysfs is GPU-agnostic test designed to work with any GPU, not
limited to i915 and Xe. The test scans the sysfs directory associated
with the GPU, reads all files, and discards the content.

Cc: michal.wajdeczko@intel.com
Cc: marcin.bernatowicz@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: ewelina.musial@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v3:
 - removed "sysfs" from the name of subtest (Thanks Michal Wajdeczko)
v2:
 - changed style of comparison to NULL

 tests/core_sysfs.c                       | 58 ++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist    |  1 +
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/meson.build                        |  1 +
 4 files changed, 61 insertions(+)
 create mode 100644 tests/core_sysfs.c

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
new file mode 100644
index 000000000..db70e940b
--- /dev/null
+++ b/tests/core_sysfs.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_dir.h"
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
+ * SUBTEST: read-all-entries
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
+	igt_dir_t *igt_dir = NULL;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		sysfs = igt_sysfs_open(fd);
+		igt_require(sysfs >= 0);
+
+		igt_dir = igt_dir_create(sysfs);
+		igt_require(igt_dir);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_describe("Read all entries from sysfs path.");
+	igt_subtest("read-all-entries") {
+		igt_dir_scan_dirfd(igt_dir, -1);
+		igt_dir_process_files(igt_dir, NULL, NULL);
+	}
+
+	igt_fixture {
+		close(sysfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 3ec1b95cf..5d4d101ef 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -4,6 +4,7 @@ igt@i915_module_load@load
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@core_debugfs@read-all-entries
+igt@core_sysfs@read-all-entries
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index ac3177ae9..a5f799f6b 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -8,6 +8,7 @@ igt@fbdev@read
 igt@fbdev@write
 
 igt@core_debugfs@read-all-entries
+igt@core_sysfs@read-all-entries
 igt@intel_sysfs_debugfs@xe-base
 igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries
 igt@intel_sysfs_debugfs@xe-forcewake
diff --git a/tests/meson.build b/tests/meson.build
index 99dbd4feb..a06172d2e 100644
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

