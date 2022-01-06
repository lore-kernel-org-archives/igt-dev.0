Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu,  6 Jan 2022 16:42:58 +0000
Message-Id: <20220106164258.56648-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t] tests/i915/perf_pmu: Fix allow hang
 handling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Commit d7a74b959eea ("tests/i915/perf_pmu: Convert to intel_ctx_t (v3)")
broke the test when it is run in its entirety.

Correct context id needs to be used with igt_allow_hang to avoid context
ban preventing the test to run to completion.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: d7a74b959eea ("tests/i915/perf_pmu: Convert to intel_ctx_t (v3)")
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
I haven't audited more tests apart from grep showing a lot of
igt_allow_hang with the default context so someone needs to go through
them and see if more are affected.
---
 tests/i915/perf_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 581da8483f0c..1665dc5e6317 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -2319,7 +2319,7 @@ igt_main
 	}
 
 	test_each_engine("busy-hang", fd, ctx, e) {
-		igt_hang_t hang = igt_allow_hang(fd, 0, 0);
+		igt_hang_t hang = igt_allow_hang(fd, ctx->id, 0);
 
 		single(fd, ctx, e, TEST_BUSY | FLAG_HANG);
 
-- 
2.32.0
