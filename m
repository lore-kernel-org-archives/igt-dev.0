Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B90C10E1B7
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 06:46:29 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 28CEE580BE1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 23:46:28 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q2RDV-00C6oj-2J
 for igt-dev@lists.freedesktop.org; Fri, 26 May 2023 08:46:25 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 26 May 2023 08:46:23 +0200
Message-Id: <20230526064624.2886063-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230526064624.2886063-1-mauro.chehab@linux.intel.com>
References: <20230526064624.2886063-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/perf_pmu: sync documentation with
 latest changes
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

There are some changes on some test names since when the
documentation was generated for this file.

Update it to keep in sync with the actual tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/perf_pmu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 2aa018e13aff..8b31df7b229e 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -145,9 +145,6 @@
  * Feature: i915 pmu perf interface, pmu
  * Test category: Perf
  *
- * SUBTEST: frequency-idle
- * Feature: pmu
- *
  * SUBTEST: gt-awake
  * Description: Setup workload on all engines,measure gt awake time via pmu
  * Feature: i915 pmu perf interface, pmu
@@ -226,10 +223,7 @@
  * SUBTEST: rc6
  * Feature: pmu
  *
- * SUBTEST: rc6-runtime-pm
- * Feature: pmu
- *
- * SUBTEST: rc6-runtime-pm-long
+ * SUBTEST: rc6-all-gts
  * Feature: pmu
  *
  * SUBTEST: rc6-suspend
-- 
2.40.1
