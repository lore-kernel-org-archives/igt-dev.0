Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698E7CCD18A
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051ED10E8E7;
	Wed,  8 Oct 2025 21:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpnE5nFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB2110E8DF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958295; x=1791494295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VkGUyHLynLyr9MGdW8f2CjX6V+VORhbuxvUTR6tqGq0=;
 b=GpnE5nFG9NoBwH2dINFZ4J9xlW2iEX0KrW5RsG1HFldzK36gxcfNldU2
 nj/pnEeQU28L5ZkIwfqGbGiq3+pOBN80uIwEZYLfOyGqAcWnG5/7R/Tmg
 hrtFj1PhmOwDs5qrdKfFpFCLS/vh4bMVPmaxCylBvlsNZ1dPyAJA7cp4Z
 PigqIR+ic6LmBL2IBR6hB0TZgMyDKsIXasX4n+EFNrXYKDGIY47BQwPbf
 wlvSQCVqJbzqHomXNNgQC0fXY3hpgFl5a/Xj0lISzhOG99b2LckhZBN3a
 s5GT/AW4rUVnePeElWUnZ9Wcq6cqRPKES6eSnqa0tqRPKFSZyIEdokEh4 A==;
X-CSE-ConnectionGUID: 5BJWrLAGRIaS2MiIZCrbJg==
X-CSE-MsgGUID: ZD7ccvC3Tji9ffIad7vQdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989645"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: kAkjK+gJSuyMC1VzuXm3AA==
X-CSE-MsgGUID: 3ag+hCAhRvO3eH74ZbKwlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805264"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 03/18] tests/intel/xe_oa: Rename nth_oa_unit to
 oa_unit_by_id
Date: Wed,  8 Oct 2025 14:17:50 -0700
Message-ID: <20251008211806.625154-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008211806.625154-1-ashutosh.dixit@intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
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

Rename nth_oa_unit to oa_unit_by_id. We will introduce oa_unit_by_type soon
and oa_unit_by_id fits that naming scheme.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index a028823e51..65e03b1010 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -493,7 +493,7 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
 	return hwe;
 }
 
-static struct drm_xe_oa_unit *nth_oa_unit(int fd, int n)
+static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
 {
 	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
 	struct drm_xe_oa_unit *oau;
@@ -502,7 +502,7 @@ static struct drm_xe_oa_unit *nth_oa_unit(int fd, int n)
 	poau = (u8 *)&qoa->oa_units[0];
 	for (int i = 0; i < qoa->num_oa_units; i++) {
 		oau = (struct drm_xe_oa_unit *)poau;
-		if (i == n)
+		if (oau->oa_unit_id == n)
 			return oau;
 		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
 	}
@@ -4348,7 +4348,7 @@ test_oa_unit_concurrent_oa_buffer_read(void)
 		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, child);
 
 		/* No OAM support yet */
-		if (nth_oa_unit(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
+		if (oa_unit_by_id(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
 			exit(0);
 
 		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, hwe);
@@ -5027,7 +5027,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		/* See xe_query_oa_units_new() */
 		igt_require(xe_dev->oa_units);
 		igt_require(xe_dev->oa_units->num_oa_units);
-		oau = nth_oa_unit(drm_fd, 0);
+		oau = oa_unit_by_id(drm_fd, 0);
 
 		devid = intel_get_drm_devid(drm_fd);
 		sysfs = igt_sysfs_open(drm_fd);
-- 
2.48.1

