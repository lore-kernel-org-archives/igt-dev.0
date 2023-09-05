Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39D910E50D
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 13:31:26 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue,  5 Sep 2023 18:53:16 +0530
Message-Id: <20230905132316.1666056-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230905132316.1666056-1-bhanuprakash.modem@intel.com>
References: <20230905132316.1666056-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] docs/reference/igt: Update IGT reference docs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Update IGT reference documentation for the renamed i915 tests.

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 .../igt-gpu-tools/igt_test_programs.xml       | 102 ++++++++++--------
 docs/reference/igt-gpu-tools/meson.build      |  14 +--
 2 files changed, 68 insertions(+), 48 deletions(-)

diff --git a/docs/reference/igt-gpu-tools/igt_test_programs.xml b/docs/reference/igt-gpu-tools/igt_test_programs.xml
index 92bc33ba8..c0f11a883 100644
--- a/docs/reference/igt-gpu-tools/igt_test_programs.xml
+++ b/docs/reference/igt-gpu-tools/igt_test_programs.xml
@@ -120,15 +120,6 @@
     <xi:include href="igt_test_programs_core_description.xml"/>
   </refentry>
 
-  <refentry id="igt-debugfs-tests">
-    <refnamediv>
-      <refname>Debugfs Tests</refname>
-      <refpurpose>Tests for debugfs behaviour</refpurpose>
-    </refnamediv>
-    <xi:include href="igt_test_programs_debugfs_programs.xml"/>
-    <xi:include href="igt_test_programs_debugfs_description.xml"/>
-  </refentry>
-
   <refentry id="igt-drm-tests">
     <refnamediv>
       <refname>DRM Tests</refname>
@@ -138,31 +129,76 @@
     <xi:include href="igt_test_programs_drm_description.xml"/>
   </refentry>
 
-  <refentry id="igt-gem-tests">
+  <refentry id="igt-i915-debugfs-tests">
+    <refnamediv>
+      <refname>i915 Debugfs Tests</refname>
+      <refpurpose>Tests for i915 debugfs behaviour</refpurpose>
+    </refnamediv>
+    <xi:include href="igt_test_programs_i915_debugfs_programs.xml"/>
+    <xi:include href="igt_test_programs_i915_debugfs_description.xml"/>
+  </refentry>
+
+  <refentry id="igt-i915-gem-tests">
+    <refnamediv>
+      <refname>i915 GEM Tests</refname>
+      <refpurpose>Tests for the i915 graphics execution manager</refpurpose>
+    </refnamediv>
+    <xi:include href="igt_test_programs_i915_gem_programs.xml"/>
+    <xi:include href="igt_test_programs_i915_gem_description.xml"/>
+  </refentry>
+
+  <refentry id="igt-i915-gen3-tests">
+    <refnamediv>
+      <refname>i915 Gen 3 Tests</refname>
+      <refpurpose>Tests specific to Intel gen 3</refpurpose>
+    </refnamediv>
+    <xi:include href="igt_test_programs_i915_gen3_programs.xml"/>
+    <xi:include href="igt_test_programs_i915_gen3_description.xml"/>
+  </refentry>
+
+  <refentry id="igt-i915-gen7-tests">
     <refnamediv>
-      <refname>GEM Tests</refname>
-      <refpurpose>Tests for the graphics execution manager</refpurpose>
+      <refname>i915 Gen 7 Tests</refname>
+      <refpurpose>Tests specific to Intel gen 7</refpurpose>
     </refnamediv>
-    <xi:include href="igt_test_programs_gem_programs.xml"/>
-    <xi:include href="igt_test_programs_gem_description.xml"/>
+    <xi:include href="igt_test_programs_i915_gen7_programs.xml"/>
+    <xi:include href="igt_test_programs_i915_gen7_description.xml"/>
   </refentry>
 
-  <refentry id="igt-gen3-tests">
+  <refentry id="igt-i915-gen9-tests">
     <refnamediv>
