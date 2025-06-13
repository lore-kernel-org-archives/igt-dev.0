Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21BEC71148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 10:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5430B10E999;
	Fri, 13 Jun 2025 10:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFJ+odhx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD6E10E997
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749811934; x=1781347934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0BGWfrG8yG69c9HdO1HJhz1Wb0V5T6BZapUM6jaXozI=;
 b=VFJ+odhxKaIcgLjTz5i9iiIqOwwhMLNgCZeRyLMjk6mMBygpbnhgkucz
 BNDNSpTG17PLBml3KDWfTaQbdI9F+cCz3Jxpk9ItbIzTOqfwdgEmFpDVf
 VYjYYcTMbwje2iy2EneU7EaN/BTTTbIe8CWRDa6xPkoAQk86bUaLxmYvJ
 5gV99124eIDkuMecu+EvDFjixVbKguMkAQvsOjC4LAPWZ32rxxha1CjQM
 mQnWjEwNr0NzursuaMkvimjrmR+6t/4/x5uZQdXgSUS7xmooUZ45OJym7
 PuzfGXeeMshwB9VlFDNAXUBVtSUSr988eYUtFyWHu8xcYQ3/hxTIVSDj+ g==;
X-CSE-ConnectionGUID: hmWRKsYcQo2wTAEpEkBziQ==
X-CSE-MsgGUID: +hQ8OkKYSXC18OHL3hqs5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69467224"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69467224"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:52:14 -0700
X-CSE-ConnectionGUID: eF6ECe+4Rs6bj3luGpm0ag==
X-CSE-MsgGUID: dJnRh3pxRZ6bkNP56gthyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="178772225"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:52:11 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
Subject: [PATCH v2 i-g-t 4/6] tests: Add core_sysfs
Date: Fri, 13 Jun 2025 12:51:43 +0200
Message-ID: <20250613105146.106581-5-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613105146.106581-1-peter.senna@linux.intel.com>
References: <20250613105146.106581-1-peter.senna@linux.intel.com>
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

Cc: marcin.bernatowicz@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: ewelina.musial@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v2:
 - changed style of comparison to NULL

 tests/core_sysfs.c                       | 58 ++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist    |  3 +-
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/meson.build                        |  1 +
 4 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 tests/core_sysfs.c

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
new file mode 100644
index 000000000..fc97bd77b
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
+		igt_require(igt_dir);
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
index 7902bbdae..7415c51ef 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -3,6 +3,8 @@ igt@i915_module_load@load
 
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
+igt@core_debugfs@debugfs-read-all-entries
+igt@core_sysfs@sysfs-read-all-entries
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
@@ -53,7 +55,6 @@ igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
 igt@i915_pciid
 igt@intel_hwmon
-igt@core_debugfs@debugfs-read-all-entries
 igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries
 igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries
 igt@kms_addfb_basic@addfb25-4-tiled
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5fb233fb4..1626e5d7c 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -8,6 +8,7 @@ igt@fbdev@read
 igt@fbdev@write
 
 igt@core_debugfs@debugfs-read-all-entries
+igt@core_sysfs@sysfs-read-all-entries
 igt@intel_sysfs_debugfs@xe-base
 igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries
 igt@intel_sysfs_debugfs@xe-forcewake
diff --git a/tests/meson.build b/tests/meson.build
index c05c023ef..da9247ddc 100644
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

