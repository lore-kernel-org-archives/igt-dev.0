Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095356E1E5
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Apr 2020 10:48:23 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Sun, 19 Apr 2020 13:48:19 +0300
Message-Id: <20200419104819.349537-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/perf: fix global-sseu-config-invalid
 for Gen11
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

In 15e8ffecfd55 ("tests/perf: respect gen11 restriction in disable
subslices") I fixed the global-sseu-config subtest which was affect by
the same issue. But global-sseu-config-invalid is also affected by the
Gen11 restriction.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: 779d43cd ("tests/perf: add global sseu parameter tests")
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1543
---
 tests/perf.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/tests/perf.c b/tests/perf.c
index 152d48a7..b7d5e50e 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -4242,6 +4242,27 @@ static void print_sseu_config(struct drm_i915_gem_context_param_sseu *sseu)
 		  sseu->max_eus_per_subslice);
 }
 
+static struct drm_i915_gem_context_param_sseu
+make_valid_reduced_sseu_config(struct drm_i915_gem_context_param_sseu default_sseu)
+{
+	struct drm_i915_gem_context_param_sseu sseu = default_sseu;
+
+	if (intel_gen(devid) == 11) {
+		/*
+		 * On Gen11 there are restrictions on what subslices
+		 * can be disabled, notably we're not able to enable
+		 * more than half the subslice. So disable half
+		 * subslices only.
+		 */
+		for (int i = 0; i < DIV_ROUND_UP(__builtin_popcount(default_sseu.subslice_mask), 2); i++)
+			sseu.subslice_mask = mask_minus_one(sseu.subslice_mask);
+	} else {
+		sseu.subslice_mask = mask_minus_one(sseu.subslice_mask);
+	}
+
+	return sseu;
+}
+
 static void
 test_global_sseu_config_invalid(void)
 {
@@ -4310,8 +4331,7 @@ test_global_sseu_config_invalid(void)
 		igt_fork(child, 1) {
 			igt_drop_root();
 
-			sseu_param = default_sseu;
-			sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
+			sseu_param = make_valid_reduced_sseu_config(default_sseu);
 			do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EACCES);
 		}
 		igt_waitchildren();
@@ -4357,21 +4377,7 @@ test_global_sseu_config(void)
 
 	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 0);
 
-	sseu_param = default_sseu;
-
-	if (intel_gen(devid) == 11) {
-		/*
-		 * On Gen11 there are restrictions on what subslices
-		 * can be disabled, notably we're not able to enable
-		 * more than half the subslice. So disable half
-		 * subslices only.
-		 */
-		for (int i = 0; i < DIV_ROUND_UP(__builtin_popcount(default_sseu.subslice_mask), 2); i++)
-			sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
-	} else {
-		sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
-	}
-
+	sseu_param = make_valid_reduced_sseu_config(default_sseu);
 	igt_debug("Selected context sseu:\n");
 	print_sseu_config(&sseu_param);
 
-- 
2.26.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
