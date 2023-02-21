Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED39F10E10F
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 08:35:59 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.8.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9727F580C2F
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 00:35:46 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pUO7k-004WwZ-2D
 for igt-dev@lists.freedesktop.org; Tue, 21 Feb 2023 09:35:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Feb 2023 09:35:35 +0100
Message-Id: <20230221083541.1079643-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
References: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/7] scripts/igt_doc.py: beautify its code
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

Change some comments and add blank lines before docstring, in
order to better document its code.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 scripts/igt_doc.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 mode change 100755 => 100644 scripts/igt_doc.py

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
old mode 100755
new mode 100644
index b7e3129d3f54..c8bd4054f638
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -109,7 +109,6 @@ class TestList:
     SUBTEST as those variables are locally processed on each comment line.
     """
 
-
     def __init__(self):
         self.doc = {}
         self.test_number = 0
@@ -238,7 +237,7 @@ class TestList:
 
     def print_test(self):
 
-        """Print tests and subtests ordered by tests"""
+        """Print tests and subtests"""
 
         for test in sorted(self.doc.keys()):
             fname = self.doc[test]["File"]
@@ -368,7 +367,7 @@ class TestList:
     # File handling methods
     #
 
-    def add_file_documentation(self, fname, field_re):
+    def add_file_documentation(self, fname):
 
         """Adds the contents of test/subtest documentation form a file"""
 
-- 
2.39.2
