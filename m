Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301246E8B7
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 20:19:56 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 19 Oct 2021 23:19:39 +0300
Message-Id: <20211019201940.31729-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20211019201940.31729-1-ville.syrjala@linux.intel.com>
References: <20211019201940.31729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] lib/edid: Add support for making
 DisplayID tile blocks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We want to test tiled display support without actually having tiled
displays. To that end we will want to construct fake tile infromation
and append it to the EDID.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_edid.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_edid.h | 49 ++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index df346c4c8cf7..3e39cfc57a6e 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -509,3 +509,79 @@ void edid_ext_set_cea(struct edid_ext *ext, size_t data_blocks_size,
 	cea->dtd_start = 4 + data_blocks_size;
 	cea->misc = flags | num_native_dtds;
 }
+
+void *dispid_block_tiled(void *ptr,
+			 int num_htiles, int num_vtiles,
+			 int htile, int vtile,
+			 int hsize, int vsize,
+			 const char *topology_id)
+{
+	struct dispid_block_header *block = ptr;
+	struct dispid_tiled_block *tiled = (void*)(block + 1);
+	size_t len;
+
+	block->tag = 0x12;
+	block->rev = 0;
+	block->num_bytes = sizeof(*tiled);
+
+	num_htiles--;
+	num_vtiles--;
+	hsize--;
+	vsize--;
+
+	tiled->tile_caps =
+		DISPID_MULTI_TILE_AT_TILE_LOCATION |
+		DISPID_SINGLE_TILE_AT_TILE_LOCATION;
+
+	tiled->topo[0] = (num_htiles & 0xf) << 4 |
+		(num_vtiles & 0xf) << 0;
+
+	tiled->topo[1] = (htile & 0xf) << 4 |
+		(vtile & 0xf) << 0;
+
+	tiled->topo[2] = (num_htiles >> 4) << 6 |
+		(num_vtiles >> 4) << 4 |
+		(htile >> 4) << 2 |
+		(vtile >> 4) << 0;
+
+	tiled->tile_size[0] = hsize;
+	tiled->tile_size[1] = hsize >> 8;
+	tiled->tile_size[2] = vsize;
+	tiled->tile_size[3] = vsize >> 8;
+
+	len = min(strlen(topology_id), sizeof(tiled->topology_id));
+	memcpy(tiled->topology_id, topology_id, len);
+
+	return tiled + 1;
+}
+
+void *edid_ext_dispid(struct edid_ext *ext)
+{
+	struct edid_dispid *dispid = &ext->data.dispid;
+
+	edid_ext_set_displayid(ext);
+
+	return dispid;
+}
+
+void *dispid_init(void *ptr)
+{
+	struct dispid_header *dispid = ptr;
+
+	dispid->rev = 0x10;
+	dispid->prod_id = 0x3;
+	dispid->ext_count = 0;
+
+	return dispid + 1;
+}
+
+void *dispid_done(struct dispid_header *dispid, void *ptr)
+{
+	int bytes = ptr - (void *)dispid;
+
+	dispid->num_bytes = bytes - sizeof(*dispid);
+
+	*(uint8_t *)ptr = compute_checksum((void*)dispid, bytes + 1);
+
+	return ptr + 1;
+}
diff --git a/lib/igt_edid.h b/lib/igt_edid.h
index aac2f4a20874..60e9d71480be 100644
--- a/lib/igt_edid.h
+++ b/lib/igt_edid.h
@@ -302,6 +302,44 @@ struct edid_cea {
 	uint8_t checksum;
 } __attribute__((packed));
 
+enum dispid_tile_caps {
+	DISPID_SINGLE_PHYSICAL_ENCLOSURE = 1 << 7,
+	DISPID_BEZEL_INFORMATION_PRESENT = 1 << 6,
+	DISPID_MULTI_TILE_UNKNOWN = 0 << 3,
+	DISPID_MULTI_TILE_AT_TILE_LOCATION = 1 << 3,
+	DISPID_SINGLE_TILE_UNKNOWN = 0 << 0,
+	DISPID_SINGLE_TILE_AT_TILE_LOCATION = 1 << 0,
+	DISPID_SINGLE_TILE_SCALED_FULLSCREEN = 2 << 0,
+	DISPID_SINGLE_TILE_CLONED_TO_ALL_TILES = 3 << 0,
+};
+
+struct dispid_header {
+	uint8_t rev;
+	uint8_t num_bytes;
+	uint8_t prod_id;
+	uint8_t ext_count;
+} __attribute__((packed));
+
+struct dispid_block_header {
+	uint8_t tag;
+	uint8_t rev;
+	uint8_t num_bytes;
+} __attribute__((packed));
+
+struct dispid_tiled_block {
+	uint8_t tile_caps;
+	uint8_t topo[3];
+	uint8_t tile_size[4];
+	uint8_t tile_pixel_bezel[5];
+	uint8_t topology_id[9];
+} __attribute__((packed));
+
+struct edid_dispid {
+	struct dispid_header header;
+	char data[122];
+	uint8_t checksum;
+} __attribute__((packed));
+
 enum edid_ext_tag {
 	EDID_EXT_CEA = 0x02,
 	EDID_EXT_DISPLAYID = 0x70,
@@ -328,6 +366,7 @@ struct edid_ext {
 	union {
 		struct edid_cea cea;
 		struct edid_tile tile;
+		struct edid_dispid dispid;
 	} data;
 } __attribute__((packed));
 
@@ -403,4 +442,14 @@ void edid_ext_set_cea(struct edid_ext *ext, size_t data_blocks_size,
 		      uint8_t num_native_dtds, uint8_t flags);
 
 void edid_ext_set_displayid(struct edid_ext *ext);
+
+void *edid_ext_dispid(struct edid_ext *ext);
+void *dispid_init(void *ptr);
+void *dispid_done(struct dispid_header *dispid, void *ptr);
+void *dispid_block_tiled(void *ptr,
+			 int num_htiles, int num_vtiles,
+			 int htile, int vtile,
+			 int hsize, int vsize,
+			 const char *topology_id);
+
 #endif
-- 
2.32.0
