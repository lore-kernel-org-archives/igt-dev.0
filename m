Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E2A10E721
 for <igt-dev@lists.freedesktop.org>; Sat, 13 May 2023 02:22:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 12 May 2023 19:22:27 -0700
Message-Id: <20230513022234.2832233-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
References: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 08/15] intel_gpu_top: Capture freq and rc6
 counters from each gt
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

Loop through available gts and store the frequency and rc6 counters.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 695f57526..b0c177329 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -578,6 +578,17 @@ static int pmu_init(struct engines *engines)
 	engines->rc6.config = I915_PMU_RC6_RESIDENCY;
 	_open_pmu(type, engines->num_counters, &engines->rc6, engines->fd);
 
+	for (i = 0; i < engines->num_gts; i++) {
+		engines->freq_req_gt[i].config = __I915_PMU_REQUESTED_FREQUENCY(i);
+		_open_pmu(type, engines->num_counters, &engines->freq_req_gt[i], engines->fd);
+
+		engines->freq_act_gt[i].config = __I915_PMU_ACTUAL_FREQUENCY(i);
+		_open_pmu(type, engines->num_counters, &engines->freq_act_gt[i], engines->fd);
+
+		engines->rc6_gt[i].config = __I915_PMU_RC6_RESIDENCY(i);
+		_open_pmu(type, engines->num_counters, &engines->rc6_gt[i], engines->fd);
+	}
+
 	for (i = 0; i < engines->num_engines; i++) {
 		struct engine *engine = engine_ptr(engines, i);
 		struct {
@@ -679,6 +690,12 @@ static void pmu_sample(struct engines *engines)
 	engines->ts.prev = engines->ts.cur;
 	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
 
+	for (i = 0; i < engines->num_gts; i++) {
+		update_sample(&engines->freq_req_gt[i], val);
+		update_sample(&engines->freq_act_gt[i], val);
+		update_sample(&engines->rc6_gt[i], val);
+	}
+
 	update_sample(&engines->freq_req, val);
 	update_sample(&engines->freq_act, val);
 	update_sample(&engines->irq, val);
-- 
2.36.1
