Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBA789C89
 for <igt-dev@lists.freedesktop.org>; Sun, 20 Sep 2020 18:56:03 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 21 Sep 2020 00:26:13 +0530
Message-Id: <20200920185615.133623-3-kunal1.joshi@intel.com>
In-Reply-To: <20200920185615.133623-1-kunal1.joshi@intel.com>
References: <20200920185615.133623-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 2/4] Added structures and functions to
 generate tiled edids
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Generating the tiled edid which can be flashed on chamelium and added
some functions to support the same.

v2: No change.

v3: No change.

v4: No change.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Navare Manasi D <manasi.d.navare@intel.com>
---
 lib/igt_chamelium.c |  67 +++++++++++++++++++++++++++++
 lib/igt_chamelium.h |   5 +++
 lib/igt_edid.c      |  27 ++++++++++++
 lib/igt_edid.h      |  20 +++++++++
 lib/igt_kms.c       | 102 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h       |   2 +
 6 files changed, 223 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 0dddbe6f..d8c7bb6f 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -909,6 +909,33 @@ const struct edid *chamelium_edid_get_raw(struct chamelium_edid *edid,
 	return edid->raw[port_index];
 }
 
+/**
+ * chamelium_edid_get_editable_raw: get the raw EDID which can be edited later.
+ * @edid: the Chamelium EDID
+ * @port: the Chamelium port
+ *
+ * The EDID provided to #chamelium_new_edid may be mutated for identification
+ * purposes. This function allows to retrieve the exact EDID that will be set
+ * for a given port.
+ *
+ * The returned raw EDID is only valid until the next call to this function.
+ */
+struct edid *chamelium_edid_get_editable_raw(struct chamelium_edid *edid,
+					  struct chamelium_port *port)
+{
+	size_t port_index = port - edid->chamelium->ports;
+	size_t edid_size;
+
+	if (!edid->raw[port_index]) {
+		edid_size = edid_get_size(edid->base);
+		edid->raw[port_index] = malloc(edid_size);
+		memcpy(edid->raw[port_index], edid->base, edid_size);
+		chamelium_port_tag_edid(port, edid->raw[port_index]);
+	}
+
+	return edid->raw[port_index];
+}
+
 /**
  * chamelium_port_set_edid:
  * @chamelium: The Chamelium instance to use
@@ -947,6 +974,46 @@ void chamelium_port_set_edid(struct chamelium *chamelium,
 				    port->id, edid_id));
 }
 
+/**
+ * chamelium_port_set_tiled_edid:
+ * @chamelium: The Chamelium instance to use
+ * @port: The port on the Chamelium to set the EDID on
+ * @edid: The Chamelium EDID to set or NULL to use the default Chamelium EDID
+ *
+ * Sets unique serial for tiled edid.
+ * Sets a port on the chamelium to use the specified EDID. This does not fire a
+ * hotplug pulse on it's own, and merely changes what EDID the chamelium port
+ * will report to us the next time we probe it. Users will need to reprobe the
+ * connectors themselves if they want to see the EDID reported by the port
+ * change.
+ *
+ * To create an EDID, see #chamelium_new_edid.
+ */
+void chamelium_port_set_tiled_edid(struct chamelium *chamelium,
+			     struct chamelium_port *port,
+			     struct chamelium_edid *edid)
+{
+	int edid_id;
+	size_t port_index;
+	struct edid *raw_edid;
+
+	if (edid) {
+		port_index = port - chamelium->ports;
+		edid_id = edid->ids[port_index];
+		if (edid_id == 0) {
+			raw_edid = chamelium_edid_get_editable_raw(edid, port);
+			raw_edid->serial[0] = 0x02;
+			base_edid_update_checksum(raw_edid);
+			edid_id = chamelium_upload_edid(chamelium, raw_edid);
+			edid->ids[port_index] = edid_id;
+		}
+	} else {
+		edid_id = 0;
+	}
+	xmlrpc_DECREF(chamelium_rpc(chamelium, NULL, "ApplyEdid", "(ii)",
+				    port->id, edid_id));
+}
+
 /**
  * chamelium_port_set_ddc_state:
  * @chamelium: The Chamelium instance to use
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index bce6331d..13a5c607 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -175,9 +175,14 @@ const struct edid *chamelium_edid_get_raw(struct chamelium_edid *edid,
 					  struct chamelium_port *port);
 const struct edid *chamelium_get_aspect_ratio_edid(void);
 const struct edid *chamelium_get_edid(enum test_edid edid);
+struct edid *chamelium_edid_get_editable_raw(struct chamelium_edid *edid,
+					 struct chamelium_port *port);
 void chamelium_port_set_edid(struct chamelium *chamelium,
 			     struct chamelium_port *port,
 			     struct chamelium_edid *edid);
+void chamelium_port_set_tiled_edid(struct chamelium *chamelium,
+			    struct chamelium_port *port,
+			    struct chamelium_edid *edid);
 bool chamelium_port_get_ddc_state(struct chamelium *chamelium,
 				  struct chamelium_port *port);
 void chamelium_port_set_ddc_state(struct chamelium *chamelium,
diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index 1c85486d..b6edde8d 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -313,9 +313,27 @@ void edid_update_checksum(struct edid *edid)
 			ext->data.cea.checksum =
 				compute_checksum((uint8_t *) ext,
 						 sizeof(struct edid_ext));
+		else if (ext->tag == EDID_EXT_DISPLAYID) {
+			ext->data.tile.extension_checksum =
+				compute_checksum((uint8_t *) &ext->data.tile,
+						 sizeof(struct edid_ext));
+			ext->data.tile.checksum =
+				compute_checksum((uint8_t *) ext,
+						 sizeof(struct edid_ext));
+		}
 	}
 }
 
+/**
+ * base_edid_update_checksum: compute and update the checksum of the main EDID
+ * block
+ */
+void base_edid_update_checksum(struct edid *edid)
+{
+	edid->checksum = compute_checksum((uint8_t *) edid,
+					  sizeof(struct edid));
+}
+
 /**
  * edid_get_size: return the size of the EDID block in bytes including EDID
  * extensions, if any.
@@ -458,6 +476,15 @@ size_t edid_cea_data_block_set_speaker_alloc(struct edid_cea_data_block *block,
 	return sizeof(struct edid_cea_data_block) + size;
 }
 
+/**
+ * edid_ext_set_tile initialize an EDID extension block to be identified
+ * as a tiled display topology block
+ */
+void edid_ext_set_displayid(struct edid_ext *ext)
+{
+	ext->tag = EDID_EXT_DISPLAYID;
+}
+
 /**
  * edid_ext_set_cea: initialize an EDID extension block to contain a CEA
  * extension. CEA extensions contain a Data Block Collection (with multiple
diff --git a/lib/igt_edid.h b/lib/igt_edid.h
index 59b47a97..7c2ce123 100644
--- a/lib/igt_edid.h
+++ b/lib/igt_edid.h
@@ -304,12 +304,30 @@ struct edid_cea {
 
 enum edid_ext_tag {
 	EDID_EXT_CEA = 0x02,
+	EDID_EXT_DISPLAYID = 0x70,
+};
+
+struct edid_tile {
+	uint8_t header[7];
+	uint8_t tile_cap;
+	uint8_t topo[3];
+	uint8_t tile_size[4];
+	uint8_t tile_pixel_bezel[5];
+	uint8_t topology_id[9];
+	uint8_t data[96];
+	uint8_t extension_checksum;
+	uint8_t checksum;
+} __attribute__((packed));
+
+enum edid_tile_cap {
+	SCALE_TO_FIT = 0x82,
 };
 
 struct edid_ext {
 	uint8_t tag; /* enum edid_ext_tag */
 	union {
 		struct edid_cea cea;
+		struct edid_tile tile;
 	} data;
 } __attribute__((packed));
 
