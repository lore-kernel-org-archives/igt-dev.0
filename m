Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFBF10E10B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 15:49:16 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 08:49:21 -0700
Message-Id: <20231004154922.3478014-13-lucas.demarchi@intel.com>
In-Reply-To: <20231004154922.3478014-1-lucas.demarchi@intel.com>
References: <20231004154922.3478014-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 12/13] lib/intel_blt: Support xe2 in
 xy-fast-copy command
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Xe2 xy-fast-copy command is slightly different, with dw01 and dw07
having a few differences: 1) different bitrange for mocs (it was
previously absent in dw07); 2) no dst_memory, src_memory;
3) hardcoded dst_type_y and src_type_y to 1.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 82 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 61 insertions(+), 21 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 4e0fe6320..0d00f0fbc 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1185,16 +1185,29 @@ struct gen12_fast_copy_data {
 		uint32_t client:			BITRANGE(29, 31);
 	} dw00;
 
-	struct {
-		uint32_t dst_pitch:			BITRANGE(0, 15);
-		uint32_t rsvd1:				BITRANGE(16, 23);
-		uint32_t color_depth:			BITRANGE(24, 26);
-		uint32_t rsvd0:				BITRANGE(27, 27);
-		uint32_t dst_memory:			BITRANGE(28, 28);
-		uint32_t src_memory:			BITRANGE(29, 29);
-		uint32_t dst_type_y:			BITRANGE(30, 30);
-		uint32_t src_type_y:			BITRANGE(31, 31);
-	} dw01;
+	union {
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 15);
+			uint32_t rsvd1:				BITRANGE(16, 23);
+			uint32_t color_depth:			BITRANGE(24, 26);
+			uint32_t rsvd0:				BITRANGE(27, 27);
+			uint32_t dst_memory:			BITRANGE(28, 28);
+			uint32_t src_memory:			BITRANGE(29, 29);
+			uint32_t dst_type_y:			BITRANGE(30, 30);
+			uint32_t src_type_y:			BITRANGE(31, 31);
+		} dw01;
+		struct {
+			uint32_t dst_pitch:			BITRANGE(0, 15);
+			uint32_t rsvd2:				BITRANGE(16, 16);
+			uint32_t pxp:				BITRANGE(16, 17);
+			uint32_t rsvd1:				BITRANGE(18, 19);
+			uint32_t dst_mocs_index:		BITRANGE(20, 23);
+			uint32_t color_depth:			BITRANGE(24, 26);
+			uint32_t rsvd0:				BITRANGE(27, 29);
+			uint32_t dst_type_y:			BITRANGE(30, 30);
+			uint32_t src_type_y:			BITRANGE(31, 31);
+		} dw01_xe2;
+	};
 
 	struct {
 		int32_t dst_x1:				BITRANGE(0, 15);
@@ -1219,10 +1232,20 @@ struct gen12_fast_copy_data {
 		int32_t src_y1:				BITRANGE(16, 31);
 	} dw06;
 
-	struct {
-		uint32_t src_pitch:			BITRANGE(0, 15);
-		uint32_t rsvd0:				BITRANGE(16, 31);
-	} dw07;
+	union {
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 15);
+			uint32_t rsvd0:				BITRANGE(16, 31);
+		} dw07;
+		struct {
+			uint32_t src_pitch:			BITRANGE(0, 15);
+			uint32_t rsvd0:				BITRANGE(16, 16);
+			uint32_t pxp:				BITRANGE(17, 17);
+			uint32_t rsvd1:				BITRANGE(18, 19);
+			uint32_t src_mocs_index:		BITRANGE(20, 23);
+			uint32_t rsvd2:				BITRANGE(24, 31);
+		} dw07_xe2;
+	};
 
 	struct {
 		uint32_t src_address_lo;
@@ -1321,11 +1344,13 @@ uint64_t emit_blt_fast_copy(int fd,
 			    uint64_t bb_pos,
 			    bool emit_bbe)
 {
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	struct gen12_fast_copy_data data = {};
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
 
+
 	alignment = get_default_alignment(fd, blt->driver);
 
 	data.dw00.client = 0x2;
@@ -1334,12 +1359,22 @@ uint64_t emit_blt_fast_copy(int fd,
 	data.dw00.src_tiling = __fast_tiling(blt->src.tiling);
 	data.dw00.length = 8;
 
-	data.dw01.dst_pitch = blt->dst.pitch;
-	data.dw01.color_depth = __fast_color_depth(blt->color_depth);
-	data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
-	data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
-	data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
-	data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data.dw01_xe2.dst_pitch = blt->dst.pitch;
+		data.dw01_xe2.dst_mocs_index = blt->dst.mocs_index;
+		data.dw01_xe2.color_depth = __fast_color_depth(blt->color_depth);
+
+		/* Undefined behavior to leave as 0, must be set to 1 */
+		data.dw01_xe2.dst_type_y = 1;
+		data.dw01_xe2.src_type_y = 1;
+	} else {
+		data.dw01.dst_pitch = blt->dst.pitch;
+		data.dw01.color_depth = __fast_color_depth(blt->color_depth);
+		data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
+		data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
+		data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
+		data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
+	}
 
 	data.dw02.dst_x1 = blt->dst.x1;
 	data.dw02.dst_y1 = blt->dst.y1;
@@ -1359,7 +1394,12 @@ uint64_t emit_blt_fast_copy(int fd,
 	data.dw06.src_x1 = blt->src.x1;
 	data.dw06.src_y1 = blt->src.y1;
 
-	data.dw07.src_pitch = blt->src.pitch;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data.dw07_xe2.src_pitch = blt->src.pitch;
+		data.dw07_xe2.src_mocs_index = blt->src.mocs_index;
+	} else {
+		data.dw07.src_pitch = blt->src.pitch;
+	}
 
 	data.dw08.src_address_lo = src_offset;
 	data.dw09.src_address_hi = src_offset >> 32;
-- 
2.40.1
