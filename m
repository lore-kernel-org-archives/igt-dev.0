Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997710EB84
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 06:39:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Apr 2023 12:05:15 +0530
Message-Id: <20230420063515.1791062-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_force_connector_basic: Limit
 "force-load-detect" test to i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As load_detect_test is enabled only for i915, limit the IGT test
igt@kms_force_connector_basic@force-load-detect execution to i915
only.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 -
 tests/kms_force_connector_basic.c        | 5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5db27c634..3c9276e49 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -167,6 +167,5 @@ igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
 igt@kms_force_connector_basic@force-connector-state
 igt@kms_force_connector_basic@force-edid
-igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_prop_blob@basic
diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 35e8153c8..f1508efba 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -372,8 +372,11 @@ end:
 	}
 
 	igt_describe("Test to detect forced load.");
-	igt_subtest("force-load-detect")
+	igt_subtest("force-load-detect") {
+		igt_require_i915(drm_fd);
+
 		force_load_detect(drm_fd, connector, res);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe_f("%s", tests[i].desc);
-- 
2.40.0
