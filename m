Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7814C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 09:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3BD1121BB;
	Tue, 23 Apr 2024 09:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoLkjjwC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D105D10FB6B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713866065; x=1745402065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7hLrgbkwfegJniTBcgiP0hDA0vLx9WhRGtQl261AkUU=;
 b=HoLkjjwCUB2CJHo+SesX7llcZaikKlh0NCU4YSRPfPKtOOhylHu3j5BF
 D20m+ZhVdy3v8P2cAIVWW1F6+MeKpmgdZgxJLJoGfIdhPL5W9XtDZ8DLQ
 oLGqi7MlYJLUuMzBiyVhRq+H2+3UYmFIXExv0dC9QvgKcIDwNUHzNKaf9
 FovpT3wIXHMND8KPCDYvar+4MTY0dfB/ngyygl1r5zUkYt0PMPFgNPCEN
 ofP3890t4xypltIEgM7nFoF0v4tGonhp3c5TF2r7JiWTsEk+fh5yHcMB9
 yabrpG+dllGiCyM25kG8YosFgS7NFU+AdNOBSMPkpS8KEIcx37MEPHLNS A==;
X-CSE-ConnectionGUID: 06NE7Y94QqaJW1E1gJ1/oA==
X-CSE-MsgGUID: xu2aWSHRRIGkavoSOmcDjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13273046"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13273046"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:54:25 -0700
X-CSE-ConnectionGUID: h4L1FEsDS/+225l0FsMGqw==
X-CSE-MsgGUID: S4ZJxQpeRPmaA+4rVM+jnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24833753"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:54:23 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/intel: Put "Run type" highest in i915
 documentation hierarchy
Date: Tue, 23 Apr 2024 09:53:44 +0000
Message-Id: <20240423095344.3518545-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423095344.3518545-1-katarzyna.piecielska@intel.com>
References: <20240423095344.3518545-1-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Let's put "Run type" at highest place in i915 documentation hierarchy. It
will be reflected in html generated documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/i915_test_config.json | 150 +++++++++++++++---------------
 1 file changed, 75 insertions(+), 75 deletions(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index 61638a4f1..7b4e11ab5 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -16,94 +16,94 @@
     "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c",
                        "xe_*" ],
     "fields": {
-        "Category": {
+        "Run type": {
             "_properties_": {
                 "mandatory": true,
-                "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
-            },
-            "Mega feature": {
-                "_properties_": {
-                    "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
+                "description": "Defines what category of testlist it belongs",
+                "default-testlist": "FULL",
+                "update-from-file": {
+                    "exclude-type": "regex-ignorecase",
+                    "append-value-if-not-excluded": "i915 FULL",
+                    "include": [
+                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
+                    ],
+                    "exclude": [
+                        { "all": "../intel-ci/blacklist.txt" }
+                    ]
                 },
-                "Sub-category": {
+                "order": [
+                    "boot",
+                    "__all__",
+                    "kunit"
+                ]
+            },
+	        "Category": {
                     "_properties_": {
                         "mandatory": true,
-                        "description": "Contains the technical feature/functionality"
+                        "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
                     },
-                    "Functionality": {
+                    "Mega feature": {
                         "_properties_": {
-                            "mandatory": true,
-                            "description": "Groups page table tests on buckets containg more detailed functionality"
+                            "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                         },
-                        "Feature": {
+                        "Sub-category": {
                             "_properties_": {
-                                "description": "Describes the lowest level feature bucket"
-                            }
-                        }
-                    },
-                    "Run type": {
-                        "_properties_": {
-                            "mandatory": true,
-                            "description": "Defines what category of testlist it belongs",
-                            "default-testlist": "FULL",
-                            "update-from-file": {
-                                "exclude-type": "regex-ignorecase",
-                                "append-value-if-not-excluded": "i915 FULL",
-                                "include": [
-                                    { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
-                                ],
-                                "exclude": [
-                                    { "all": "../intel-ci/blacklist.txt" }
-                                ]
+                                "mandatory": true,
+                                "description": "Contains the technical feature/functionality"
                             },
-                            "order": [
-                                "boot",
-                                "__all__",
-                                "kunit"
-                            ]
+                            "Functionality": {
+                                "_properties_": {
+                                    "mandatory": true,
+                                    "description": "Groups page table tests on buckets containg more detailed functionality"
+                                },
+                                "Feature": {
+                                    "_properties_": {
+                                        "description": "Describes the lowest level feature bucket"
+                                    }
+                                }
+                            }
                         }
                     }
+                },
+            "Test category": {
+                "_properties_": {
+                    "description": "Defines the test category. Usually used at subtest level."
+                }
+            },
+            "Test requirement": {
+                "_properties_": {
+                    "description": "Defines Kernel parameters required for the test to run"
+                }
+            },
+            "Issue": {
+                "_properties_": {
+                    "description": "If the test is used to solve an issue, point to the URL containing the issue."
+                }
+            },
+            "GPU excluded platform": {
+                "_properties_": {
+                    "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
+                }
+            },
+            "GPU requirement": {
+                "_properties_": {
+                    "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
+                }
+            },
+            "Depends on" : {
+                "_properties_": {
+                    "description": "List other subtests that are required to not be skipped before calling this one."
+                }
+            },
+            "TODO": {
+                "_properties_": {
+                    "description": "Point to known missing features at the test or subtest."
+                }
+            },
+            "Description" : {
+                "_properties_": {
+                    "description": "Provides a description for the test/subtest."
                 }
-            }
-        },
-        "Test category": {
-            "_properties_": {
-                "description": "Defines the test category. Usually used at subtest level."
-            }
-        },
-        "Test requirement": {
-            "_properties_": {
-                "description": "Defines Kernel parameters required for the test to run"
-            }
-        },
-        "Issue": {
-            "_properties_": {
-                "description": "If the test is used to solve an issue, point to the URL containing the issue."
-            }
-        },
-        "GPU excluded platform": {
-            "_properties_": {
-                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
-            }
-        },
-        "GPU requirement": {
-            "_properties_": {
-                "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
-            }
-        },
-        "Depends on" : {
-            "_properties_": {
-                "description": "List other subtests that are required to not be skipped before calling this one."
-            }
-        },
-        "TODO": {
-            "_properties_": {
-                "description": "Point to known missing features at the test or subtest."
-            }
-        },
-        "Description" : {
-            "_properties_": {
-                "description": "Provides a description for the test/subtest."
             }
         }
     }
-- 
2.34.1

