Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1ED10E3E3
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:55:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:14 +0530
Message-Id: <20230629144910.3055377-26-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 25/81] tests/i915/kms_pipe_b_c_ivb: Document
 each subtest for testplan
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_pipe_b_c_ivb.c | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/i915/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.c
index 192771794..f19355511 100644
--- a/tests/i915/kms_pipe_b_c_ivb.c
+++ b/tests/i915/kms_pipe_b_c_ivb.c
@@ -25,6 +25,58 @@
  */
 
 #include "igt.h"
+/**
+ * TEST: kms pipe b c ivb
+ * Category: Display
+ * Description: Exercise the FDI lane bifurcation code for IVB in the kernel by
+ *              setting different combinations of modes for pipes B and C.
+ *
+ * SUBTEST: disable-pipe-B-enable-pipe-C
+ * Description: Tests pipe-B and pipe-C interactions in IVB by disabling pipe-B
+ *              and then setting mode on pipe-C.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: enable-pipe-C-while-B-has-3-lanes
+ * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-C
+ *              while pipe-B has 3-lanes
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: from-pipe-C-to-B-with-3-lanes
+ * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B
+ *              with 3 lanes from pipe-C.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: pipe-B-double-modeset-then-modeset-pipe-C
+ * Description: Tests pipe-B and pipe-C interactions in IVB by enabling two
+ *              different modes on pipe-B and then a single mode on pipe-C.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: pipe-B-dpms-off-modeset-pipe-C
+ * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B
+ *              with mode that requires 3 lanes and then enabling pipe-c with
+ *              dpms off/on pipe-B.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION(
 "Exercise the FDI lane bifurcation code for IVB in the kernel by setting"
-- 
2.40.0
