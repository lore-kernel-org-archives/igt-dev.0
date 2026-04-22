Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E98F5A8DE
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 11:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D766F10E9B2;
	Wed, 22 Apr 2026 11:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4aVl206";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E041E10E08C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776857274; x=1808393274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v6Gb5nriyrQSM7D2dMFqX0DILZtrfLRBOceFs7oM7tw=;
 b=d4aVl206O6OBLNOtV8aTf2UScDjUrwsK98CNyZv9lRr1XcrpZB2ViHRJ
 xrse6pI28vuhC83ZLAjgD3k7aeHkTtQOMi7DRtBfdcqJNA2e5Kyn6C2YX
 UEvgp0Si0U1J9W3VbNn1B/IKNYXyB8WEQWnz5LkRkUOKoDcCpotThJQXs
 2tXOKQr+uiOr8+NgIzvW9g1Bgk5YFRsSKwjtCaelakqTBAo8kzrOviKXG
 38Rspi2M/ILX385aKD3V4eBiRVU6HltGlRf1K++JOVpaqFll9cprjvJV1
 pxDOCb2LNMxwDxNx44nrJBEwzImlyaif+q6JTHzje/+Uahy2YuAyOgGEE Q==;
X-CSE-ConnectionGUID: ODKKR2EJSIy1qSku+UxPKw==
X-CSE-MsgGUID: Mf5VR3zxSzyzHJ6UysmV5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89275682"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89275682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 04:27:53 -0700
X-CSE-ConnectionGUID: coN7fnJMSoWj24qkknll5g==
X-CSE-MsgGUID: 7EoAQBONRGeGp7LYlxKpzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="262717347"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 04:27:51 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 raag.jadav@intel.com, jari.tahvanainen@intel.com, sk.anirban@intel.com,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com,
 himanshu.girotra@intel.com, ramadevi.gandi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_survivability: Update category and mega
 feature
Date: Wed, 22 Apr 2026 17:04:03 +0530
Message-Id: <20260422113403.843322-1-karthik.poosa@intel.com>
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

Update category and mega feature of xe_survivability same as xe_pmu for
proper tracking in internal visualization tools.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_survivability.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index e842a76ec..d5d7e048c 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -23,8 +23,8 @@
 
 /**
  * TEST: Comprehensive survivability mode testing
- * Category: Core
- * Mega feature: General Core features
+ * Category: Metrics
+ * Mega feature: Performance Monitoring Unit
  * Sub-category: Telemetry
  * Functionality: survivability mode
  * Description: Validate survivability mode functionality
-- 
2.25.1

