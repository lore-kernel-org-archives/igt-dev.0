Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330BBC5473D
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6E010E3B3;
	Tue, 27 Aug 2024 16:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxJcdMdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD0810E3B0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724777696; x=1756313696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LQQSXTNeVnmCNb/Mc0XqWMaXY8/d7Fvid+kizd6bauU=;
 b=WxJcdMdFnIFgu0CkgDp/G1mZh1dPBA6CGFB8bp/xIiRC4bwe32wnOegb
 pu8aTSFYbCLzIc3Ley7IDfjEu/id+7RBuFAmyau7CIvAIwoMftntoDqq6
 fHNtuJHODVjRzzQs6SVlexaxIjs9frV9qXZm7bdAYIRHP/DnyRKveoEht
 khSRaFVNyXFwew+n8a742o2v9zTDt9zaAaCU9fV9SZR5HsuKbueY3dU1T
 s92lalCkJP4ZEX1WqJCsosVX11bieKRaPpm2X01lIF079G24Fv/gQvreY
 DVDZvV1ywK1FLkca28c+GWrpyer8QEYeh7LwkpleKCGCgbKtdxK7MhBis w==;
X-CSE-ConnectionGUID: HjltIQOdSF2kUVHa9/YJcg==
X-CSE-MsgGUID: rwmMVS5FSsGg2yLVrRedRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45787329"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45787329"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:56 -0700
X-CSE-ConnectionGUID: KMKXiV6VTbaZeBlHGqIuIQ==
X-CSE-MsgGUID: DvNYIS3qTJez9u7e755Lzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63640411"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 01/10] tests/intel/xe_drm_fdinfo: Extend mercy to the
 upper end
Date: Tue, 27 Aug 2024 09:54:40 -0700
Message-ID: <20240827165449.1706784-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827165449.1706784-1-lucas.demarchi@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
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

