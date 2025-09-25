Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D259CAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 11:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E661810E8DE;
	Thu, 25 Sep 2025 11:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFUPst+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8357110E8E5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758800250; x=1790336250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f9rCP2XlC9WZfs7kS6iT/VwQuoPgeFZV5xW8BB51rQc=;
 b=PFUPst+SOBosQu01Su4p102FaU3d5iTK6PXtic+lurRl4V5CiDtWqKtc
 hPdTHiB1eU2ysO4sO5HgjfA+7ph00+LbY10rJdifugPJUf8n679gTJMnv
 +TmTSt2haNjdHy3IqbRsSnrOihyHf+x6ZbWUUAIb4DZssoIKVH1TwwJnN
 /342gnmAVsSv/b276sxnNeA5Mz7+2MgipXke0EQEOeqU01l4TJfM8pL30
 ybVlQwyo7RFJg/xMzl6SRaM9cUlbJcjqTNT5vEe2QL6ILsDcepwlyqrU3
 bZ+Dd1e2j6DVMxH2xAZq8tembanT8oZB4RxhPE2v0dsu9mbGCBcI/fW7f g==;
X-CSE-ConnectionGUID: 85MPui/QQxancHUXXDZ5mQ==
X-CSE-MsgGUID: LeAzVq39Qcyas41cfwSAIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61167974"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61167974"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 04:37:29 -0700
X-CSE-ConnectionGUID: QldfgJY/S/ak/pG55jZs0A==
X-CSE-MsgGUID: qGYBGUghSC++DRCbAcEVqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="208055108"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 04:37:29 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v8 2/2] lib/intel_compute: Adjust long kernel usage for
 WMTP
Date: Thu, 25 Sep 2025 11:36:59 +0000
Message-ID: <20250925113705.414943-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925113705.414943-1-sobin.thomas@intel.com>
References: <20250925113705.414943-1-sobin.thomas@intel.com>
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

WMTP uses different shaders SIP and loop kernel and does not
require a separate long_kernel; This will make long kernel test to
be enabled or Thread group preemption tests.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/intel_compute.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 89a2ff566..ce41deeca 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2133,8 +2133,6 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 	if (threadgroup_preemption)
 		long_kernel_loop_count = TGP_long_kernel_loop_count;
-	else
-		long_kernel_loop_count = WMTP_long_kernel_loop_count;
 
 	for (int i = 0; i < entries; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
-- 
2.51.0

