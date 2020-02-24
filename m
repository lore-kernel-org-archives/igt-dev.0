Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6416E52D
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 15:04:03 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 24 Feb 2020 17:03:57 +0200
Message-Id: <20200224150358.1472416-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/perf: add some debug prints
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

Helps debug on shards.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/perf.c b/tests/perf.c
index d9bac561..7b11f668 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -847,7 +847,8 @@ gen8_sanity_check_test_oa_reports(uint32_t *oa_report0, uint32_t *oa_report1,
 					    format.c_off);
 		uint32_t delta = c1[j] - c0[j];
 
-		igt_debug("C%d: delta = %"PRIu32"\n", j, delta);
+		igt_debug("C%d: delta = %"PRIu32", max_delta=%"PRIu32"\n",
+			  j, delta, max_delta);
 		igt_assert(delta <= max_delta);
 	}
 }
@@ -863,6 +864,9 @@ init_sys_info(void)
 	intel_perf = intel_perf_for_fd(drm_fd);
 	igt_require(intel_perf);
 
+	igt_debug("n_eu_slices: %"PRIu64"\n", intel_perf->devinfo.n_eu_slices);
+	igt_debug("n_eu_sub_slices: %"PRIu64"\n", intel_perf->devinfo.n_eu_sub_slices);
+	igt_debug("n_eus: %"PRIu64"\n", intel_perf->devinfo.n_eus);
 	igt_debug("timestamp_frequency = %"PRIu64"\n",
 		  intel_perf->devinfo.timestamp_frequency);
 	igt_assert_neq(intel_perf->devinfo.timestamp_frequency, 0);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
