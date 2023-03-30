Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884C10EE08
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 13:06:06 +0000 (UTC)
Received: from linux.intel.com (pludynia-mobl.ger.corp.intel.com [10.252.3.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3F925580C4C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 06:05:24 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1phrxy-00BSaY-0z
 for igt-dev@lists.freedesktop.org; Thu, 30 Mar 2023 15:05:22 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Mar 2023 15:05:07 +0200
Message-Id: <20230330130518.2731441-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
References: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 01/12] xe_test_config.json: do some
 adjustments at the output hierarchy
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

Place "Mega feature" inside the same hierarchical level,
placing it on a higher level than sub-category, as this provides
a higher level of group for functionalities.

While here, better document the fields.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/xe/xe_test_config.json | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/xe/xe_test_config.json b/tests/xe/xe_test_config.json
index 6c474d6053f3..666fe6cd315c 100644
--- a/tests/xe/xe_test_config.json
+++ b/tests/xe/xe_test_config.json
@@ -4,27 +4,27 @@
     "fields": {
         "Category": {
             "_properties_": {
-                "description": "Contains the major group for the tested functionality"
+                "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
             },
-            "Sub-category": {
+            "Mega feature": {
                 "_properties_": {
-                    "description": "Contains the minor group of the functionality"
-                },
-                "Functionality": {
-                    "_properties_": {
-                        "description": "Groups page table tests per functionality"
-                    }
+                    "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                 },
-                "Run type": {
+                "Sub-category": {
                     "_properties_": {
-                        "description": "Defines what category of testlist it belongs"
+                        "description": "Contains the the technical feature/functionality"
+                    },
+                    "Functionality": {
+                        "_properties_": {
+                            "description": "Groups page table tests on buckets containg more detailed functionality"
+                        }
+                    },
+                    "Run type": {
+                        "_properties_": {
+                            "description": "Defines what category of testlist it belongs"
+                        }
                     }
                 }
-            },
-            "Mega feature": {
-                "_properties_": {
-                    "description": "Contains the mega feature for E2E use case"
-                }
             }
         },
         "Test category": {
-- 
2.39.2
