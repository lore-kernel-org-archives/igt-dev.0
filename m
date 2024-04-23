Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14ABC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 09:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C094113276;
	Tue, 23 Apr 2024 09:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU/Favt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC737113276
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 09:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713866056; x=1745402056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bF6pjbCDgGHLp5v3u1DEWsYRdCVGRTRyPRTawyC34Tw=;
 b=HU/Favt/r8K580uGriUc37d+zJj3mYFIC2l5LLfeUMe3w/0XiDYQza80
 KGtIlrXtlaNqZ+uCNrGjPYapQOh1TBvXgg006PXC1IHyvPRyLuZseNsn7
 HdEYnW5i/DcBquG/boiN3rose+PJF6Us6+ECdkTuvFMUB+GSI208oKZJ/
 1wi43GzuusJItq7HV160aclpbSRQX5ETblDLp33N+yenXivIRVd2U4/Qf
 rdVtxe31pfiNEIzyyS4uXGXQCwjulrf0B1goyKNSEepBrCI1mSimM2Pg5
 /yUcwIIZOsw6a+KkJP16n/Rq0wNJqPJcyiIcmQjEXvP9vpYpxv+mWZHcP w==;
X-CSE-ConnectionGUID: /ZnfC+2ySgepBrfYIOkw3A==
X-CSE-MsgGUID: nbsd+sT8TAmOL/zBElXndQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9306091"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9306091"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:54:16 -0700
X-CSE-ConnectionGUID: snYIMH96TDiWyQ5ayzEXAw==
X-CSE-MsgGUID: zRI0TGE2Se24XPaurUzAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24322588"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:54:14 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/intel: Put "Run type" highest in KMS
 documentation hierarchy
Date: Tue, 23 Apr 2024 09:53:43 +0000
Message-Id: <20240423095344.3518545-3-katarzyna.piecielska@intel.com>
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

Let's put "Run type" at highest place in KMS documentation hierarchy. It
will be reflected in html generated documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/kms_test_config.json | 94 ++++++++++++++++----------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index f3f6bfad6..35010d886 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -6,56 +6,56 @@
     "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
                        "kms_dsc_helper.c" ],
     "fields": {
-        "Category": {
+        "Run type": {
             "_properties_": {
-                "description": "Contains the major group for the tested functionality 'Display'"
-            },
-            "Mega feature": {
-                "_properties_": {
-                    "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
-                },
-                "Functionality": {
-                    "_properties_": {
-                        "description": "Groups tests on buckets containg more detailed functionality"
-                    }
-                }
-            },
-            "Run type": {
-                "_properties_": {
-                    "description": "Defines what category of testlist it belongs",
-                    "update-from-file": {
-                        "append-value-if-not-excluded": "Xe FULL, i915 FULL",
-                        "exclude-type": "regex-ignorecase",
-                        "include": [
-                            { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
-                            { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
-                            { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
+                "description": "Defines what category of testlist it belongs",
+                "update-from-file": {
+                    "append-value-if-not-excluded": "Xe FULL, i915 FULL",
+                    "exclude-type": "regex-ignorecase",
+                    "include": [
+                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
+                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
+                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
 
-                            { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
-                            { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
-                        ],
-                        "exclude": [
-                            { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
+                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
+                        { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
+                    ],
+                    "exclude": [
+                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
                             { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                         ]
                     }
-                }
-            }
-        },
-        "Driver requirement": {
-            "_properties_": {
-                "description": "Describes any Driver specific requrirement, like i915/xe."
-            }
-        },
-        "Test category": {
-            "_properties_": {
-                "description": "Defines the test category. Usually used at subtest level."
-            }
-        },
-        "Description" : {
-            "_properties_": {
-                "description": "Provides a description for the test/subtest."
-            }
-        }
-    }
+                },
+				"Category": {
+					"_properties_": {
+						"description": "Contains the major group for the tested functionality 'Display'"
+					},
+					"Mega feature": {
+						"_properties_": {
+							"description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
+						},
+						"Functionality": {
+							"_properties_": {
+								"description": "Groups tests on buckets containg more detailed functionality"
+							}
+						}
+					}
+				},
+				"Driver requirement": {
+					"_properties_": {
+						"description": "Describes any Driver specific requrirement, like i915/xe."
+					}
+				},
+				"Test category": {
+					"_properties_": {
+						"description": "Defines the test category. Usually used at subtest level."
+					}
+				},
+				"Description" : {
+					"_properties_": {
+						"description": "Provides a description for the test/subtest."
+					}
+				}
+			}
+	}
 }
-- 
2.34.1

