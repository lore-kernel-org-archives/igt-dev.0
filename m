Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4038310E6EB
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:54:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:15:38 +0530
Message-Id: <20230811184655.157060-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 04/81] testplan/kms: Exclude kms helpers from
 testplan
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

As we are using wild cards in testplan, it'll expect a binary
for each source (.c) file. Exclude kms helpers from testplan
to avoid the build failures.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_test_config.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
index 499f418ab..9219ae4eb 100644
--- a/tests/kms_test_config.json
+++ b/tests/kms_test_config.json
@@ -2,6 +2,8 @@
     "description": "JSON file to be used to parse KMS documentation",
     "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
     "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c", "testdisplay.c" ],
+    "exclude_files": [ "chamelium/kms_chamelium_helper.c", "i915/kms_dsc_helper.c",
+                       "kms_color_helper.c"],
     "fields": {
         "Category": {
             "_properties_": {
-- 
2.40.0
