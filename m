Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30A910E3CE
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 21:32:18 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
Date: Tue,  6 Jun 2023 21:29:30 +0000
Message-Id: <20230606212930.125031-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tools/intel_gpu_top: Return the error to the
 caller of pmu_init
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

When run as a regular user, we see an assert instead of a proper error
message.  Propagate errors correctly to caller.

Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/139
Fixes: (c67825ba40de: intel_gpu_top: Determine number of tiles)
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/intel_gpu_top.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 7018499c..24fba88b 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -536,7 +536,7 @@ static void imc_reads_open(struct pmu_counter *pmu, struct engines *engines)
 	imc_open(pmu, "data_reads", engines);
 }
 
-static int get_num_gts(uint64_t type)
+static int get_num_gts(uint64_t type, int *num_gts)
 {
 	int fd, cnt;
 
@@ -548,11 +548,13 @@ static int get_num_gts(uint64_t type)
 
 		close(fd);
 	}
-	assert(!errno || errno == ENOENT);
+	if (errno && errno != ENOENT)
+		return fd;
+
 	assert(cnt > 0);
-	errno = 0;
+	*num_gts = cnt;
 
-	return cnt;
+	return 0;
 }
 
 static void init_aggregate_counters(struct engines *engines)
@@ -578,12 +580,14 @@ static void init_aggregate_counters(struct engines *engines)
 static int pmu_init(struct engines *engines)
 {
 	unsigned int i;
-	int fd;
+	int fd, ret;
 	uint64_t type = igt_perf_type_id(engines->device);
 
 	engines->fd = -1;
 	engines->num_counters = 0;
-	engines->num_gts = get_num_gts(type);
+	ret = get_num_gts(type, &engines->num_gts);
+	if (ret)
+		return ret;
 
 	engines->irq.config = I915_PMU_INTERRUPTS;
 	fd = _open_pmu(type, engines->num_counters, &engines->irq, engines->fd);
-- 
2.34.1
