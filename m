Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93051C982E1
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4278B10E144;
	Mon, 21 Sep 2026 11:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lidMe/6L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6C010E33A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789991735; x=1821527735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HzmiOlzYxGvHP7a8DnD5VIqs9efroqf/EOnmiXjlAYM=;
 b=lidMe/6Lqno8uu3cuGt57NTPgJREOLJ6d2ePOwyPa/WIWvMLNfulonOw
 OC1g5AlI8bXCFVBTF9SUTozzeMq28HVdDcZfkG6OawdnCxi0WJbYx11Cc
 5tGdG58Ys8d+6/oyRY7ihQndJi0WEF64AxJZWwsMXh3AKfz9qbT5tZ9aJ
 Y2q/dtuXh41dtjzlLLsA0eB/paqeL4vlxnYYKuWEXb8l1LqQpeM//pyaE
 LSvzszwWjmaaXF+2DezCQ/42MsoKSywCrJUs+c3QkdzMPVwKm/0yWvj6N
 QnFG/ELxv/A+nzCtZ9A6FD1MoVlGvSaYVyD2hdY2XYayHWyhvy+HusvJO A==;
X-CSE-ConnectionGUID: ayGPWROiRBKgM9K6J4KUag==
X-CSE-MsgGUID: k1jieTanRAyo09cSAv1syQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101159056"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="101159056"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 04:55:35 -0700
X-CSE-ConnectionGUID: O5EaPe/qT1WhGHf8Vsosdg==
X-CSE-MsgGUID: UCHVjr0uTO+ev1LOxkjgkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3926855"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.76])
 by fmviesa013.fm.intel.com with ESMTP; 21 Sep 2026 04:55:34 -0700
From: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Subject: [PATCH i-g-t v6] intel-ci: Add multigpu svm to CRI Core blocklist
Date: Mon, 21 Sep 2026 17:26:10 +0530
Message-ID: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
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

Add multiGPU SVM tests to the CRI core blocklist,
as multiGPU tests require a separate test configuration.

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
---
 tests/intel-ci/xe.cri.core.blocklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
index 4172f055b..2e7779064 100644
--- a/tests/intel-ci/xe.cri.core.blocklist.txt
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -17,7 +17,7 @@ igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
 ##################################################################
 # Valid skip: multigpu runs in separate config
 ##################################################################
-igt@.*@.*multigpu.*
+igt@.*multigpu.*
 igt@xe_peer2peer@.*
 #################################################################
 # Valid skip: No render engine support on CRI
-- 
2.43.0

