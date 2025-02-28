Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DCFC19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 05:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFEE10EBFC;
	Fri, 28 Feb 2025 05:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n46gjqzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A2310EBFC
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 05:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740719298; x=1772255298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MhTIWSK1U1XiXWaQZgVfAjvd+ImrVzNVT/ctm4fqQBg=;
 b=n46gjqzXg+7jMgrIb20QJVggz8T8OEOEzgE09XIxKDVSTW8zVB8dIUQR
 0m3NoHGVlm1ffFAxFGf986gqIMJMa4KNN8cUCmq0ILx3UQcTc60rN2dZT
 C0bhTdDVdz236vdXgy4QlKup3bCsuDZFSAdpuY9B7vMMmzRblu3jUCc3z
 VPO/PbbE5pjAdkEZVLRp+ffK4YVtObr73QWlFkV/urivLSAtRZrqkcUtF
 rNGDEkoGl7tzC3Abqf/LglI3dlZiP66oHdb7aHegNuLNNPCVVqhcc2yXm
 cxvOS1la6H+OTm2wvdHONKSlxQYOR93vr7Qwt33DB8ZJPW1iNEK0F6796 Q==;
X-CSE-ConnectionGUID: 2lmn1MOsQZmGOW50b3pWzA==
X-CSE-MsgGUID: k/Ihlo5HQ8+d6OVripGMOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53048690"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="53048690"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 21:08:08 -0800
X-CSE-ConnectionGUID: fIEiUt8IRZmyCfFgBan/WA==
X-CSE-MsgGUID: zToqMktWRcyWoIuAmhi3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117905187"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 21:08:05 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, katarzyna.piecielska@intel.com,
 jari.tahvanainen@intel.com, ramadevi.gandi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v2] tests/intel: Update sub-category of Xe power
 management tests
Date: Fri, 28 Feb 2025 10:37:57 +0530
Message-Id: <20250228050757.2081043-1-karthik.poosa@intel.com>
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
 * tests/intel/xe_gt_freq.c to Frequency management tests.
 * tests/intel/xe_pm.c to Suspend-resume tests.
 * tests/intel/xe_pm_residency.c to GT C-states and idle residency tests.

v2: Modify sub-category as per review comments. (Rodrigo)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_gt_freq.c      | 2 +-
 tests/intel/xe_pm.c           | 2 +-
 tests/intel/xe_pm_residency.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 1fb6d2b53..843144ad2 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -7,7 +7,7 @@
  * TEST: Test Xe GT frequency request functionality
  * Category: Core
  * Mega feature: Power management
- * Sub-category: Power management tests
+ * Sub-category: Frequency management tests
  * Functionality: frequency request
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c2026474d..19b0d5ef7 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -7,7 +7,7 @@
  * TEST: Check Power Management functionality
  * Category: Core
  * Mega feature: Power management
- * Sub-category: Power management tests
+ * Sub-category: Suspend-resume tests
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 3432077cc..d1c25e944 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -7,7 +7,7 @@
  * TEST: Test gtidle properties
  * Category: Core
  * Mega feature: Power management
- * Sub-category: Power management tests
+ * Sub-category: GT C-states and idle residency tests
  * Functionality: GT C States
  * Test category: functionality test
  */
-- 
2.25.1

