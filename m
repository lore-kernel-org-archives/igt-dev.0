Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DF110E886
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 08:37:42 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.24.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9F22A580EAF
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 01:37:38 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qeWzg-004YDS-26
 for igt-dev@lists.freedesktop.org; Fri, 08 Sep 2023 10:37:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 10:27:46 +0200
Message-ID: <20230908083734.1084351-11-mauro.chehab@linux.intel.com>
In-Reply-To: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
References: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 10/11] scripts/doc_to_xls.py: expand GPU
 excluded platform
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
