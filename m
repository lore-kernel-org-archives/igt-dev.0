Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4CC10E0A4
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 04:37:59 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 058BB580D37
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 21:37:59 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qTxQq-00342t-3D
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 06:37:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 06:37:55 +0200
Message-ID: <20230810043755.730525-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe_live_ktest: remove xe_pci and xe_rtp
 tests from IGT testlist
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
