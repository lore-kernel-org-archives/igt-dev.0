Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF9510E706
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:56:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:44 +0530
Message-Id: <20230811184655.157060-71-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 70/81] tests/kms_selftest: Document each
 subtest for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Fix the documentation for renamed tests

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_selftest.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index 5495c24f2..940fc3d8d 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -23,6 +23,29 @@
 
 #include "igt.h"
 #include "igt_kmod.h"
+/**
+ * TEST: kms selftest
+ * Category: Display
+ * Description: Basic sanity check of KMS selftests.
+ *
+ * SUBTEST: %s
+ * Description: Basic sanity check of KMS selftest %arg[1].
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @drm_cmdline:            drm cmdline
+ * @drm_damage:             drm damage
+ * @drm_dp_mst:             drm dp mst
+ * @drm_format_helper:      drm format helper
+ * @drm_format:             drm format
+ * @drm_plane:              drm plane
+ * @framebuffer:            framebuffer
+ */
 
 IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
 
-- 
2.40.0