-      <refname>Gen 3 Tests</refname>
-      <refpurpose>Tests specific to gen 3</refpurpose>
+      <refname>i915 Gen 9 Tests</refname>
+      <refpurpose>Tests specific to Intel gen 9</refpurpose>
     </refnamediv>
-    <xi:include href="igt_test_programs_gen3_programs.xml"/>
-    <xi:include href="igt_test_programs_gen3_description.xml"/>
+    <xi:include href="igt_test_programs_i915_gen9_programs.xml"/>
+    <xi:include href="igt_test_programs_i915_gen9_description.xml"/>
   </refentry>
 
-  <refentry id="igt-gen7-tests">
+  <refentry id="igt-i915-perf-tests">
     <refnamediv>
-      <refname>Gen 7 Tests</refname>
-      <refpurpose>Tests specific to gen 7</refpurpose>
+      <refname>i915 Perf Tests</refname>
+      <refpurpose>Tests for the i915 performance metrics</refpurpose>
     </refnamediv>
-    <xi:include href="igt_test_programs_gen7_programs.xml"/>
-    <xi:include href="igt_test_programs_gen7_description.xml"/>
+    <xi:include href="igt_test_programs_i915_perf_programs.xml"/>
+    <xi:include href="igt_test_programs_i915_perf_description.xml"/>
+  </refentry>
+
+  <refentry id="igt-i915-pm-tests">
+    <refnamediv>
+      <refname>i915 PM Tests</refname>
+      <refpurpose>Tests for i915 power management features</refpurpose>
+    </refnamediv>
+    <xi:include href="igt_test_programs_i915_pm_programs.xml"/>
+    <xi:include href="igt_test_programs_i915_pm_description.xml"/>
+  </refentry>
+
+  <refentry id="igt-i915-prime-tests">
+    <refnamediv>
+      <refname>i915 Prime Tests</refname>
+      <refpurpose>Tests for i915 buffer sharing</refpurpose>
+    </refnamediv>
+    <xi:include href="igt_test_programs_i915_prime_programs.xml"/>
+    <xi:include href="igt_test_programs_i915_prime_description.xml"/>
   </refentry>
 
   <refentry id="igt-i915-tests">
@@ -192,24 +228,6 @@
     <xi:include href="igt_test_programs_meta_description.xml"/>
   </refentry>
 
-  <refentry id="igt-perf-tests">
-    <refnamediv>
-      <refname>Perf Tests</refname>
-      <refpurpose>Tests for the performance metrics</refpurpose>
-    </refnamediv>
-    <xi:include href="igt_test_programs_perf_programs.xml"/>
-    <xi:include href="igt_test_programs_perf_description.xml"/>
-  </refentry>
-
-  <refentry id="igt-pm-tests">
-    <refnamediv>
-      <refname>PM Tests</refname>
-      <refpurpose>Tests for power management features</refpurpose>
-    </refnamediv>
-    <xi:include href="igt_test_programs_pm_programs.xml"/>
-    <xi:include href="igt_test_programs_pm_description.xml"/>
-  </refentry>
-
   <refentry id="igt-prime-tests">
     <refnamediv>
       <refname>Prime Tests</refname>
diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
index 6b832ad27..802342db4 100644
--- a/docs/reference/igt-gpu-tools/meson.build
+++ b/docs/reference/igt-gpu-tools/meson.build
@@ -26,16 +26,18 @@ ignore_headers = [
 test_groups = [
 	'amdgpu',
 	'core',
-	'debugfs',
 	'drm',
-	'gem',
-	'gen3',
-	'gen7',
+	'i915_debugfs',
+	'i915_gem',
+	'i915_gen3',
+	'i915_gen7',
+	'i915_gen9',
+	'i915_perf',
+	'i915_pm',
+	'i915_prime',
 	'i915',
 	'kms',
 	'meta',
-	'perf',
-	'pm',
 	'prime',
 	'sw_sync',
 	'testdisplay',
-- 
2.40.0


