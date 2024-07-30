Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62126C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F5C10E51C;
	Tue, 30 Jul 2024 11:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNiQrTCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806FD10E51C
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340201; x=1753876201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JLf9M22ZHXXu/c6TpjXqHm058iUPRr6CfSnzlSXAKIo=;
 b=ZNiQrTCLjLI0GZAFiuSVjMGnioswacNUMY5Q4FaG479HLtaGgKO9kCrJ
 1Lhg9WXQ0EZPCRONHu6ie91YhhqtURKHkmRm5BscMxjsSv+5QNzlj1FzL
 y7tj6Bd0jJ25KJYmFv+2sDTnHBcelF3G5+eMgjZU3ElMcWsQqAIu9kb8X
 PPnUBdHlpn+poZp4PK82HuWr3Sp8G0TzxUR6snGhXa8tvsVBuh6WkyXeI
 mFYXqwFSt5z0lNqfgNb32A7LuVkVb6GLbFBCHq5bGRstFEz7SrK4jjOrt
 oAbn6RZM7JH7rL0CTFtpEBBN8h2nYPxvGw0YHVXSlPDIx+HwUkAbd9tzm g==;
X-CSE-ConnectionGUID: n6GYwqcdSTyo19jCzXCXFw==
X-CSE-MsgGUID: iPsV7eqESAuvccpHIBBlwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20286800"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20286800"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:50:00 -0700
X-CSE-ConnectionGUID: NCINtOggR4eIS7UMHkgmFw==
X-CSE-MsgGUID: 2bLs8OpkT+mM6B5Lt3G42g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217804"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:57 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 66/66] tests/xe_live_ktest: Add xe_eudebug live test
Date: Tue, 30 Jul 2024 13:45:23 +0200
Message-Id: <20240730114523.334156-67-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