@@ -356,6 +374,7 @@ struct edid {
 void edid_init(struct edid *edid);
 void edid_init_with_mode(struct edid *edid, drmModeModeInfo *mode);
 void edid_update_checksum(struct edid *edid);
+void base_edid_update_checksum(struct edid *edid);
 size_t edid_get_size(const struct edid *edid);
 void edid_get_mfg(const struct edid *edid, char out[static 3]);
 void detailed_timing_set_mode(struct detailed_timing *dt, drmModeModeInfo *mode,
@@ -383,4 +402,5 @@ size_t edid_cea_data_block_set_speaker_alloc(struct edid_cea_data_block *block,
 void edid_ext_set_cea(struct edid_ext *ext, size_t data_blocks_size,
 		      uint8_t num_native_dtds, uint8_t flags);
 
+void edid_ext_set_displayid(struct edid_ext *ext);
 #endif
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1c9aa4d1..b93d45e3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -88,6 +88,9 @@
 
 /* list of connectors that need resetting on exit */
 #define MAX_CONNECTORS 32
+#define MAX_EDID 2
+#define DISPLAY_TILE_BLOCK 0x12
+
 static struct {
 	uint32_t connector_type;
 	uint32_t connector_type_id;
@@ -130,6 +133,26 @@ const struct edid *igt_kms_get_base_edid(void)
 	return &edid;
 }
 
+const struct edid *igt_kms_get_base_tile_edid(void)
+{
+	static struct edid edid;
+	drmModeModeInfo mode = {};
+
+	mode.clock = 277250;
+	mode.hdisplay = 1920;
+	mode.hsync_start = 1968;
+	mode.hsync_end = 2000;
+	mode.htotal = 2080;
+	mode.vdisplay = 2160;
+	mode.vsync_start = 2163;
+	mode.vsync_end = 2173;
+	mode.vtotal = 2222;
+	mode.vrefresh = 60;
+	edid_init_with_mode(&edid, &mode);
+	edid_update_checksum(&edid);
+	return &edid;
+}
+
 /**
  * igt_kms_get_alt_edid:
  *
@@ -265,6 +288,85 @@ const struct edid *igt_kms_get_dp_audio_edid(void)
 	return generate_audio_edid(raw_edid, false, &sad, &speaker_alloc);
 }
 
+struct edid **igt_kms_get_tiled_edid(uint8_t htile, uint8_t vtile)
+{
+	uint8_t top[2];
+	int edids, i;
+	static  char raw_edid[MAX_EDID][256] = {0};
+	static struct edid *edid[MAX_EDID];
+
+	top[0] = 0x00;
+	top[1] = 0x00;
+	top[0] = top[0] | (htile<<4);
+	vtile = vtile & 15;
+	top[0] = top[0] | vtile;
+	top[1] = top[1] | ((htile << 2) & 192);
+	top[1] = top[1] | (vtile & 48);
+
+	edids = (htile+1) * (vtile+1);
+
+	for (i = 0; i < edids; i++)
+		edid[i] = (struct edid *) raw_edid[i];
+
+	for (i = 0; i < edids; i++) {
+
+		struct edid_ext *edid_ext;
+		struct edid_tile *edid_tile;
+
+	/* Create a new EDID from the base IGT EDID, and add an
+	 * extension that advertises tile support.
+	 */
+		memcpy(edid[i],
+		igt_kms_get_base_tile_edid(), sizeof(struct edid));
+		edid[i]->extensions_len = 1;
+		edid_ext = &edid[i]->extensions[0];
+		edid_tile = &edid_ext->data.tile;
+	/* Set 0x70 to 1st byte of extension,
+	 * so it is identified as display block
+	 */
+		edid_ext_set_displayid(edid_ext);
+	/* To identify it as a tiled display block extension */
+		edid_tile->header[0] = DISPLAY_TILE_BLOCK;
+		edid_tile->header[1] = 0x79;
+		edid_tile->header[2] = 0x00;
+		edid_tile->header[3] = 0x00;
+		edid_tile->header[4] = 0x12;
+		edid_tile->header[5] = 0x00;
+		edid_tile->header[6] = 0x16;
+	/* Tile Capabilities */
+		edid_tile->tile_cap = SCALE_TO_FIT;
+	/* Set number of htile and vtile */
+		edid_tile->topo[0] = top[0];
+		if (i == 0)
+			edid_tile->topo[1] = 0x10;
+		else if (i == 1)
+			edid_tile->topo[1] = 0x00;
+		edid_tile->topo[2] = top[1];
+	/* Set tile resolution */
+		edid_tile->tile_size[0] = 0x7f;
+		edid_tile->tile_size[1] = 0x07;
+		edid_tile->tile_size[2] = 0x6f;
+		edid_tile->tile_size[3] = 0x08;
+	/* Dimension of Bezels */
+		edid_tile->tile_pixel_bezel[0] = 0;
+		edid_tile->tile_pixel_bezel[1] = 0;
+		edid_tile->tile_pixel_bezel[2] = 0;
+		edid_tile->tile_pixel_bezel[3] = 0;
+		edid_tile->tile_pixel_bezel[4] = 0;
+	/* Manufacturer Information */
+		edid_tile->topology_id[0] = 0x44;
+		edid_tile->topology_id[1] = 0x45;
+		edid_tile->topology_id[2] = 0x4c;
+		edid_tile->topology_id[3] = 0x43;
+		edid_tile->topology_id[4] = 0x48;
+		edid_tile->topology_id[5] = 0x02;
+		edid_tile->topology_id[6] = 0x00;
+		edid_tile->topology_id[7] = 0x00;
+		edid_tile->topology_id[8] = 0x00;
+	}
+	return edid;
+}
+
 static const uint8_t edid_4k_svds[] = {
 	32 | CEA_SVD_NATIVE, /* 1080p @ 24Hz (native) */
 	5,                   /* 1080i @ 60Hz */
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index aaeedd45..7264727a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -795,6 +795,8 @@ const struct edid *igt_kms_get_hdmi_audio_edid(void);
 const struct edid *igt_kms_get_dp_audio_edid(void);
 const struct edid *igt_kms_get_4k_edid(void);
 const struct edid *igt_kms_get_3d_edid(void);
+const struct edid *igt_kms_get_base_tile_edid(void);
+struct edid **igt_kms_get_tiled_edid(uint8_t htile, uint8_t vtile);
 
 struct udev_monitor *igt_watch_uevents(void);
 bool igt_hotplug_detected(struct udev_monitor *mon,
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
