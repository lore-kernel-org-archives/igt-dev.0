Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B162A10E3F8
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:19:00 +0530
Message-Id: <20230629144910.3055377-72-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 71/81] tests/kms_selftest: Document each
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
