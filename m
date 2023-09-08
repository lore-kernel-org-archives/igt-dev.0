Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400B710E04B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 10:32:38 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:31:52 +0200
Message-ID: <20230908103218.1089792-11-mauro.chehab@linux.intel.com>
In-Reply-To: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
References: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 10/11] scripts/doc_to_xls.py: expand GPU
 excluded platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

As this item reflect blacklists, better to expand it at the
spreadsheet, as it makes easier to filter for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/doc_to_xls.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/doc_to_xls.py b/scripts/doc_to_xls.py
index 8531eeb81779..3af3488928cf 100755
--- a/scripts/doc_to_xls.py
+++ b/scripts/doc_to_xls.py
@@ -48,6 +48,10 @@ for config_file in parse_args.config:
 wb = Workbook()
 ws = None
 
+expand_fields = {
+    "GPU excluded platform": "blacklist "
+}
+
 for row in range(len(tests)):
     test = tests[row]
     sheet_name = test.title
@@ -58,7 +62,7 @@ for row in range(len(tests)):
     else:
         ws = wb.create_sheet(sheet_name)
 
-    sheet = test.get_spreadsheet()
+    sheet = test.get_spreadsheet(expand_fields)
 
     max_length = []
     for col in range(len(sheet[row])):
-- 
2.41.0
