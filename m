Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D2710E6BA
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 07:12:59 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.50.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 798535807E2
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 23:12:57 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r8bEF-000TlC-24
 for igt-dev@lists.freedesktop.org; Thu, 30 Nov 2023 08:12:55 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 08:11:50 +0100
Message-ID: <20231130071253.114028-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231130071253.114028-1-mauro.chehab@linux.intel.com>
References: <20231130071253.114028-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] scripts/igt_doc.py: rewrite intelci
 testlist logic
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

Cleanup the block/accept testlist code, reducing one step on it,
and fixing some issues at testlist generation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 181 +++++++++++++++++++++++++--------------------
 1 file changed, 99 insertions(+), 82 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 0ec6e3e5ec97..df3f72c8d69f 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,C0201,C0206
+# pylint: disable=C0301,R0914,R0915,R1702
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
@@ -56,7 +56,7 @@ class IgtTestList(TestList):
         subtest_dict = self.expand_dictionary(True)
 
         # Create a tests_per_list dict
-        gpus = set()
+        gpu_set = set()
         tests_per_list = {}
         split_regex = re.compile(r",\s*")
 
@@ -68,115 +68,126 @@ class IgtTestList(TestList):
             for run_type in set(split_regex.split(run_types)):
                 run_type = run_type.lower()
 
-                if run_type.startswith(tuple(self.drivers)):
-                    run_type_set.add(run_type)
-                else:
-                    for driver in self.drivers:
-                        run_type = f"{driver.lower()}_{run_type}"
-                        run_type_set.add(run_type)
+                drivers = set(self.drivers)
 
-            for run_type in run_type_set:
-                if run_type not in tests_per_list:
-                    tests_per_list[run_type] = {}
+                for driver in self.drivers:
+                    driver = driver.lower()
 
-                if subname not in tests_per_list[run_type]:
-                    tests_per_list[run_type][subname] = {}
-
-                if "GPU" in subtest:
-                    for gpu_list in split_regex.split(subtest["GPU"]):
-                        gpus.add(gpu_list)
-                        tests_per_list[run_type][subname][gpu_list] = True
-
-                if "GPU excluded platform" in subtest:
-                    for gpu_list in split_regex.split(subtest["GPU excluded platform"]):
-                        gpus.add(gpu_list)
-                        tests_per_list[run_type][subname][gpu_list] = False
-
-        # Handle block and permit lists
-
-        for run_type in tests_per_list.keys():
-            for subname, gpu in tests_per_list[run_type].items():
-
-                # Trivial case: fields not defined
-                if not gpus:
-                    tests_per_list[run_type][subname]["default"] = True
-                    continue
-
-                if not gpu:
-                    tests_per_list[run_type][subname] = {}
-                    for gpu in gpus:
-                        tests_per_list[run_type][subname][gpu] = True
-                    continue
-
-                default_gpu_value = True
-                for gpu, value in tests_per_list[run_type][subname].items():
-                    if value:
-                        default_gpu_value = False
+                    if run_type.startswith(driver):
+                        run_type = re.sub(r"^" + driver + r"[\W_]*", "", run_type)
+                        drivers = set([driver])
                         break
-                    if not gpu in tests_per_list[run_type][subname]:
-                        for gpu in gpus:
-                            tests_per_list[run_type][subname][gpu] = default_gpu_value
 
-                if "all" in tests_per_list[run_type][subname]:
-                    if not tests_per_list[run_type][subname]["all"]:
-                        for gpu in gpus:
-                            tests_per_list[run_type][subname][gpu] = False
+                run_type_set.add(run_type)
 
-                if default_gpu_value:
-                    tests_per_list[run_type][subname]["default"] = True
+            for driver in drivers:
+                if driver not in tests_per_list:
+                    tests_per_list[driver] = {}
 
-        return (gpus, tests_per_list)
+                for run_type in run_type_set:
+                    if run_type not in tests_per_list[driver]:
+                        tests_per_list[driver][run_type] = {}
 
-    def write_intelci_testlist(self, directory):
-        '''Create testlist directory (if needed) and files'''
+                    if subname not in tests_per_list[driver][run_type]:
+                        tests_per_list[driver][run_type][subname] = {}
 
-        if not os.path.exists(directory):
-            os.makedirs(directory)
+                    if "GPU" in subtest:
+                        for gpu in split_regex.split(subtest["GPU"]):
+                            gpu_set.add(gpu)
+                            tests_per_list[driver][run_type][subname][gpu] = True
+
+                    if "GPU excluded platform" in subtest:
+                        for gpu in split_regex.split(subtest["GPU excluded platform"]):
+                            gpu_set.add(gpu)
+                            tests_per_list[driver][run_type][subname][gpu] = False
+
+        # Create a testlist dictionary
 
