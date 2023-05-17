Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C7B10E49B
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 21:25:47 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 May 2023 14:25:36 -0700
Message-Id: <20230517212542.3681862-10-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
References: <20230517212542.3681862-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 09/15] intel_gpu_top: Switch pmu_counter
 to use aggregated values
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

Aggregate gt specific values for freq and rc6 counters.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 49 +++++++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index aab301bd1..88c876dfe 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -560,6 +560,26 @@ static int get_num_gts(uint64_t type)
 	return cnt;
 }
 
+static void init_aggregate_counters(struct engines *engines)
+{
+	struct pmu_counter *pmu;
+
+	pmu = &engines->freq_req;
+	pmu->type = igt_perf_type_id(engines->device);
+	pmu->config = I915_PMU_REQUESTED_FREQUENCY;
+	pmu->present = true;
+
+	pmu = &engines->freq_act;
+	pmu->type = igt_perf_type_id(engines->device);
+	pmu->config = I915_PMU_ACTUAL_FREQUENCY;
+	pmu->present = true;
+
+	pmu = &engines->rc6;
+	pmu->type = igt_perf_type_id(engines->device);
+	pmu->config = I915_PMU_RC6_RESIDENCY;
+	pmu->present = true;
+}
+
 static int pmu_init(struct engines *engines)
 {
 	unsigned int i;
@@ -575,14 +595,7 @@ static int pmu_init(struct engines *engines)
 	if (fd < 0)
 		return -1;
 
-	engines->freq_req.config = I915_PMU_REQUESTED_FREQUENCY;
-	_open_pmu(type, engines->num_counters, &engines->freq_req, engines->fd);
-
-	engines->freq_act.config = I915_PMU_ACTUAL_FREQUENCY;
-	_open_pmu(type, engines->num_counters, &engines->freq_act, engines->fd);
-
-	engines->rc6.config = I915_PMU_RC6_RESIDENCY;
-	_open_pmu(type, engines->num_counters, &engines->rc6, engines->fd);
+	init_aggregate_counters(engines);
 
 	for (i = 0; i < engines->num_gts; i++) {
 		engines->freq_req_gt[i].config = __I915_PMU_REQUESTED_FREQUENCY(i);
@@ -698,14 +711,28 @@ static void pmu_sample(struct engines *engines)
 
 	for (i = 0; i < engines->num_gts; i++) {
 		update_sample(&engines->freq_req_gt[i], val);
+		engines->freq_req.val.cur += engines->freq_req_gt[i].val.cur;
+		engines->freq_req.val.prev += engines->freq_req_gt[i].val.prev;
+
 		update_sample(&engines->freq_act_gt[i], val);
+		engines->freq_act.val.cur += engines->freq_act_gt[i].val.cur;
+		engines->freq_act.val.prev += engines->freq_act_gt[i].val.prev;
+
 		update_sample(&engines->rc6_gt[i], val);
+		engines->rc6.val.cur += engines->rc6_gt[i].val.cur;
+		engines->rc6.val.prev += engines->rc6_gt[i].val.prev;
 	}
 
-	update_sample(&engines->freq_req, val);
-	update_sample(&engines->freq_act, val);
+	engines->freq_req.val.cur /= engines->num_gts;
+	engines->freq_req.val.prev /= engines->num_gts;
+
+	engines->freq_act.val.cur /= engines->num_gts;
+	engines->freq_act.val.prev /= engines->num_gts;
+
+	engines->rc6.val.cur /= engines->num_gts;
+	engines->rc6.val.prev /= engines->num_gts;
+
 	update_sample(&engines->irq, val);
-	update_sample(&engines->rc6, val);
 
 	for (i = 0; i < engines->num_engines; i++) {
 		struct engine *engine = engine_ptr(engines, i);
-- 
2.36.1
