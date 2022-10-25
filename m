Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9FB10E2C8
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 20:07:19 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Oct 2022 20:07:07 +0000
Message-Id: <20221025200709.83314-28-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
References: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 27/29] tools/i915-perf: add option to printout
 reports data
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

This is helpful to get an idea of how timelines of reports should be
built.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_reader.c | 88 ++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 30 deletions(-)

diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
index 9be1a9fc..bcd40624 100644
--- a/tools/i915-perf/i915_perf_reader.c
+++ b/tools/i915-perf/i915_perf_reader.c
@@ -53,7 +53,8 @@ usage(void)
 	       "     --help,    -h             Print this screen\n"
 	       "     --counters, -c c1,c2,...  List of counters to display values for.\n"
 	       "                               Use 'all' to display all counters.\n"
-	       "                               Use 'list' to list available counters.\n");
+	       "                               Use 'list' to list available counters.\n"
+	       "     --reports, -r             Print out data per report.\n");
 }
 
 static struct intel_perf_logical_counter *
@@ -165,12 +166,49 @@ get_logical_counters(struct intel_perf_metric_set *metric_set,
 	return counters;
 }
 
+static void
+print_report_deltas(const struct intel_perf_data_reader *reader,
+		    const struct drm_i915_perf_record_header *i915_report0,
+		    const struct drm_i915_perf_record_header *i915_report1,
+		    struct intel_perf_logical_counter **counters,
+		    uint32_t n_counters)
+{
+	struct intel_perf_accumulator accu;
+
+	intel_perf_accumulate_reports(&accu,
+				      reader->perf, reader->metric_set,
+				      i915_report0, i915_report1);
+
+	for (uint32_t c = 0; c < n_counters; c++) {
+		struct intel_perf_logical_counter *counter = counters[c];
+
+		switch (counter->storage) {
+		case INTEL_PERF_LOGICAL_COUNTER_STORAGE_UINT64:
+		case INTEL_PERF_LOGICAL_COUNTER_STORAGE_UINT32:
+		case INTEL_PERF_LOGICAL_COUNTER_STORAGE_BOOL32:
+			fprintf(stdout, "   %s: %" PRIu64 "\n",
+				counter->symbol_name, counter->read_uint64(reader->perf,
+									   reader->metric_set,
+									   accu.deltas));
+			break;
+		case INTEL_PERF_LOGICAL_COUNTER_STORAGE_DOUBLE:
+		case INTEL_PERF_LOGICAL_COUNTER_STORAGE_FLOAT:
+			fprintf(stdout, "   %s: %f\n",
+				counter->symbol_name, counter->read_float(reader->perf,
+									  reader->metric_set,
+									  accu.deltas));
+			break;
+		}
+	}
+}
+
 int
 main(int argc, char *argv[])
 {
 	const struct option long_options[] = {
 		{"help",             no_argument, 0, 'h'},
 		{"counters",   required_argument, 0, 'c'},
+		{"reports",          no_argument, 0, 'r'},
 		{0, 0, 0, 0}
 	};
 	struct intel_perf_data_reader reader;
@@ -179,8 +217,9 @@ main(int argc, char *argv[])
 	const char *counter_names = NULL;
 	int32_t n_counters;
 	int fd, opt;
+	bool print_reports = false;
 
-	while ((opt = getopt_long(argc, argv, "hc:", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hc:r", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage();
@@ -188,6 +227,9 @@ main(int argc, char *argv[])
 		case 'c':
 			counter_names = optarg;
 			break;
+		case 'r':
+			print_reports = true;
+			break;
 		default:
 			fprintf(stderr, "Internal error: "
 				"unexpected getopt value: %d\n", opt);
@@ -268,11 +310,6 @@ main(int argc, char *argv[])
 
 	for (uint32_t i = 0; i < reader.n_timelines; i++) {
 		const struct intel_perf_timeline_item *item = &reader.timelines[i];
-		const struct drm_i915_perf_record_header *i915_report0 =
-			reader.records[item->record_start];
-		const struct drm_i915_perf_record_header *i915_report1 =
-			reader.records[item->record_end];
-		struct intel_perf_accumulator accu;
 
 		fprintf(stdout, "Time: CPU=0x%016" PRIx64 "-0x%016" PRIx64
 			" GPU=0x%016" PRIx64 "-0x%016" PRIx64"\n",
@@ -281,29 +318,20 @@ main(int argc, char *argv[])
 		fprintf(stdout, "hw_id=0x%x %s\n",
 			item->hw_id, item->hw_id == 0xffffffff ? "(idle)" : "");
 
-		intel_perf_accumulate_reports(&accu,
-					      reader.perf, reader.metric_set,
-					      i915_report0, i915_report1);
-
-		for (uint32_t c = 0; c < n_counters; c++) {
-			struct intel_perf_logical_counter *counter = counters[c];
-
-			switch (counter->storage) {
-			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_UINT64:
-			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_UINT32:
-			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_BOOL32:
-				fprintf(stdout, "   %s: %" PRIu64 "\n",
-					counter->symbol_name, counter->read_uint64(reader.perf,
-										   reader.metric_set,
-										   accu.deltas));
-				break;
-			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_DOUBLE:
-			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_FLOAT:
-				fprintf(stdout, "   %s: %f\n",
-					counter->symbol_name, counter->read_float(reader.perf,
-										  reader.metric_set,
-										  accu.deltas));
-				break;
+		print_report_deltas(&reader,
+				    reader.records[item->record_start],
+				    reader.records[item->record_end],
+				    counters, n_counters);
+
+		if (print_reports) {
+			for (uint32_t r = item->record_start; r < item->record_end; r++) {
+				fprintf(stdout, " report%i = %s\n",
+					r - item->record_start,
+					intel_perf_read_report_reason(reader.perf, reader.records[r]));
+				print_report_deltas(&reader,
+						    reader.records[r],
+						    reader.records[r + 1],
+						    counters, n_counters);
 			}
 		}
 	}
-- 
2.25.1
