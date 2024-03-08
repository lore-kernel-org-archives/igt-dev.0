Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E13FC54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96F4113748;
	Fri,  8 Mar 2024 08:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCtIW1Ga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B74E113748
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887244; x=1741423244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sUB3klp5wtLKhwqLGCrMpwSb94J2mK04O8xme4uIVec=;
 b=fCtIW1Gax310tpaqBnbNweozmUq22mpU1EfTbIRsBwz6PP3X91rH8oVt
 kseQ9KCgLBXEiUExesN/5yt71YKae7Hr+GaEjuU50vV/6YZYEiM9t2vBv
 lZe/vP+BkevA2lGqcXbn7cBPO/cn+qGu89XDi3xGis+It6otwOXwfb/Gd
 TGkKRBanMlMWJag7il8/HCL/pFcvQuYYA2t5knIqCNOdPyiJ6o91lm6d+
 /F5m+j6FVGkJXsBWn/xONXLSxukaf9U22KzSU82BvZnQw/AASI2zcBU1W
 8+XJIeurzBSt8rGyKj3imATKvpD13NHnTEDDbhTDkcz6gJPU4Ehh0iHBU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4767438"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4767438"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10411617"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:40:42 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Subject: [PATCH i-g-t v2 22/25] tests/intel: Add more tests to Performance
 subcategory
Date: Fri,  8 Mar 2024 08:36:54 +0000
Message-Id: <20240308083657.1092049-23-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

