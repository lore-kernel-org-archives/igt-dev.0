Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938A3ED7B95
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6DD10E58E;
	Tue, 14 Apr 2026 09:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5Ttz5ZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB9D10E58E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776160337; x=1807696337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YA9WMxwREM6Abj7WiRHgf1KIcZmwWqnck3KCEv+bHjg=;
 b=T5Ttz5ZFjfAdAsxSeG4JmkzTCdf0nXk4Ds6qGfaVaOA49UMVnhD/pefB
 QAywYUZTfLT6M6O9RoOW/tSMrhRQjGqFKAC1RnVPMXXM+UaiOMxEnGU61
 s1eXS6KlFf6SXIZI3MNBtjnP8OMwkOzZOn/FRfywhbzh0GuyPTDNkNbJf
 QzV3ttoS8bJPRCvahVZXBhSlN5w2o20JegeS0/chVJ8PVs8lSlOPnI3PG
 tUCka/aSVxi3FER4ydrKS/yaTx7BcNTKc239Fpr/3I0QeroBkKzk4i6yw
 1TFN1hSerzhuuu/aAcQbfmkk7rMoJNbwF9R9VfU58tvleWdb1PvtlHi1l w==;
X-CSE-ConnectionGUID: KiDKdXjDSQyjd5VMBrp/rQ==
X-CSE-MsgGUID: Nbx+M/rwRAuSbt64VDxrrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77293504"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77293504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:52:16 -0700
X-CSE-ConnectionGUID: NLmW3u0GSDa9ALfgdu5efQ==
X-CSE-MsgGUID: NxxV9eOZSyCD4NVnpd6tuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234979974"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:52:15 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 1/4] tests/intel/kms_pm_dc: Replace require with
 proper assertion
Date: Tue, 14 Apr 2026 15:20:11 +0530
Message-ID: <20260414095014.55950-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414095014.55950-1-jeevan.b@intel.com>
References: <20260414095014.55950-1-jeevan.b@intel.com>
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
index 8138933d4..f1380ea69 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -312,8 +312,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 		usleep(delay);
 	}
 
-	igt_require_f(igt_dc_state_wait_entry(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO,
-					      dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
+	check_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
 static void setup_dc3co(data_t *data)
-- 
2.43.0

