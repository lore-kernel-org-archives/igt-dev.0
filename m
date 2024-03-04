Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480CAC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E9110FFE1;
	Mon,  4 Mar 2024 11:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2lO5F86";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9934210FFE1
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551218; x=1741087218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YgsezLDUOZLyfEcACaQNzjLdwXhsDHl4FMtY3t+fnOo=;
 b=M2lO5F86Zc56rGauXAtIKBND8yWKSBS8iznf7D+WlCTThi95HYPKWPwF
 LszVoRreqE+yM5yGIlXxhy5q1GvrJoYaoa7GgWN4o/K4q6HlRBSpwYmdj
 y10wuJJ/gdOJqMenlgAxfRK+2Gup/i2qbH3LxhOeD1AbDk7JOCxOkT5Ju
 9C3QLHa1y1+n8pX/RXRBckv2DpVxDrhTqHUFrGZfwkDqf+f2gOT4hsqXp
 PSDcL05ISCE1leRfobzpBqz2dFcN4mcGGGb8XX3b4D5oNQzdjBTTVUR2S
 fu5Qn4mYENXj7whFFJWJJNaVGQjJNyt3owPSpCko6f7J77Hw1LKVk7LWQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15445181"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15445181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:20:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13624845"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:20:16 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH i-g-t 22/24] tests/intel: Add more tests to Performance
 subcategory
Date: Mon,  4 Mar 2024 11:16:15 +0000
Message-Id: <20240304111617.849785-23-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
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

