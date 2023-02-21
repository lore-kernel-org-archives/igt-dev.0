Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD21A10E121
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 08:36:00 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.8.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9B7AF580D2C
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 00:35:46 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pUO7k-004Wwi-2O
 for igt-dev@lists.freedesktop.org; Tue, 21 Feb 2023 09:35:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Feb 2023 09:35:38 +0100
Message-Id: <20230221083541.1079643-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
References: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/7] scripts/igt_doc.py: add support to
 specify numeric values
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

Add a way to specify a set of default values to be used when numeric
wildcards like "%d" are present at the igt subtest.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 3f061a5fcfd3..a1d3a0350499 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -126,6 +126,27 @@ class TestList:
          * @userptr-misaligned-binds:	userptr misaligned
          */
 
+    It is also possible to define a list of values that will actually be
+    used by the test and no string replacement is needed.
+    This is done by using one or multiple arg[n].values lines:
+
+        /**
+         * SUBTEST: unbind-all-%d-vmas
+         * Description: unbind all with %arg[1] VMAs
+         *
+         * arg[1].values: 2, 8
+         * arg[1].values: 16, 32
+         */
+
+        /**
+         * SUBTEST: unbind-all-%d-vmas
+         * Description: unbind all with %arg[1] VMAs
+         *
+         * arg[1].values: 64, 128
+         */
+
+    Such feature is specially useful for numeric parameters
+
     The valid `field` values are defined on a JSON configuration file.
 
     The TEST documents the common fields present on all tests. Typically,
@@ -703,6 +724,21 @@ class TestList:
 
                     continue
 
+                # We don't need a multi-lined version here
+                if (match := re.match(r'arg\[(\d+)\]\.values:\s*(.*)', file_line)):
+                    cur_arg = int(match.group(1)) - 1
+
+                    if cur_arg not in self.doc[current_test]["arg"][arg_ref]:
+                        self.doc[current_test]["arg"][arg_ref][cur_arg] = {}
+
+                    values = match.group(2).split(",")
+                    for split_val in values:
+                        if split_val == "":
+                            continue
+                        self.doc[current_test]["arg"][arg_ref][cur_arg][split_val.strip()] = split_val.strip()
+
+                    continue
+
                 if (match := re.match(r'^(.*):', file_line)):
                     sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized field '%s'. Need to add at %s" %
                             (match.group(1), self.config_fname))
-- 
2.39.2
