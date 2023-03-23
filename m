Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEA910E4A2
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:39 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:06 -0700
Message-Id: <20230323225534.3739835-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 02/30] i915/perf: Define a default engine
 for OA
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

Use a helper to set the default engine for use with OA.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 48bd17a5..f7883de6 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -215,6 +215,7 @@ static int sysfs = -1;
 static int pm_fd = -1;
 static int stream_fd = -1;
 static uint32_t devid;
+static struct intel_execution_engine2 default_e2;
 
 static uint64_t gt_max_freq_mhz = 0;
 static struct intel_perf *intel_perf = NULL;
@@ -5084,8 +5085,19 @@ static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
 	return false;
 }
 
+static void set_default_engine(const intel_ctx_t *ctx)
+{
+	const struct intel_execution_engine2 *e;
+
+	for_each_ctx_engine(drm_fd, ctx, e)
+		if (e->class == I915_ENGINE_CLASS_RENDER && e->instance == 0)
+			default_e2 = *e;
+}
+
 igt_main
 {
+	const intel_ctx_t *ctx;
+
 	igt_fixture {
 		struct stat sb;
 
@@ -5123,6 +5135,8 @@ igt_main
 
 		igt_require(init_sys_info());
 
+		ctx = intel_ctx_create_all_physical(drm_fd);
+		set_default_engine(ctx);
 		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
 
@@ -5310,6 +5324,7 @@ igt_main
 		if (intel_perf)
 			intel_perf_free(intel_perf);
 
+		intel_ctx_destroy(drm_fd, ctx);
 		close(drm_fd);
 	}
 }
-- 
2.36.1
