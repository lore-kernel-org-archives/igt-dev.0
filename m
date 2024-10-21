Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C342D17141
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 21:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDE210E5A9;
	Mon, 21 Oct 2024 21:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ye7DMci9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060A610E5A9
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 21:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729546958; x=1761082958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dfDivrJBYS7asDcyHbPvSGVwygGMd+hctzIyMTch1dQ=;
 b=Ye7DMci95j4kNCJ4SVNDMM0l8Ty1V3Bvb+5TIpUl71s7laEwaDZA8d9M
 AaXQ0IfhQO5UG2zNKpdR3bxxv2owmgoMR/9DtXrDHgPff4B6xLJLUk4mJ
 ZbuQcptPG7L3EqXA+azL3w3tc+xV7f3+mVLyM4p2iCTFP1UDdF/lHlCG3
 0y3HiS7nb21jmsw0bXgWlRA97Mfsr/r6PLWAtfMV91L+BkM1yd/rV5Wpa
 NuWtxw3v3/RDKVMtDR/P15Ioo/f9CZeKxIIs7kivBXasEcldCG5rVOCoB
 B2TIYKmcrqApWrdi8UHaE+kpxf1S/gkFopp3H6/yB67Qp9FwlfiQvr6V3 g==;
X-CSE-ConnectionGUID: +ujG+t4sSW6a7O+RDV67IA==
X-CSE-MsgGUID: 0RNL1ATMSXGJ5q5Tru0lPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="40441037"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="40441037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:42:37 -0700
X-CSE-ConnectionGUID: amextnqLS6CtnqPUTipMfQ==
X-CSE-MsgGUID: IJC9BSu3Qn2bjcEtA2BaiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="110492708"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:42:37 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] lib/xe/oa: Don't skip if freq sysfs are not present
Date: Mon, 21 Oct 2024 14:42:25 -0700
Message-ID: <20241021214225.1101453-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Freq sysfs are not created in certain environments. In most of these cases
OA IGT's will work just fine, even when GT min/max freq's are not
known. Therefore, just print a warning if freq sysfs are not present but
don't cause tests to skip.

v2: Change igt_warn to igt_info in case CI doesn't like warn (Umesh)

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/xe_oa.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 86264230c9..4fdd0b8c95 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -571,11 +571,9 @@ xe_perf_for_fd(int drm_fd, int gt)
 	}
 
 	if (!read_sysfs(sysfs_dir_fd, path_min, &gt_min_freq) ||
-	    !read_sysfs(sysfs_dir_fd, path_max, &gt_max_freq)) {
-		igt_warn("Unable to read freqs from sysfs\n");
-		close(sysfs_dir_fd);
-		return NULL;
-	}
+	    !read_sysfs(sysfs_dir_fd, path_max, &gt_max_freq))
+		igt_info("Unable to read freqs from sysfs\n");
+
 	close(sysfs_dir_fd);
 
 	device_id = intel_get_drm_devid(drm_fd);
-- 
2.41.0

