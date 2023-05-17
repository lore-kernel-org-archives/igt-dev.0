Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A6710E3CA
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:55 +0530
Message-Id: <20230517063323.4146387-54-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 53/81] tests/kms_hdr: Document each subtest for
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdr.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e9e52a9a1..79b108bc2 100644
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
@@ -208,6 +213,21 @@ static bool has_max_bpc(igt_output_t *output)
 	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
 }
 
+/**
+ * SUBTEST: bpc-%s
+ * Description: Tests switching between different display output bpc modes %arg[1]
+ * Driver requirement: any
+ * Functionality: kms_hdr
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @switch:              default
+ * @switch-dpms:         with dpms
+ * @switch-suspend:      with suspend
+ */
 static void test_bpc_switch(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -561,6 +581,38 @@ static bool has_hdr(igt_output_t *output)
 	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
 }
 
+/**
+ * SUBTEST: invalid-hdr
+ * Description: Test to ensure HDR is not enabled on non-HDR panel
+ * Driver requirement: any
+ * Functionality: kms_hdr
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-metadata-sizes
+ * Description: Tests invalid HDR metadata sizes
+ * Driver requirement: any
+ * Functionality: kms_hdr
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: static-%s
+ * Description: Tests %arg[1].
+ * Driver requirement: any
+ * Functionality: kms_hdr
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @swap:                    swapping static HDR metadata
+ * @toggle:                  entering and exiting HDR mode
+ * @toggle-dpms:             static toggle with dpms
+ * @toggle-suspend:          static toggle with suspend
+ */
 static void test_hdr(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
-- 
2.40.0


