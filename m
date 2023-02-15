Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3BD10EA01
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 00:46:53 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 16:46:19 -0800
Message-Id: <20230215004648.2100655-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/31] i915/perf: Define a default engine
 for OA
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

Use a helper to set the default engine for use with OA.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index c74434fe..15ffb50e 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -228,6 +228,7 @@ static int sysfs = -1;
 static int pm_fd = -1;
 static int stream_fd = -1;
 static uint32_t devid;
+static struct intel_execution_engine2 default_e2;
 
 static uint64_t gt_max_freq_mhz = 0;
 static struct intel_perf *intel_perf = NULL;
@@ -5097,8 +5098,19 @@ static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
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
 
@@ -5136,6 +5148,8 @@ igt_main
 
 		igt_require(init_sys_info());
 
+		ctx = intel_ctx_create_all_physical(drm_fd);
+		set_default_engine(ctx);
 		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
 
@@ -5323,6 +5337,7 @@ igt_main
 		if (intel_perf)
 			intel_perf_free(intel_perf);
 
+		intel_ctx_destroy(drm_fd, ctx);
 		close(drm_fd);
 	}
 }
-- 
2.36.1