-        (gpus, tests_per_list)  = self.gen_intelci_testlist()
         testlists = {}
 
-        for run_type in tests_per_list.keys():
-            for subname, gpu_dict in tests_per_list[run_type].items():
-                for gpu, value in gpu_dict.items():
-                    if gpu == "all":
+        for driver, run_types in tests_per_list.items():
+            testlists[driver] = {}
+            for run_type, subnames in run_types.items():
+                for subname, gpus in subnames.items():
+                    if not gpu_set:
+                        gpu = "default"
+
+                    if gpu not in testlists[driver]:
+                        testlists[driver][gpu] = {}
+
+                    if run_type not in testlists[driver][gpu]:
+                        testlists[driver][gpu][run_type] = set()
+
+                    # Trivial case: fields not defined
+                    if not gpu_set:
+                        testlists[driver][gpu][run_type].add(subname)
+                        continue
+
+                    # Globally blocklisted values
+                    if "all" in tests_per_list[driver][run_type][subname]:
                         continue
 
-                    gpu = re.sub(r"[\W_]+", "-", gpu).lower()
-                    name = re.sub(r"[\W_]+", "-", run_type).lower()
-                    name = re.sub(r"_+", "_", name)
+                    # Nothing blocked of explicitly added.
+                    # It means that test should be on testlists
+                    if not gpus:
+                        for gpu in gpu_set:
+                            if gpu == "all":
+                                continue
+
+                            if gpu not in testlists[driver]:
+                                testlists[driver][gpu] = {}
 
-                    drivers = set(self.drivers)
+                            if run_type not in testlists[driver][gpu]:
+                                testlists[driver][gpu][run_type] = set()
+
+                            testlists[driver][gpu][run_type].add(subname)
+                        continue
 
-                    for driver in self.drivers:
-                        driver = driver.lower()
+                    default_gpu_value = True
 
-                        if name.startswith(driver):
-                            all_drivers = False
-                            name = re.sub(r"^" + driver + r"[\W_]*", "", name)
-                            drivers = set([driver])
+                    # If GPU field is used, default is to block list
+                    for gpu, value in gpus.items():
+                        if value:
+                            default_gpu_value = False
                             break
 
-                    for driver in drivers:
-                        if driver not in testlists:
-                            testlists[driver] = {}
-
+                    for gpu, value in gpus.items():
                         if gpu not in testlists[driver]:
                             testlists[driver][gpu] = {}
 
-                        if name not in testlists[driver][gpu]:
-                            testlists[driver][gpu][name] = set()
+                        if run_type not in testlists[driver][gpu]:
+                            testlists[driver][gpu][run_type] = set()
 
-                        testlists[driver][gpu][name].add(subname)
+                        value = default_gpu_value
+                        if gpu in tests_per_list[driver][run_type][subname]:
+                            value = tests_per_list[driver][run_type][subname]
 
-        for driver in testlists.keys():
+                        if value:
+                            testlists[driver][gpu][run_type].add(subname)
+
+                    if default_gpu_value:
+                        testlists[driver][gpu][run_type].add(subname)
+
+        return (testlists, gpu_set)
+
+    def write_intelci_testlist(self, directory):
+        '''Create testlist directory (if needed) and files'''
+
+        if not os.path.exists(directory):
+            os.makedirs(directory)
+
+        testlists = self.gen_intelci_testlist()
+
+        for driver, gpus in testlists[0].items():
             driver_path = os.path.join(directory, driver)
             try:
                 os.makedirs(driver_path)
             except FileExistsError:
                 pass
 
-            for gpu, names in testlists[driver].items():
+            for gpu, names in gpus.items():
+                gpu = re.sub(r"[\W_]+", "-", gpu).lower()
+
                 dname = os.path.join(driver_path, gpu)
                 try:
                     os.makedirs(dname)
@@ -185,7 +196,13 @@ class IgtTestList(TestList):
 
                 for testlist, subtests in names.items():
                     if testlist == "":
+                        if not subtests:
+                            continue
+
                         testlist = "other"
+                    else:
+                        testlist = re.sub(r"[\W_]+", "-", testlist).lower()
+                        testlist = re.sub(r"_+", "_", testlist)
 
                     if not subtests:
                         print(f"Warning: empty testlist: {testlist}")
-- 
2.42.0
