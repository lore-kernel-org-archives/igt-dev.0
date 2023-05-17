Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09E610E3BA
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:16 +0530
Message-Id: <20230517063323.4146387-15-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 14/81] tests/i915/kms_ccs: Document each
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_ccs.c | 83 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 1b3462ea9..42485fa56 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -22,10 +22,93 @@
  *
  */
 
+/**
+ * TEST: kms ccs
+ * Category: Display
+ * Description: Test render compression (RC), in which the main surface is
+ *              complemented by a color control surface (CCS) that the display
+ *              uses to interpret the compressed data.
+ */
 #include "igt.h"
 
 #include "i915/gem_create.h"
 
+/**
+ * SUBTEST: %s-%s-%s
+ * Description: Test %arg[2] with given %arg[3] modifier
+ * Driver requirement: i915
+ * Functionality: ccs
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @pipe-A:                    Pipe A
+ * @pipe-B:                    Pipe B
+ * @pipe-C:                    Pipe C
+ * @pipe-D:                    Pipe D
+ * @pipe-E:                    Pipe E
+ * @pipe-F:                    Pipe F
+ * @pipe-G:                    Pipe G
+ * @pipe-H:                    Pipe H
+ *
+ * arg[2]:
+ *
+ * @bad-aux-stride:            Bad AUX stride
+ * @ccs-on-another-bo:         CCS with different BO
+ * @missing-ccs-buffer:        Missing CCS buffer
+ *
+ * arg[3]:
+ *
+ * @y_tiled_ccs:               Y tiled ccs
+ * @y_tiled_gen12_mc_ccs:      Y tiled gen12 mc ccs
+ * @y_tiled_gen12_rc_ccs:      Y tiled gen12 rc ccs
+ * @y_tiled_gen12_rc_ccs_cc:   Y tiled gen12 rc ccs cc
+ * @yf_tiled_ccs:              YF tiled ccs
+ */
+
+/**
+ * SUBTEST: %s-%s-%s
+ * Description: Test %arg[2] with %arg[3] modifier
+ * Driver requirement: i915
+ * Functionality: ccs
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @pipe-A:                      Pipe A
+ * @pipe-B:                      Pipe B
+ * @pipe-C:                      Pipe C
+ * @pipe-D:                      Pipe D
+ * @pipe-E:                      Pipe E
+ * @pipe-F:                      Pipe F
+ * @pipe-G:                      Pipe G
+ * @pipe-H:                      Pipe H
+ *
+ * arg[2]:
+ *
+ * @bad-pixel-format:            Bad pixel format
+ * @bad-rotation-90:             90 degree rotation
+ * @crc-primary-basic:           Primary plane CRC compatibility
+ * @crc-primary-rotation-180:    180 degree rotation
+ * @crc-sprite-planes-basic:     Sprite plane CRC compatability
+ * @random-ccs-data:             Random CCS data
+ *
+ * arg[3]:
+ *
+ * @4_tiled_dg2_mc_ccs:        4 tiled mc ccs
+ * @4_tiled_dg2_rc_ccs:        4 tiled dg2 rc ccs
+ * @4_tiled_dg2_rc_ccs_cc:     4 tiled dg2 rc ccs cc
+ * @y_tiled_ccs:               Y tiled ccs
+ * @y_tiled_gen12_mc_ccs:      Y tiled gen12 mc ccs
+ * @y_tiled_gen12_rc_ccs:      Y tiled gen12 rc ccs
+ * @y_tiled_gen12_rc_ccs_cc:   Y tiled gen12 rc ccs cc
+ * @yf_tiled_ccs:              YF tiled ccs
+ */
+
 #define SDR_PLANE_BASE	3
 
 IGT_TEST_DESCRIPTION("Test render compression (RC), in which the main surface "
-- 
2.40.0


