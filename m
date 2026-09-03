Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42DEC624DE
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 21:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3037810E535;
	Thu,  3 Sep 2026 21:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJySNhVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F326610E535
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 21:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788472162; x=1820008162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B1gDtPdbLc2zXZUEu4vwa7tWWnY6NbPCSB3mSXzYv6s=;
 b=VJySNhVtWlDiGqPfVgou83sQS+Bj8lSxFKtmuZDC84Eli88e2Bkg7Ss2
 VONi9EE7SjxFCCRy9qCELQbrFjQDu2oJ1D8DJDIzofRSawwKLSVDtaSBu
 /EVTsMKVhX7Ug0KPdX51NDw2JFMkImTMVUNFOLmj1aLPw+xar5cDXokUA
 J4hq9o9abLqeWhq9uat1163N1DywWwxyexuWgZHUzAK/uXDngatvgTcbI
 wHB8AfQObvnsQK/jFtmIMcio4DRz5jXCNDbN3RxtQOqwWFikcU6NWhSA6
 1YcgvAJKv7g1gojrlrp0KRupttfJPXbsblawy1b3o2k71HkE9aScjhNbN A==;
X-CSE-ConnectionGUID: CfW2sGSjSfKVmB6t13Xi1g==
X-CSE-MsgGUID: vtGkS4YvRAGHPCOeftoF9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89003166"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="89003166"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 14:49:21 -0700
X-CSE-ConnectionGUID: 9TSLFKpTQhmHwr61Xc+phw==
X-CSE-MsgGUID: hYxv1SQqRmKtG4GB/EPvdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="299707524"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa002.jf.intel.com with ESMTP; 03 Sep 2026 14:49:21 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel-ci: remove pxp from PTL blocklist.
Date: Thu,  3 Sep 2026 14:49:18 -0700
Message-ID: <20260903214919.1005742-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
References: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
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

We've added GSC FW with PXP support for PTL sometime back.
However, it was still in the block list so let's remove this.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel-ci/xe.ptl.core.blocklist.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 362711406..85e0c3f3c 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -82,11 +82,6 @@ igt@xe_oa@unprivileged-single-ctx-counters
 igt@xe_pm_residency@gt-c6-freeze
 igt@xe_pm_residency@toggle-gt-c6
 ##################################################################
-# Expected skip as PXP is not enabled for PTL upstream
-##################################################################
-igt@xe_pxp@.*
-igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
-##################################################################
 # survivability feature not applicable for PTL
 ##################################################################
 igt@.*survivability.*
-- 
2.43.0

