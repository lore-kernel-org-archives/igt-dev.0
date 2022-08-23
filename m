Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D3911224A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:44 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:19 +0000
Message-Id: <20220823183036.5270-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/23] i915/perf: Account for OA sampling
 interval in polling test
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

The polling test reads all the reports and then expects EAGAIN on a
subsequent read since it has consumed all available data. This
works well for OA sampling periods in the order of 10s of ms. For
smaller sampling periods like 500 us, we end up reading valid data and
the test fails. Fix the check to account for the OA sampling period.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 95600562..5fd143e9 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -2220,14 +2220,22 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
 			n_extra_iterations++;
 
 		/* At this point, after consuming pending reports (and hoping
-		 * the scheduler hasn't stopped us for too long we now
-		 * expect EAGAIN on read.
+		 * the scheduler hasn't stopped us for too long) we now expect
+		 * EAGAIN on read. While this works most of the times, there are
+		 * some rare failures when the OA period passed to this test is
+		 * very small (say 500 us) and that results in some valid
+		 * reports here. To weed out those rare occurences we assert
+		 * only if the OA period is >= 40 ms because 40 ms has withstood
+		 * the test of time on most platforms (ref: subtest: polling).
 		 */
 		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
 		       errno == EINTR)
 			;
-		igt_assert_eq(ret, -1);
-		igt_assert_eq(errno, EAGAIN);
+
+		if (requested_oa_period >= 40000000) {
+			igt_assert_eq(ret, -1);
+			igt_assert_eq(errno, EAGAIN);
+		}
 
 		n++;
 	}
-- 
2.25.1
