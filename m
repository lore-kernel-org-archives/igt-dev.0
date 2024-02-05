Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EB0C48291
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 06:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E1010E078;
	Mon,  5 Feb 2024 06:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEhCr3kN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01D010E0E8
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 06:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707113176; x=1738649176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xRsfqwCZ445o5Hec/pSYyaU91/iHE4dTcMfub1Wu09M=;
 b=cEhCr3kNnTdE2qoT+ANrfK+EsCqrR5+0nBW5qtHJ0dH2maW00H3wO1Mh
 KgKylS+CewCvOuwpA8wZzAc5t7AJFZzn29ftUsMGnwjuTddbcqPvyl702
 SS205yJvZ3ADlusjI4wSo+j7cEHaATr1SOiDsPM2KL8ZLRSvF4kjfVAR9
 4XnmEVnvr+8tlZTI5azEMY76MCdX/lsDwNplrMyLHrtNoUxRYDqppzQvo
 2CiIZOlMw6vvjE3e9l6R5Mn4WuthjVlqia/KHvjqdipU7zP09ri2dtHHi
 T3AdCXLpVyWQUEqU9wbT4Wcx521tC/ssmko6XDUPM0oXvTnzjUl2ChppJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="435592545"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="435592545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 22:06:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5265186"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004.fm.intel.com with ESMTP; 04 Feb 2024 22:06:15 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t v2] tests/intel/xe_exec_queue_property: Remove persistence
 queue property
Date: Mon,  5 Feb 2024 11:48:08 +0530
Message-Id: <20240205061808.44032-1-tejas.upadhyay@intel.com>
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
here https://patchwork.freedesktop.org/series/129311/, to
have parity remove test support as well

V2(Priyanka):
  - Leave hole in uapi define to have parity with KMD

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm-uapi/xe_drm.h            | 1 -
 tests/intel/xe_exec_queue_property.c | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index bacdca787..0f297ec9c 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1046,7 +1046,6 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
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

