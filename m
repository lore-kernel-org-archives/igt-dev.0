Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C5811A275
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:45 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:32 +0000
Message-Id: <20220823183036.5270-20-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 19/23] i915/perf: Wait longer for rc6
 residency in DG2
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

igt@perf@rc6-disable waits for 50ms to check if we entered rc6. One some
failures this seems to take longer to enter rc6, about 100ms. Tweak the
test for DG2 to use a longer wait time.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 6951735b..3ddfe587 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4441,7 +4441,10 @@ test_rc6_disable(void)
 		.properties_ptr = to_user_pointer(properties),
 	};
 	unsigned long rc6_start, rc6_end, rc6_enabled;
+	uint32_t rc6_duration;
 
+	/* On DG2, we wait longer to enter rc6 */
+	rc6_duration = IS_DG2(devid) ? 100000 : 50000;
 	rc6_enabled = 0;
 	igt_sysfs_rps_scanf(sysfs, RC6_ENABLE, "%lu", &rc6_enabled);
 	igt_require(rc6_enabled);
@@ -4449,7 +4452,7 @@ test_rc6_disable(void)
 	/* Verify rc6 is functional by measuring residency while idle */
 	gem_quiescent_gpu(drm_fd);
 	rc6_start = rc6_residency_ms();
-	usleep(50000);
+	usleep(rc6_duration);
 	rc6_end = rc6_residency_ms();
 	igt_require(rc6_end != rc6_start);
 
@@ -4457,7 +4460,7 @@ test_rc6_disable(void)
 	stream_fd = __perf_open(drm_fd, &param, false);
 
 	rc6_start = rc6_residency_ms();
-	usleep(50000);
+	usleep(rc6_duration);
 	rc6_end = rc6_residency_ms();
 	igt_assert_eq(rc6_end - rc6_start, 0);
 
@@ -4466,7 +4469,7 @@ test_rc6_disable(void)
 
 	/* But once OA is closed, we expect the device to sleep again */
 	rc6_start = rc6_residency_ms();
-	usleep(50000);
+	usleep(rc6_duration);
 	rc6_end = rc6_residency_ms();
 	igt_assert_neq(rc6_end - rc6_start, 0);
 }
-- 
2.25.1
