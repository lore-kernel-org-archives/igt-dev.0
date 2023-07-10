Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A555B10E277
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 11:54:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 391D3580DAF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 04:53:59 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qIpSn-002vw8-0x
 for igt-dev@lists.freedesktop.org; Mon, 10 Jul 2023 13:53:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jul 2023 13:53:54 +0200
Message-Id: <20230710115354.699245-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 7/7] scripts/test_list.py: optimize check
 regex
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

Running re.sub() for an already compiled regex makes it recompile
again. Change the logic to use the right syntax. While here, also use
rstrip() to remove \n at the end of read files.

Before:

	$ time ./scripts/igt_doc.py --config tests/i915/i915_*json --check --igt build/

	real	0m1.492s
	user	0m1.457s
	sys	0m0.030s

After:
	$ time ./scripts/igt_doc.py --config tests/i915/i915_*json --check --igt build/

	real	0m0.492s
	user	0m0.473s
	sys	0m0.017s

It is now 3 times faster (measured for i915 driver, which has
more IGT tests).

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 2c1a6f230fb5..19ed5e5467f5 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -401,10 +401,10 @@ class TestList:
 
         for filter_field, regex in self.filters.items():
             if filter_field in subtest:
-                if not re.match(regex, subtest[filter_field]):
+                if not regex.match(subtest[filter_field]):
                     return True
             elif filter_field in test:
-                if not re.match(regex, test[filter_field]):
+                if not regex.match(test[filter_field]):
                     return True
             else:
                 return field_not_found_value
@@ -919,7 +919,7 @@ class TestList:
 
             with open(fname, 'r', encoding='utf8') as handle:
                 for line in handle:
-                    tests.append(line)
+                    tests.append(line.rstrip("\n"))
 
         return sorted(tests)
 
@@ -938,9 +938,11 @@ class TestList:
 
         doc_subtests = set()
 
+        args_regex = re.compile(r'\<[^\>]+\>')
+
         for subtest in self.get_subtests()[""]:
             subtest = "@".join(subtest.split("@")[:3])
-            subtest = re.sub(r'\<[^\>]+\>', r'\\d+', subtest)
+            subtest = args_regex.sub(r'\\d+', subtest)
             doc_subtests.add(subtest)
 
         doc_subtests = list(sorted(doc_subtests))
@@ -957,14 +959,14 @@ class TestList:
         for doc_test in doc_subtests:
             if test_regex != r"":
                 test_regex += r"|"
-            test_regex += r'^' + doc_test + r'$'
+            test_regex += doc_test
 
-        test_regex = re.compile(test_regex)
+        test_regex = re.compile(r'^(' + test_regex + r')$')
 
         for doc_test in doc_subtests:
             found = False
             for run_test in run_subtests:
-                if re.match(test_regex, run_test):
+                if test_regex.match(run_test):
                     found = True
                     break
             if not found:
@@ -972,7 +974,7 @@ class TestList:
 
         for run_test in run_subtests:
             found = False
-            if re.match(test_regex, run_test):
+            if test_regex.match(run_test):
                 found = True
             if not found:
                 run_missing.append(run_test)
@@ -1101,7 +1103,7 @@ class TestList:
                     continue
 
                 # It is a known section. Parse its contents
-                match = re.match(field_re, file_line)
+                match = field_re.match(file_line)
                 if match:
                     current_field = self.field_list[match.group(1).lower()]
                     match_val = match.group(2)
@@ -1198,7 +1200,7 @@ class TestList:
                             self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] += match_val
                     continue
 
-                re.sub(r"\n$","", file_line)
+                file_line.rstrip(r"\n")
                 sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
                          (self.config_fname, file_line))
 
-- 
2.40.1
