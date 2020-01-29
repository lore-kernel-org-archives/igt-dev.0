Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852166F45D
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 07:01:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 29 Jan 2020 12:20:16 +0530
Message-Id: <20200129065018.16971-6-swati2.sharma@intel.com>
In-Reply-To: <20200129065018.16971-1-swati2.sharma@intel.com>
References: <20200129065018.16971-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/7] tests/kms_hdr: Add function to check
 HDR panel
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
Cc: matthew.d.ropper@intel.com, Kunal Joshi <kunal1.joshi@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

EDID of connected panel needs to be parsed to detect whether
panel can drive hdr or not. Added new function is_panel_hdr(),
to know about hdr capabilities of panel. If panel supports hdr
then only tests will get executed else skipped.

v2: continue instead of break [Kunal]

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Suggested-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_hdr.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index c48e43e9..5615ac35 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -24,9 +24,22 @@
 #include <fcntl.h>
 #include <termios.h>
 #include <unistd.h>
+#include "igt_edid.h"
 
 IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
 
+/* HDR EDID parsing. */
+#define CTA_EXTENSION_VERSION		0x03
+#define HDR_STATIC_METADATA_BLOCK       0x06
+#define USE_EXTENDED_TAG		0x07
+
+/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
+enum hdmi_eotf {
+	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
+	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
+	HDMI_EOTF_SMPTE_ST2084,
+};
+
 /* Test flags. */
 enum {
 	TEST_NONE = 0,
@@ -268,6 +281,80 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	igt_require_f(valid_tests, "No connector found with MAX BPC connector property\n");
 }
 
+static bool cta_block(const char *edid_ext)
+{
+	/*
+	 * Byte 1: 0x07 indicates Extended Tag
+	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
+	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
+	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
+	 *	             ET_1: Traditional Gamma - HDR Luminance Range
+	 *	             ET_2: SMPTE ST 2084
+	 *	             ET_3: Hybrid Log-Gamma (HLG)
+	 *	             ET_4 to ET_5: Reserved for future use
+	 */
+
+	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
+	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
+	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
+	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
+			return true;
+
+	return false;
+}
+
+/* Returns true if panel supports hdr */
+static bool is_panel_hdr(data_t *data, igt_output_t *output)
+{
+	bool ok;
+	int i, j, offset;
+	uint64_t edid_blob_id;
+	drmModePropertyBlobRes *edid_blob;
+	const struct edid_ext *edid_ext;
+	const struct edid *edid;
+	const struct edid_cea *edid_cea;
+	const char *cea_data;
+	bool ret = false;
+
+	ok = kmstest_get_property(data->fd, output->id,
+			DRM_MODE_OBJECT_CONNECTOR, "EDID",
+			NULL, &edid_blob_id, NULL);
+
+	if (!ok || !edid_blob_id)
+		return ret;
+
+	edid_blob = drmModeGetPropertyBlob(data->fd, edid_blob_id);
+	igt_assert(edid_blob);
+
+	edid = (const struct edid *) edid_blob->data;
+	igt_assert(edid);
+
+	drmModeFreePropertyBlob(edid_blob);
+
+	for (i = 0; i < edid->extensions_len; i++) {
+		edid_ext = &edid->extensions[i];
+		edid_cea = &edid_ext->data.cea;
+
+		/* HDR not defined in CTA Extension Version < 3 */
+		if ((edid_ext->tag != EDID_EXT_CEA) ||
+		    (edid_cea->revision != CTA_EXTENSION_VERSION))
+				continue;
+		else {
+			offset = edid_cea->dtd_start;
+			cea_data = edid_cea->data;
+
+			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
+				ret = cta_block(cea_data + j);
+
+				if (ret)
+					break;
+			}
+		}
+	}
+
+	return ret;
+}
+
 igt_main
 {
 	data_t data = { 0 };
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
