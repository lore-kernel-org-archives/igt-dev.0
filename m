Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E834E10E252
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:55:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:16:57 +0530
Message-Id: <20230815164815.320904-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 03/81] testplan/kms: Include testdisplay to kms
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
index 7a43da74e..499f418ab 100644
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
