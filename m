Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:44 -0700
Message-Id: <20230915132346.1845909-13-lucas.demarchi@intel.com>
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/14] lib/intel_blt: Support Xe2 in
 xy-block-copy command
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Xe2 block-copy command is slightly different, with dw01 and dw02
having a few differences: 1) different bitrange for mocs; 2) no
ctrl_surface_type, aux_mode or compression.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_blt.c | 107 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 69 insertions(+), 38 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 9f8e3dea3..0658d67f4 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -55,15 +55,24 @@ struct gen12_block_copy_data {
 		uint32_t client:			BITRANGE(29, 31);
 	} dw00;
 
-	struct {
-		uint32_t dst_pitch:			BITRANGE(0, 17);
-		uint32_t dst_aux_mode:			BITRANGE(18, 20);
-		uint32_t pad:				BITRANGE(21, 21);
-		uint32_t dst_mocs:			BITRANGE(22, 27);
-		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
-		uint32_t dst_compression:		BITRANGE(29, 29);
-		uint32_t dst_tiling:			BITRANGE(30, 31);
-	} dw01;
+	union {
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 17);
+			uint32_t dst_aux_mode:			BITRANGE(18, 20);
+			uint32_t pad:				BITRANGE(21, 21);
+			uint32_t dst_mocs:			BITRANGE(22, 27);
+			uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
+			uint32_t dst_compression:		BITRANGE(29, 29);
+			uint32_t dst_tiling:			BITRANGE(30, 31);
+		} dw01;
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 17);
+			uint32_t pad0:				BITRANGE(18, 23);
+			uint32_t dst_mocs:			BITRANGE(24, 27);
+			uint32_t pad1:				BITRANGE(28, 29);
+			uint32_t dst_tiling:			BITRANGE(30, 31);
+		} dw01_xe2;
+	};
 
 	struct {
 		int32_t dst_x1:				BITRANGE(0, 15);
@@ -96,15 +105,24 @@ struct gen12_block_copy_data {
 		int32_t src_y1:				BITRANGE(16, 31);
 	} dw07;
 
-	struct {
-		uint32_t src_pitch:			BITRANGE(0, 17);
-		uint32_t src_aux_mode:			BITRANGE(18, 20);
-		uint32_t pad:				BITRANGE(21, 21);
-		uint32_t src_mocs:			BITRANGE(22, 27);
-		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
-		uint32_t src_compression:		BITRANGE(29, 29);
-		uint32_t src_tiling:			BITRANGE(30, 31);
-	} dw08;
+	union {
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 17);
+			uint32_t src_aux_mode:			BITRANGE(18, 20);
+			uint32_t pad:				BITRANGE(21, 21);
+			uint32_t src_mocs:			BITRANGE(22, 27);
+			uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
+			uint32_t src_compression:		BITRANGE(29, 29);
+			uint32_t src_tiling:			BITRANGE(30, 31);
+		} dw08;
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 17);
+			uint32_t pad0:				BITRANGE(18, 23);
+			uint32_t src_mocs:			BITRANGE(24, 27);
+			uint32_t pad1:				BITRANGE(28, 29);
+			uint32_t src_tiling:			BITRANGE(30, 31);
+		} dw08_xe2;
+	};
 
 	struct {
 		uint32_t src_address_lo;
@@ -521,7 +539,7 @@ static bool __new_tile_y_type(enum blt_tiling_type tiling)
 static void fill_data(struct gen12_block_copy_data *data,
 		      const struct blt_copy_data *blt,
 		      uint64_t src_offset, uint64_t dst_offset,
-		      bool extended_command)
+		      bool extended_command, unsigned int ip_ver)
 {
 	data->dw00.client = 0x2;
 	data->dw00.opcode = 0x41;
@@ -529,18 +547,24 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw00.special_mode = __special_mode(blt);
 	data->dw00.length = extended_command ? 20 : 10;
 
-	if (__special_mode(blt) == SM_FULL_RESOLVE)
-		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
-	else
-		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
-	data->dw01.dst_pitch = blt->dst.pitch - 1;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data->dw01_xe2.dst_pitch = blt->dst.pitch - 1;
+		data->dw01_xe2.dst_mocs = blt->dst.mocs;
+		data->dw01_xe2.dst_tiling = __block_tiling(blt->dst.tiling);
+	} else {
+		if (__special_mode(blt) == SM_FULL_RESOLVE)
+			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
+		else
+			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
+		data->dw01.dst_pitch = blt->dst.pitch - 1;
 
-	data->dw01.dst_mocs = blt->dst.mocs;
-	data->dw01.dst_compression = blt->dst.compression;
-	data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
+		data->dw01.dst_mocs = blt->dst.mocs;
+		data->dw01.dst_compression = blt->dst.compression;
+		data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
 
-	if (blt->dst.compression)
-		data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
+		if (blt->dst.compression)
+			data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
+	}
 
 	data->dw02.dst_x1 = blt->dst.x1;
 	data->dw02.dst_y1 = blt->dst.y1;
@@ -558,14 +582,20 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw07.src_x1 = blt->src.x1;
 	data->dw07.src_y1 = blt->src.y1;
 
-	data->dw08.src_pitch = blt->src.pitch - 1;
-	data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
-	data->dw08.src_mocs = blt->src.mocs;
-	data->dw08.src_compression = blt->src.compression;
-	data->dw08.src_tiling = __block_tiling(blt->src.tiling);
-
-	if (blt->src.compression)
-		data->dw08.src_ctrl_surface_type = blt->src.compression_type;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data->dw08_xe2.src_pitch = blt->src.pitch - 1;
+		data->dw08_xe2.src_mocs = blt->src.mocs;
+		data->dw08_xe2.src_tiling = __block_tiling(blt->src.tiling);
+	} else {
+		data->dw08.src_pitch = blt->src.pitch - 1;
+		data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
+		data->dw08.src_mocs = blt->src.mocs;
+		data->dw08.src_compression = blt->src.compression;
+		data->dw08.src_tiling = __block_tiling(blt->src.tiling);
+
+		if (blt->src.compression)
+			data->dw08.src_ctrl_surface_type = blt->src.compression_type;
+	}
 
 	data->dw09.src_address_lo = src_offset;
 	data->dw10.src_address_hi = src_offset >> 32;
@@ -770,6 +800,7 @@ uint64_t emit_blt_block_copy(int fd,
 			     uint64_t bb_pos,
 			     bool emit_bbe)
 {
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	struct gen12_block_copy_data data = {};
 	struct gen12_block_copy_data_ext dext = {};
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
@@ -786,7 +817,7 @@ uint64_t emit_blt_block_copy(int fd,
 		     + blt->dst.plane_offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
-	fill_data(&data, blt, src_offset, dst_offset, ext);
+	fill_data(&data, blt, src_offset, dst_offset, ext, ip_ver);
 
 	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
 
-- 
2.40.1
