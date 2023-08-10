Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1437910E19E
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 15:13:14 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1FF67580CD0
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 08:13:13 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qU7Lb-005cPQ-0c
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 17:13:11 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 17:10:31 +0200
Message-ID: <20230810151303.1338975-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230810151303.1338975-1-mauro.chehab@linux.intel.com>
References: <20230810151303.1338975-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] scripts/test_list.py: add a check
 for missing features
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

Some fields shall always be present at the documentation.

Add a check for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 4f580fb3de58..c23d6d735edf 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -936,13 +936,27 @@ class TestList:
         if self.filters:
             print("NOTE: test checks are affected by filters")
 
+        mandatory_fields = set()
+        for field, item in self.props.items():
+            if item["_properties_"].get("mandatory"):
+                    mandatory_fields.add(field)
+
         doc_subtests = set()
 
         args_regex = re.compile(r'\<[^\>]+\>')
 
-        for subtest in self.get_subtests()[""]:
+        missing_mandatory_fields = False
+
+        subtests = self.expand_dictionary(True)
+        for subtest, data in sorted(subtests.items()):
             subtest = "@".join(subtest.split("@")[:3])
             subtest = args_regex.sub(r'\\d+', subtest)
+
+            for field in mandatory_fields:
+                if field not in data:
+                    print(f"Warning: {subtest} {field} documentation is missing")
+                    missing_mandatory_fields = True
+
             doc_subtests.add(subtest)
 
         doc_subtests = list(sorted(doc_subtests))
-- 
2.41.0
