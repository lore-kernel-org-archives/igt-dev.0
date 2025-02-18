Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B405EC021AD
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F30B10E769;
	Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3Ou6Vik";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0927310E766
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910497; x=1771446497;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oQcP2riZoNfP9P1XHBhIV50esKyHZURskJcDRdEmcDk=;
 b=I3Ou6Vik2di1H78maRSh7axJQty7qmPYsXCk7N+xWrW7uUBlslTwtFpH
 GLGfb+D5hm3/cnrWSDv5WsP9hSk6OU47Grg67w49Ci5H5Euomdd/nzJkA
 hj/SlQyWZW02fJiWMaIM3co6uTHaZlIr02z4MlLuzz+u6Z53VcQiVkIbn
 0Cws/4l58dLhTs4V6EgP9b0UBB2fVNnCY0Bjpz4Kt5M3FDsRM95xKfsOW
 g/jiTpItkubOVU8EpRGkDUB34vXL30jMdUErvkK3UgG9OAzB+rOX/dIJe
 BmCDxQxpuvZBEfsODF+R9bH7uuyos0J7rkYaZM7mUr6xCNNY2RSjuXVHh w==;
X-CSE-ConnectionGUID: JEP/E8rqSk6c4C/OCWqh2Q==
X-CSE-MsgGUID: GIDY+8wqTJaHRx3x0kUPrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545846"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: hFqeAAhYSsyvJ7GFmHgJng==
X-CSE-MsgGUID: tx5PZFKjTOKvs/Q9q/ngrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367474"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:16 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 14/14] tests/intel/xe_oa: Try largest buffer size
 and Xe1
Date: Tue, 18 Feb 2025 12:28:12 -0800
Message-Id: <20250218202812.1679653-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
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

Patch just for CI and not for merging

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 22ff3f20d..148918181 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4692,9 +4692,6 @@ igt_main
 		devid = intel_get_drm_devid(drm_fd);
 		sysfs = igt_sysfs_open(drm_fd);
 
-		/* Currently only run on Xe2+ */
-		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
-
 		igt_require(init_sys_info());
 
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
@@ -4734,7 +4731,7 @@ igt_main
 	 * Description: Test various OA buffer sizes
 	 */
 	igt_subtest_with_dynamic("buffer-size") {
-		long k = random() % num_buf_sizes;
+		long k = num_buf_sizes - 1;
 
 		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
 			test_non_zero_reason(hwe, buf_sizes[k].size);
-- 
2.34.1

