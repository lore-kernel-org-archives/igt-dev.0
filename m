Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0C710E123
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 15:46:55 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 19 May 2023 08:46:39 -0700
Message-Id: <20230519154650.3751855-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230519154650.3751855-1-umesh.nerlige.ramappa@intel.com>
References: <20230519154650.3751855-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 05/16] perf_pmu: Quiesce GPU if measuring
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
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index c476c422c..6c9cd5ca8 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -417,6 +417,7 @@ single(int gem_fd, const intel_ctx_t *ctx,
 	int fd;
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
+	gem_quiescent_gpu(gem_fd);
 	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
 	if (flags & TEST_BUSY)
@@ -777,6 +778,7 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
 	int fd[2];
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
+	gem_quiescent_gpu(gem_fd);
 	fd[0] = open_group(gem_fd, I915_PMU_ENGINE_SEMA(e->class, e->instance),
 			   -1);
 	fd[1] = open_group(gem_fd, I915_PMU_ENGINE_WAIT(e->class, e->instance),
-- 
2.36.1
