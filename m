Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3881010E8D4
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 19:53:05 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Oct 2022 19:52:53 +0000
Message-Id: <20221028195258.106453-24-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
References: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 23/28] tools/i915-perf: record remaining
 perf data on exit
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

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index f8f9b737..d16f1546 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -1144,6 +1144,11 @@ main(int argc, char *argv[])
 
 	fprintf(stdout, "Exiting...\n");
 
+	if (!write_i915_perf_data(ctx.output_stream, ctx.perf_fd)) {
+		fprintf(stderr, "Failed to write i915-perf data: %s\n",
+			strerror(errno));
+	}
+
 	if (!write_correlation_timestamps(ctx.output_stream, ctx.drm_fd)) {
 		fprintf(stderr,
 			"Failed to write final i915 timestamp correlation data: %s\n",
-- 
2.25.1
