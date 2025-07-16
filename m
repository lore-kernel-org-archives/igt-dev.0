Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23324C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 09:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66410E76B;
	Wed, 16 Jul 2025 09:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkS+e0jL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1302D10E76B
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752658639; x=1784194639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n2XITuyK9m3Xxn0xyKYTD2xi7ktaY+JFEgxYmvwbYrE=;
 b=fkS+e0jLY2GniM8g2cKpAclj5g1fKBcJ5HKdEojWEVeTdd803f7uZbM+
 SxIbRRkJdToO4l1fqSg/pB64LVFijSzP+FbEoAmlEOn+VmDxMl3UUjdfT
 YhLbjuh8MX/fsl/Fr+E1TNXWEbmV7mYBuD1c417w+rzMHERQm0kyW8eo8
 e7ZPra2ieGdsNPfkR5qVfd0HPYO+/lego3OdqMil3eW/tHuVQ4tfRM+8J
 W3OacUc4I0sPNdcKzvq6xH+lFN5dtXffbKJX+LACmUxJNX7VFYZ4fPela
 DtMqdLRKvBp1qbIJTKTTSRcfEIGcsFTiYJmP0ieDSTTWf+rPt/ry+Y6OR g==;
X-CSE-ConnectionGUID: +UTP4le5SniVPzFyLy3Mpw==
X-CSE-MsgGUID: woxArdT0T6y6O0kY8MxCyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54867848"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="54867848"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 02:37:18 -0700
X-CSE-ConnectionGUID: HOnahTwaS3O+goPPPhGkKw==
X-CSE-MsgGUID: RhscT3lpTR2zjbixbS+HfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="157547100"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 02:37:16 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, ewelina.musial@intel.com
Subject: [PATCH v6 i-g-t 4/6] tests: Add core_sysfs
Date: Wed, 16 Jul 2025 11:36:52 +0200
Message-ID: <20250716093656.169619-5-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716093656.169619-1-peter.senna@linux.intel.com>
References: <20250716093656.169619-1-peter.senna@linux.intel.com>
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

Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: michal.wajdeczko@intel.com
Cc: karthik.b.s@intel.com
Cc: ewelina.musial@intel.com
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v6:
 - unchanged from v5
v5:
 - use igt_dir_process_files_simple()
v4:
 - unchanged from v3
v3:
 - removed "sysfs" from the name of subtest (Thanks Michal Wajdeczko)
v2:
 - changed style of comparison to NULL

 tests/core_sysfs.c                         | 48 ++++++++++++++++++++++
 tests/intel-ci/i915.fast-feedback.testlist |  1 +
 tests/intel-ci/xe-fast-feedback.testlist   |  1 +
 tests/meson.build                          |  1 +
 4 files changed, 51 insertions(+)
 create mode 100644 tests/core_sysfs.c

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
new file mode 100644
index 000000000..c43008981
--- /dev/null
+++ b/tests/core_sysfs.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_dir.h"
+#include "igt_sysfs.h"
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
+	igt_subtest("read-all-entries")
+		igt_dir_process_files_simple(sysfs);
+
+	igt_fixture {
+		close(sysfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
index 3ec1b95cf..5d4d101ef 100644
--- a/tests/intel-ci/i915.fast-feedback.testlist
+++ b/tests/intel-ci/i915.fast-feedback.testlist
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
index 568e7db00..532bc9071 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -7,6 +7,7 @@ test_progs = [
 	'core_hotunplug',
 	'core_setmaster',
 	'core_setmaster_vs_auth',
+	'core_sysfs',
 	'dmabuf',
 	'dmabuf_sync_file',
 	'device_reset',
-- 
2.43.0

