Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5852CCF648B
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 23:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E815110E27B;
	Wed, 19 Nov 2025 23:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTiBriUY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1993310E27D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 23:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763594343; x=1795130343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8lJfdctbB41n3POnS0VwOfRl8yQBjzFjf+46PyVDhUA=;
 b=HTiBriUYaVcDY4je26SfiWYjhpf/Zai7YROYMx/Jb8o0Pu7pw0Z8WsD0
 YMd1RiZTKhabQEJuX72lOb3ttTkEvcfTrg1LNNcqZEwCP+JcfPnRBCs6I
 c2v/CQbimxGwROezVpqbNkaN+AAF/5HVvucyTiPPlDLPRYDUKn74xgFHW
 3WVYAIHKjsGpGEli22VHT4it6V64mOxHz733jhRekBuDpEBSgMq6AyAbG
 ZjKYf6hTvII+iJHNErNJk+vv4tzpwCrENEVQm5yNSEiSvdml9AAPmQhU7
 14KcY9nWQcrjD5MmVqBdTXz3G/H7T5XPm38/dtxz6rLsIDDCadr3KVB0U g==;
X-CSE-ConnectionGUID: i0Gy69JkSjO8aXL0SVfYlw==
X-CSE-MsgGUID: EuPBr5FdTEK/crzq+BUo/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68257794"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="68257794"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 15:19:03 -0800
X-CSE-ConnectionGUID: yLXF/bj5RbmxHZnk0w6g8g==
X-CSE-MsgGUID: LrPse9oqSha3p/hy1pIuOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="195682870"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa004.jf.intel.com with ESMTP; 19 Nov 2025 15:19:02 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xin Wang <x.wang@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom()
Date: Wed, 19 Nov 2025 23:18:59 +0000
Message-ID: <20251119231900.3797119-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119231900.3797119-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
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

For consistency with the igt framework, use igt_srandom() to generate
random seed instead of srand().

v2:
  In the IGT framework, each running test case is initialized through
  common_init(), which has called igt_srandom(), additional calls are
  not needed. (Kamil)

Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pat.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 59dfb6b11..4294af71c 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1161,15 +1161,8 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	int fd;
 
 	igt_fixture {
-		uint32_t seed;
-
 		fd = drm_open_driver(DRIVER_XE);
 		dev_id = intel_get_drm_devid(fd);
-
-		seed = time(NULL);
-		srand(seed);
-		igt_debug("seed: %d\n", seed);
-
 		xe_device_get(fd);
 	}
 
-- 
2.43.0

