Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAFE10E17A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 16:45:56 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.94.248.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6DD24580DC5
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 08:45:54 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r81Dc-000KA0-1s
 for igt-dev@lists.freedesktop.org; Tue, 28 Nov 2023 17:45:52 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Nov 2023 17:43:03 +0100
Message-ID: <20231128164551.77343-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20231128164551.77343-1-mauro.chehab@linux.intel.com>
References: <20231128164551.77343-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC 3/3] igt_doc: ensure that the driver name will
 be there
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

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py   | 22 ++++++++++++++++++----
 scripts/test_list.py |  5 +++++
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index a807d2bb373d..c982a97148c9 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -61,9 +61,20 @@ class IgtTestList(TestList):
         split_regex = re.compile(r",\s*")
 
         for subname, subtest in subtest_dict.items():
-            run_type = subtest.get("Run type", "other")
+            run_types = subtest.get("Run type", "other")
+            run_type_set = set(split_regex.split(run_types))
+
+            run_type_set = set()
+            for run_type in set(split_regex.split(run_types)):
+                run_type = run_type.lower()
+
+                if run_type.startswith(tuple(self.drivers)):
+                    run_type_set.add(run_type)
+                else:
+                    for driver in self.drivers:
+                        run_type = f"{driver.lower()}_{run_type}"
+                        run_type_set.add(run_type)
 
-            run_type_set = set(split_regex.split(run_type))
             for run_type in run_type_set:
                 if run_type not in tests_per_list:
                     tests_per_list[run_type] = {}
@@ -126,10 +137,10 @@ class IgtTestList(TestList):
             for subname, gpu_dict in tests_per_list[run_type].items():
                 for gpu, value in gpu_dict.items():
                     run_name = re.sub(r"[\W_]+", "-", run_type)
-                    gpu = re.sub(r"[\W_]+", "-", gpu)
+                    gpu = re.sub(r"[\W_]+", "-", gpu).lower()
 
                     if gpus:
-                        name = f"{run_name}_{gpu}".lower()
+                        name = f"{run_name}_{gpu}"
                     else:
                         name = run_name.lower()
 
@@ -148,6 +159,9 @@ class IgtTestList(TestList):
             if testlist == "":
                 testlist = "other"
 
+            if not subtests:
+                print(f"Warning: empty testlist: {testlist}")
+                continue
 
             fname = os.path.join(directory, testlist) + ".testlist"
             with open(fname, 'w', encoding='utf8') as handler:
diff --git a/scripts/test_list.py b/scripts/test_list.py
index 36eea5fb1c76..1164f5bc40df 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -292,6 +292,11 @@ class TestList:
 
         self.driver_name = driver_name
 
+        if "drivers" in self.config:
+            self.drivers = self.config["drivers"]
+        else:
+            self.drivers = [driver_name]
+
         if sources_path:
             cfg_path = os.path.realpath(sources_path) + "/"
 
-- 
2.42.0
