Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0349589133
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Dec 2020 03:20:17 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 28 Dec 2020 05:19:40 +0200
Message-Id: <20201228031940.178954-4-lionel.g.landwerlin@intel.com>
In-Reply-To: <20201228031940.178954-1-lionel.g.landwerlin@intel.com>
References: <20201228031940.178954-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/i915/perf: don't forget last
 timeline element
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
List-ID: <igt-dev@lists.freedesktop.org>

We're currently dropping the last element of the timeline.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: 43116ee368585d ("lib/i915-perf: add i915 perf data reader")
---
 lib/i915/perf_data_reader.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index 4b68fb502..065fe6066 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -298,17 +298,23 @@ static void
 generate_cpu_events(struct intel_perf_data_reader *reader)
 {
 	uint32_t last_header_idx = 0;
-	const struct drm_i915_perf_record_header *last_header = reader->records[0];
+	const struct drm_i915_perf_record_header *last_header = reader->records[0],
+		*current_header = reader->records[0];
+	const uint8_t *start_report, *end_report;
+	uint32_t last_ctx_id, current_ctx_id;
+	uint64_t gpu_ts_start, gpu_ts_end;
 
 	for (uint32_t i = 1; i < reader->n_records; i++) {
-		const struct drm_i915_perf_record_header *current_header =
-			reader->records[i];
-		const uint8_t *start_report = (const uint8_t *) (last_header + 1),
-			*end_report = (const uint8_t *) (current_header + 1);
-		uint32_t last_ctx_id = oa_report_ctx_id(&reader->devinfo, start_report),
-			current_ctx_id = oa_report_ctx_id(&reader->devinfo, end_report);
-		uint64_t gpu_ts_start = oa_report_timestamp(start_report),
-			gpu_ts_end = oa_report_timestamp(end_report);
+		current_header = reader->records[i];
+
+		start_report = (const uint8_t *) (last_header + 1);
+		end_report = (const uint8_t *) (current_header + 1);
+
+		last_ctx_id = oa_report_ctx_id(&reader->devinfo, start_report);
+		current_ctx_id = oa_report_ctx_id(&reader->devinfo, end_report);
+
+		gpu_ts_start = oa_report_timestamp(start_report);
+		gpu_ts_end = oa_report_timestamp(end_report);
 
 		if (last_ctx_id == current_ctx_id)
 			continue;
@@ -318,6 +324,9 @@ generate_cpu_events(struct intel_perf_data_reader *reader)
 		last_header = current_header;
 		last_header_idx = i;
 	}
+
+	if (last_header != current_header)
+		append_timeline_event(reader, gpu_ts_start, gpu_ts_end, last_header_idx, reader->n_records - 1, last_ctx_id);
 }
 
 static void
-- 
2.30.0.rc2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
