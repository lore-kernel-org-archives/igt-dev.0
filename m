Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231B4CEACEF
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 01:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE1610EB9E;
	Sat, 15 Nov 2025 01:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giHnexG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7A810EB9E
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 01:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763169468; x=1794705468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wv4XuxL42ohUw+RBP2g5A3DCoGS20jUrpn/R6xtqxXw=;
 b=giHnexG2qfPsQNsnVtZIuh+qK7VOQEGHUBUzpzTAD1wZdIWDbZiySMK6
 MkErvAMz7KJzDPmtWtk5LmUYTZEnQT0QaUqTmDRxAI5EnZrpROgpLPjeA
 8aR1pMN1a/JTSo8n3uYSYB2gCBnZfWtnH3x+CSkQPzMDAZnmaBzZ5F/sZ
 lyiacGUFuhb3bBpzEYWosdWnTUOuEn2KNvl/ryw8ssBEW68WgxMh2cIvj
 mPJ6p7Rh2BH0ehLGiE93rieuCG8P6eETMDLOZKq5g1fWtamg7EB16nA8z
 L9FswdwJApJ/xCMbD0Sq059PxMkpszdEtBYJbWspLVV4r8egRQdXXnp8x A==;
X-CSE-ConnectionGUID: 539HCu7mRcmIhcJOlz7Mig==
X-CSE-MsgGUID: yPDYOpgcRZOpeINk9m/31w==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="67873547"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="67873547"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:17:48 -0800
X-CSE-ConnectionGUID: WgspmPC/SUqjA8eWp3iDWw==
X-CSE-MsgGUID: hSgoUvapQta5a+tgHWyFWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="220800889"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2025 17:17:48 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom()
Date: Sat, 15 Nov 2025 01:17:29 +0000
Message-ID: <20251115011730.3700391-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115011730.3700391-1-zongyao.bai@intel.com>
References: <20251115011730.3700391-1-zongyao.bai@intel.com>
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

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pat.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 59dfb6b11..54bedefbb 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1161,15 +1161,9 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	int fd;
 
 	igt_fixture {
-		uint32_t seed;
-
+		igt_srandom();
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

