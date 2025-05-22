Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41873C54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 11:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD48410EB10;
	Thu, 22 May 2025 11:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4tZn5c/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B190310EB10
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747911714; x=1779447714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jNQEYSs7aI4vRWqlJKPcB6/rpJRxgSBo6Jwhghtnn1A=;
 b=Q4tZn5c/DLc7eHfQhMLP/KxmIdcIVfGegpyVcQ8n1jtaCeU5teCM9azZ
 Z+3DjTMtQhiQ+6PJskctrzZLNkD0oHSmmbXP0qnmQI7RGXNL8dqZeXD9A
 OxTYQArVYtvpos+v/02JN35weLUGiGZ4JLRqeswKyPQXxiJFRTvM7cjdd
 RqcyO06TrvXDl/bL0ig36adeXv5Xu9dr88SxH4SCbT6ASByIVI8y8JnGy
 MggMQ0gYeuA2Ps27h4qcXrtF40uauej0U+P73NQL/CnCKroa8rsX+yWal
 gmmV/CpusjZYYHF3ZvFcHmaInjZa5cgnm5uPkyJ040RDTbrI5X9O5m3gG Q==;
X-CSE-ConnectionGUID: Cn4ZAI/gQe6C/sBaxr4tnQ==
X-CSE-MsgGUID: BjNOeiqAT2WjtOzzzpBWHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61274964"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="61274964"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:01:54 -0700
X-CSE-ConnectionGUID: v7gtbzxMS3aa362XzFdU3Q==
X-CSE-MsgGUID: 0VfmHBSDQjStp8xl/WyNfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="145788856"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:01:52 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
Subject: [PATCH i-g-t 4/5] tests/core_sysfs: Add GPU-agnostic sysfs testing
Date: Thu, 22 May 2025 13:00:47 +0200
Message-ID: <20250522110126.628720-5-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522110126.628720-1-peter.senna@linux.intel.com>
References: <20250522110126.628720-1-peter.senna@linux.intel.com>
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
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: ewelina.musial@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/core_sysfs.c                       | 58 ++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist    |  1 +
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/meson.build                        |  1 +
 4 files changed, 61 insertions(+)
 create mode 100644 tests/core_sysfs.c

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
new file mode 100644
index 000000000..09d0b7429
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
+	igt_dir_t *igt_dir = NULL;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		sysfs = igt_sysfs_open(fd);
+		igt_require(sysfs >= 0);
+
+		igt_dir = igt_dir_create(sysfs);
+		igt_require(igt_dir != NULL);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_describe("Read all entries from sysfs path.");
+	igt_subtest("sysfs-read-all-entries") {
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
index 9d421f402..aa7f57b1f 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -4,6 +4,7 @@ igt@i915_module_load@load
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@core_debugfs@debugfs-read-all-entries
+igt@core_sysfs@sysfs-read-all-entries
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index c8bfc7fa7..0a02667d7 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -8,6 +8,7 @@ igt@fbdev@read
 igt@fbdev@write
 
 igt@core_debugfs@debugfs-read-all-entries
+igt@core_sysfs@sysfs-read-all-entries
 
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
diff --git a/tests/meson.build b/tests/meson.build
index 97633a53b..212a4c3b8 100644
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

