Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03F2C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 08:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE3F1138DC;
	Wed, 24 Apr 2024 08:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pp+7SZPx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041271138DA
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713945974; x=1745481974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JPJiyN1VMgGg9zmXsq7FOdZImPKJR4NmTNjCAPaB5Ps=;
 b=Pp+7SZPxglu07sJZhg9Ce16z+2d+x3RBUFFiZ2g5+/bjjPi8E2szSklV
 zXPeINmHt5rNWu3glgfEd1CAT6VXCiQu2ribkcdopAzHs592ajtQOIa5e
 Phxj4Z1xvjcDq4jpHOwKAoxUZPC2y/3/VZhTZt/+4ECEXkLhtxsZx1UkK
 iOpI8vWr29ZNMEr51BGValU7LkxbhusklWRX4h7IvQe9ZftF2BzUGbYs4
 juBiEz7vZ04U8WE3i118r+UZvBUlhv/HOG8tMMvp1+QQUkymF0nD1e0g6
 IV/Po8zkIKDnxv8BY0tLPmN3zZERMi5Vsqtqvg5hAiNTUvJNbGu6+PYTU Q==;
X-CSE-ConnectionGUID: xQ3pDaROS3SFIWtDKyzNQw==
X-CSE-MsgGUID: XM3kJUSDQeK1JAGLHtzdXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27077942"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="27077942"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:06:13 -0700
X-CSE-ConnectionGUID: Y2M7cgScQiCe4x4uYAY9yQ==
X-CSE-MsgGUID: KOKk+J/iQiuU6C5g+93Cqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="62098573"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:06:12 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/intel: Put "Run type" highest in i915
 documentation hierarchy
Date: Wed, 24 Apr 2024 08:05:33 +0000
Message-Id: <20240424080533.3611723-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424080533.3611723-1-katarzyna.piecielska@intel.com>
References: <20240424080533.3611723-1-katarzyna.piecielska@intel.com>
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

v2: move only required fields under 'Run type'

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/i915_test_config.json | 66 +++++++++++++++----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index 61638a4f1..f51ae2a55 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -16,51 +16,51 @@
     "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c",
                        "xe_*" ],
     "fields": {
-        "Category": {
+        "Run type": {
             "_properties_": {
                 "mandatory": true,
-                "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
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
+                },
+                "order": [
+                    "boot",
+                    "__all__",
+                    "kunit"
+                ]
             },
-            "Mega feature": {
+            "Category": {
                 "_properties_": {
-                    "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
+                    "mandatory": true,
+                    "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
                 },
-                "Sub-category": {
+                "Mega feature": {
                     "_properties_": {
-                        "mandatory": true,
-                        "description": "Contains the technical feature/functionality"
+                        "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                     },
-                    "Functionality": {
+                    "Sub-category": {
                         "_properties_": {
                             "mandatory": true,
-                            "description": "Groups page table tests on buckets containg more detailed functionality"
+                            "description": "Contains the technical feature/functionality"
                         },
-                        "Feature": {
+                        "Functionality": {
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
+                                "description": "Groups page table tests on buckets containg more detailed functionality"
                             },
-                            "order": [
-                                "boot",
-                                "__all__",
-                                "kunit"
-                            ]
+                            "Feature": {
+                                "_properties_": {
+                                    "description": "Describes the lowest level feature bucket"
+                                }
+                            }
                         }
                     }
                 }
-- 
2.34.1

