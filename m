Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C83610E70B
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Oct 2022 20:55:42 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Oct 2022 20:55:28 +0000
Message-Id: <20221027205535.12824-22-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
References: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 21/28] tools/i915-perf: make timestamp
 range easier to compare
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

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

With timestamp bit shifting stuff, aligning values in the console is
useful to compare them.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_reader.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
index 4a2e3df4..92e43c19 100644
--- a/tools/i915-perf/i915_perf_reader.c
+++ b/tools/i915-perf/i915_perf_reader.c
@@ -235,14 +235,17 @@ main(int argc, char *argv[])
 		return EXIT_FAILURE;
 	}
 
-	fprintf(stdout, "Timestamp correlation CPU range: 0x%016"PRIx64"-0x%016"PRIx64"\n",
+	fprintf(stdout, "Timestamp correlation CPU range:       0x%016"PRIx64"-0x%016"PRIx64"\n",
 		reader.correlations[0]->cpu_timestamp,
 		reader.correlations[reader.n_correlations - 1]->cpu_timestamp);
-	fprintf(stdout, "Timestamp correlation GPU range: 0x%016"PRIx64"-0x%016"PRIx64"\n",
+	fprintf(stdout, "Timestamp correlation GPU range (64b): 0x%016"PRIx64"-0x%016"PRIx64"\n",
 		reader.correlations[0]->gpu_timestamp,
 		reader.correlations[reader.n_correlations - 1]->gpu_timestamp);
+	fprintf(stdout, "Timestamp correlation GPU range (32b): 0x%016"PRIx64"-0x%016"PRIx64"\n",
+		reader.correlations[0]->gpu_timestamp & 0xffffffff,
+		reader.correlations[reader.n_correlations - 1]->gpu_timestamp & 0xffffffff);
 
-	fprintf(stdout, "OA data timestamp range: 0x%016"PRIx64"-0x%016"PRIx64"\n",
+	fprintf(stdout, "OA data timestamp range:               0x%016"PRIx64"-0x%016"PRIx64"\n",
 		intel_perf_read_record_timestamp(reader.perf,
 						 reader.metric_set,
 						 reader.records[0]),
-- 
2.25.1
