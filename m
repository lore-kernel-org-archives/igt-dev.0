Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028B7CD484E
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 23:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADFF10E922;
	Mon, 11 May 2026 23:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dL14yrtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5DC10E22A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778542596; x=1810078596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6FpsW4/CPktKVKmK2hNqPKcndXF237F0h8qJBN2VF0g=;
 b=dL14yrtG1BnmzypsjYoeNv8tN9jS9uYEUKJfMZXwR1gTcqHW8X966FLM
 syt7arNVPW3E1diFjOD7z7o7CuvHM8Jh31r8ivnvqnXEwLZXJiNtO65Mg
 M+5u8lChEi5eWDD/efm1Z8qnUdewfn2KJaPytot+zvpzEWmJT1jKEC73M
 O88VIluXkqhKYPZqx3N0KC/rgr+ns+9Fg2NP21ZxWgBj+ZEsgMc3r0tsz
 5lF1qMBerpbkhEukZKAH6dvWIzKr/v/etKy9qtYkJ3sVPi4Lfpi4hCUZi
 OvZkdGvuxMJZpZr2undEwYqdKL9PF9MCKz/sNjY0tuaOSntuJtut+N9/x w==;
X-CSE-ConnectionGUID: kzVIhdpvSMKywFfe8r3lBw==
X-CSE-MsgGUID: 8uL276ODTOyCeG2zRgNp4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90027399"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90027399"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 16:36:35 -0700
X-CSE-ConnectionGUID: 8uFA+Q2hRgiAIsMfaaVnKQ==
X-CSE-MsgGUID: axe4mzqCSVqVp3kZbJpjiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="237687261"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa009.jf.intel.com with ESMTP; 11 May 2026 16:36:35 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, x.wang@intel.com, Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 2/3] tests/intel/xe_pat: drop redundant manual srand
 initialization
Date: Mon, 11 May 2026 23:36:21 +0000
Message-ID: <20260511233622.2074382-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511233622.2074382-1-zongyao.bai@intel.com>
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
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

