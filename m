Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F556F48E
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 14:52:20 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 20:10:15 +0530
Message-Id: <20210603144022.28176-16-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
References: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 16/23] tests/kms_dither: Validate dither
 after CC blocks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Nischal Varide <nischal.varide@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Dithering after all CC blocks will be enabled only if the panel
supports 12 BPC (or more) and the Framebuffer BPC is greater than
12 BPC. And legacy dither block (at the end of PIPE) should be
disabled to avoid double dithering.

This patch will extend the support to validate Dither after all
color conversion (CC) blocks.

V2:
* Identify the dithering block, then check the status (Uma)

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Nischal Varide <nischal.varide@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_dither.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index c25d623f81..1ff07914f4 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -57,7 +57,8 @@ typedef struct data {
 
 typedef struct {
 	unsigned int bpc;
-	unsigned int dither;
+	unsigned int legacy;
+	unsigned int cc1;
 } dither_status_t;
 
 /* Prepare test data. */
@@ -104,7 +105,10 @@ static dither_status_t get_dither_state(data_t *data)
 	igt_assert_eq(sscanf(start_loc, "bpc: %u", &status.bpc), 1);
 
 	igt_assert(start_loc = strstr(buf, "Dither: "));
-	igt_assert_eq(sscanf(start_loc, "Dither: %u", &status.dither), 1);
+	igt_assert_eq(sscanf(start_loc, "Dither: %u", &status.legacy), 1);
+
+	igt_assert(start_loc = strstr(buf, "Dither_CC1: "));
+	igt_assert_eq(sscanf(start_loc, "Dither_CC1: %u", &status.cc1), 1);
 
 	return status;
 }
@@ -141,10 +145,10 @@ static void test_dithering(data_t *data, enum pipe pipe,
 	 */
 	status = get_dither_state(data);
 
-	igt_debug("FB BPC:%d, Panel BPC:%d, Pipe BPC:%d, Expected Dither:%s, Actual result:%s\n",
-		  fb_bpc, output_bpc, status.bpc,
-		  (fb_bpc > output_bpc) ? "Enable": "Disable",
-		  status.dither ? "Enable": "Disable");
+	igt_debug("FB BPC:%d, Panel BPC:%d, Pipe BPC:%d, "
+		  "Dither at end of the pipe:%u, Dither after CC1:%u\n",
+			fb_bpc, output_bpc, status.bpc,
+			status.legacy, status.cc1);
 
        /*
 	* We must update the Connector max_bpc property back
@@ -163,12 +167,25 @@ static void test_dithering(data_t *data, enum pipe pipe,
 				output->name, status.bpc, output_bpc);
 
 	/* Compute the result. */
-	if (fb_bpc > output_bpc)
-		igt_assert_f(status.dither, "(fb_%dbpc > output_%dbpc): Dither should be enabled\n",
-				fb_bpc, output_bpc);
-	else
-		igt_assert_f(!status.dither, "(fb_%dbpc <= output_%dbpc): Dither should be disabled\n",
+	if (fb_bpc > output_bpc) {
+		if (output_bpc < IGT_CONNECTOR_BPC_12)
+			igt_assert_f((status.legacy && !status.cc1),
+					"(fb_%dbpc > output_%dbpc): Dither should be "
+					"enabled at end of the PIPE & "
+					"disbaled at the CC1.\n",
+					fb_bpc, output_bpc);
+		else
+			igt_assert_f((!status.legacy && status.cc1),
+					"(fb_%dbpc > output_%dbpc): Dither should be "
+					"disabled at end of the PIPE & "
+					"enabled at the CC1.\n",
+					fb_bpc, output_bpc);
+	} else {
+		igt_assert_f((!status.legacy && !status.cc1),
+				"(fb_%dbpc <= output_%dbpc): Dither should be "
+				"disabled at both places (end of the PIPE & CC1).\n",
 				fb_bpc, output_bpc);
+	}
 
 	return;
 }
@@ -218,6 +235,7 @@ igt_main
 	} tests[] = {
 		{ IGT_FRAME_BUFFER_BPC_8, DRM_FORMAT_XRGB8888, IGT_CONNECTOR_BPC_6 },
 		{ IGT_FRAME_BUFFER_BPC_8, DRM_FORMAT_XRGB8888, IGT_CONNECTOR_BPC_8 },
+		{ IGT_FRAME_BUFFER_BPC_16, DRM_FORMAT_XRGB16161616F, IGT_CONNECTOR_BPC_12 },
 	};
 	int i;
 	data_t data = { 0 };
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
