Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC92D10E53E
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 13:59:01 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 46B4B580C3B
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 06:59:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJaMs-00412N-1E
 for igt-dev@lists.freedesktop.org; Wed, 12 Jul 2023 15:58:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 15:58:52 +0200
Message-Id: <20230712135854.957128-12-mauro.chehab@linux.intel.com>
In-Reply-To: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 11/13] scripts/test_list.py: filename
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

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 6e3cab206e82..1551bc92c010 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -616,7 +616,7 @@ class TestList:
     # Output methods
     #
 
-    def print_rest_flat(self, filename):
+    def print_rest_flat(self, filename = None):
 
         """Print tests and subtests ordered by tests"""
 
@@ -728,7 +728,7 @@ class TestList:
                     sheet[row].append('')
         return sheet
 
-    def print_nested_rest(self, filename):
+    def print_nested_rest(self, filename = None):
 
         """Print tests and subtests ordered by tests"""
 
-- 
2.40.1
