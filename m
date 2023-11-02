Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50E710E879
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 13:10:05 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.131.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CBB6E5807E2
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 06:10:02 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qyXSS-001I18-15
 for igt-dev@lists.freedesktop.org; Thu, 02 Nov 2023 14:10:00 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 14:06:25 +0100
Message-ID: <20231102130957.307435-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20231102130957.307435-1-mauro.chehab@linux.intel.com>
References: <20231102130957.307435-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] intel/*.json: better handle FULL
 testlist
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

On KMS, the FULL testlist for i915 and Xe may be different, as they
have different blocklists.

Rename FULL to Xe FULL or i915 FULL, accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/kms_test_config.json | 6 +++---
 tests/intel/xe_test_config.json  | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 53465c534bdc..e94737981ab7 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -23,7 +23,7 @@
                 "_properties_": {
                     "description": "Defines what category of testlist it belongs",
                     "update-from-file": {
-                        "append-value-if-not-excluded": "FULL",
+                        "append-value-if-not-excluded": "Xe FULL, i915 FULL",
                         "match-type": "subtest-match",
                         "include": [
                             { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
@@ -34,8 +34,8 @@
                             { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
                         ],
                         "exclude": [
-                            { "i915 BAT, i915 BAT chamelium, i915 chamelium, FULL": "../intel-ci/blacklist.txt" },
-                            { "Xe BAT, Xe BAT chamelium, FULL": "../intel-ci/xe.blocklist.txt" }
+                            { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
+                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                         ]
                     }
                 }
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 6c8059b6f21f..44c3dd4b4fee 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -35,12 +35,13 @@
                             "default-testlist": "FULL",
                             "update-from-file": {
                                 "type": "subtest-match",
+                                "append-value-if-not-excluded": "Xe FULL",
                                 "include": [
                                     { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
                                 ],
                                 "exclude": [
-                                    { "Xe BAT": "../intel-ci/xe.blocklist.txt" }
-                                ],
+                                    { "Xe BAT, Xe FULL": "../intel-ci/xe.blocklist.txt" }
+                                ]
                             },
                             "order": [
                                 "boot",
-- 
2.41.0
