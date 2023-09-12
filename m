Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A050810E22C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 09:50:36 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.24.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A3331580BF0
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 02:50:34 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qg02S-000M6f-1w
 for igt-dev@lists.freedesktop.org; Tue, 12 Sep 2023 11:50:32 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 11:50:29 +0200
Message-ID: <20230912095029.84964-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] scripts/test_list.py: check key before
 expanding fields
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

The logic used by doc_to_xls.py expands a field that may or may
not exist, depending on the test set.

Check it to avoig errors like:

  File "/home/mchehab/devel/upstream/igt-gpu-tools/scripts/test_list.py", line 819, in get_spreadsheet
    for field in sorted(list(expand_field_name[item]), key=str.lower):
                             ~~~~~~~~~~~~~~~~~^^^^^^
  KeyError: 'GPU excluded platform'

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 74abdc5ebe65..fdc3c1998d23 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -816,6 +816,9 @@ class TestList:
         for item in sorted(expand_fields.keys(), key=str.lower):
             prefix = expand_fields[item]
 
+            if item not in expand_field_name:
+                continue
+
             for field in sorted(list(expand_field_name[item]), key=str.lower):
                 row = 0
                 sheet[row].append(prefix + field)
-- 
2.41.0
