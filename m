Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3DBCCD1A2
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E3F10E586;
	Wed, 18 Sep 2024 11:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVHHSR8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0184210E586
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726659106; x=1758195106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cnDdbSnAGBK6VL8Fewnk1mBRtLOMiUM2Qh2VTeXxDuA=;
 b=mVHHSR8LTiLCI8g8gcEMKofJlva0RnzllzZvUSuiXObYtWtidlsKhNqq
 cj9P1A4u0W26+DfucbbbubrZk4U2cEAkotISvR6aOiRgCNOQcWRlWuTx5
 kqlhLGI7I4zHeyATB4TB85otzYHdqWJAI+NeZxJhYwX4tr5Ue8q3K3a+n
 kcjBbyVUhxA3FRSvLP58gcOZN/qIuMCGCamOq9QWDGWdET16o0cId3Hxm
 KVePfW0r1USFQA7/aGUrX12JzSddxWebT7rMtubCQgzAVQemLnTWLIFqr
 AgBOFYpCTBnA3B+hjkX7Qme9dCRZbCSgmmD2T3sEP23Czjf0JqupjRTBY g==;
X-CSE-ConnectionGUID: pmzecuzHTjSplm7KX/3WVQ==
X-CSE-MsgGUID: ImrGUJbDSoCCLNZrttlEKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28470125"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="28470125"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:46 -0700
X-CSE-ConnectionGUID: PU8FqekPRmKR/rnoLNFOrg==
X-CSE-MsgGUID: fuTliODsQXmBsxCoeS5GvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106972752"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:42 -0700
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
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v7 16/16] tests/xe_live_ktest: Add xe_eudebug live test
Date: Wed, 18 Sep 2024 13:30:17 +0200
Message-Id: <20240918113017.144687-17-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918113017.144687-1-christoph.manszewski@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
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

