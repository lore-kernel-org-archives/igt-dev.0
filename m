Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E3010E6A3
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 14:55:18 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.5.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DCCFA580ABF
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 07:55:14 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qbj4i-0020HD-2o
 for igt-dev@lists.freedesktop.org; Thu, 31 Aug 2023 16:55:12 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 16:52:07 +0200
Message-ID: <20230831145509.477543-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20230831145509.477543-1-mauro.chehab@linux.intel.com>
References: <20230831145509.477543-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 05/11] scripts/test_list.py: filename
 arguments for print_ methods are optional
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

Add a default to those, as the code doesn't need any arguments.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index d0d56954b010..9ab33f15d970 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -595,7 +595,7 @@ class TestList:
     # Output methods
     #
 
-    def print_rest_flat(self, filename):
+    def print_rest_flat(self, filename = None):
 
         """Print tests and subtests ordered by tests"""
 
@@ -707,7 +707,7 @@ class TestList:
                     sheet[row].append('')
         return sheet
 
-    def print_nested_rest(self, filename):
+    def print_nested_rest(self, filename = None):
 
         """Print tests and subtests ordered by tests"""
 
-- 
2.41.0
