Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA4BCD5BA2
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3762710E82D;
	Thu,  5 Sep 2024 09:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxevstBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ABA10E82D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528577; x=1757064577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cnDdbSnAGBK6VL8Fewnk1mBRtLOMiUM2Qh2VTeXxDuA=;
 b=ZxevstBHbqpWfTP8v1EoooLcinVrwaW1EmorqtilXWrCjFoSVIGujbvp
 LJeJZWozdfkiBiR8eQiUL4hEB7UNWzV0PQVsZ3U7pQa4XCf1BZyVfbmZn
 NYSiu0ztef1qT6CPTRHfuCJqn3T7G4OKWtTU++oXDS3gQQLUOtRMgBn6h
 aVHp8ruorqwQUnUhB42orJOoS8gH0GbGBrcSfgQRSRwcA3Y2HlK5sumll
 OUMjaHvxy4NYmE0kKG8DsuU3xqhkvTXHFdZILSHFhgedNZZTJ8j337Mai
 /03REJhaaIvgpslSJR3sjhfXCM6ilFBQyvFNizV8QFIYMgdYkai58VBE3 g==;
X-CSE-ConnectionGUID: 9QnPwHKXS6yFCloioiWl+Q==
X-CSE-MsgGUID: btzvjjl0T4qKDTorjBZFMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35590361"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="35590361"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:29:37 -0700
X-CSE-ConnectionGUID: sbpAQThmRNWLSaPsCG1tQg==
X-CSE-MsgGUID: dxoyfzRdQPW02jcUkmKJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65405232"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:29:33 -0700
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
Subject: [PATCH i-g-t v6 17/17] tests/xe_live_ktest: Add xe_eudebug live test
Date: Thu,  5 Sep 2024 11:28:12 +0200
Message-Id: <20240905092812.94553-18-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905092812.94553-1-christoph.manszewski@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

