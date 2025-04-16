Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B04C369C4
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 16:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F43B10E296;
	Wed, 16 Apr 2025 16:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCEy9BG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C87410E972
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744821103; x=1776357103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TkAyQlup/KPYUNrDI5wLFJbLd3JP2eoWpUIfuHQtjs8=;
 b=gCEy9BG56M6pV3ghs7iYNgaYrZG/257XsUdPoBKl6r4kNahZHEnb8yyQ
 LNLrDo/YBx+39gkqFSVxhoj7UdZTHyZj5wYl7MjgYRy9CBr6ZmPkc+2Kh
 seqHGV74MoHgiNKr8N1YOrTaS+GTvboAsm4ki1B9yH25fjiFgjSgCAWR+
 It0Nr3DY+CaYBIYx9huhXCGB103OrtiGeFNOcD3qGP8rd1CUZvlTz2Xxu
 leG1cq/tfpX2t/cVWWS5dT9oXsczvdaFT2xqJzjxbMyaS4zatkHWQuetC
 8CSxHJ6qRWS1Mi2a78WBp1yfSntFgCcEx3kEvZwov4XHErRcWImPdgtix w==;
X-CSE-ConnectionGUID: IjxSQEzLRVmUmJUjx3Pszg==
X-CSE-MsgGUID: FPfjuZ3SR++Mc5A260oSLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45515119"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="45515119"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 09:31:43 -0700
X-CSE-ConnectionGUID: gTYEvGbESzeX+PB85IhLHw==
X-CSE-MsgGUID: c2NFKvoOQN+/7p4X+5sJkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130380218"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2025 09:31:42 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t 3/3] benchmarks/gem_wsim: replace div64_u64_round_up()
 with DIV_ROUND_UP
Date: Wed, 16 Apr 2025 16:30:53 +0000
Message-Id: <20250416163053.117425-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416163053.117425-1-shuicheng.lin@intel.com>
References: <20250416163053.117425-1-shuicheng.lin@intel.com>
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

DIV_ROUND_UP is defined in igt_aux.h with the same function as
div64_u64_round_up().

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 benchmarks/gem_wsim.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 7a6b10028..d791ea584 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -344,11 +344,6 @@ static int read_timestamp_frequency(int i915)
 	return value;
 }
 
-static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
-{
-	return (x + y - 1) / y;
-}
-
 static uint64_t ns_to_ctx_ticks(uint64_t ns)
 {
 	static long f;
@@ -359,7 +354,7 @@ static uint64_t ns_to_ctx_ticks(uint64_t ns)
 			f = 12500000; /* icl!!! are you feeling alright? */
 	}
 
-	return div64_u64_round_up(ns * f, NSEC_PER_SEC);
+	return DIV_ROUND_UP(ns * f, NSEC_PER_SEC);
 }
 
 #define MI_STORE_DWORD_INDEX	MI_INSTR(0x21, 1)
-- 
2.25.1

