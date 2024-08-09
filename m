Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABA4C52D7D
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 12:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D90410E900;
	Fri,  9 Aug 2024 12:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7Z12bNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B0A10E900
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723207199; x=1754743199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gA4DCOF9hFkUnClPSdVCY+fMkxNlSOTft2Wyu/WopMU=;
 b=n7Z12bNbGY5IdT4Qp5CH8hHaLpurPm3N9YSQVuEMJEPZiCxhbn0LhZ/p
 J/kRHoWvdD8W7+KU9wwAWTokIA/zMUwQ0kqP2Uh7pGEpna5hKWrA8EUIP
 XOgQ8lOR34slXEGnNDyszJkDccVmadXISubNciCAQmg1cJhsv8bC1ee9C
 8lWlBt1t+oN8WZKEJ6YC96V/FxRSpdbCnuXVCmekRIjtTHjYoTdTcaQVv
 rRZNY8K/GMwCUfkSyae4G3d878SgklGAQSBFm9RDb5HJRnt7359ivHOkI
 VlT7ECoERcbP6ejh0T4buq8sSE15ui4Q7BGq3/yDMMRq4N1Z6muFGDkO7 g==;
X-CSE-ConnectionGUID: jOR6crA8RA+Zk06bijtj7A==
X-CSE-MsgGUID: PjcVteV3QLmj8cjYUs0k4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32525510"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="32525510"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:39:59 -0700
X-CSE-ConnectionGUID: +tzZxkG7RmelLMuKOz4k9A==
X-CSE-MsgGUID: U17jPPFSTZSCQupoxMPtuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57761606"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.4])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:39:55 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 14/14] tests/xe_live_ktest: Add xe_eudebug live test
Date: Fri,  9 Aug 2024 14:38:13 +0200
Message-Id: <20240809123813.109365-15-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809123813.109365-1-christoph.manszewski@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
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

xe_eudebug introduces a dedicated kunit test to the live test module.
Add it to the list of live tests to be executed.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_live_ktest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index 4376d5df7..50af97ecc 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -30,6 +30,11 @@
  * Description:
  *	Kernel dynamic selftests to check mocs configuration.
  * Functionality: mocs configuration
+ *
+ * SUBTEST: xe_eudebug
+ * Description:
+ *	Kernel dynamic selftests to check eudebug functionality.
+ * Functionality: eudebug kunit
  */
 
 static const char *live_tests[] = {
@@ -37,6 +42,7 @@ static const char *live_tests[] = {
 	"xe_dma_buf",
 	"xe_migrate",
 	"xe_mocs",
+	"xe_eudebug",
 };
 
 igt_main
-- 
2.34.1

