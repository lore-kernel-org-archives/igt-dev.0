Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5B410E0E1
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 14:31:29 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.2.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 51E86580699
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 07:31:27 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qxTIb-000Z1e-0k
 for igt-dev@lists.freedesktop.org; Mon, 30 Oct 2023 15:31:25 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 15:31:22 +0100
Message-ID: <20231030143122.134627-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel/xe_test_config.json: add
 igt@intel_hwmon to testplan
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

The tests on such file is used on both i915 and Xe driver.
Add it to Xe testplan documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 5fd7c888f274..dd7aa4776ec6 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -1,7 +1,7 @@
 {
     "description": "JSON file to be used to parse Xe documentation",
     "name": "Tests for Xe Driver",
-    "files": [ "xe_*.c", "../core_hotunplug.c" ],
+    "files": [ "xe_*.c", "../core_hotunplug.c", "intel_hwmon.c" ],
     "fields": {
         "Category": {
             "_properties_": {
-- 
2.41.0
