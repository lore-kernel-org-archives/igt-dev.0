Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D6610E2B7
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 00:37:02 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 17:36:54 -0700
Message-Id: <20230330003656.1294873-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230330003656.1294873-1-umesh.nerlige.ramappa@intel.com>
References: <20230330003656.1294873-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/7] tests/i915/perf_pmu: Quiesce GPU if
 measuring idle busyness without spinner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, arjun.melkaveri@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The assumption in some tests is that the engines are not busy if no
spinners are being run. This is not true in some cases where we see
that the render is busy at the start of the test. Quiesce GPU to wait
for such work to complete before checking for idle busyness.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf_pmu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 1bea3e57..5185cd9a 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -281,10 +281,12 @@ single(int gem_fd, const intel_ctx_t *ctx,
 
 	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
-	if (flags & TEST_BUSY)
+	if (flags & TEST_BUSY) {
 		spin = spin_sync(gem_fd, ahnd, ctx, e);
-	else
+	} else {
 		spin = NULL;
+		gem_quiescent_gpu(gem_fd);
+	}
 
 	val = pmu_read_single(fd);
 	slept = measured_usleep(batch_duration_ns / 1000);
@@ -644,10 +646,12 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
 	fd[1] = open_group(gem_fd, I915_PMU_ENGINE_WAIT(e->class, e->instance),
 			   fd[0]);
 
-	if (flags & TEST_BUSY)
+	if (flags & TEST_BUSY) {
 		spin = spin_sync(gem_fd, ahnd, ctx, e);
-	else
+	} else {
 		spin = NULL;
+		gem_quiescent_gpu(gem_fd);
+	}
 
 	pmu_read_multi(fd[0], 2, val[0]);
 	measured_usleep(batch_duration_ns / 1000);
-- 
2.36.1
