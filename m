Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6031210E23E
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 16:22:51 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:41:53 +0530
Message-Id: <20230907161155.1828658-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230907161155.1828658-1-bhanuprakash.modem@intel.com>
References: <20230907161155.1828658-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 5/7] tests/intel/pm: Rename i915_pm_lpsp to
 kms_pm_lpsp
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

As i915_pm_lpsp is a display specific test, rename it with
the "kms_" prefix, i.e kms_pm_lpsp.

V2: - Rebase
V3: - Restore old Copyright

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/{i915_pm_lpsp.c => kms_pm_lpsp.c} | 0
 tests/meson.build                             | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tests/intel/{i915_pm_lpsp.c => kms_pm_lpsp.c} (100%)

diff --git a/tests/intel/i915_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
similarity index 100%
rename from tests/intel/i915_pm_lpsp.c
rename to tests/intel/kms_pm_lpsp.c
diff --git a/tests/meson.build b/tests/meson.build
index ea8b60282..92729e0c3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -222,7 +222,6 @@ intel_i915_progs = [
 	'i915_pciid',
 	'i915_pipe_stress',
 	'i915_pm_freq_mult',
-	'i915_pm_lpsp',
 	'i915_pm_rpm',
 	'i915_pm_rc6_residency',
 	'i915_pm_rps',
@@ -262,6 +261,7 @@ intel_kms_progs = [
 	'kms_pipe_b_c_ivb',
 	'kms_pm_backlight',
 	'kms_pm_dc',
+	'kms_pm_lpsp',
 	'kms_psr',
 	'kms_psr2_sf',
 	'kms_psr2_su',
-- 
2.40.0
