Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C535CD98DE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B8710EC4A;
	Thu, 18 Jun 2026 06:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6vOjBU9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FCB10EC4A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764081; x=1813300081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5KUbiK5+sYvgzRFN3+xEputeB3nJAa2zL+cqPlaybng=;
 b=T6vOjBU9tRriZi6I+6NR27luauCiGplk69dZQLz398qfVMGwtauYDKzN
 NiCFmo2DMAXCA7IiGwKrcaodQqA/hpnR46/EiTVXQcGczHQylXNUfG+p/
 ZM2sVwdOFayPNKZ2WHKOdRdORm/Eg2oIvmJzhmS3bQqU9xKhTyRAl+QR6
 WQMslVzpLyQp0lpLZ1GurghdSkPGKFZjSkJtg1EvlreQl/v9MI182J2CK
 GKS28RjkzzxK884FR9gyu0XS9MZy3MtU0zYxQQqdbzRW4sN8t7vZ7egbs
 MS9Ppoz0pZTb4eUjxttSqFTnm1JN6NBHHDSzzLeIenv9C+u5Wq9gTVcL2 g==;
X-CSE-ConnectionGUID: uwhEt9rCQ/md4UzFJDAl5w==
X-CSE-MsgGUID: kKRH62dYTAW8eNhmd0m0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82358321"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82358321"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:28:01 -0700
X-CSE-ConnectionGUID: fXr6cz78SpSVrEoBf2Cs0w==
X-CSE-MsgGUID: IefAGZTSTa6L5B/j3assPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="253381031"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:28:00 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v10 2/7] tests/intel/kms_pm_dc: Replace require with
 proper assertion
Date: Thu, 18 Jun 2026 11:57:44 +0530
Message-ID: <20260618062749.2789015-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618062749.2789015-1-jeevan.b@intel.com>
References: <20260618062749.2789015-1-jeevan.b@intel.com>
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

The DC3CO video playback simulation test was incorrectly using require at
the end to check if DC3CO state was entered. This causes the test to be
marked as SKIP instead of FAIL when DC3CO doesn't work properly, hiding
real issues. So changing the call from require to assert.

Fixes: b89efa8048e58 ("tests/i915/i915_pm_dc: Check dc3co count to skip the test")
Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 4e8720c6e..73607e764 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -319,8 +319,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 		usleep(delay);
 	}
 
-	igt_require_f(igt_dc_state_wait_entry(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO,
-					      dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
+	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
 static void setup_dc3co(data_t *data)
-- 
2.43.0

