Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3306E10E3B7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:06 +0530
Message-Id: <20230517063323.4146387-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 04/81] testplan/kms: Include testdisplay to kms
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

As testdisplay.c is belongs to display, add it to the kms
testplan config.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
index d2d6357d1..b81b3ba55 100644
--- a/tests/kms_test_config.json
+++ b/tests/kms_test_config.json
@@ -1,6 +1,6 @@
 {
     "description": "JSON file to be used to parse KMS documentation",
-    "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c" ],
+    "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c", "testdisplay.c" ],
     "fields": {
         "Category": {
             "_properties_": {
-- 
2.40.0


