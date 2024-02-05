Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5942C48291
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 05:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82E711239F;
	Mon,  5 Feb 2024 05:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eResozKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F7C11239F
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 05:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707112239; x=1738648239;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A+j1EcDKhAnBxTYGmuIdHh0KRS4KLtJEgWYJMdEe5JM=;
 b=eResozKBZbaIgD0umIItlT1xlTW8N2L8o0xsSO5o6paq71HGYAHhG9FL
 5vLHoUl6DmMZbkjPN3SFY6KsBUipKmAqutVYx9xlZrmOcGbuaWB91ZZFc
 CfRIX/K5a29HnKzF/OmIzf9KfUhEAZCR9dqjCMZEJOzySYZn7r31igUEd
 enA8mY+2xdZqHWOore8JlIDJbp+wdslJjfbFsYP7KLlYKS03hcWZZ23Oh
 uhorJrZ+zDJjJ342r8d/cGdql1R/ljXfqKbjpOcHqAoE9QKJoqfyKh7hq
 6Vcu6pXnsBc9pj+tHzri+3O+Q4DzM8EFsL42mRxEMPQAd/pCRR9JEyTJI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="435590836"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="435590836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 21:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5244039"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2024 21:50:32 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t] tests/intel/xe_exec_queue_property: Remove persistence queue
 property
Date: Mon,  5 Feb 2024 11:32:25 +0530
Message-Id: <20240205060225.35672-1-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm-uapi/xe_drm.h            | 9 ++++-----
 tests/intel/xe_exec_queue_property.c | 8 --------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index bacdca787..1917e4c50 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1046,11 +1046,10 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		4
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		5
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	6
 /* Monitor 128KB contiguous region with 4K sub-granularity */
 #define     DRM_XE_ACC_GRANULARITY_128K				0
 /* Monitor 2MB contiguous region with 64KB sub-granularity */
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

