Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A42C4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 10:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6935810F3FE;
	Wed,  7 Feb 2024 10:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGKQmjvO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC31410F3FE
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301429; x=1738837429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dOhZVNn1Fr55thcqsu5eSknqUc6PZMslmnpjyiDUpzc=;
 b=DGKQmjvOQgiD3nzKUWzDxYZZLKJ1MU3Uqcn3b09e7FAr4ahqXGCkj3kI
 +iAU8go1RaCBmPwmCRRwtjS8gfU/dhg4QSB2h2/RYcsSKTr1I4ZF8T5YU
 GEh7fBXpT8TDFN2ZZhGBzfm9y26SuOmspZkit/XrdyFzIE5ctsw63nuiV
 sZYgdeNOs1GdWzEUhmBxN0bc8f9QaUz6O8psj2fDwuzDg1xf1+pVT3RiW
 4HvgZ1w/f/hWstlTjdFchmrunnqeEtYbVI2WD11xJ21Wffx5mdcFPCSB4
 uOqGZtCpdD9Anle8BcXAmZQMmLggEZ1zv+KKUN+vkwstynW5n92b/cLpg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12044213"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="12044213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5914012"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa005.fm.intel.com with ESMTP; 07 Feb 2024 02:23:45 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 i-g-t] drm-uapi/xe: remove persistence queue
Date: Wed,  7 Feb 2024 16:05:41 +0530
Message-Id: <20240207103541.634047-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

KMD has removed support setting persistence queue property
https://patchwork.freedesktop.org/series/129311/ here, to
have parity remove test as well

V3:
  - Update commit message - Kamil
  - dont change drm-uapi/xe_drm.h manually - Lucas
V2(Priyanka):
  - Leave hole in uapi define to have parity with KMD

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 53e08fb0e..4fdd4ceae 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -11,8 +11,6 @@
  * Test category: functionality test
  * SUBTEST: priority-set-property
  * Description: tests basic priority property by setting invalid values and positive values.
- * SUBTEST: persistence-set-property
- * Description: tests basic persistence property by setting positive values
  * SUBTEST: %s-property-min-max
  * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
  *
@@ -214,12 +212,6 @@ igt_main
 		igt_waitchildren();
 	}
 
-	igt_subtest("persistence-set-property") {
-		/* Tests persistence property by setting positive values. */
-		test_set_property(xe, DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE, 1, 0);
-
-	}
-
 	igt_subtest_group {
 		igt_fixture {
 			sys_fd = igt_sysfs_open(xe);
-- 
2.25.1

