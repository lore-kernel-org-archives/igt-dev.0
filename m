Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B267D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 10:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EF710E35D;
	Mon,  1 Dec 2025 10:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RiXy4BdA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD11010E35D
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764585253; x=1796121253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k97eAGxV2rD46rwPvjkKuE4SWYjXX8zY6rhsAR4tUBo=;
 b=RiXy4BdAl+lUs1Asdbnemhhcto041YVb75mYfxDkrOdb9if/XUkJNUpj
 yIPcEdaWSVgSoazWTF/79xspmtvX89UNIzsClACNZZ7e5eSvNPrYb2dNU
 XmPrtCaUuHtB9HT0KUq4f6JB0bVVWasqXrPEllfQnlGxtr5R8s11lrWqG
 isDgvUBmrMrq9S0kHlSkLT1rMj1THdSOX6/zJLIKMMag04PzTQoztVd4P
 9EqH0OZSMOj3Fh5e62802h5oFdEsIMWQTM2v79f0icMNo3cWxuXEbyY7C
 pN5OtAbJY0+iCcZuvJTG0dq4rHsNs6omEdDg7ckR56iFBuO8oVeYtLCul g==;
X-CSE-ConnectionGUID: 3FRGQLIdSGyrCh5NDHv4xg==
X-CSE-MsgGUID: O00pEA2YSfuCa39gR/5Liw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66554580"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66554580"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:34:12 -0800
X-CSE-ConnectionGUID: QYsyTSq7SE2c2Wb/P3v5CQ==
X-CSE-MsgGUID: 9cMIGHw4ROGD2+ePwHXG1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194456173"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2025 02:34:11 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	Satyanarayana.K.V.P@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov*: Force disable EU debug before
 running SR-IOV test
Date: Mon,  1 Dec 2025 16:13:03 +0530
Message-Id: <20251201104303.2438191-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

EU debug and SR-IOV cannot be enabled together.
Failed EU debug tests may leave the feature enabled,
blocking SR-IOV tests. Explicitly disable EU debug to ensure
clean state before running SR-IOV test.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_sriov_auto_provisioning.c | 2 ++
 tests/intel/xe_sriov_flr.c               | 2 ++
 tests/intel/xe_sriov_scheduling.c        | 2 ++
 tests/intel/xe_sriov_vram.c              | 2 ++
 tests/sriov_basic.c                      | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 451c3c5ca..c0d038afa 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -12,6 +12,7 @@
 #include "xe/xe_sriov_debugfs.h"
 #include "xe/xe_sriov_provisioning.h"
 #include "xe/xe_query.h"
+#include "xe/xe_eudebug.h"
 
 /**
  * TEST: xe_sriov_auto_provisioning
@@ -333,6 +334,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		int ret;
 
 		pf_fd = drm_open_driver(DRIVER_XE);
+		xe_eudebug_enable(pf_fd, false);
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 3e5835487..d74d2e486 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -17,6 +17,7 @@
 #include "xe/xe_query.h"
 #include "xe/xe_sriov_provisioning.h"
 #include "xe/xe_sriov_debugfs.h"
+#include "xe/xe_eudebug.h"
 
 /**
  * TEST: xe_sriov_flr
@@ -1030,6 +1031,7 @@ igt_main
 
 	igt_fixture {
 		pf_fd = drm_open_driver(DRIVER_XE);
+		xe_eudebug_enable(pf_fd, false);
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 5e8c87755..ab25383e2 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -10,6 +10,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
 #include "xe/xe_sriov_provisioning.h"
+#include "xe/xe_eudebug.h"
 
 /**
  * TEST: Tests for SR-IOV scheduling parameters.
@@ -891,6 +892,7 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 
 	igt_fixture {
 		pf_fd = drm_open_driver(DRIVER_XE);
+		xe_eudebug_enable(pf_fd, false);
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
index 6c3c8e031..8e1aa2e04 100644
--- a/tests/intel/xe_sriov_vram.c
+++ b/tests/intel/xe_sriov_vram.c
@@ -9,6 +9,7 @@
 #include "intel_vram.h"
 #include "xe/xe_sriov_provisioning.h"
 #include "xe/xe_query.h"
+#include "xe/xe_eudebug.h"
 
 /**
  * TEST: xe_sriov_vram
@@ -346,6 +347,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 
 	igt_fixture {
 		pf_fd = drm_open_driver(DRIVER_XE);
+		xe_eudebug_enable(pf_fd, false);
 		igt_require(xe_has_vram(pf_fd));
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 36bca4149..0a4381896 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -6,6 +6,7 @@
 #include "drmtest.h"
 #include "igt_core.h"
 #include "igt_sriov_device.h"
+#include "xe/xe_eudebug.h"
 
 IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
 
@@ -125,6 +126,7 @@ igt_main
 
 	igt_fixture {
 		pf_fd = drm_open_driver(DRIVER_ANY);
+		xe_eudebug_enable(pf_fd, false);
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_vfs_supported(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
-- 
2.34.1

