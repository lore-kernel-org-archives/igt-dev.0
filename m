Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B41C79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 13:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B31410E842;
	Thu, 10 Sep 2026 13:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcP9YZOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C210E182
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789046646; x=1820582646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6uRlDBaEcBYa3F4dmF6M97JrDnjMigZ8ydbyLDX4y9w=;
 b=bcP9YZOIN+DBWkJ4INBUu/A/+vGz4jg8jI8T1s48WQcxTTTU6fwsXY13
 1t+dm+cBbYEoX0v3v2OSXJxNPmYhxullylUiPYRJJNj0KuZeN5Z03ceTx
 dzE/lZJnpkPoGqsnmW6nhLVlheE/ZmdQYR9vXlEcOW8fTmsAO0+IDZIgI
 bvc8Ob//wMMPswX62PtcT+qfgPnio+ShlOXGqncHXR+JeWPCZwtjZCub6
 Oe0plvr/Q+kIe7v/hatUCSSuRiifvj0Wt8v4aO/9k0A42eWS9D5xerwOz
 D1tyS7zs28iivOMaG5XY+1tghCCcilxVJuJEq96Q+0ajzke2rErkXwDrU Q==;
X-CSE-ConnectionGUID: x7OCIWPiS4aK1WUP07mXwg==
X-CSE-MsgGUID: dS7CPSuqTuuNGO4MRnX6UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="77053994"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77053994"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 06:24:06 -0700
X-CSE-ConnectionGUID: yVPoOJ3mTsiNDtC2MzbYyg==
X-CSE-MsgGUID: U7XSHQp5Q+qJB4gO9bC8Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="269068980"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2026 06:24:05 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH] igt: xe_exec_reset: Remove RAPID_RESET_STRESS from
 mixed-engine test
Date: Thu, 10 Sep 2026 18:52:51 +0530
Message-ID: <20260910132251.1669256-1-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
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

The RAPID_RESET_STRESS flag (1 ms reset interval) is incompatible with
MIXED_ENGINE_STRESS. During resets, the KMD rejects EXEC_QUEUE_CREATE
with -EINVAL because engines are momentarily unavailable, causing near-
total submission failure (~9 successful vs ~180k failed in 2 seconds).

Remove RAPID_RESET_STRESS to allow submissions between resets, restoring
realistic mixed-engine workload coverage while keeping default 250ms GT
reset intervals.

'Fixes: fb556e8d9acc ("tests/intel/xe_exec_reset: add gt-stress-reset-mixed-engine-usage subtest")'
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 tests/intel/xe_exec_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index e12279d23..9b1687c35 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -1208,7 +1208,7 @@ int igt_main()
 		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
 		{ "reset-rapid-cycle", RAPID_RESET_STRESS },
 		{ "reset-destroy-vm-context", DESTROY_VM_CTX_STRESS },
-		{ "reset-mixed-engine-usage", MIXED_ENGINE_STRESS | RAPID_RESET_STRESS },
+		{ "reset-mixed-engine-usage", MIXED_ENGINE_STRESS },
 		{ "reset-pm-transition", PM_TRANSITION_STRESS | DESTROY_VM_CTX_STRESS },
 		{ NULL },
 	};
-- 
2.43.0

