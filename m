Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07E210E927
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Sep 2022 14:07:47 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Sep 2022 19:37:19 +0530
Message-Id: <20220914140721.3500129-6-riana.tauro@intel.com>
In-Reply-To: <20220914140721.3500129-1-riana.tauro@intel.com>
References: <20220914140721.3500129-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/7] i915/gem_exec_schedule: Add energy
 support for dgfx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

igt_power library reads energy using hwmon interface for dgfx and
rapl otherwise. Modify semaphore-power test to use igt_power interface.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/gem_exec_schedule.c | 49 +++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 4693894f..58b118c7 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -2844,11 +2844,11 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
 static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *signaler, *e;
-	struct rapl gpu, pkg;
+	struct igt_power gpu, pkg;
 	uint64_t ahnd = get_simple_l2h_ahnd(i915, ctx->id);
 
-	igt_require(gpu_power_open(&gpu) == 0);
-	pkg_power_open(&pkg);
+	igt_require(igt_power_open(i915, &gpu, "gpu") == 0);
+	igt_power_open(i915, &pkg, "pkg");
 
 	for_each_ctx_engine(i915, ctx, signaler) {
 		struct {
@@ -2870,11 +2870,11 @@ static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
 		gem_wait(i915, spin->handle, &jiffie); /* waitboost */
 		igt_spin_busywait_until_started(spin);
 
-		rapl_read(&pkg, &s_spin[0].pkg);
-		rapl_read(&gpu, &s_spin[0].gpu);
+		igt_power_get_energy(&pkg, &s_spin[0].pkg);
+		igt_power_get_energy(&gpu, &s_spin[0].gpu);
 		usleep(100*1000);
-		rapl_read(&gpu, &s_spin[1].gpu);
-		rapl_read(&pkg, &s_spin[1].pkg);
+		igt_power_get_energy(&gpu, &s_spin[1].gpu);
+		igt_power_get_energy(&pkg, &s_spin[1].pkg);
 
 		/* Add a waiter to each engine */
 		i = 0;
@@ -2905,34 +2905,33 @@ static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
 				igt_spin_free(i915, sema[i]);
 		usleep(10); /* just give the tasklets a chance to run */
 
-		rapl_read(&pkg, &s_sema[0].pkg);
-		rapl_read(&gpu, &s_sema[0].gpu);
+		igt_power_get_energy(&pkg, &s_sema[0].pkg);
+		igt_power_get_energy(&gpu, &s_sema[0].gpu);
 		usleep(100*1000);
-		rapl_read(&gpu, &s_sema[1].gpu);
-		rapl_read(&pkg, &s_sema[1].pkg);
+		igt_power_get_energy(&gpu, &s_sema[1].gpu);
+		igt_power_get_energy(&pkg, &s_sema[1].pkg);
 
 		igt_spin_free(i915, spin);
 
-		baseline = power_W(&gpu, &s_spin[0].gpu, &s_spin[1].gpu);
-		total = power_W(&gpu, &s_sema[0].gpu, &s_sema[1].gpu);
+		baseline = igt_power_get_mW(&gpu, &s_spin[0].gpu, &s_spin[1].gpu);
+		total = igt_power_get_mW(&gpu, &s_sema[0].gpu, &s_sema[1].gpu);
 		igt_info("%s: %.1fmW + %.1fmW (total %1.fmW)\n",
 			 signaler->name,
-			 1e3 * baseline,
-			 1e3 * (total - baseline),
-			 1e3 * total);
+			 baseline,
+			 (total - baseline),
+			 total);
 
-		if (rapl_valid(&pkg)) {
-			baseline = power_W(&pkg, &s_spin[0].pkg, &s_spin[1].pkg);
-			total = power_W(&pkg, &s_sema[0].pkg, &s_sema[1].pkg);
+		if (igt_power_valid(&pkg)) {
+			baseline = igt_power_get_mW(&pkg, &s_spin[0].pkg, &s_spin[1].pkg);
+			total = igt_power_get_mW(&pkg, &s_sema[0].pkg, &s_sema[1].pkg);
 			igt_info("pkg: %.1fmW + %.1fmW (total %1.fmW)\n",
-				 1e3 * baseline,
-				 1e3 * (total - baseline),
-				 1e3 * total);
+				 baseline,
+				 (total - baseline),
+				 total);
 		}
 	}
-
-	rapl_close(&gpu);
-	rapl_close(&pkg);
+	igt_power_close(&gpu);
+	igt_power_close(&pkg);
 	put_ahnd(ahnd);
 }
 
-- 
2.25.1
