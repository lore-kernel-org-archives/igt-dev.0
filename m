Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC72C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 11:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADF71133E0;
	Wed, 17 Apr 2024 11:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6n29Uqg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4A51133E0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713352425; x=1744888425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cJvrd+dgEXE/m523XSwWkfAwvrkYTIImRwwhWYzkahg=;
 b=M6n29Uqgi4w15B1mlxqPoEZvIj+aMx+k8mEl8IHOxepb8GHiWgsFcTdl
 m4Aafi40BhJTSP9zZ2+yGllbay0Ao2ZLfUgfEFY591w0m65fuk26oiMRH
 HnW9CjoCiZ2Sl7H5Ta685kaFBedvrvvf1gREMhcww4oZFynhCc8edqN8X
 4RZSLsWGRlVOIH/Ni9Tqx7CyuYjY3bjLNUgl4+tk79GUQEWH6IflCvW5N
 GGrioMMfhJgRnhEj7lAxGvBA4856agQecnavPvUmZEGc/yczguHeMOSaQ
 093JgxDaUL/W6K3dcjvMYr+fJDBH+0AeAqH8ZaFJDMzyV87JkvUeKFjmO w==;
X-CSE-ConnectionGUID: HuycYZlSR2iRtCvyi/ve/w==
X-CSE-MsgGUID: xBKpTDGYT6yrcKkUq6fW1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8699118"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8699118"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:13:44 -0700
X-CSE-ConnectionGUID: mnA7HetIT2KDpPXP3HDOkQ==
X-CSE-MsgGUID: 1XIS+5EvQdOkkrIK83mUOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="27384096"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:13:43 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel: Put "Run type" highest in
 documentation hierarchy
Date: Wed, 17 Apr 2024 11:13:24 +0000
Message-Id: <20240417111324.3231762-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417111324.3231762-1-katarzyna.piecielska@intel.com>
References: <20240417111324.3231762-1-katarzyna.piecielska@intel.com>
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

Let's put "Run type" at highest place in documentation hierarchy. It
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

