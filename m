Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC7F10E3DB
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:38:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:01:26 +0530
Message-Id: <20230523063243.669540-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 05/82] testplan/kms: Add support to
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
---
 tests/kms_test_config.json | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
index b81b3ba55..e563bbd12 100644
--- a/tests/kms_test_config.json
+++ b/tests/kms_test_config.json
@@ -22,6 +22,11 @@
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
