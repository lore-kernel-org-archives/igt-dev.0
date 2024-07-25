Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661DEC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 09:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2822810E08B;
	Thu, 25 Jul 2024 09:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUuafD7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973F610E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721900201; x=1753436201;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=FkBdQu+tr5WKiaS6J/WU5gxPPvNZlpUDDbRtKkjHRu8=;
 b=VUuafD7RN2LYMVb+d6RHvvUnKU16zPsiNgyfw4QE9/M9Gy3lr08U8WfE
 IJSPKazN75L4qH2hf9MDt3HFAodCUZiYET550lRLrMS+2KVQZ6YVvz+M0
 VDYou3Jizo5mJh5vsRgGB0ri+K3ioP/uwycLK3qc8PZ6T5zB6xDO6nA1D
 i4PZYVvd1RBOxLld0ygAJlZ0W4kOyvKKH2pe6tRogOSaISUuQBmGxYRTO
 28vruYSmx0SuuaI3KerVOxBcYF0RS9oid9Tz2msxh5nYK8Td1YI9f7UZT
 pbyAsC8AU+p4i7Jz9SfAXq1EVZTW4rXDR7yKa2AMQL4/NoRiHPQbYigny A==;
X-CSE-ConnectionGUID: F3zjtnczTbqn/hJF+cr9FQ==
X-CSE-MsgGUID: yRm0gMoHSiSG83sdXJX1UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19500166"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208,223";a="19500166"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 02:36:41 -0700
X-CSE-ConnectionGUID: nrbEE4FXT72uC2ikXcIxZw==
X-CSE-MsgGUID: 6+6dqcZATdGh5HSAffKBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208,223";a="52796319"
Received: from mehtah-mobl2.gar.corp.intel.com (HELO [10.251.217.104])
 ([10.251.217.104])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 02:36:40 -0700
Message-ID: <f79e0043-2a5b-4b35-8533-86b3d6b08b84@linux.intel.com>
Date: Thu, 25 Jul 2024 11:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] Do not require QUERY_OA_UNITS for all Xe tests
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, ashutosh.dixit@intel.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

From 493a989dd9ba79a0daa9e88311b1128ef470a9fe Mon Sep 17 00:00:00 2001
From: Peter Senna Tschudin <peter.senna@intel.com>
Date: Thu, 25 Jul 2024 08:24:00 +0200
Subject: [PATCH i-g-t] Do not require QUERY_OA_UNITS for all Xe tests

Changes xe_query_oa_units_new() to return NULL instead of aborting
due to assertion failure when querying for DRM_XE_DEVICE_QUERY_OA_UNITS.

It adds a skip to xe_oa.c to make sure it will not try to run the tests if the
query has failed before.

The motivation is as follows:
 - The only test that requires oa_units is tests/intel/xe_oa.c, however current
   code will prevent all Xe tests from running if OA_UNITS is not supported
 - Before this patch, trying to run IGT on the Xe module from Fedora 40
   (6.9.9-200.fc40.x86_64) fails
 - After this patch, we can run some tests, such as xe_exec_basic
   successfully

Here is an example of the impact of this patch:
 1. Use Fedora 40 with the following kernel command line arguments:
    "xe.force_probe=* i915.force_probe=!* modprobe.blacklist=i915,ast,snd_hda_intel,xe"

 2. Running IGT without this patch will fail:
     $ sudo ./build/tests/xe_exec_basic
     $ echo $?
     98

 3. Running after fix applied will succeed:
    sudo ./build/tests/xe_exec_basic
     $ sudo ./build/tests/xe_exec_basic
     $ echo $?
     0

Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>
---
 lib/xe/xe_query.c   | 6 +++++-
 tests/intel/xe_oa.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 84eaaac96..f0643e1bc 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -124,7 +124,11 @@ static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
 		.data = 0,
 	};
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	/**
+	 * Only tests/intel/xe_oa.c needs OA_UNITS
+	 */
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) != 0)
+		return NULL;
 
 	oa_units = malloc(query.size);
 	igt_assert(oa_units);
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ff2218300..dd02f8608 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4503,6 +4503,7 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe = NULL;
+	struct xe_device *xe_dev;
 
 	igt_fixture {
 		struct stat sb;
@@ -4527,7 +4528,13 @@ igt_main
 		igt_assert_eq(drm_fd, -1);
 
 		drm_fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(drm_fd);
+		xe_dev = xe_device_get(drm_fd);
+
+		/**
+		 * This test needs OA_UNITS to run, see xe_query_oa_units_new()
+		 * on lib/xe/xe_query.c
+		 */
+		igt_require(xe_dev->oa_units);
 
 		devid = intel_get_drm_devid(drm_fd);
 		sysfs = igt_sysfs_open(drm_fd);
-- 
2.34.1

