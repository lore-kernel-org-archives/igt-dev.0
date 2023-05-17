Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8163010E3B5
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:47 +0530
Message-Id: <20230517063323.4146387-46-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 45/81] tests/kms_dither: Document each subtest
 for testplan
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
 tests/kms_dither.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 95be6e136..f62bc90d9 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -25,6 +25,11 @@
  *
  */
 
+/**
+ * TEST: kms dither
+ * Category: Display
+ * Description: Test Dithering block status
+ */
 #include "igt.h"
 #include <fcntl.h>
 #include <termios.h>
@@ -181,6 +186,23 @@ static bool is_supported(igt_output_t *output)
 		igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
 }
 
+/**
+ * SUBTEST: FB-8BPC-Vs-Panel-6BPC
+ * Description: Framebuffer BPC:8, Panel BPC:6, Expected Dither:Enable
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: FB-8BPC-Vs-Panel-8BPC
+ * Description: Framebuffer BPC:8, Panel BPC:8, Expected Dither:Disable
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void
 run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 {
-- 
2.40.0


