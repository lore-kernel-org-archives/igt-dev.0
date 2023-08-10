Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A01E10E513
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 12:34:08 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A3124580DB2
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 05:34:06 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qU4rc-0044FI-1s
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 14:34:04 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 14:32:29 +0200
Message-ID: <20230810123402.969597-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230810123402.969597-1-mauro.chehab@linux.intel.com>
References: <20230810123402.969597-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] xe_test_config.json: mark some fields
 are mandatory at subtest level
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

Some IGT Xe tests were added without proper documentation.
Currently, igt_doc.py doesn't know what fields are mandatory or
not, so it can't enforce it.

Add a field to mark those.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_test_config.json | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/xe/xe_test_config.json b/tests/xe/xe_test_config.json
index 08c39de74384..8fb65d02d840 100644
--- a/tests/xe/xe_test_config.json
+++ b/tests/xe/xe_test_config.json
@@ -5,6 +5,7 @@
     "fields": {
         "Category": {
             "_properties_": {
+                "mandatory": true,
                 "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
             },
             "Mega feature": {
@@ -13,10 +14,12 @@
                 },
                 "Sub-category": {
                     "_properties_": {
+                        "mandatory": true,
                         "description": "Contains the the technical feature/functionality"
                     },
                     "Functionality": {
                         "_properties_": {
+                            "mandatory": true,
                             "description": "Groups page table tests on buckets containg more detailed functionality"
                         },
                         "Feature": {
@@ -27,6 +30,7 @@
                     },
                     "Run type": {
                         "_properties_": {
+                            "mandatory": true,
                             "description": "Defines what category of testlist it belongs",
                             "order": [
                                 "boot",
@@ -75,6 +79,7 @@
         },
         "Description" : {
             "_properties_": {
+                "mandatory": true,
                 "description": "Provides a description for the test/subtest."
             }
         }
-- 
2.41.0
