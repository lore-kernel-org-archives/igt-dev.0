Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2DB10E257
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:46 +0530
Message-Id: <20230815164815.320904-53-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 52/81] tests/kms_hdr: Document each subtest for
 testplan
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

V2: - Fix functionality
V3: - Driver requirement: s/any/i915, xe/
    - Mega feature: s/General Display Features/HDR/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index ba19761e2..1a5b5ead8 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -20,6 +20,11 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms hdr
+ * Category: Display
+ * Description: Test HDR metadata interfaces and bpc switch
+ */
 #include "igt.h"
 #include <fcntl.h>
 #include <termios.h>
@@ -208,6 +213,31 @@ static bool has_max_bpc(igt_output_t *output)
 	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
 }
 
+/**
+ * SUBTEST: bpc-switch
+ * Description: Tests switching between different display output bpc modes
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr
+ * Mega feature: HDR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: bpc-switch-dpms
+ * Description: Tests switching between different display output bpc modes with dpms
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, dpms, hdr
+ * Mega feature: HDR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: bpc-switch-suspend
+ * Description: Tests switching between different display output bpc modes with suspend
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr, suspend
+ * Mega feature: HDR
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_bpc_switch(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -561,6 +591,52 @@ static bool has_hdr(igt_output_t *output)
 	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
 }
 
+/**
+ * SUBTEST: invalid-hdr
+ * Description: Test to ensure HDR is not enabled on non-HDR panel
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr
+ * Mega feature: HDR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-metadata-sizes
+ * Description: Tests invalid HDR metadata sizes
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr
+ * Mega feature: HDR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: static-toggle-dpms
+ * Description: Tests static toggle with dpms
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, dpms, hdr
+ * Mega feature: HDR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: static-toggle-suspend
+ * Description: Tests static toggle with suspend
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr, suspend
+ * Mega feature: HDR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: static-%s
+ * Description: Tests %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr
+ * Mega feature: HDR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @swap:                    swapping static HDR metadata
+ * @toggle:                  entering and exiting HDR mode
+ */
 static void test_hdr(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
-- 
2.40.0
