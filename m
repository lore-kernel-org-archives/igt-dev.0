Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B36C54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC6E10F145;
	Tue, 12 Mar 2024 14:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1hTWOBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD03710F145
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710253072; x=1741789072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sUB3klp5wtLKhwqLGCrMpwSb94J2mK04O8xme4uIVec=;
 b=W1hTWOBmQWD9VB9I17Krrhc4tSLR1gAv0KO5ripX1eRc5tQX2TGoxUA5
 NvCCklJXN8uqEhB5Jjwt8s7F6P+vDNCRzi0xJ2EoZqeXbHyva881TnpAg
 CcmWo5ELvmG0l/zgS4SVUq/y6afdrxI0IP09PXDDMj8J6Zdavsfv4EubQ
 eBGE5cBtTsOS1UHsWkIkC7k6lZufbfOh/yyBUFBxB6Z11ydDBfxQHSpPB
 fE5FizdzMw0qXZNn1HIpvNhl74WBsoKCgO7hPKr5fUHGJqqf1k+p1IZy9
 AblA57/+u4XduRQV+ZC5NKzwrxV0KQNe0lcrj5LIvu791CAlHFRvnPyhL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7909599"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7909599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11459586"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:17:50 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Subject: [PATCH i-g-t v3 22/25] tests/intel: Add more tests to Performance
 subcategory
Date: Tue, 12 Mar 2024 14:14:16 +0000
Message-Id: <20240312141419.1277931-23-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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

Tag tests/intel/perf.c & tests/intel/perf_pmu.c as performance.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/perf.c     | 1 +
 tests/intel/perf_pmu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index e5d3fbd0e..fdfb75603 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -52,6 +52,7 @@
  * Test category: Perf
  * Functionality: oa
  * Sub-category: Performance
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: blocking
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 718a3ed37..b80273a56 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -55,6 +55,7 @@
  * Feature: i915 pmu perf interface, pmu
  * Test category: Perf
  * Sub-category: Performance
+ * Category: Desktop client
  * Functionality: pmu
  * Run type: FULL
  *
-- 
2.34.1

