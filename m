Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD7610E110
 for <igt-dev@lists.freedesktop.org>; Sat,  6 May 2023 00:55:39 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  5 May 2023 17:55:17 -0700
Message-Id: <20230506005528.1890922-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/15] perf_pmu: Quiesce GPU if measuring
 idle busyness without spinner
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

The assumption in some tests is that the engines are not busy if no
spinners are being run. This is not true in some cases where we see
that the render is busy at the start of the test. Quiesce GPU to wait
for such work to complete before checking for idle busyness.

v2: Move gem_quiescent_gpu to beginning of test (Tvrtko)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 0b1177785..6080c5fdc 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -279,6 +279,7 @@ single(int gem_fd, const intel_ctx_t *ctx,
 	int fd;
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
+	gem_quiescent_gpu(gem_fd);
 	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
 	if (flags & TEST_BUSY)
@@ -639,6 +640,7 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
 	int fd[2];
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
+	gem_quiescent_gpu(gem_fd);
 	fd[0] = open_group(gem_fd, I915_PMU_ENGINE_SEMA(e->class, e->instance),
 			   -1);
 	fd[1] = open_group(gem_fd, I915_PMU_ENGINE_WAIT(e->class, e->instance),
-- 
2.34.1
