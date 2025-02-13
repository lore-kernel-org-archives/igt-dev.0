Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9670CC0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 15:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6C610E09D;
	Thu, 13 Feb 2025 15:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGY0MI1J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372EC10E09D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739462276; x=1770998276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qv9ymVHuZGtJ4PVGbWcEw/Rt7r2DAT+NluheyOaIz7E=;
 b=FGY0MI1JBmxs9tltTgO53S4YA6mJBwy14bYMU/Yiz6zi0lia/Wki2mi2
 pt2WVSuf5iV4uCPTzc3o41XHzmvlt8B58B03sLKs81zROrPT0tFEBZNkr
 XkiJ2ZMQlVroxuPRTkUWuqwaRwz7dwfhqCwGSca9H6+5PyGJ2GA2JEKI6
 JIGoGY4NIPTUKxWmZUv1tRlS80+wnVayzVZf4IuXRqs63hY/j9TaNWg0t
 a7NXRAmU03TL9MvpFbH79BgLMdm422bQB1p1oj588aMHfRHjhhKSC0Kzp
 I/q4Io66UmEY8GUQv+/9lH+S1wGDHquZiymzNznzpkZPa+IPnryGFdzYu A==;
X-CSE-ConnectionGUID: pnlTZ7/GS4qBB2JZRBmTpg==
X-CSE-MsgGUID: ZZTZ32ChQcq9xGJehTs4LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40432142"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40432142"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:57:56 -0800
X-CSE-ConnectionGUID: xIeZDASGRfydtBLA9w3wlQ==
X-CSE-MsgGUID: VMg7kFlORomyMAbP+X3qJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="112934261"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:57:54 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, katarzyna.piecielska@intel.com,
 jari.tahvanainen@intel.com, ramadevi.gandi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v1] tests/intel: Update sub-category of Xe power
 management tests
Date: Thu, 13 Feb 2025 21:27:40 +0530
Message-Id: <20250213155740.361646-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Change sub-category of below tests from Power management tests to below:
 * tests/intel/xe_gt_freq.c to Power DFS tests.
 * tests/intel/xe_pm.c to Power suspend-resume tests.
 * tests/intel/xe_pm_residency.c to Power RC6 residency tests.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_gt_freq.c      | 2 +-
 tests/intel/xe_pm.c           | 2 +-
 tests/intel/xe_pm_residency.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 1fb6d2b53..e97195b1e 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -7,7 +7,7 @@
  * TEST: Test Xe GT frequency request functionality
  * Category: Core
  * Mega feature: Power management
- * Sub-category: Power management tests
+ * Sub-category: Power DFS tests
  * Functionality: frequency request
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c2026474d..644680893 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -7,7 +7,7 @@
  * TEST: Check Power Management functionality
  * Category: Core
  * Mega feature: Power management
- * Sub-category: Power management tests
+ * Sub-category: Power suspend-resume tests
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index f9e96d608..f0833eb0a 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -7,7 +7,7 @@
  * TEST: Test gtidle properties
  * Category: Core
  * Mega feature: Power management
- * Sub-category: Power management tests
+ * Sub-category: Power RC6 residency tests
  * Functionality: GT C States
  * Test category: functionality test
  */
-- 
2.25.1

