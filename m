Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAF4C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0544610E43B;
	Mon, 29 Jul 2024 16:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L39fXone";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EC110E43B
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269167; x=1753805167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JLf9M22ZHXXu/c6TpjXqHm058iUPRr6CfSnzlSXAKIo=;
 b=L39fXoneQb8g1rr1dLc/6vUAW8q1BLrxgnkwxCvZbVXF957MRmg4IqwS
 vCXcoJCjiFlAa4ugqImK8MCBAJUXrXpioJjy/Ll4G6PYaJyB+31e59D4O
 ybaC/lS7unsh4GX9tfTKi/8tOafHmC2p9/EE42IZxk4BSRFRbFkFfZrb0
 udUjgodTQVEjBdDfGK1ytMYyUgpCLVR3qROgd5km1RCDQhJ5p1ayckb3E
 p7FwqptIeMnMB1/cpgSU1k6yQnstHQAKq7N0a2sSMo26kzxcoCq1+SHtC
 v+4KstWHjkr2yrZ1prawgOfYeb/im0DpOHIXvh55s4vDH6fLCWGv0mRFl Q==;
X-CSE-ConnectionGUID: RqApJySkTRm81v/z9hHS0g==
X-CSE-MsgGUID: LTtqhdgYSsCy9NkK6tF+0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31428068"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31428068"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:49 -0700
X-CSE-ConnectionGUID: Z/iBgIWyRB+38PPsFeFKUQ==
X-CSE-MsgGUID: OxAGPcdiQSehVCzLrsr0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53740203"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:46 -0700
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
Subject: [PATCH 66/66] tests/xe_live_ktest: Add xe_eudebug live test
Date: Mon, 29 Jul 2024 18:01:59 +0200
Message-Id: <20240729160159.37036-67-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
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

