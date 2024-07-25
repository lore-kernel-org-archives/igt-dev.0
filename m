Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9164CC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 14:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195710E155;
	Thu, 25 Jul 2024 14:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rq5NeHIT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF45010E155
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 14:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721916220; x=1753452220;
 h=message-id:date:mime-version:from:subject:to:
 content-transfer-encoding;
 bh=gMcraiPPiBFM811qQDmEebBs9tyrw7TfLUCFYQfL3pk=;
 b=Rq5NeHITF54c0X5qGQKHho0Q8uILed27KSn53o1X6zpkKa/MSKHSFUve
 teC865a9YF0e5yZNnH0Tzx23x0q1VIE8kmr9vMTg4gFA9lbaR/BhdONGd
 qhy+5qMqn/OQAqLpBRAUPYLDspC5XENwL9uILSBDVGJseneeOEaIvy9mV
 nI0WpB/CjjiKRjIH2yykxsovLh2CzN2v2ji40yVIldogc+ptlSXkExJn5
 shoIiHo5OwABhLgPwCKpZoLRz+PM7df6ZsCzumF7tp23WCUn7jFiqApeX
 pKcL2rHUPmCYe5wJ0UmrBjoMBZp3zbsuEwB1ZGmj6McguRPt3zNVwm3SW A==;
X-CSE-ConnectionGUID: 5LsAxva+Q0eO9s8T2W18QQ==
X-CSE-MsgGUID: Kz0qxuSoSdCqyh+ECQuAwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19795232"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19795232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:03:24 -0700
X-CSE-ConnectionGUID: WRlSc5rLQZK8l+ZDd1lxVQ==
X-CSE-MsgGUID: +O+5wJJeRrKTOYOJzbaMkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="90383364"
Received: from hmotaman-mobl.amr.corp.intel.com (HELO [10.251.217.191])
 ([10.251.217.191])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:03:24 -0700
Message-ID: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
Date: Thu, 25 Jul 2024 16:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v2] lib/xe/xe_query: Do not require QUERY_OA_UNITS for
 all Xe tests
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
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

V2:
 - Cleanup headers from message body
 - Add 'lib/xe/xe_query:' to subject line

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

