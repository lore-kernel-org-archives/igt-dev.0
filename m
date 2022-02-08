Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDBF10E52B
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Feb 2022 04:11:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue,  8 Feb 2022 09:41:06 +0530
Message-Id: <20220208041106.2202609-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220201090528.2105215-1-bhanuprakash.modem@intel.com>
References: <20220201090528.2105215-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v5 i-g-t 1/3] tests/kms_color_helper: Read deep-color
 capability from EDID
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, uma.shankar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add a helper function to read the panel's deep-color capability
from EDID.

For EDID 1.3, we need to read deep color capability from Vendor
Specific Data Block, and for EDID 1.4 read bit depth from Video
Input Definition.

Vendor Specific Data Block for "HDMI Licensing LLC":
---------------------------------------------------------
| Byte|  Bit  |        Description                      |
---------------------------------------------------------
|     | Bit 6 |   16-bit-per-channel deep color (48-bit)|
|  6  | Bit 5 |   12-bit-per-channel deep color (36-bit)|
|     | Bit 4 |   10-bit-per-channel deep color (30-bit)|
---------------------------------------------------------

Video Input Definition (1-byte):
    * Video Signal Interface: Bit 7 (1:Digital, 0:Analog)
    * Color Bit Depth: Bits 6 → 4
-----------------------------------------------------
| 7 | 6 5 4 | 3 2 1 0 | Color Bit Depth: Bits 6 → 4 |
|---|-------|---------|-----------------------------|
| 1 | 0 0 0 | x x x x | Color Bit Depth is undefined|
| 1 | 0 0 1 | x x x x | 6 Bits per Primary Color    |
| 1 | 0 1 0 | x x x x | 8 Bits per Primary Color    |
| 1 | 0 1 1 | x x x x | 10 Bits per Primary Color   |
| 1 | 1 0 0 | x x x x | 12 Bits per Primary Color   |
| 1 | 1 0 1 | x x x x | 14 Bits per Primary Color   |
| 1 | 1 1 0 | x x x x | 16 Bits per Primary Color   |
| 1 | 1 1 1 | x x x x | Reserved (Do Not Use)       |
-----------------------------------------------------
For deep-color we need atleast 10-bits.

V2:
* Add EDID 1.3 support
V3:
* Fix reading VSDB flags1 for deep-color
V4:
* Separate functions for EDID 1.3 & EDID 1.4
* Other minor cleanups
V5:
* Fine tune the logic to identify DC support for RGB format

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_edid.c           | 66 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_edid.h           |  2 ++
 tests/kms_color_helper.c | 52 +++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  3 ++
 4 files changed, 123 insertions(+)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index df346c4c8c..37122ca71e 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -349,6 +349,72 @@ size_t edid_get_size(const struct edid *edid)
 	       edid->extensions_len * sizeof(struct edid_ext);
 }
 
