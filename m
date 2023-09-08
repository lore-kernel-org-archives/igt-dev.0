Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648FD10E882
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 08:37:40 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.24.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 969DA580EA4
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 01:37:38 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qeWzg-004YD4-1j
 for igt-dev@lists.freedesktop.org; Fri, 08 Sep 2023 10:37:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 10:27:39 +0200
Message-ID: <20230908083734.1084351-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
References: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 03/11] kms_test_config.json: add
 testlists and blacklists
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

Specify the testlists and blacklists to be used to store CI
run type.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
