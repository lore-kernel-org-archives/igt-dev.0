Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2A10E252
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:55:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:16:56 +0530
Message-Id: <20230815164815.320904-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 02/81] testplan/kms: Add support to
 differentiate b/w drivers
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

Add support to differentiate the subtests based on the driver
support, since many kms tests supports both i915 & xe drivers.

Add a new field "Driver requirement" to test_config.json

Example:
- Driver requirement: i915 (i915 specific test)
- Driver requirement: xe   (xe specific test)
- Driver requirement: i915, xe  (tests supports both i915 & xe)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/kms_test_config.json | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
index 447a13337..7a43da74e 100644
--- a/tests/kms_test_config.json
+++ b/tests/kms_test_config.json
@@ -23,6 +23,11 @@
                 }
             }
         },
+        "Driver requirement": {
+            "_properties_": {
+                "description": "Describes any Driver specific requrirement, like i915/xe."
+            }
+        },
         "Test category": {
             "_properties_": {
                 "description": "Defines the test category. Usually used at subtest level."
-- 
2.40.0
