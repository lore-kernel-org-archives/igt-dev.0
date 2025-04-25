Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D405BC369D1
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 07:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890F310E8A1;
	Fri, 25 Apr 2025 07:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXScmQwA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EBF10E8A1
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 07:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745565684; x=1777101684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okpbZ7ogCSLJZSeT6jmFaYl4ZLXutdlN5F02L3Z8Xp8=;
 b=EXScmQwANkrS7zRAw4b44dB7CyPidBzLxIjn7lYpvduWdIUwcYC+tsOP
 VpxWT4dSAQQJczhS24YWvnMDRPiHBs3IoGHJmFlA0Io2173SMppt3KOIF
 GyDqh+SBYsNkaciQxDxW6J1Kqmto4diswaLZ7744a+A3spoyBUf70b3rY
 /CbT7PplCDmyNqaXlKC8zdOlDRcbCDOeGfC2MN9u7pnITH/UrOzdQYUU1
 b0pq+ffAsbROU02s402NU95dx0MZXXo4Ve1mIWJiRPSpqrMCTlv/yy7b5
 6U6RF33lSAab+Ale8klbUm2v9YAu5d0eh++Up47b4tGMnhxK9C1JNJ9qt A==;
X-CSE-ConnectionGUID: p4VA6u5tTv2aKdqJd6ku7g==
X-CSE-MsgGUID: 0kDq5UZdTDWANM6+da1K/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58208887"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="58208887"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 00:21:24 -0700
X-CSE-ConnectionGUID: vmnnQ0F9S5CAgCGoZLhIdA==
X-CSE-MsgGUID: +G9EMBWoRgmvuskSqK3bHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="138000192"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 00:21:24 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, kamil.konieczny@linux.intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_eu_stall: Check if
 observation_paranoid file is present
Date: Fri, 25 Apr 2025 00:21:18 -0700
Message-ID: <cfc9001ab828c4985d47db3aaa8d0aebfb4dd41e.1745565376.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <29f92b276ff8c0a246dc5d22757193bc66f27c66.1745565376.git.harish.chegondi@intel.com>
References: <29f92b276ff8c0a246dc5d22757193bc66f27c66.1745565376.git.harish.chegondi@intel.com>
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

Add a check for the presence of /proc/sys/dev/xe/observation_paranoid
file.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index b48236425..411c30871 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -39,6 +39,7 @@
 #include <fcntl.h>
 #include <poll.h>
 #include <sys/ioctl.h>
+#include <sys/stat.h>
 #include <sys/wait.h>
 
 #include "igt.h"
@@ -645,6 +646,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 {
 	int drm_fd;
 	uint32_t devid;
+	struct stat sb;
 	bool blocking_read = true;
 
 	igt_fixture {
@@ -653,6 +655,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		devid = intel_get_drm_devid(drm_fd);
 		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
 		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
+		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
 		if (output_file) {
 			output = fopen(output_file, "w");
 			igt_require(output);
-- 
2.48.1

