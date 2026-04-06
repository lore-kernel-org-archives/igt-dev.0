Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECC2FB5175
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8C510E2E2;
	Mon,  6 Apr 2026 22:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECdBL6Jv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD7B10E2E2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514439; x=1807050439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6FpsW4/CPktKVKmK2hNqPKcndXF237F0h8qJBN2VF0g=;
 b=ECdBL6Jvrq92xPDGndeRytaNz7THscnCWZxyGn/CtiShCV8FhjngTfCW
 M2eXDacxZtLChLZy31JvKZE/9NT0/9RVXxv4QqCiyLCrwZWCE4/P4rGYz
 OWt5AxKDc46YWb7Dpaf7Aefyp2djhU+GcoCg4dUjgvWmK/AUDr0jyh3WO
 P+FjY7nq5oP0Gg8PHHcrnw8oHniAHw5hI9uvCutizKhrNYUtOqAzvNrHi
 C061pjS0vFJxmWB2cU61ddO720E7HQbcUkLsCp+vIlWpsNacEAlsgLv09
 cceIEutlmyYS9loPL3weK5LrfabzOjrKYet9Zw7nbVsLQvtdXYcgEVI4J Q==;
X-CSE-ConnectionGUID: BYjAQUGaRoOPjMQ9XiTSLg==
X-CSE-MsgGUID: oXcs62cVQoauBHJ/2WXv/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="99094821"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="99094821"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:27:19 -0700
X-CSE-ConnectionGUID: 2JpJVRbeTPGgM2e+/AYl+Q==
X-CSE-MsgGUID: rxzT6EQDQXmI9WOXhdXTaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="221416446"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 15:27:18 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 2/5] fixup! tests/xe: add some vm_bind pat_index tests
Date: Mon,  6 Apr 2026 22:27:00 +0000
Message-ID: <20260406222703.3217769-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406222703.3217769-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
 <20260406222703.3217769-1-zongyao.bai@intel.com>
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

