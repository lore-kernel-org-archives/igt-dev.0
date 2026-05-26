Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98590CD5BD0
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 22:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA710E639;
	Tue, 26 May 2026 22:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/W/RGgk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845F910E639
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 22:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779835022; x=1811371022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6FpsW4/CPktKVKmK2hNqPKcndXF237F0h8qJBN2VF0g=;
 b=g/W/RGgkphOqV9hOAlnIlRbD87duYEcdFhZ77No33WzZYGJaPPYFDvim
 VlhNtgrbimr7CbD+UT3ZR/yHURCUok8Zao4MaChwRKn+z1Ta4L5Uo5pd2
 8PVm64Whg5ce4Tu9ic2pGwsY75qIk/qtFkNfIUaTIwLalCSsYXS9jrNta
 QjMULFyCbTDb++WswPB0g47mutWJlXuSCFIC6IDx9Pz4rysuum/LXXow9
 gmXzEySV9Ened6j6+5AmQgLWL1K7Ek87FytAhVZrOlryKsZXhWRKruzJu
 6Zi9mX+PIrQKPj8IYv9ftlO/fxFRPFVYb7WL1rj37QpwreNZQMfiQ3cCH g==;
X-CSE-ConnectionGUID: gZc4AnjATaeHLzqBUHx5Xg==
X-CSE-MsgGUID: GKqwAFcnSTmi5/60NCNKBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98236842"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="98236842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 15:37:01 -0700
X-CSE-ConnectionGUID: rmNLBV4WQjWV6EXmOwBPPg==
X-CSE-MsgGUID: ojoAeenPQYaLdZ4Cv1/Shg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="241892859"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa008.jf.intel.com with ESMTP; 26 May 2026 15:37:00 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, x.wang@intel.com, Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v2 2/3] tests/intel/xe_pat: drop redundant manual srand
 initialization
Date: Tue, 26 May 2026 22:36:53 +0000
Message-ID: <20260526223655.81924-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526223655.81924-1-zongyao.bai@intel.com>
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
 <20260526223655.81924-1-zongyao.bai@intel.com>
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

Remove manual seed initialization and srand() call from igt_fixture().
The IGT framework already handles random seed initialization via igt_srandom()

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pat.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index e53e08877..79f9a87aa 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -2213,15 +2213,8 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	int fd;
 
 	igt_fixture() {
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

