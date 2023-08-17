Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7E410E46D
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 13:33:11 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.19.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B6873580D81
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 06:33:10 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qWd7c-000MUC-1X
 for igt-dev@lists.freedesktop.org; Thu, 17 Aug 2023 15:33:08 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 15:33:07 +0200
Message-ID: <20230817133307.86426-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] README.md and docs: describe how to
 document tests
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

Add some documentation describing how to document tests,
with both the legacy way and via testplan.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 README.md                  |   6 +-
 docs/test_documentation.md | 179 +++++++++++++++++++++++++++++++++++++
 2 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 docs/test_documentation.md

diff --git a/README.md b/README.md
index 66f2bc0fa1bd..efa525b041c0 100644
--- a/README.md
+++ b/README.md
@@ -49,6 +49,10 @@ Documentation is built using
 
     $ ninja -C build igt-gpu-tools-doc
 
+Please notice that some drivers and test sets may require that all
+tests to be properly documented via testplan. By default, build
+will fail if one forgets to document or update the documentation.
+This is currently enabled for the Xe, i915 drivers and for KMS tests.
 
 Running Tests
 -------------
@@ -164,7 +168,7 @@ was used to generate them.
 Imported i915_drm.h uapi headers from airlied's drm-next branch.
 
 In some cases updating a single uapi file is needed as our history
-shows. So in this case, it should be done by:
+shows. In this case, it should be done by:
 
     # From the kernel dir with a drm/drm-next commit checked out:
     $ make INSTALL_HDR_PATH=<dest-dir> headers_install
diff --git a/docs/test_documentation.md b/docs/test_documentation.md
new file mode 100644
index 000000000000..f21bf69def16
--- /dev/null
+++ b/docs/test_documentation.md
@@ -0,0 +1,179 @@
+IGT Test documentation
+======================
+
+Legacy way
+----------
+
+IGT has been providing a way to document tests in runtime by using tree macros:
+
+    - IGT_TEST_DESCRIPTION(test_file_description)
+    - igt_describe(subtest_description) and igt_describe_f(format, args...)
+
+This is limited, as:
+    - Each test/subtest has just one “field”: description. So, it doesn't
+      allow specifying what features are tested and/or special requirements;
+    - It is meant to produce a very concise documentation;
+    - Integration with external platforms to group tests per category
+      is not possible, as there's no way to tell what category each test
+      belongs;
+    - Format is not easily expansible;
+    - The build system doesn’t verify if all tests are documented. So,
+      documentation tends to be outdated or forgotten, as new patches
+      modify the test set.
+
+Documentation via structured comments (testplan)
+------------------------------------------------
+
+With the addition of Xe driver, a new way to document tests was added.
+It is based on special comment-like annotation inside the C code.
+
+It was written to be flexible, so the valid fields to be used by is
+described on a JSON configuration file. That makes easy to add/modify
+the fields as needed. It is also easy to use the documentation to
+integrate with external reporting tools.
+
+As an additional benefit, the documentation tags will be generating a
+Restructured Text file. So, it is possible to add enriched test
+descriptions if needed.
+
+Also, the build system can optionally enforce a check at build time to
+verify if the documentation is in place.
+
+testplan configuration file
+---------------------------
+
+The configuration file contains the fields to be used for documenting
+tests, and the test names. It may also mark a property as mandatory.
+
+A typical example is:
+
+```
+{
+    "description": "JSON example file",
+    "name": "Tests for XYZ Driver",
+    "files": [ "test.c" ],
+    "fields": {
+        "Feature": {
+            "_properties_": {
+                "description": "Feature to be tested"
+            }
+        },
+        "Description" : {
+            "_properties_": {
+                "mandatory": true,
+                "description": "Provides a description for the test/subtest."
+            }
+        }
+    }
+}
+```
+
+Documenting tests via testplan
+------------------------------
+
+A typical documentation markup at the test source code looks like:
+```
+/**
+ * TEST: Check if new IGT test documentation logic functionality is working
+ * Mega-feature: IGT test documentation
+ * Category: Software build block
+ * Sub-category: documentation
+ * Functionality: test documentation
+ * Issue: none
+ * Description: Complete description of this test
+ *
+ * SUBTEST: foo
+ * Description: do foo things.
+ *      Foo description continuing on another line
+ *
+ * SUBTEST: bar
+ * Description:
+ *      Do bar things.
+ *      Bar description continuing on another line
+ */
+```
+
+It is also possible to add variables to the documentation with:
+
+```
+/**
+ * SUBTEST: test-%s-binds-with-%ld-size-%s
+ * Description: Test arg[3] arg[1] binds with arg[2] size
+ *
+ * SUBTEST: test-%s-%ld-size
+ * Description: Test arg[1] with %arg[2] size
+ *
+ * arg[1]:
+ *
+ * @large:      large
+ *              something
+ * @small:      small
+ *              something
+ *
+ * arg[2]:      buffer size
+ *
+ * arg[3]:
+ *
+ * @misaligned-binds:           misaligned
+ * @userptr-binds:              user pointer
+ */
+ ```
+
+The first "%s" will be replaced by the values of arg[1] for the subtest
+name. At the description, arg[1] will be replaced by the string after
+the field description. The same applies to the subsequent wildcards.
+
+So, the above will produce the following output (using the example
+configuration file described at the past session:
+
+```
+``igt@test@test-large-<buffer size>-size``
+
+:Description: Test large something with <buffer size> size
+
+
+``igt@test@test-large-binds-with-<buffer size>-size-misaligned-binds``
+
+:Description: Test misaligned large something binds with <buffer size> size
+
+
+``igt@test@test-small-binds-with-<buffer size>-size-misaligned-binds``
+
+:Description: Test misaligned small something binds with <buffer size> size
+
+
+``igt@test@test-small-<buffer size>-size``
+
+:Description: Test small something with <buffer size> size
+
+
+``igt@test@test-large-binds-with-<buffer size>-size-userptr-binds``
+
+:Description: Test user pointer large something binds with <buffer size> size
+
+
+``igt@test@test-small-binds-with-<buffer size>-size-userptr-binds``
+
+:Description: Test user pointer small something binds with <buffer size> size
+```
+
+Wildcard replacement can also be used to maintain an argument with the
+same name at the replaced description. That makes easy to document
+numeric arguments with a fixed testset, like:
+
+```
+/**
+ * SUBTEST: unbind-all-%d-vmas
+ * Description: unbind all with %arg[1] VMAs
+ *
+ * arg[1].values: 2, 8
+ * arg[1].values: 16, 32
+ */
+
+/**
+ * SUBTEST: unbind-all-%d-vmas
+ * Description: unbind all with %arg[1] VMAs
+ *
+ * arg[1].values: 64, 128
+ */
+```
-- 
2.41.0
