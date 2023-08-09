Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803710E452
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 14:48:52 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 345D35808EF
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 07:48:51 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qTkUT-002k1I-0y
 for igt-dev@lists.freedesktop.org; Wed, 09 Aug 2023 16:48:49 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Aug 2023 16:48:45 +0200
Message-ID: <20230809144845.653231-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe_live_ktest: remove wa from the testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The workaround selftest is not a live test. It is meant to run
via kunit.py, as part of the driver-independent validation.

So, remove it from IGT.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_live_ktest.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
index f0cbf4f623bc..53cc8c186215 100644
--- a/tests/xe/xe_live_ktest.c
+++ b/tests/xe/xe_live_ktest.c
@@ -40,7 +40,6 @@ static const struct kunit_tests live_tests[] = {
 	{ "xe_migrate_test",	"migrate" },
 	{ "xe_pci_test",	"pci" },
 	{ "xe_rtp_test",	"rtp" },
-	{ "xe_wa_test",		"wa" },
 };
 
 igt_main
-- 
2.41.0
