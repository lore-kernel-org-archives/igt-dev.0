Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB5810E459
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 15:06:48 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D7DFF580E7F
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 08:06:45 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qHQZ9-002SAG-1k
 for igt-dev@lists.freedesktop.org; Thu, 06 Jul 2023 17:06:43 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:06:38 +0200
Message-Id: <20230706150638.581415-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20230706150638.581415-1-mauro.chehab@linux.intel.com>
References: <20230706150638.581415-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 5/5] scripts/test_list.py: speedup
 testlist check logic
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

Now that the build system will generate the testlist for us,
just read them when checking for missing symbols.

This should speed up a log the check logic.

After the change, touching on a single file and rebuilding the
testplan with check enabled is a lot faster:

	$ touch tests/xe/xe_compute.c
	$ time make
	ninja -C build
	ninja: Entering directory `build'
	[10/10] Generating docs/testplan/i915_tests.html with a custom command

	real	0m4.510s
	user	0m5.944s
	sys	0m0.217s

This can be improved even further if we split the test_executables
dependencies per driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index a55d2977c7c3..2c1a6f230fb5 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -909,35 +909,17 @@ class TestList:
 
         return subtests
 
-    def __get_testlist(self, name):
-        match = re.match(r"(.*/)?(.*)\.c$", name)
-        if not match:
-            return []
-
-        basename = "igt@" + match.group(2)
-
-        fname = os.path.join(self.igt_build_path, "tests", match.group(2))
-        if not os.path.isfile(fname):
-            print(f"Error: file {fname} doesn't exist.")
-            sys.exit(1)
-        try:
-            result = subprocess.run([ fname, "--list-subtests" ],
-                                    check = True,
-                                    stdout = subprocess.PIPE,
-                                    universal_newlines=True)
-            subtests = result.stdout.splitlines()
-
-            return [basename  + "@" + i for i in subtests]
-        except subprocess.CalledProcessError:
-            # Handle it as a test using igt_simple_main
-            return [basename]
-
     def get_testlist(self):
 
         """ Return a list of tests as reported by --list-subtests """
         tests = []
         for name in self.filenames:
-            tests += self.__get_testlist(name)
+            fname = re.sub(r"\.c$", ".testlist", name.split('/')[-1])
+            fname = os.path.join(self.igt_build_path, "tests", fname)
+
+            with open(fname, 'r', encoding='utf8') as handle:
+                for line in handle:
+                    tests.append(line)
 
         return sorted(tests)
 
-- 
2.40.1
