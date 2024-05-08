Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487C9C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 10:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54C9113574;
	Wed,  8 May 2024 10:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JstSkBHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2A7113574
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715164185; x=1746700185;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=PbPaiu3xykHr8aoqO3uCF8KPfcN5ZhUn8D8Yef+pcBQ=;
 b=JstSkBHz839XzWXMWUWYPuTbwWOzSDTppALdYmOf+QPSBllI7ybfQ9vX
 X1K5VS9X7EvAem58+dOmAZLbpogZ9KoF7fRTqxkhVnFZIZfaVd2sYcxPX
 GT0qGHGGdjWcF9+w31byY7V+pleU01TAx+/K9OmjD9JWiUrA3uC7+Ml9f
 trj1m7Qc9e64/ZNxBebA4UQumrYV3jlsud7sLGC8f3o9cvHaAFDyaxw6S
 I4iBd13UvZj2R6reOsAD2DiBr3UCgORvoWgho28Rsyj6uiVe5mvl+rfbv
 w9UtG+Ea4McCREIgaZV2UDyggO6dTeJt8gCWIqChfrr6qhOwFk3Kppo/r Q==;
X-CSE-ConnectionGUID: aK+2E6KHS3OQjwfZEsWsIw==
X-CSE-MsgGUID: WSrhzTcWQIyNv1+RJNQtsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28530727"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28530727"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 03:29:45 -0700
X-CSE-ConnectionGUID: Vejv6laDRxi2M8qHT2AK9g==
X-CSE-MsgGUID: x/H8EnU5Q5Gdxjp15Mb8Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="66272612"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 03:29:45 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BD26520C5DC8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 03:29:44 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1s4eYQ-00000001bjB-3FAq for igt-dev@lists.freedesktop.org;
 Wed, 08 May 2024 12:29:42 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] tests/intel: add other missing core tests to
 xe_test_config.json
Date: Wed,  8 May 2024 12:29:41 +0200
Message-ID: <20240508102941.383343-1-mauro.chehab@linux.intel.com>
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

All core tests are used to check Xe functionality. Add them to the Xe
testplan configuration.

Also, move descriptions for simple tests to the right place,
as otherwise warnings will be produced:
	Warning: igt@core_getclient Description documentation is missing
	Warning: igt@core_getstats Description documentation is missing
	Warning: igt@core_setmaster_vs_auth Description documentation is missing

As each subtest requires its own description.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/core_getclient.c          | 1 +
 tests/core_getstats.c           | 1 +
 tests/core_setmaster_vs_auth.c  | 1 +
 tests/intel/xe_test_config.json | 2 +-
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 308f2c0e4422..5914335724d3 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -41,6 +41,7 @@
  * Test category: GEM_Legacy
  *
  * SUBTEST:
+ * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
  */
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_CLIENT ioctl.");
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index b2d26a8260a9..05e0eae34008 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -42,6 +42,7 @@
  * Test category: GEM_Legacy
  *
  * SUBTEST:
+ * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
  */
 
 /**
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index 592d850f6bc5..4605f84530e4 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -50,6 +50,7 @@
  * Test category: GEM_Legacy
  *
  * SUBTEST:
+ * Description: Check that drop/setMaster correctly transfer master state
  */
 
 IGT_TEST_DESCRIPTION("Check that drop/setMaster correctly transfer master "
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 3775e63fc65e..6651c12073c6 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -2,7 +2,7 @@
     "description": "JSON file to be used to parse Xe documentation",
     "name": "Tests for Xe Driver",
     "drivers": [ "xe" ],
-    "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c" ],
+    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c", "intel_hwmon.c" ],
     "fields": {
         "Run type": {
             "_properties_": {
-- 
2.44.0

