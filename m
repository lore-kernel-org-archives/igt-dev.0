Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFDB10E5D8
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 14:00:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Mar 2022 19:28:44 +0530
Message-Id: <20220316135845.418963-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220316135845.418963-1-bhanuprakash.modem@intel.com>
References: <20220316135845.418963-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v8 i-g-t 1/2] tests/kms_color_helper: Read deep-color
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
V6:
* Cleanup
V7:
* Cleanup: Fix typos, comments and rename function names
* Update max_bpc() to capture the prop value

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 lib/igt_edid.c           | 66 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_edid.h           |  2 ++
 tests/kms_color_helper.c | 52 +++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  3 ++
 4 files changed, 123 insertions(+)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index df346c4c8c..bff13a0da0 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -349,6 +349,72 @@ size_t edid_get_size(const struct edid *edid)
 	       edid->extensions_len * sizeof(struct edid_ext);
 }
 
+static int ieee_oui(uint8_t oui[CEA_VSDB_HEADER_SIZE])
+{
+         return (oui[2] << 16) | (oui[1] << 8) | oui[0];
+}
+
+/**
+ * edid_get_deep_color_from_vsdb: return the Deep Color info from Vendor
+ * Specific Data Block (VSDB), if VSDB not found then return zero.
+ */
+uint8_t edid_get_deep_color_from_vsdb(const struct edid *edid)
+{
+	const struct edid_ext *edid_ext;
+	const struct edid_cea *edid_cea;
+	const char *cea_data;
+	uint8_t deep_color = 0;
+	int offset, i, j;
+
+	/*
+	 * Read from vendor specific data block first, if vsdb not found
+	 * return 0.
+	 */
+	for (i = 0; i < edid->extensions_len; i++) {
+		edid_ext = &edid->extensions[i];
+		edid_cea = &edid_ext->data.cea;
+
+		if ((edid_ext->tag != EDID_EXT_CEA) ||
+		    (edid_cea->revision != 3))
+			continue;
+
+		offset = edid_cea->dtd_start;
+		cea_data = edid_cea->data;
+
+		for (j = 0; j < offset; j += (cea_data[j] & 0x1F) + 1) {
+			struct edid_cea_data_block *vsdb =
+				(struct edid_cea_data_block *)(cea_data + j);
+
+			if (((vsdb->type_len & 0xE0) >> 5) != EDID_CEA_DATA_VENDOR_SPECIFIC)
+				continue;
+
+			if (ieee_oui(vsdb->data.vsdbs->ieee_oui) == 0x000C03)
+				deep_color = vsdb->data.vsdbs->data.hdmi.flags1;
+
+			if (deep_color & (7 << 4))
+				return deep_color;
+		}
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
index d71e7bb2e6..3ea1c4bc9c 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,6 +24,58 @@
 
 #include "kms_color_helper.h"
 
+bool
+panel_supports_deep_color(int fd, drmModeConnector *connector)
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
+uint64_t get_max_bpc(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) ?
+		igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC) : 0;
+}
+
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
 			       color_t *colors,
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index bb6f0054f3..4c38def454 100644
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
 
+bool panel_supports_deep_color(int fd, drmModeConnector *connector);
+uint64_t get_max_bpc(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
 			       color_t *colors,
-- 
2.35.1
