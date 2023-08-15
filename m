Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949FB10E258
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:55:51 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:16:55 +0530
Message-Id: <20230815164815.320904-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 01/81] testplan/kms: Keep category as high
 level entity
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

Update kms testplan to keep the category as high level entity.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/kms_test_config.json | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
index 5fbe40bdc..447a13337 100644
--- a/tests/kms_test_config.json
+++ b/tests/kms_test_config.json
@@ -6,21 +6,21 @@
         "Category": {
             "_properties_": {
                 "description": "Contains the major group for the tested functionality 'Display'"
-            }
-        },
-        "Mega feature": {
-            "_properties_": {
-                "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
             },
-            "Functionality": {
+            "Mega feature": {
                 "_properties_": {
-                    "description": "Groups tests on buckets containg more detailed functionality"
+                    "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
+                },
+                "Functionality": {
+                    "_properties_": {
+                        "description": "Groups tests on buckets containg more detailed functionality"
+                    }
+                }
+            },
+            "Run type": {
+                "_properties_": {
+                    "description": "Defines what category of testlist it belongs"
                 }
-            }
-        },
-        "Run type": {
-            "_properties_": {
-                "description": "Defines what category of testlist it belongs"
             }
         },
         "Test category": {
-- 
2.40.0