+static int ieee_oui(uint8_t oui[CEA_VSDB_HEADER_SIZE])
+{
+         return (oui[0] << 16) | (oui[1] << 8) | oui[2];
+}
+
+/**
+ * edid_get_deep_color_from_vsdb: return the Deep Color info from Vender
+ * Specific Data Block (VSDB), if VSDB not found then return zero.
+ */
+uint8_t edid_get_deep_color_from_vsdb(const struct edid *edid)
+{
+	const uint8_t offset = offsetof(struct edid_cea, data);
+	uint8_t deep_color, i = 0;
+
+	/* Read from vendor specific data block first, if vsdb not found
+	 * return 0.
+	 */
+	for (i = 0; i < edid->extensions_len; i++) {
+		uint32_t index = 0;
+		uint8_t dtd_offset = edid->extensions[i].data.cea.dtd_start;
+
+		if (edid->extensions[i].tag != EDID_EXT_CEA)
+			continue;
+
+		do {
+			struct edid_cea_data_block * vsdb =
+				(struct edid_cea_data_block *) &edid->extensions[i].data.cea.data[index];
+			uint8_t vsdb_length = (vsdb->type_len & 0x1f);
+			uint8_t vsdb_type = (vsdb->type_len & (7 << 5)) >> 5;
+
+			if (vsdb_type == EDID_CEA_DATA_VENDOR_SPECIFIC) {
+				/* TODO:
+				 * As of now we are validating RGB format, limiting
+				 * the execution to HDMI 1.4 only, update below logic
+				 * to extend to support YCbCr format in case of HDMI 2.0.
+				 */
+				if (ieee_oui(vsdb->data.vsdbs[0].ieee_oui) == 0x000C03)
+					deep_color = vsdb->data.vsdbs[0].data.hdmi.flags1;
+			}
+
+			if (deep_color & (7 << 4))
+				return deep_color;
+
+			index += (vsdb_length + sizeof(vsdb->type_len));
+		} while (index < dtd_offset - offset);
+	}
+
+	return 0;
+}
+
+/**
+ * edid_get_bit_depth: Read from the Video Input Definition and return the
+ * Color Bit Depth if Input is a Digital Video, else return zero.
+ */
+uint8_t edid_get_bit_depth_from_vid(const struct edid *edid)
+{
+	/*
+	 * Video Signal Interface: Bit 7 (1:Digital, 0:Analog)
+	 * Color Bit Depth: Bits 6 → 4
+	 */
+	if (!(edid->input & (1 << 7)))
+		return 0;
+
+	return ((edid->input & (7 << 4)) >> 4);
+}
+
 /**
  * cea_sad_init_pcm:
  * @channels: the number of supported channels (max. 8)
diff --git a/lib/igt_edid.h b/lib/igt_edid.h
index aac2f4a208..a9251d689e 100644
--- a/lib/igt_edid.h
+++ b/lib/igt_edid.h
@@ -377,6 +377,8 @@ void edid_update_checksum(struct edid *edid);
 void base_edid_update_checksum(struct edid *edid);
 size_t edid_get_size(const struct edid *edid);
 void edid_get_mfg(const struct edid *edid, char out[static 3]);
+uint8_t edid_get_deep_color_from_vsdb(const struct edid *edid);
+uint8_t edid_get_bit_depth_from_vid(const struct edid *edid);
 void detailed_timing_set_mode(struct detailed_timing *dt, drmModeModeInfo *mode,
 			      int width_mm, int height_mm);
 void detailed_timing_set_monitor_range_mode(struct detailed_timing *dt,
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index d71e7bb2e6..6b3af02b00 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,6 +24,58 @@
 
 #include "kms_color_helper.h"
 
+bool
+is_panel_supports_deep_color(int fd, drmModeConnector *connector)
+{
+	uint64_t edid_blob_id;
+	uint8_t bit_depth, rev;
+	const struct edid *edid;
+	bool result;
+	drmModePropertyBlobPtr edid_blob = NULL;
+
+	igt_assert(kmstest_get_property(fd, connector->connector_id,
+					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+					&edid_blob_id, NULL));
+	edid_blob = drmModeGetPropertyBlob(fd, edid_blob_id);
+	igt_require_f(edid_blob, "EDID blob is NULL\n");
+
+	edid = (const struct edid *) edid_blob->data;
+	rev = edid->revision;
+
+	if (rev >= 4) {
+		bit_depth = edid_get_bit_depth_from_vid(edid);
+
+		if (bit_depth > 0 && bit_depth < 7)
+			igt_info("Max supported bit depth: %d\n", ((bit_depth << 1) + 4));
+		else
+			igt_info("Max supported bit depth: Undefined\n");
+
+		result = (bit_depth >= 3) && (bit_depth < 7);
+	} else {
+		bit_depth = edid_get_deep_color_from_vsdb(edid);
+
+		if (bit_depth &	HDMI_VSDB_DC_48BIT)
+			igt_info("Max supported bit depth: 16\n");
+		else if (bit_depth & HDMI_VSDB_DC_36BIT)
+			igt_info("Max supported bit depth: 12\n");
+		else if (bit_depth & HDMI_VSDB_DC_30BIT)
+			igt_info("Max supported bit depth: 10\n");
+		else
+			igt_info("Max supported bit depth: Undefined\n");
+
+		result = !!(bit_depth & (7 << 4));
+	}
+	drmModeFreePropertyBlob(edid_blob);
+
+	return result;
+}
+
+bool is_max_bpc_supported(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
+		igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
+}
+
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
 			       color_t *colors,
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index bb6f0054f3..992087ac9c 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -36,6 +36,7 @@
 #include "drm.h"
 #include "drmtest.h"
 #include "igt.h"
+#include "igt_edid.h"
 
 
 /* Internal */
@@ -64,6 +65,8 @@ typedef struct {
 	color_t coeffs[];
 } gamma_lut_t;
 
+bool is_panel_supports_deep_color(int fd, drmModeConnector *connector);
+bool is_max_bpc_supported(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
 			       color_t *colors,
-- 
2.35.0
