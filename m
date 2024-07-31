Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A11C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 11:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F4710E442;
	Wed, 31 Jul 2024 11:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lG+XOXmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC9810E442
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722424678; x=1753960678;
 h=message-id:date:mime-version:from:subject:in-reply-to:to:
 content-transfer-encoding;
 bh=DHyTiGWqXLO4OCXfutavAzbcybEIurgiN26EyR7MtJc=;
 b=lG+XOXmJl7dhHZhE1gQ1qJFVp9VXn6LL9k1bJDS3AV1Nf8TrpwuZvouJ
 NiEa19GbS+9cbI4n70HU8cIacuEPC+8C+Tbm+aHKT/XNu0bJh5FMHJp97
 UV9FezGNQrmsbxJipWNPgQc4Boi/7QP1G9q3VqOi6NQYvgKD9RfwQhkRh
 FWG9sE3PvT0/RhZZpaJsaMa5hKd581BlFgl/vx9od9JAlUWE1lCELVkot
 qjGqkqo1DTp2u9yWgva3cpXw3yj1yupCXUIxF3dedwMdV1BCyAC2O5E6Z
 xcSpn6XktP4O7BmBvKSqXYxZOGg+ZFwgoqlest8kASBfhGG3cVMecQHVd g==;
X-CSE-ConnectionGUID: /bREmZpsQ2eknrLtNP9/9A==
X-CSE-MsgGUID: +9QfRDg2TASAgPSCUexOnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="12805252"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="12805252"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:17:57 -0700
X-CSE-ConnectionGUID: 9W53X659SYGyyGu7Am1vbg==
X-CSE-MsgGUID: UYaKkwQYQ5u5lw/ddAvQpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="85579419"
Received: from edimitro-mobl2.amr.corp.intel.com (HELO [10.251.217.241])
 ([10.251.217.241])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:17:57 -0700
Message-ID: <355010f7-e6f4-4d01-a8dd-3be387b57dcf@linux.intel.com>
Date: Wed, 31 Jul 2024 13:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v4] lib/xe/xe_query: Do not require QUERY_OA_UNITS for
 all Xe tests
Content-Language: en-US
In-Reply-To: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
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

The code currently requires the driver to support DRM_XE_DEVICE_QUERY_OA_UNITS
to run all tests while the only test that needs it is xe_oa. Removes the
requirement so that all other Xe tests can run when this single requirement is
not met.

I found it when trying to run IGT Xe tests on a recent kernel
6.9.9-200.fc40.x86_64 from Fedora 40.

V4:
 - Shorten the commit message
 - Adds back the the path prefix to the subject

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

