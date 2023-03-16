Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9907C10E363
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:30 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:33:21 -0700
Message-Id: <20230316233323.2638668-30-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 29/31] lib/i915/perf: Adjust the GPU
 timestamp for new OA formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In some OA formats, gpu_ts is a 64 bit value and the right shift can
result in bit[31] being set. This throws off the correlation and the
timelines. Apply the mask on gpu_ts as well.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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
