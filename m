Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B0C10E153
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 16:45:55 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.94.248.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 58640580D96
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 08:45:54 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r81Dc-000K9u-1l
 for igt-dev@lists.freedesktop.org; Tue, 28 Nov 2023 17:45:52 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Nov 2023 17:43:01 +0100
Message-ID: <20231128164551.77343-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231128164551.77343-1-mauro.chehab@linux.intel.com>
References: <20231128164551.77343-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC 1/3] tests/intel: *.json: specify what drivers
 use such tests
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

The test sets defined at the JSON files are meant to be used
by one or more drivers. Specify the driver(s) at the JSON
config file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/i915_test_config.json | 1 +
 tests/intel/kms_test_config.json  | 1 +
 tests/intel/xe_test_config.json   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index c15ef2580688..ad59677f8126 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -1,6 +1,7 @@
 {
     "description": "JSON file to be used to parse i915 documentation",
     "name": "Tests for i915 Driver",
+    "drivers": [ "i915" ],
     "files": [ "*.c", "../core_auth.c", "../core_getclient.c",
                "../core_getstats.c", "../core_getversion.c",
                "../core_hotunplug.c", "../core_setmaster.c",
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index d38562c02ed6..f3f6bfad6eac 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -1,6 +1,7 @@
 {
     "description": "JSON file to be used to parse KMS documentation",
     "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
+    "drivers": [ "xe", "i915" ],
     "files": [ "../chamelium/kms_*.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
     "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
                        "kms_dsc_helper.c" ],
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index a2d764307831..3944a9c8028b 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -1,6 +1,7 @@
 {
     "description": "JSON file to be used to parse Xe documentation",
     "name": "Tests for Xe Driver",
+    "drivers": [ "xe" ],
     "files": [ "xe_*.c", "../core_hotunplug.c", "intel_hwmon.c" ],
     "fields": {
         "Category": {
-- 
2.42.0
