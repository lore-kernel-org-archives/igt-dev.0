Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:23 -0700
Message-Id: <20231004031023.3444455-14-lucas.demarchi@intel.com>
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 13/13] lib/intel_blt: Support xe2 in
 ctrl-surf-copy command
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

Xe2 ctrl-surf-copy command varies significantly from gen12. Create a new
struct and function to fill the data, sharing the rest of the logic in
emit_blt_ctrl_surf_copy().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_blt.c | 128 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 107 insertions(+), 21 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 0d00f0fbc..81b765548 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -998,6 +998,65 @@ struct gen12_ctrl_surf_copy_data {
 	} dw04;
 };
 
+struct xe2_ctrl_surf_copy_data {
+	struct {
+		uint32_t length:			BITRANGE(0, 7);
+		uint32_t rsvd0:				BITRANGE(8, 8);
+		uint32_t size_of_ctrl_copy:		BITRANGE(9, 18);
+		uint32_t rsvd1:				BITRANGE(19, 19);
+		uint32_t dst_access_type:		BITRANGE(20, 20);
+		uint32_t src_access_type:		BITRANGE(21, 21);
+		uint32_t opcode:			BITRANGE(22, 28);
+		uint32_t client:			BITRANGE(29, 31);
+	} dw00;
+
+	struct {
+		uint32_t src_address_lo;
+	} dw01;
+
+	struct {
+		uint32_t src_address_hi:		BITRANGE(0, 24);
+		uint32_t pxp:				BITRANGE(25, 27);
+		uint32_t src_mocs_index:		BITRANGE(28, 31);
+	} dw02;
+
+	struct {
+		uint32_t dst_address_lo;
+	} dw03;
+
+	struct {
+		uint32_t dst_address_hi:		BITRANGE(0, 24);
+		uint32_t pxp:				BITRANGE(25, 27);
+		uint32_t dst_mocs_index:		BITRANGE(28, 31);
+	} dw04;
+};
+
+union ctrl_surf_copy_data {
+	struct gen12_ctrl_surf_copy_data gen12;
+	struct xe2_ctrl_surf_copy_data xe2;
+};
+
+static void xe2_dump_bb_surf_ctrl_cmd(const struct xe2_ctrl_surf_copy_data *data)
+{
+	uint32_t *cmd = (uint32_t *) data;
+
+	igt_info("details:\n");
+	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, "
+		 "src/dst access type: <%d, %d>, size of ctrl copy: %u, length: %d>\n",
+		 cmd[0],
+		 data->dw00.client, data->dw00.opcode,
+		 data->dw00.src_access_type, data->dw00.dst_access_type,
+		 data->dw00.size_of_ctrl_copy, data->dw00.length);
+	igt_info(" dw01: [%08x] src offset lo (0x%x)\n",
+		 cmd[1], data->dw01.src_address_lo);
+	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs idx: %u\n",
+		 cmd[2], data->dw02.src_address_hi, data->dw02.src_mocs_index);
+	igt_info(" dw03: [%08x] dst offset lo (0x%x)\n",
+		 cmd[3], data->dw03.dst_address_lo);
+	igt_info(" dw04: [%08x] dst offset hi (0x%x), src mocs idx: %u\n",
+		 cmd[4], data->dw04.dst_address_hi, data->dw04.dst_mocs_index);
+}
+
 static void dump_bb_surf_ctrl_cmd(const struct gen12_ctrl_surf_copy_data *data)
 {
 	uint32_t *cmd = (uint32_t *) data;
@@ -1056,7 +1115,9 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 				 uint64_t bb_pos,
 				 bool emit_bbe)
 {
-	struct gen12_ctrl_surf_copy_data data = {};
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	union ctrl_surf_copy_data data = { };
+	size_t data_sz;
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
@@ -1065,33 +1126,55 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
 
 	alignment = max_t(uint64_t, get_default_alignment(fd, surf->driver), 1ull << 16);
-
-	data.dw00.client = 0x2;
-	data.dw00.opcode = 0x48;
-	data.dw00.src_access_type = surf->src.access_type;
-	data.dw00.dst_access_type = surf->dst.access_type;
-
-	/* Ensure dst has size capable to keep src ccs aux */
-	data.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
-	data.dw00.length = 0x3;
-
 	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
 	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
 	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
 
-	data.dw01.src_address_lo = src_offset;
-	data.dw02.src_address_hi = src_offset >> 32;
-	data.dw02.src_mocs_index = surf->src.mocs_index;
+	if (ip_ver >= IP_VER(20, 0)) {
+		data.xe2.dw00.client = 0x2;
+		data.xe2.dw00.opcode = 0x48;
+		data.xe2.dw00.src_access_type = surf->src.access_type;
+		data.xe2.dw00.dst_access_type = surf->dst.access_type;
+
+		/* Ensure dst has size capable to keep src ccs aux */
+		data.xe2.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
+		data.xe2.dw00.length = 0x3;
+
+		data.xe2.dw01.src_address_lo = src_offset;
+		data.xe2.dw02.src_address_hi = src_offset >> 32;
+		data.xe2.dw02.src_mocs_index = surf->src.mocs_index;
+
+		data.xe2.dw03.dst_address_lo = dst_offset;
+		data.xe2.dw04.dst_address_hi = dst_offset >> 32;
+		data.xe2.dw04.dst_mocs_index = surf->dst.mocs_index;
+
+		data_sz = sizeof(data.xe2);
+	} else {
+		data.gen12.dw00.client = 0x2;
+		data.gen12.dw00.opcode = 0x48;
+		data.gen12.dw00.src_access_type = surf->src.access_type;
+		data.gen12.dw00.dst_access_type = surf->dst.access_type;
+
+		/* Ensure dst has size capable to keep src ccs aux */
+		data.gen12.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
+		data.gen12.dw00.length = 0x3;
+
+		data.gen12.dw01.src_address_lo = src_offset;
+		data.gen12.dw02.src_address_hi = src_offset >> 32;
+		data.gen12.dw02.src_mocs_index = surf->src.mocs_index;
+
+		data.gen12.dw03.dst_address_lo = dst_offset;
+		data.gen12.dw04.dst_address_hi = dst_offset >> 32;
+		data.gen12.dw04.dst_mocs_index = surf->dst.mocs_index;
 
-	data.dw03.dst_address_lo = dst_offset;
-	data.dw04.dst_address_hi = dst_offset >> 32;
-	data.dw04.dst_mocs_index = surf->dst.mocs_index;
+		data_sz = sizeof(data.gen12);
+	}
 
 	bb = bo_map(fd, surf->bb.handle, surf->bb.size, surf->driver);
 
-	igt_assert(bb_pos + sizeof(data) < surf->bb.size);
-	memcpy(bb + bb_pos, &data, sizeof(data));
-	bb_pos += sizeof(data);
+	igt_assert(bb_pos + data_sz < surf->bb.size);
+	memcpy(bb + bb_pos, &data, data_sz);
+	bb_pos += data_sz;
 
 	if (emit_bbe) {
 		igt_assert(bb_pos + sizeof(uint32_t) < surf->bb.size);
@@ -1105,7 +1188,10 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 			 ", bb offset: %" PRIx64 "\n",
 			 src_offset, dst_offset, bb_offset);
 
-		dump_bb_surf_ctrl_cmd(&data);
+		if (ip_ver >= IP_VER(20, 0))
+			xe2_dump_bb_surf_ctrl_cmd(&data.xe2);
+		else
+			dump_bb_surf_ctrl_cmd(&data.gen12);
 	}
 
 	munmap(bb, surf->bb.size);
-- 
2.40.1
