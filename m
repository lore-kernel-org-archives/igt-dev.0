Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731A710E09E
 for <igt-dev@lists.freedesktop.org>; Sat, 13 May 2023 02:22:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 12 May 2023 19:22:26 -0700
Message-Id: <20230513022234.2832233-8-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
References: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/15] intel_gpu_top: Determine number of
 tiles
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

Find out how many tiles are present in the platforms for multi-tile support.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 3d21f25bd..695f57526 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -117,6 +117,8 @@ struct engines {
 	bool discrete;
 	char *device;
 
+	int num_gts;
+
 	/* Do not edit below this line.
 	 * This structure is reallocated every time a new engine is
 	 * found and size is increased by sizeof (engine).
@@ -533,6 +535,25 @@ static void imc_reads_open(struct pmu_counter *pmu, struct engines *engines)
 	imc_open(pmu, "data_reads", engines);
 }
 
+static int get_num_gts(uint64_t type)
+{
+	int fd, cnt;
+
+	errno = 0;
+	for (cnt = 0; cnt < MAX_GTS; cnt++) {
+		fd = igt_perf_open(type, __I915_PMU_REQUESTED_FREQUENCY(cnt));
+		if (fd < 0)
+			break;
+
+		close(fd);
+	}
+	assert(!errno || errno == ENOENT);
+	assert(cnt > 0);
+	errno = 0;
+
+	return cnt;
+}
+
 static int pmu_init(struct engines *engines)
 {
 	unsigned int i;
@@ -541,6 +562,7 @@ static int pmu_init(struct engines *engines)
 
 	engines->fd = -1;
 	engines->num_counters = 0;
+	engines->num_gts = get_num_gts(type);
 
 	engines->irq.config = I915_PMU_INTERRUPTS;
 	fd = _open_pmu(type, engines->num_counters, &engines->irq, engines->fd);
-- 
2.36.1
