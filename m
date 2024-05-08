Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10227C19F4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 09:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882F610FA34;
	Wed,  8 May 2024 09:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUK882/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA04A113520
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 09:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715161777; x=1746697777;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=+5HHKdku+6cJxPRuGvLv+kt8t1i+5j+8ajEQjM8GfYU=;
 b=HUK882/kCe958vDUdIiZW35kuB/c7ucmT2IOXY4AfeimXvLV+LaQmUHs
 BiLZW3NcUIhc+3H9wNqBhlqiNN+lblxni4h/PyMNvBP8gEYuBqAz6OLZd
 QJ06NGCz4cBOw85lBs9hTevPw3RoXdfTRUiVv6D0GROUT9ZOqpll3L/Xt
 4kQhNjZkdiql0OQFzyjLdKd/KKOVeOrz0RGk5qGoHU5rYcqfg/neck7gW
 ZHbPR7VcGXrxqu0eCUm/sagqD1h0JGx8drNqxh5agiQemoTC/H+l9qnqp
 C0SXlwUu07yM6spQfeukiv9JMizJ1lcRlhVt6KpSKheNzxcL3wIdFLBi2 w==;
X-CSE-ConnectionGUID: EMC1TLylRz2rdLfZOIlJmQ==
X-CSE-MsgGUID: VmsgiaxsRja9UUpZzdda+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="13960141"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="13960141"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 02:49:36 -0700
X-CSE-ConnectionGUID: sxRHA8wwSgm9R68Em1Mz4A==
X-CSE-MsgGUID: uWz8AECvRfOjA0Ema+o8sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="29360355"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 02:49:36 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E2BA120C5DC8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 02:49:35 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1s4dvZ-00000001ayg-3oAJ for igt-dev@lists.freedesktop.org;
 Wed, 08 May 2024 11:49:33 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel: add some missing core tests to
 xe_test_config.json
Date: Wed,  8 May 2024 11:49:31 +0200
Message-ID: <20240508094931.380460-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Such tests are also used to check Xe functionality. Add them
to the Xe testplan configuration.

Also, move descriptions for simple tests to the right place,
as otherwise warnings will be produced:
	Warning: igt@core_getclient Description documentation is missing
	Warning: igt@core_getstats Description documentation is missing
	Warning: igt@core_setmaster_vs_auth Description documentation is missing

As each subtest requires its own description.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/core_getclient.c          | 2 +-
 tests/core_getstats.c           | 2 +-
 tests/core_setmaster_vs_auth.c  | 2 +-
 tests/intel/xe_test_config.json | 4 +++-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 308f2c0e4422..6756c0882381 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -34,13 +34,13 @@
 /**
  * TEST: core getclient
  * Category: Desktop client
- * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
  * Feature: core
  * Functionality: permission management for clients
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
  * SUBTEST:
+ * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl
  */
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_CLIENT ioctl.");
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index b2d26a8260a9..6f98087253c7 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -35,13 +35,13 @@
 /**
  * TEST: core getstats
  * Category: Desktop client
- * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
  * Feature: core
  * Functionality: DRM memory management
  * Sub-category: uapi
  * Test category: GEM_Legacy
  *
  * SUBTEST:
+ * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
  */
 
 /**
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index 592d850f6bc5..c8fbc827b9f1 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -43,13 +43,13 @@
 /**
  * TEST: core setmaster vs auth
  * Category: Desktop client
- * Description: Check that drop/setMaster correctly transfer master state
  * Feature: core
  * Functionality: permission management for clients
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
  * SUBTEST:
+ * Description: Check that drop/setMaster correctly transfer master state
  */
 
 IGT_TEST_DESCRIPTION("Check that drop/setMaster correctly transfer master "
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 3775e63fc65e..ef3993dae8e5 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -2,7 +2,9 @@
     "description": "JSON file to be used to parse Xe documentation",
     "name": "Tests for Xe Driver",
     "drivers": [ "xe" ],
-    "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c" ],
+    "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c",
+               "../core_auth.c", "../core_getclient.c", "../core_getstats.c",
+               "../core_getversion.c", "../core_setmaster.c", "../core_setmaster_vs_auth.c" ],
     "fields": {
         "Run type": {
             "_properties_": {
-- 
2.44.0

