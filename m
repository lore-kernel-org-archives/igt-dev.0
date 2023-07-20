Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC8410E60A
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 23:18:04 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 16:17:52 -0700
Message-ID: <20230720231756.3464641-17-ashutosh.dixit@intel.com>
In-Reply-To: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
References: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 16/20] tests/i915/perf: Skip
 intel_ctx_create_all_physical for xe
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

intel_ctx_create_all_physical is only available for i915.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 0efa7f71477d..bfe4dd6ee533 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5955,7 +5955,7 @@ test_group_concurrent_oa_buffer_read(void)
 
 igt_main
 {
-	const intel_ctx_t *ctx;
+	const intel_ctx_t *ctx = NULL;
 	const struct intel_execution_engine2 *e;
 
 	igt_subtest("i915-ref-count")
@@ -5985,8 +5985,11 @@ igt_main
 
 		igt_require(init_sys_info());
 
-		ctx = intel_ctx_create_all_physical(drm_fd);
-		set_default_engine(ctx);
+		if (!is_xe_device(drm_fd)) {
+			ctx = intel_ctx_create_all_physical(drm_fd);
+			set_default_engine(ctx);
+		}
+
 		write_u64_file(i9xe.sysctl_path_paranoid, 1);
 		write_u64_file(i9xe.sysctl_path_max_sample_rate, 100000);
 
-- 
2.41.0
