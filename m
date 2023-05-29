Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9E110E214
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:34:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 10:57:18 +0530
Message-Id: <20230529052835.860047-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 05/82] testplan/kms: Add support to
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
- Driver requirement: any  (tests supports both i915 & xe)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/kms_test_config.json | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
index 2c6181e55..39025c41d 100644
--- a/tests/kms_test_config.json
+++ b/tests/kms_test_config.json
@@ -23,6 +23,11 @@
                 "description": "Defines what category of testlist it belongs"
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
