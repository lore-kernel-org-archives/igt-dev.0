Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2F96E8FB
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2020 12:05:33 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 11 Jun 2020 15:05:11 +0300
Message-ID: <20200611120511.1036732-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: Fix _open_pmu()
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>

_open_pmu() was calling perf_igfx_open_group() which in turn was
calling igt_perf_type_id("i915") each time.

By making _open_pmu() take type as a parameter and call
igt_perf_open_group() we achieve two things:

 * we use the correct type for engines->device instead of the
   hardcoded "i915"

 * optimization - we call igt_perf_type_id() once - it's reading
   sysfs

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 tools/intel_gpu_top.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 476e0a6f..cae01c25 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -438,11 +438,11 @@ static const char *imc_data_writes_unit(void)
 		return NULL;
 }
 
-#define _open_pmu(cnt, pmu, fd) \
+#define _open_pmu(type, cnt, pmu, fd) \
 ({ \
 	int fd__; \
 \
-	fd__ = perf_igfx_open_group((pmu)->config, (fd)); \
+	fd__ = igt_perf_open_group((type), (pmu)->config, (fd)); \
 	if (fd__ >= 0) { \
 		if ((fd) == -1) \
 			(fd) = fd__; \
@@ -472,23 +472,24 @@ static int pmu_init(struct engines *engines)
 {
 	unsigned int i;
 	int fd;
+	uint64_t type = igt_perf_type_id(engines->device);
 
 	engines->fd = -1;
 	engines->num_counters = 0;
 
 	engines->irq.config = I915_PMU_INTERRUPTS;
-	fd = _open_pmu(engines->num_counters, &engines->irq, engines->fd);
+	fd = _open_pmu(type, engines->num_counters, &engines->irq, engines->fd);
 	if (fd < 0)
 		return -1;
 
 	engines->freq_req.config = I915_PMU_REQUESTED_FREQUENCY;
-	_open_pmu(engines->num_counters, &engines->freq_req, engines->fd);
+	_open_pmu(type, engines->num_counters, &engines->freq_req, engines->fd);
 
 	engines->freq_act.config = I915_PMU_ACTUAL_FREQUENCY;
-	_open_pmu(engines->num_counters, &engines->freq_act, engines->fd);
+	_open_pmu(type, engines->num_counters, &engines->freq_act, engines->fd);
 
 	engines->rc6.config = I915_PMU_RC6_RESIDENCY;
-	_open_pmu(engines->num_counters, &engines->rc6, engines->fd);
+	_open_pmu(type, engines->num_counters, &engines->rc6, engines->fd);
 
 	for (i = 0; i < engines->num_engines; i++) {
 		struct engine *engine = engine_ptr(engines, i);
@@ -508,7 +509,7 @@ static int pmu_init(struct engines *engines)
 					get_pmu_config(dirfd(engines->root),
 						       engine->name,
 						       cnt->counter);
-			fd = _open_pmu(engines->num_counters, cnt->pmu,
+			fd = _open_pmu(type, engines->num_counters, cnt->pmu,
 				       engines->fd);
 			if (fd >= 0)
 				engine->num_counters++;
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
