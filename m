Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A79910ECBD
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 03:34:41 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 20:34:30 -0700
Message-Id: <20230330033430.1298683-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/perf_pmu: Add some more debug
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

Add another line of debug to debug igt@perf_pmu@module-unload failures.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 197e7cd2542..cd476867f6c 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -2119,6 +2119,7 @@ static void test_unload(unsigned int num_engines)
 		igt_debug("Read %d events from perf and trial unload\n", count);
 		pmu_read_multi(fd[0], count, buf);
 		ret = __igt_i915_driver_unload(&who);
+		igt_debug("(ret %d who %s\n", ret, who);
 		igt_assert(ret != 0 && !strcmp(who, "i915"));
 		free(who);
 		pmu_read_multi(fd[0], count, buf);
-- 
2.38.0
