Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A367C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 14:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E1210E678;
	Tue,  8 Jul 2025 14:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfB/4rqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85E910E67E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 14:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751985667; x=1783521667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hNRQ1DAxxX8y/j1TGmrAYHnY8o76Mh89S1a4wDxLu4c=;
 b=NfB/4rqkRQVZEphd9t7qkB9BVWED529m4ziNmOz+GvUsgKkU0jfa3KFF
 8xyKZHzlsPLw0l9HTVKQH6PQd9SPARVNShFl66zbLQGOHkUlGSVcoWhrl
 1g8mk1nED/fjsZl2Li8ajEIxUn0st6P871LoX/aVGsuFXvXoK8V1WjZdI
 IGgotadm9ZXf2zaeGQVoqgkyi1dMw8mnvSR8V2CDPQCeRQz1dZUYV/UJN
 2LuTvny7p48/RP0nSiqO3kBWFUKcNNtll0egHcLiGreFMS3WyfIMsV/jH
 9ivYUVXZZROgpGugh5jgrrCrY++Ltbyj55H2vzBcbCXSWNNH6cmRV5Lsm w==;
X-CSE-ConnectionGUID: 8KpQIDc+SGu7D2V8YSyy7g==
X-CSE-MsgGUID: MxfnDw4MRcOTdEuxTbOk4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56837429"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="56837429"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:41:07 -0700
X-CSE-ConnectionGUID: 7GhI8vqTTiux8MfTlvjJaw==
X-CSE-MsgGUID: 6ZbSpVg8Sl2JWcAxb5tp7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="161065329"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:41:05 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com
Subject: [PATCH v5,resend i-g-t 4/6] tests: Add core_sysfs
Date: Tue,  8 Jul 2025 16:40:36 +0200
Message-ID: <20250708144039.53482-5-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708144039.53482-1-peter.senna@linux.intel.com>
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
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

Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: michal.wajdeczko@intel.com
Cc: karthik.b.s@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v5:
 - use igt_dir_process_files_simple()
v4:
 - unchanged from v3
v3:
 - removed "sysfs" from the name of subtest (Thanks Michal Wajdeczko)
v2:
 - changed style of comparison to NULL

 tests/core_sysfs.c                       | 49 ++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist    |  1 +
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/meson.build                        |  1 +
 4 files changed, 52 insertions(+)
 create mode 100644 tests/core_sysfs.c

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
new file mode 100644
index 000000000..5ac3ed901
--- /dev/null
+++ b/tests/core_sysfs.c
@@ -0,0 +1,49 @@
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
+	igt_subtest("read-all-entries") {
+		igt_dir_process_files_simple(sysfs);
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
index 1009bef2e..4976f2d91 100644
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

