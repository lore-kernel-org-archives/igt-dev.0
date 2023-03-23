Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2609B10EB82
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:45 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:33 -0700
Message-Id: <20230323225534.3739835-30-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 29/30] lib/i915/perf: Adjust the GPU
 timestamp for new OA formats
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

In some OA formats, gpu_ts is a 64 bit value and the right shift can
result in bit[31] being set. This throws off the correlation and the
timelines. Apply the mask on gpu_ts as well.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/perf_data_reader.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index 332f530e..2272ae2c 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -216,6 +216,12 @@ correlate_gpu_timestamp(struct intel_perf_data_reader *reader,
 	uint64_t mask = reader->perf->devinfo.oa_timestamp_mask;
 	int corr_idx = -1;
 
+	/* On some OA formats, gpu_ts is a 64 bit value and the shift can
+	 * result in bit[31] being set. This throws off the correlation and the
+	 * timelines. Apply the mask on gpu_ts as well.
+	 */
+	gpu_ts = gpu_ts & mask;
+
 	for (uint32_t i = 0; i < reader->n_correlation_chunks; i++) {
 		if (gpu_ts >= (reader->correlation_chunks[i].gpu_ts_begin & mask) &&
 		    gpu_ts <= (reader->correlation_chunks[i].gpu_ts_end & mask)) {
-- 
2.36.1
