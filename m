Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DF010E41D
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 09:35:09 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.19.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7DE23580505
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 02:35:08 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qWZPG-000Jhz-1f
 for igt-dev@lists.freedesktop.org; Thu, 17 Aug 2023 11:35:06 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:35:04 +0200
Message-ID: <20230817093504.75749-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] docs/reference: add links to testplan-based
 documentation
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Instead of relying on runtime-based docs, use the documentation
parsed via testplan for i915, Xe and KMS tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 .../igt-gpu-tools/igt_test_programs.xml       | 63 ++++++++-----------
 docs/reference/igt-gpu-tools/meson.build      |  4 --
 2 files changed, 27 insertions(+), 40 deletions(-)

diff --git a/docs/reference/igt-gpu-tools/igt_test_programs.xml b/docs/reference/igt-gpu-tools/igt_test_programs.xml
index 92bc33ba83f6..51f8cac05f98 100644
--- a/docs/reference/igt-gpu-tools/igt_test_programs.xml
+++ b/docs/reference/igt-gpu-tools/igt_test_programs.xml
@@ -147,42 +147,6 @@
     <xi:include href="igt_test_programs_gem_description.xml"/>
   </refentry>
 
-  <refentry id="igt-gen3-tests">
-    <refnamediv>
-      <refname>Gen 3 Tests</refname>
-      <refpurpose>Tests specific to gen 3</refpurpose>
-    </refnamediv>
-    <xi:include href="igt_test_programs_gen3_programs.xml"/>
-    <xi:include href="igt_test_programs_gen3_description.xml"/>
-  </refentry>
-
-  <refentry id="igt-gen7-tests">
-    <refnamediv>
-      <refname>Gen 7 Tests</refname>
-      <refpurpose>Tests specific to gen 7</refpurpose>
-    </refnamediv>
-    <xi:include href="igt_test_programs_gen7_programs.xml"/>
-    <xi:include href="igt_test_programs_gen7_description.xml"/>
-  </refentry>
-
-  <refentry id="igt-i915-tests">
-    <refnamediv>
-      <refname>i915 Tests</refname>
-      <refpurpose>Tests for overall i915 driver behaviour</refpurpose>
-    </refnamediv>
-    <xi:include href="igt_test_programs_i915_programs.xml"/>
-    <xi:include href="igt_test_programs_i915_description.xml"/>
-  </refentry>
-
-  <refentry id="igt-kms-tests">
-    <refnamediv>
-      <refname>KMS Tests</refname>
-      <refpurpose>Tests for kernel mode setting</refpurpose>
-    </refnamediv>
-    <xi:include href="igt_test_programs_kms_programs.xml"/>
-    <xi:include href="igt_test_programs_kms_description.xml"/>
-  </refentry>
-
   <refentry id="igt-meta-tests">
     <refnamediv>
       <refname>Meta Tests</refname>
@@ -255,6 +219,33 @@
     <xi:include href="igt_test_programs_vgem_description.xml"/>
   </refentry>
 
+  <refentry id="igt-xe-tests">
+    <refnamediv>
+      <refname>
+          <ulink url="../testplan/xe_tests.html" type="http">Xe Tests</ulink>
+      </refname>
+      <refpurpose>Tests for the Intel Xe driver</refpurpose>
+    </refnamediv>
+  </refentry>
+
+  <refentry id="igt-i915-tests">
+    <refnamediv>
+      <refname>
+        <ulink url="../testplan/i915_tests.html" type="http">i915 Tests</ulink>
+      </refname>
+      <refpurpose>Tests for the Intel i915 driver</refpurpose>
+    </refnamediv>
+  </refentry>
+
+  <refentry id="igt-kms-tests">
+    <refnamediv>
+      <refname>
+        <ulink url="../testplan/kms_tests.html" type="http">KMS Tests</ulink>
+      </refname>
+      <refpurpose>Tests for kernel mode setting</refpurpose>
+    </refnamediv>
+  </refentry>
+
   <glossary>
     <title>Glossary</title>
 
diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
index 6b832ad279cf..9bb5ca7e0798 100644
--- a/docs/reference/igt-gpu-tools/meson.build
+++ b/docs/reference/igt-gpu-tools/meson.build
@@ -29,10 +29,6 @@ test_groups = [
 	'debugfs',
 	'drm',
 	'gem',
-	'gen3',
-	'gen7',
-	'i915',
-	'kms',
 	'meta',
 	'perf',
 	'pm',
-- 
2.41.0
