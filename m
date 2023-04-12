Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88E710E876
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 15:34:14 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.30.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id F30EC580BEE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 08:34:12 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pmcU6-000Wv1-31
 for igt-dev@lists.freedesktop.org; Wed, 12 Apr 2023 17:34:10 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:34:09 +0200
Message-Id: <20230412153409.126527-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe/xe_prime_self_import: remove
 *-vs-gem_close-race from BAT
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

Those are race tests. It should probably be part of a stress test
test list.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/xe-fast-feedback.testlist | 4 ++--
 tests/xe/xe_prime_self_import.c          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5efb226caef0..5db27c634524 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -113,8 +113,8 @@ igt@xe_mmio@mmio-timestamp
 igt@xe_mmio@mmio-invalid
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
-igt@xe_prime_self_import@export-vs-gem_close-race
-igt@xe_prime_self_import@reimport-vs-gem_close-race
+#igt@xe_prime_self_import@export-vs-gem_close-race
+#igt@xe_prime_self_import@reimport-vs-gem_close-race
 #igt@xe_prime_self_import@basic-llseek-size
 igt@xe_query@query-engines
 igt@xe_query@query-mem-usage
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index fb677b50b6aa..4e8fd5d4f683 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -288,7 +288,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 /**
  * SUBTEST: reimport-vs-gem_close-race
  * Description: Reimport versus gem_close race
- * Run type: BAT
+ * Run type: FULL
  */
 
  static void test_reimport_close_race(void)
@@ -386,7 +386,7 @@ static void *thread_fn_export_vs_close(void *p)
 /**
  * SUBTEST: export-vs-gem_close-race
  * Description: Export versus gem_close race test
- * Run type: BAT
+ * Run type: FULL
  */
 
 static void test_export_close_race(void)
-- 
2.39.2
