Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8D210E550
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 13:19:10 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 16:08:49 +0300
Message-Id: <20230601130850.26359-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
References: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 6/7] lib/edid: Add support for making
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
index 68dc4f75478b..387b479b4db7 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -578,3 +578,79 @@ void edid_ext_set_cea(struct edid_ext *ext, size_t data_blocks_size,
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
index 85a9ef5e1a25..02645345f0d0 100644
--- a/lib/igt_edid.h
+++ b/lib/igt_edid.h
@@ -303,6 +303,44 @@ struct edid_cea {
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
@@ -329,6 +367,7 @@ struct edid_ext {
 	union {
 		struct edid_cea cea;
 		struct edid_tile tile;
+		struct edid_dispid dispid;
 	} data;
 } __attribute__((packed));
 
@@ -408,4 +447,14 @@ void edid_ext_set_cea(struct edid_ext *ext, size_t data_blocks_size,
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
2.39.3
