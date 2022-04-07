Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4366810E9E7
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 05:19:14 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Apr 2022 22:19:08 -0700
Message-Id: <20220407051908.3390083-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel-ci/fast-feedback: Move
 gem_lmem_swapping further
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Commit 7506029428b3 ("tests/intel-ci/fast-feedback: Move
gem_lmem_swapping") moved gem_lmem_swapping down. However moving it
just before core_hotunplug is causing multiple warnings in CI.

The tests should work regardless of the order, but let's not tank the CI
results.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index e24d2fa4..f6329708 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -166,13 +166,13 @@ igt@vgem_basic@sysfs
 # They will sometimes reveal issues of earlier tests leaving the
 # driver in a broken state that is not otherwise noticed in that test.
 
+igt@core_hotunplug@unbind-rebind
+igt@vgem_basic@unload
+igt@i915_module_load@reload
 igt@gem_lmem_swapping@basic
 igt@gem_lmem_swapping@parallel-random-engines
 igt@gem_lmem_swapping@random-engines
 igt@gem_lmem_swapping@verify-random
-igt@core_hotunplug@unbind-rebind
-igt@vgem_basic@unload
-igt@i915_module_load@reload
 igt@i915_pm_rpm@module-reload
 igt@i915_suspend@system-suspend-without-i915
 
-- 
2.35.1
