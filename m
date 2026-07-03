Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C709C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 06:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F7810F65C;
	Fri,  3 Jul 2026 06:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzVBALRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A7110F65C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 06:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783060724; x=1814596724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/OYOUHAlmjj3GA7BI2X2Y2T+7gII5TUCaKQcI/8XV0=;
 b=fzVBALRMgvV2UvRJyppMJpeGfbyJnWUHF1akjE4bECF2iMaQAPhbVIpJ
 kSTPP6VqHP73MqQT4+SRo6FMeG0OcLg0Q8qoQqjd9kJNiobZByZ3xjS2e
 2bxpGP216JQxrLWMwdRCzox9wDeHElOrtqZ5bXHwGYbJMtD6qtqBbxVRj
 2TW3a807Q1xJaQkwbYu30kMC+6UvofjLRnTXoNub5BJzmMEbPRwp2PPsy
 +zuaHlCW8dJrtx09XbheEReR109rV8T9diqW4UaDzoKRcQReUrze3ukLC
 t7XeuDkFHPt3G30Kciegzg4SfeTndZ5hfV4bCVUQvHRObMTHTzZbkbjW8 A==;
X-CSE-ConnectionGUID: otZXw5FdTwqDufkB4fZeOg==
X-CSE-MsgGUID: dkRPF3hwQeip+nKJMfy0sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94168542"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="94168542"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:38:44 -0700
X-CSE-ConnectionGUID: 9QnnbQrARL62xCTga3t2Ow==
X-CSE-MsgGUID: OjEBVTzKQOe5rTjEJn1Stw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="291166990"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.245.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:38:43 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 4/7] tests/xe_eudebug_sriov: Remove xe_eudebug_sriov
 test
Date: Fri,  3 Jul 2026 08:38:18 +0200
Message-Id: <20260703063821.11560-5-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703063821.11560-1-dominik.karol.piatkowski@intel.com>
References: <20260703063821.11560-1-dominik.karol.piatkowski@intel.com>
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

Remove xe_eudebug_sriov test due to lack of upstream kernel with
EUdebug feature to be supported by this test.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_eudebug_sriov.c | 154 ---------------------------------
 tests/meson.build              |   1 -
 2 files changed, 155 deletions(-)
 delete mode 100644 tests/intel/xe_eudebug_sriov.c

diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.c
deleted file mode 100644
index 1f150d0ef..000000000
--- a/tests/intel/xe_eudebug_sriov.c
+++ /dev/null
@@ -1,154 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2025 Intel Corporation
- */
-
-/**
- * TEST: Test EU Debugger and SR-IOV interaction
- * Category: Core
- * Mega feature: EUdebug/SR-IOV
- * Sub-category: EUdebug tests
- * Functionality: EU Debugger framework
- * Test category: functionality test
- */
-
-#include "igt.h"
-#include "igt_sysfs.h"
-#include "lib/igt_sriov_device.h"
-#include "xe/xe_eudebug.h"
-
-static bool has_vf_enable_eudebug_attr(int fd, unsigned int vf_num)
-{
-	char path[PATH_MAX];
-	int sysfs;
-	bool ret;
-
-	igt_assert(vf_num > 0);
-
-	sysfs = igt_sysfs_open(fd);
-	igt_assert_fd(sysfs);
-	/* vf_num is 1-based, but virtfn is 0-based */
-	snprintf(path, sizeof(path), "device/virtfn%u/enable_eudebug", vf_num - 1);
-	ret = igt_sysfs_has_attr(sysfs, path);
-	close(sysfs);
-
-	return ret;
-}
-
-/**
- * SUBTEST: deny-eudebug
- * Mega feature: EUdebug
- * Sub-category: EUdebug framework
- * Functionality: EU debug and SR-IOV
- * Description:
- *	Check that eudebug toggle is not available for VFs, and that enabling
- *	eudebug with VFs enabled is not permitted.
- */
-static void test_deny_eudebug(int fd)
-{
-	unsigned int num_vfs = igt_sriov_get_total_vfs(fd);
-	bool err = false;
-	int sysfs;
-
-	igt_debug("Testing %u VFs\n", num_vfs);
-
-	xe_eudebug_enable(fd, false);
-	igt_sriov_enable_driver_autoprobe(fd);
-	igt_sriov_enable_vfs(fd, num_vfs);
-	igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(fd));
-
-	for (int vf_num = 1; vf_num <= num_vfs; ++vf_num) {
-		if (!igt_sriov_is_vf_drm_driver_probed(fd, vf_num)) {
-			igt_debug("VF%u probe failed\n", vf_num);
-			err = true;
-		} else if (has_vf_enable_eudebug_attr(fd, vf_num)) {
-			igt_debug("VF%u has enable_eudebug attribute\n", vf_num);
-			err = true;
-		}
-	}
-
-	igt_assert(!err);
-
-	sysfs = igt_sysfs_open(fd);
-	igt_assert_fd(sysfs);
-	igt_assert_eq(igt_sysfs_printf(sysfs, "device/enable_eudebug", "1"), -EPERM);
-	close(sysfs);
-}
-
-/**
- * SUBTEST: deny-sriov
- * Mega feature: EUdebug
- * Sub-category: EUdebug framework
- * Functionality: EU debug and SR-IOV
- * Description:
- *	Check that VFs cannot be enabled when eudebug is enabled.
- */
-static void test_deny_sriov(int fd)
-{
-	unsigned int num_vfs = igt_sriov_get_total_vfs(fd);
-	int sysfs = 0;
-
-	igt_debug("Testing %u VFs\n", num_vfs);
-
-	igt_sriov_disable_vfs(fd);
-	igt_assert_eq(0, igt_sriov_get_enabled_vfs(fd));
-	xe_eudebug_enable(fd, true);
-
-	sysfs = igt_sysfs_open(fd);
-	igt_assert_fd(sysfs);
-	igt_assert_eq(igt_sysfs_printf(sysfs, "device/sriov_numvfs", "%u", num_vfs), -EPERM);
-	close(sysfs);
-}
-
-static void restore_initial_driver_state(int fd, bool eudebug_enabled, bool vf_autoprobe)
-{
-	bool abort = false;
-
-	igt_sriov_disable_vfs(fd);
-	if (igt_sriov_get_enabled_vfs(fd) > 0) {
-		igt_debug("Failed to disable VF(s)\n");
-		abort = true;
-	}
-
-	vf_autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
-		       igt_sriov_disable_driver_autoprobe(fd);
-	if (vf_autoprobe != igt_sriov_is_driver_autoprobe_enabled(fd)) {
-		igt_debug("Failed to restore sriov_drivers_autoprobe value\n");
-		abort = true;
-	}
-
-	if (__xe_eudebug_enable_getset(fd, NULL, &eudebug_enabled) < 0) {
-		igt_debug("Failed to restore eudebug state\n");
-		abort = true;
-	}
-
-	/* abort to avoid execution of next tests with invalid driver state */
-	igt_abort_on_f(abort, "Failed to restore initial driver state\n");
-}
-
-int igt_main()
-{
-	bool eudebug_enabled;
-	bool vf_autoprobe;
-	int fd;
-
-	igt_fixture() {
-		fd = drm_open_driver(DRIVER_XE);
-		igt_require(igt_sriov_is_pf(fd));
-		igt_require(igt_sriov_vfs_supported(fd));
-		igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
-		igt_require(__xe_eudebug_enable_getset(fd, &eudebug_enabled, NULL) == 0);
-		vf_autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
-	}
-
-	igt_subtest("deny-eudebug")
-		test_deny_eudebug(fd);
-
-	igt_subtest("deny-sriov")
-		test_deny_sriov(fd);
-
-	igt_fixture() {
-		restore_initial_driver_state(fd, eudebug_enabled, vf_autoprobe);
-		close(fd);
-	}
-}
diff --git a/tests/meson.build b/tests/meson.build
index 93c292162..94c3dc214 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -354,7 +354,6 @@ intel_xe_progs = [
 ]
 
 intel_xe_eudebug_progs = [
-	'xe_eudebug_sriov',
 ]
 
 if build_xe_eudebug
-- 
2.34.1

