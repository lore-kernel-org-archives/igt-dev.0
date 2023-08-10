Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A37C10E506
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 11:12:39 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EA467580AFF
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 04:12:37 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qU3al-0041lq-36
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 13:12:35 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 13:12:02 +0200
Message-ID: <20230810111234.960098-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230810111234.960098-1-mauro.chehab@linux.intel.com>
References: <20230810111234.960098-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/3] xe_live_ktest: remove xe_pci and
 xe_rtp tests from IGT testlist
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

Those aren't live tests and are currently executed by Intel CI
at build time by running kunit.py, as those are part of the
device-independent validation.

So, remove them from IGT.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_live_ktest.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
index 53cc8c186215..5088f676b2bf 100644
--- a/tests/xe/xe_live_ktest.c
+++ b/tests/xe/xe_live_ktest.c
@@ -38,8 +38,6 @@ static const struct kunit_tests live_tests[] = {
 	{ "xe_bo_test",		"bo" },
 	{ "xe_dma_buf_test",	"dmabuf" },
 	{ "xe_migrate_test",	"migrate" },
-	{ "xe_pci_test",	"pci" },
-	{ "xe_rtp_test",	"rtp" },
 };
 
 igt_main
-- 
2.41.0
