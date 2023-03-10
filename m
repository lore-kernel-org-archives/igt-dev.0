Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E8310E323
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 19:42:29 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 20:41:19 +0100
Message-Id: <20230310194125.14781-14-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 13/19] xe/xe_test_config.json: cleanup
 the field struct
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

Originally, the JSON file was conceived to also validate fields
and only allow certain values when others are present.

It turns that it doesn't make much sense to do such validations,
as it makes harder to change the hierarchy. So, remove the
parts of the fields struct that doesn't contain "is_field".

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/xe/xe_test_config.json | 80 ++++--------------------------------
 1 file changed, 9 insertions(+), 71 deletions(-)

diff --git a/tests/xe/xe_test_config.json b/tests/xe/xe_test_config.json
index 05ba71c6b8..6c474d6053 100644
--- a/tests/xe/xe_test_config.json
+++ b/tests/xe/xe_test_config.json
@@ -4,128 +4,66 @@
     "fields": {
         "Category": {
             "_properties_": {
-                "is_field": true,
                 "description": "Contains the major group for the tested functionality"
             },
-            "Hardware": {
+            "Sub-category": {
                 "_properties_": {
-                    "description": "Harware-supported build blocks"
+                    "description": "Contains the minor group of the functionality"
                 },
-                "Sub-category": {
+                "Functionality": {
                     "_properties_": {
-                        "is_field": true,
-                        "description": "Contains the minor group of the functionality"
-                    },
-                    "Page table": {
-                        "Functionality": {
-                            "_properties_": {
-                                "is_field": true,
-                                "description": "Groups page table tests per functionality"
-                            }
-                        }
-                    },
-                    "Unified Shared Memory building block": {
-                        "Functionality": {
-                            "_properties_": {
-                                "is_field": true,
-                                "description": "Groups page table tests per functionality"
-                            }
-                        }
-                    },
-                    "Compression": {
-                        "Functionality": {
-                            "_properties_": {
-                                "is_field": true
-                            }
-                        }
+                        "description": "Groups page table tests per functionality"
                     }
-                }
-            },
-            "Software building block": {
-                "_properties_": {
-                    "description": "Software-based building blocks"
                 },
-                "Sub-category": {
-                    "_properties_": {
-                        "is_field": true,
-                        "description": "Contains the minor group of the functionality"
-                    }
-                }
-            },
-            "Software feature": {
-                "Sub-category": {
+                "Run type": {
                     "_properties_": {
-                        "is_field": true,
-                        "description": "Contains the minor group of the functionality"
+                        "description": "Defines what category of testlist it belongs"
                     }
                 }
             },
-            "End to end use case": {
-                "Sub-category": {
-                    "_properties_": {
-                        "is_field": true,
-                        "description": "Contains the minor group of the functionality"
-                    }
-                },
-                "Mega feature": {
-                    "_properties_": {
-                        "is_field": true,
-                        "description": "Contains the mega feature for E2E use case"
-                    }
+            "Mega feature": {
+                "_properties_": {
+                    "description": "Contains the mega feature for E2E use case"
                 }
             }
         },
         "Test category": {
             "_properties_": {
-                "is_field": true,
                 "description": "Defines the test category. Usually used at subtest level."
             }
         },
         "Test requirement": {
             "_properties_": {
-                "is_field": true,
                 "description": "Defines Kernel parameters required for the test to run"
             }
         },
-        "Run type": {
-            "_properties_": {
-                "is_field": true,
-                "description": "Defines the test primary usage. Usually used at subtest level."
-            }
-        },
         "Issue": {
             "_properties_": {
-                "is_field": true,
                 "description": "If the test is used to solve an issue, point to the URL containing the issue."
             }
         },
         "GPU excluded platform": {
             "_properties_": {
-                "is_field": true,
                 "description": "Provides a list of GPUs not capable of running the subtest (or the test as a hole)."
             }
         },
         "GPU requirement": {
             "_properties_": {
-                "is_field": true,
                 "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
             }
         },
         "Depends on" : {
             "_properties_": {
-                "is_field": true,
                 "description": "List other subtests that are required to not be skipped before calling this one."
             }
         },
         "TODO": {
             "_properties_": {
-                "is_field": true,
                 "description": "Point to known missing features at the test or subtest."
             }
         },
         "Description" : {
             "_properties_": {
-                "is_field": true,
                 "description": "Provides a description for the test/subtest."
             }
         }
-- 
2.34.1
