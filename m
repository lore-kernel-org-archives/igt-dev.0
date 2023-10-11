Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C5D10E648
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 10:26:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 15:47:22 +0530
Message-Id: <20231011101722.3188258-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20231011101722.3188258-1-bhanuprakash.modem@intel.com>
References: <20231011101722.3188258-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 4/4] tests/intel-ci: Add module-reload test to
 CI
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

Add igt@kms_pm_rpm@module-reload test to CI

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/blacklist.txt          | 1 +
 tests/intel-ci/fast-feedback.testlist | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index e13759d3e..13504dac3 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -15,6 +15,7 @@ igt@meta_test(@.*)?
 #igt@i915_module_load(@.*)? # danger, danger; hope for taints!
 igt@i915_pm_rpm@module-reload
 igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
+igt@kms_pm_rpm@module-reload
 ###############################################
 # GEM
 ###############################################
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index c252e2cf0..8b70f139a 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -164,6 +164,7 @@ igt@gem_lmem_swapping@parallel-random-engines
 igt@gem_lmem_swapping@random-engines
 igt@gem_lmem_swapping@verify-random
 igt@i915_pm_rpm@module-reload
+igt@kms_pm_rpm@module-reload
 
 # Kernel selftests
 igt@i915_selftest@live
-- 
2.40.0
