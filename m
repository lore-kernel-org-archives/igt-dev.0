Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76C46E29A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2020 12:48:37 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 30 Mar 2020 15:48:34 +0300
Message-Id: <20200330124834.43038-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/perf: dramatically loosen
 expectations on oa-exponents
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This test really quite flaky because it expects HW to emit reports
following pretty much exactly the specified timer. And there are lots
of reasons the HW might not be able to meet the timer deadline. The
design is such that it's expected to not always meet the timer.

We just want to verify that the HW was configured properly, so loosen
the checks to half the reports (of 30) meeting the timer deadline.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/perf.c b/tests/perf.c
index 442d89fb..023829fc 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -1742,8 +1742,14 @@ test_oa_exponents(void)
 
 		igt_debug("matches=%u/%u\n", matches, n_timer_reports - 1);
 
-		/* Allow for a couple of errors. */
-		igt_assert_lte(n_timer_reports - 3, matches);
+		/*
+		 * Expect half the reports to match the timing
+		 * expectation. The results are quite erratic because
+		 * the condition under which the HW reaches
+		 * expectations depends on memory controller pressure
+		 * etc...
+		 */
+		igt_assert_lte(n_timer_reports / 2, matches);
 	}
 
 	load_helper_stop();
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
