Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9E4C02196
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 07:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3375710E1D8;
	Thu,  6 Feb 2025 07:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdSsnHfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BB810E1D8
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738827085; x=1770363085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dcemxq5jSYmPbNox0lNeequ1No7Bz8eg0G9wPc6RFKc=;
 b=XdSsnHfFwc9nqyYqCBgaNyOVVvgcsaSBgjHR1lQO1XbtBrBu1Pislzs2
 wJN+Z3HRPUfPEg3GTra9J42q/LlLkXC46AA30+WlR1+JCXij4LGy6/HdN
 qetT/vI6eDulwbghrb6lhA2E/CdKuJ0GZwxjsuSuuGW91VoLt/3wNwx35
 bBethxu2XAJoo7zR3taPAeKHjt++p7g60uQiwZJAHSh81RJ6DagRkusTi
 uz55Wjm91yuQK92eWBtGAMksa7DBvnYJgM5GQPgA/t3yuJzUw8d7Gt5qO
 BMd3J6Y8D4n0B+ACgZZ3q3XOdw6QqUu5Y9p32FmrLj+TFHXioj82WWssn g==;
X-CSE-ConnectionGUID: x/5+DG/AS7y81GORg36Yzw==
X-CSE-MsgGUID: HNKpU3COTvKoEonVBR6o5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50404227"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="50404227"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 23:31:24 -0800
X-CSE-ConnectionGUID: //FQQiypRryqyEdDvLdGdA==
X-CSE-MsgGUID: ZltBmnjBREqcey4QQbmBMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111586810"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 23:31:22 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, katarzyna.piecielska@intel.com,
 jari.tahvanainen@intel.com, ramadevi.gandi@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pm: Update the sub-category of xe_pm
 tests
Date: Thu,  6 Feb 2025 13:01:07 +0530
Message-Id: <20250206073107.93693-1-karthik.poosa@intel.com>
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

Reclassify the xe_pm tests under suspend-resume sub-category
for distinct tracking

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c2026474d..0eb16725a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -7,7 +7,7 @@
  * TEST: Check Power Management functionality
  * Category: Core
  * Mega feature: Power management
- * Sub-category: Power management tests
+ * Sub-category: Suspend-resume
  * Test category: functionality test
  */
 
-- 
2.25.1

