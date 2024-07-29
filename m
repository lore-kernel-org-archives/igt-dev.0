Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0383C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 05:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7079810E05E;
	Mon, 29 Jul 2024 05:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzShE0Jr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EC710E05E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 05:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722230744; x=1753766744;
 h=message-id:date:mime-version:from:subject:in-reply-to:to:
 cc:content-transfer-encoding;
 bh=nsgouotkzYCncpjXkaI0Jjwbl43zOhi1DniEYmUDjQs=;
 b=fzShE0Jr10QWoVtX/lA3vBzq2sFrppSmfb52EBvketF+4ba/7c8FvyiZ
 mW2LLc5DONNGnbWdZuTYGOBGhsWYBu6qTTh00XQxhntxmzrH2MyYutl37
 v3JsZyMZ/tcG1kUTC1fZRlGtPC1esGHGF5BFkCgMvfXg32NY2GFkevxVP
 RZJrOiTW6ZWJL0GwKJuVcXFf/yKDvEO5C+kHjCbkuQAeJeSKCiGew7LpE
 uGHQStPZwoVyugZ4b7QQTyFGJ7zlIFzVSKsA5s+2FujVx6OFndOo1GzNp
 HeUjoe3CnoTHOOu2iPthoSpVbfuciq87DpXXCvZhGRuCTV+kaK3KozoVk w==;
X-CSE-ConnectionGUID: A8tZ5znbQjqqaVopHD9jug==
X-CSE-MsgGUID: rp0w4QpBQ/6gZJkkxOHkuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="31370389"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="31370389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2024 22:25:43 -0700
X-CSE-ConnectionGUID: IhhR/QeySzCccH3dfMUlLw==
X-CSE-MsgGUID: 1+wCjpUUSPC8DBRuOXtVjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="58695138"
Received: from hyeongju-mobl2.ger.corp.intel.com (HELO [10.251.217.184])
 ([10.251.217.184])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2024 22:25:42 -0700
Message-ID: <ecedfd14-32ac-4ad8-b336-46f98b02b1e3@linux.intel.com>
Date: Mon, 29 Jul 2024 07:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v3] Do not require QUERY_OA_UNITS for all Xe tests
Content-Language: en-US
In-Reply-To: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
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

V3:
 - Update comment syntax and shorten comments
 - Update comment content to describe from kernel version perspective only
 - Update test to make '!= 0' implicit

V2:
 - Cleanup headers from message body
 - Add 'lib/xe/xe_query:' to subject line

Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>
---
 lib/xe/xe_query.c   | 4 +++-
 tests/intel/xe_oa.c | 6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 84eaaac96..8694fa3f9 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -124,7 +124,9 @@ static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
 		.data = 0,
 	};
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	/* Support older kernels where this uapi is not yet available */
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
+		return NULL;
 
 	oa_units = malloc(query.size);
 	igt_assert(oa_units);
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ff2218300..1f82dce06 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4503,6 +4503,7 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe = NULL;
+	struct xe_device *xe_dev;
 
 	igt_fixture {
 		struct stat sb;
@@ -4527,7 +4528,10 @@ igt_main
 		igt_assert_eq(drm_fd, -1);
 
 		drm_fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(drm_fd);
+		xe_dev = xe_device_get(drm_fd);
+
+		/* See xe_query_oa_units_new() */
+		igt_require(xe_dev->oa_units);
 
 		devid = intel_get_drm_devid(drm_fd);
 		sysfs = igt_sysfs_open(drm_fd);
-- 
2.34.1

