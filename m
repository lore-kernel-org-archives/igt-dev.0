Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AF510E214
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:34:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 10:57:17 +0530
Message-Id: <20230529052835.860047-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 04/82] testplan/kms: Include testdisplay to kms
 testplan config
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

As testdisplay.c is belongs to display, add it to the kms
testplan config.

V2: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/kms_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
index 5fbe40bdc..2c6181e55 100644
--- a/tests/kms_test_config.json
+++ b/tests/kms_test_config.json
@@ -1,7 +1,7 @@
 {
     "description": "JSON file to be used to parse KMS documentation",
     "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
-    "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c" ],
+    "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c", "testdisplay.c" ],
     "fields": {
         "Category": {
             "_properties_": {
-- 
2.40.0
