Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF79606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bC6aJVsE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF041125FD;
	Thu, 22 Oct 2026 12:55:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8515D1125E8
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792673679; x=1824209679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XlpD/HSGyF//XcjOcVua/YPlCJ0esA14sklCZxH4Z4k=;
 b=bC6aJVsEnRLHRRVE4ajX8eONd5Qd+R6vlMlGft7EqELZxiuypil63ndU
 aPsNSrLX3FrtmDcpSn710jYZ8JmUvxJbUtHPij04SnXQFqwh13EptVV3x
 zvDPG0QhDawBSh4xIGUvzQTQjcCFjt/u4XsNIG/vfmomn62dEh/wpjOQu
 aXwsYABaKB+nU0bd5bt+5+MGSGRyXr8hnMoqI5UZrdntyZcOh7D9CWa2C
 /iUYCRhtNkCDtAzRm+8mFueKDAiLWUMJuRHA4mzMqAm9q6zwE3X56h3L0
 9rqAox+0O6imUHNaHrHaaxY/gJjGSLdopOlvZu46ncms+7o/EjIcwaQ4u A==;
X-CSE-ConnectionGUID: NaJaFYnSTPu17ZIAXMU98g==
X-CSE-MsgGUID: qb+Y7eMwT+67Gm0r17thKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1319577"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1319577"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:54:39 -0700
X-CSE-ConnectionGUID: 7fHPSfO5TBmxo9qZeZzf5g==
X-CSE-MsgGUID: GBbu+OKwQiujKNeH24KGzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3439060"
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:54:36 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, peter.senna@linux.intel.com,
 piotr.rudnicki@intel.com, mika.kuoppala@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_live_ktest: remove xe_eudebug from
 ktest list
Date: Thu, 22 Oct 2026 15:02:58 +0200
Message-ID: <20261022130258.407901-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Eudebug is currently not supported and there are no ktests there
available.

Remove it from xe_live_ktest list.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_live_ktest.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index e80d7f68e0..b6dcb29d4f 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -35,13 +35,6 @@
  * Description:
  *	Kernel dynamic selftests to check mocs configuration.
  * Functionality: mocs configuration
- *
- * SUBTEST: xe_eudebug
- * Description:
- *	Kernel dynamic selftests to check eudebug functionality.
- * Functionality: eudebug kunit
- * Mega feature: EUdebug
- * Sub-category: kunit eudebug
  */
 
 static const char *live_tests[] = {
@@ -50,7 +43,6 @@ static const char *live_tests[] = {
 	"xe_dma_buf",
 	"xe_migrate",
 	"xe_mocs",
-	"xe_eudebug",
 };
 
 int igt_main()
-- 
2.43.0

