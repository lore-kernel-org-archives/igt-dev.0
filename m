Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A26C5B54A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4FF10E03A;
	Wed, 28 Aug 2024 14:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFzPKPQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1B010E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724857134; x=1756393134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=haewVwic75Wp03NCM3sxyCUckIytnB99UzlznwsZ6L8=;
 b=ZFzPKPQMTro4HP8GAmImeX1eNVWb8/a26asHdDQxDE+nVgM91rq0a8/X
 /TWJw583emCU3pADnLxErvRI6FOPegFlFWcIK7A8Aw/rpZENlhcaCJdP4
 lzatTALTZPNJXGbm4/pFZtotP0V7V8OigDwZDkQ+8gFQSv6b6LjeymEWG
 ATG2VmWF6FI+DJ+3EQe7EfkFX9mibefi1U13N3gnY4CQ83+TSPmvqynNS
 5wV/JOWBFle+/lDG4zmqbpBqUZhvXPXwChjiY0o4mRpJx1ddgpnKRvvFD
 ZWKan+fSvS5GqjCkTycdSUwJXH1NnWX/9/GYUofWqgw9g+NPoFiA7jOLi Q==;
X-CSE-ConnectionGUID: q90T/OHPTx+sU8MFO5NrAQ==
X-CSE-MsgGUID: /9BkkKvOQhyCYk8CJaRftQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27159577"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="27159577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:58:54 -0700
X-CSE-ConnectionGUID: DAeBDfzFTzGc95efYwUJhg==
X-CSE-MsgGUID: JvQPF3jBQDSDTamNG5cI3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="94055923"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:58:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [CI i-g-t] tests/intel/xe_drm_fdinfo: Extend mercy to the upper end
Date: Wed, 28 Aug 2024 07:58:43 -0700
Message-ID: <20240828145843.1786261-1-lucas.demarchi@intel.com>
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

When we are processing the fdinfo of each client, the gpu time is read
first, and then later all the exec queues are accumulated. It's thus
possible that the total gpu time is smaller than the time reported in
the exec queues. A preemption in the middle of second sample would
exaggerate the problem:
				  total_cycles	      cycles
	s1: read exec queues times			*
	s1: read gpu time		|		*
	.				|		*
	.				|		*
	.				|		*
	-> xe_spin_end()		|		*
	s2: read exec queues times	|
	s2: read gpu time		|

There's nothing guaranteeing and atomic read between the gpu time and
exec_queue time in either s1 or s2. Due to the call to xe_spin_end(),
in which exec_queue tick stops and gpu tick continues, it's much more
likely delta_total_cycles > cycles. However, if there was any additional
delay between the readout in s1, it could also go the other way.

In a more realistic situation, as reported in CI:

	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 1: cycles 29223333, total_cycles 5801623069
	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 2: cycles 38974256, total_cycles 5811276365
	(xe_drm_fdinfo:1072) DEBUG: rcs: percent: 101.000000

Extend the same mercy to the upper end as we did to the lower end.
This also matches the tolerance applied on the i915 side in
tests/intel/drm_fdinfo.c:__assert_within_epsilon().

v2: Fix the commit message since the problem is actually on sample1, not
    sample2

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 4696c6495..e3a99a2dc 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -484,7 +484,7 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
 
 	if (flags & TEST_BUSY)
-		igt_assert(percent >= 95 && percent <= 100);
+		igt_assert(percent >= 95 && percent <= 105);
 	else
 		igt_assert(!percent);
 }
-- 
2.43.0

