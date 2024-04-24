Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BCFC10F15
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 08:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF321138DC;
	Wed, 24 Apr 2024 08:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VujiQscb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D691138DB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713945953; x=1745481953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fcERp4l8XTvZqbW8GOpqqj4Tjno1a5o18Bpg9yeelMY=;
 b=VujiQscbOtWxhycut6VjSFq+0P3GK8WyLb7M1d312u7i5jyYj3QR2H0z
 YM3CFRyL3pKRKZaviYLj2tkqnoI4tetUvsmeWBsPonfdgjVwy6QGDhPU5
 gHfmP3r+C3A9AQz200uzAmQPfBtmVoLE8YuSEGFHFqXNAGgwZstFNWZHy
 aWaY6hFPMxCAivL86kDTfF64z0ZTLpWnV0ndDzaOca0/n25fCU8rC+2mO
 /Cssxr0fVBV20bb+xdOaj5n6QEKU7Z7U2so+rstbxS+4CSrvLdLZziW/i
 aZH43p7suNHHPLm7PS+wY/3jn/9Y2Bx7eqKjI2YormXYTUw4YYUzX5mAJ Q==;
X-CSE-ConnectionGUID: Xtc1L/NBRRmgCQGve79E4Q==
X-CSE-MsgGUID: CzsQjG8FReCGWHwiiCNxBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9727113"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9727113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:05:53 -0700
X-CSE-ConnectionGUID: TlbaWIhHRUWeGx7miwPopA==
X-CSE-MsgGUID: +XhKn5gZSfqYpcEkLJejFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29096673"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:05:51 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v3 1/3] tests/intel: Put "Run type" highest in Xe
 documentation hierarchy
Date: Wed, 24 Apr 2024 08:05:31 +0000
Message-Id: <20240424080533.3611723-2-katarzyna.piecielska@intel.com>
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

Let's put "Run type" at highest place in Xe documentation hierarchy. It
will be reflected in html generated documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/xe_test_config.json | 66 ++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 22b43ffac..f88883414 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -4,51 +4,51 @@
     "drivers": [ "xe" ],
     "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c" ],
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
+                    "append-value-if-not-excluded": "Xe FULL",
+                    "include": [
+                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
+                    ],
+                    "exclude": [
+                        { "Xe BAT, Xe FULL": "../intel-ci/xe.blocklist.txt" }
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
-                        "description": "Contains the the technical feature/functionality"
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
-                                "append-value-if-not-excluded": "Xe FULL",
-                                "include": [
-                                    { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
-                                ],
-                                "exclude": [
-                                    { "Xe BAT, Xe FULL": "../intel-ci/xe.blocklist.txt" }
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

