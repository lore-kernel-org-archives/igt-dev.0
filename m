Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C304010E54D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 11:41:20 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.24.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BFCA2580D93
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 04:41:18 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qCIgd-00HXNw-37
 for igt-dev@lists.freedesktop.org; Thu, 22 Jun 2023 13:41:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 13:41:14 +0200
Message-Id: <20230622114114.4179898-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe/xe_test_config.json: add
 core_hotunplug.c to Xe tests
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

Changeset 9dd259184050 ("intel-ci/xe-fast-feedback.testlist: Add core hotunplug test")
added a core test to Xe without placing it at the documentation.

Fixes: 9dd259184050 ("intel-ci/xe-fast-feedback.testlist: Add core hotunplug test")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_test_config.json | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_test_config.json b/tests/xe/xe_test_config.json
index e89f998bc66b..08c39de74384 100644
--- a/tests/xe/xe_test_config.json
+++ b/tests/xe/xe_test_config.json
@@ -1,7 +1,7 @@
 {
     "description": "JSON file to be used to parse Xe documentation",
     "name": "Tests for Xe Driver",
-    "files": [ "xe_*.c" ],
+    "files": [ "xe_*.c", "../core_hotunplug.c" ],
     "fields": {
         "Category": {
             "_properties_": {
@@ -18,6 +18,11 @@
                     "Functionality": {
                         "_properties_": {
                             "description": "Groups page table tests on buckets containg more detailed functionality"
+                        },
+                        "Feature": {
+                            "_properties_": {
+                                "description": "Describes the lowest level feature bucket"
+                            }
                         }
                     },
                     "Run type": {
-- 
2.40.1
