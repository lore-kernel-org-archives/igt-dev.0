Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F41610E6DF
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 18:10:08 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 20:07:21 +0200
Message-ID: <20230906181001.498395-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230906181001.498395-1-mauro.chehab@linux.intel.com>
References: <20230906181001.498395-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] kms_test_config.json: add testlists and
 blocklists
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Specify the testlists and blocklists to be used to store CI
run type.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/kms_test_config.json | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 4130b7d6dae0..7ab288685677 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -21,7 +21,19 @@
             },
             "Run type": {
                 "_properties_": {
-                    "description": "Defines what category of testlist it belongs"
+                    "description": "Defines what category of testlist it belongs",
+                    "testlists": {
+                        "i915 BAT": "../intel-ci/fast-feedback.testlist",
+                        "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist",
+                        "i915 chamelium": "../intel-ci/chamelium-only.testlist",
+
+                        "Xe BAT": "../intel-ci/xe-fast-feedback.testlist",
+                        "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist"
+                    },
+                    "blocklists": {
+                        "i915 BAT, i915 BAT chamelium, i915 chamelium": "../intel-ci/blacklist.txt",
+                        "Xe BAT, Xe BAT chamelium": "../intel-ci/xe.blocklist.txt"
+                    }
                 }
             }
         },
-- 
2.41.0
