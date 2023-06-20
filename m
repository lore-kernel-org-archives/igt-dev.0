Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C99910E15E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 08:55:29 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.7.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CF75E580DA2
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 01:55:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qBX92-00GiTV-1L
 for igt-dev@lists.freedesktop.org; Tue, 20 Jun 2023 10:55:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jun 2023 10:55:21 +0200
Message-Id: <20230620085522.3984101-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230620085522.3984101-1-mauro.chehab@linux.intel.com>
References: <20230620085522.3984101-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/4] tests/xe: add run type fields to
 order testlists
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

Order tests at the fast feedback testlist, when generating
testlists based on Run type field:

- add boot to xe_module_load, to run such test first when producing
  a fast feedback testlist;
- place kunit tests at the end of the fast feedback testlist, as they
  have a higher chance of causing GPU hangups.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_live_ktest.c  | 2 +-
 tests/xe/xe_module_load.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
index 7dcf679069b8..f0cbf4f623bc 100644
--- a/tests/xe/xe_live_ktest.c
+++ b/tests/xe/xe_live_ktest.c
@@ -8,7 +8,7 @@
  * Sub-category: kunit
  * Functionality: kunit
  * Test category: functionality test
- * Run type: BAT
+ * Run type: BAT, kunit
  *
  * SUBTEST: bo
  * Functionality: bo
diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
index 1c2d4a2e2ea3..3b2dc1fdc90f 100644
--- a/tests/xe/xe_module_load.c
+++ b/tests/xe/xe_module_load.c
@@ -99,7 +99,7 @@ static const char * const unwanted_drivers[] = {
 /**
  * SUBTEST: force-load
  * Description: Load the Xe driver passing ``force_probe=*`` parameter
- * Run type: BAT
+ * Run type: BAT, boot
  *
  * SUBTEST: load
  * Description: Load the Xe driver
-- 
2.40.1
