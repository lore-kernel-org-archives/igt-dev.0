Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC8610E02A
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jul 2023 19:22:14 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 15:21:57 -0400
Message-ID: <20230719192157.267244-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amdgpu: vcn test add session context buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: ruijing.dong@amd.com, leo.liu@amd.com, saleemkhan.jamadar@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Porting libdrm vcn test updates:

1. Rename vbv_buffer to input buffer.
2. Update decoder test with using session context buffer
3. Added helper function amdgpu_cs_vcn_ib_zero_count.

Cc: Leo Liu <leo.liu@amd.com>
Cc: Ruijing Dong <ruijing.dong@amd.com>
Cc: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>

Signed-off-by: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
Signed-off-by: Ruijing Dong <ruijing.dong@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Reviewed-by: Ruijing Dong <ruijing.dong@amd.com>

---
 tests/amdgpu/amd_vcn.c | 83 ++++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/tests/amdgpu/amd_vcn.c b/tests/amdgpu/amd_vcn.c
index aaf216fb9..bd8c9da23 100644
--- a/tests/amdgpu/amd_vcn.c
+++ b/tests/amdgpu/amd_vcn.c
@@ -115,6 +115,7 @@ struct h264_decode {
 struct vcn_context {
 	struct amdgpu_mmd_bo enc_buf;
 	struct amdgpu_mmd_bo cpb_buf;
+	struct amdgpu_mmd_bo session_ctx_buf;
 	uint32_t enc_task_id;
 	uint32_t *ib_checksum;
 	uint32_t *ib_size_in_dw;
@@ -327,7 +328,9 @@ amdgpu_cs_vcn_dec_create(amdgpu_device_handle device_handle, struct mmd_context
 
 	context->num_resources  = 0;
 	alloc_resource(device_handle, &msg_buf, 4096, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &v_context->session_ctx_buf, 32 * 4096, AMDGPU_GEM_DOMAIN_GTT);
 	context->resources[context->num_resources++] = msg_buf.handle;
+	context->resources[context->num_resources++] = v_context->session_ctx_buf.handle;
 	context->resources[context->num_resources++] = context->ib_handle;
 	r = amdgpu_bo_cpu_map(msg_buf.handle, (void **)&msg_buf.ptr);
 	igt_assert_eq(r, 0);
@@ -336,9 +339,10 @@ amdgpu_cs_vcn_dec_create(amdgpu_device_handle device_handle, struct mmd_context
 	memcpy(msg_buf.ptr, vcn_dec_create_msg, sizeof(vcn_dec_create_msg));
 
 	len = 0;
-	if (context->vcn_dec_sw_ring == true)
+	vcn_dec_cmd(context, v_context, v_context->session_ctx_buf.addr, 5, &len);
+	if (context->vcn_dec_sw_ring == true) {
 		vcn_dec_cmd(context, v_context, msg_buf.addr, 0, &len);
-	else {
+	} else {
 		context->ib_cpu[len++] = reg[context->vcn_reg_index].data0;
 		context->ib_cpu[len++] = msg_buf.addr;
 		context->ib_cpu[len++] = reg[context->vcn_reg_index].data1;
@@ -350,7 +354,6 @@ amdgpu_cs_vcn_dec_create(amdgpu_device_handle device_handle, struct mmd_context
 			context->ib_cpu[len++] = 0;
 		}
 	}
-
 	if (context->vcn_unified_ring) {
 		amdgpu_cs_sq_ib_tail(v_context, context->ib_cpu + len);
 		ip = AMDGPU_HW_IP_VCN_ENC;
@@ -382,6 +385,7 @@ amdgpu_cs_vcn_dec_decode(amdgpu_device_handle device_handle, struct mmd_context
 	size += ALIGN(dpb_size, 4*1024);
 	size += ALIGN(dt_size, 4*1024);
 
+
 	context->num_resources = 0;
 	alloc_resource(device_handle, &dec_buf, size, AMDGPU_GEM_DOMAIN_GTT);
 	context->resources[context->num_resources++] = dec_buf.handle;
@@ -416,7 +420,9 @@ amdgpu_cs_vcn_dec_decode(amdgpu_device_handle device_handle, struct mmd_context
 	ctx_addr = ALIGN(dpb_addr + 0x006B9400, 4*1024);
 	dt_addr = ALIGN(dpb_addr + dpb_size, 4*1024);
 
+
 	len = 0;
+	vcn_dec_cmd(context, v_context, v_context->session_ctx_buf.addr, 0x5, &len);
 	vcn_dec_cmd(context, v_context, msg_addr, 0x0, &len);
 	vcn_dec_cmd(context, v_context, dpb_addr, 0x1, &len);
 	vcn_dec_cmd(context, v_context, dt_addr, 0x2, &len);
@@ -471,9 +477,10 @@ amdgpu_cs_vcn_dec_destroy(amdgpu_device_handle device_handle,
 	memcpy(msg_buf.ptr, vcn_dec_destroy_msg, sizeof(vcn_dec_destroy_msg));
 
 	len = 0;
-	if (context->vcn_dec_sw_ring == true)
+	vcn_dec_cmd(context, v_context, v_context->session_ctx_buf.addr, 5, &len);
+	if (context->vcn_dec_sw_ring == true) {
 		vcn_dec_cmd(context, v_context, msg_buf.addr, 0, &len);
-	else {
+	} else {
 		context->ib_cpu[len++] = reg[context->vcn_reg_index].data0;
 		context->ib_cpu[len++] = msg_buf.addr;
 		context->ib_cpu[len++] = reg[context->vcn_reg_index].data1;
@@ -485,7 +492,6 @@ amdgpu_cs_vcn_dec_destroy(amdgpu_device_handle device_handle,
 			context->ib_cpu[len++] = 0;
 		}
 	}
-
 	if (context->vcn_unified_ring) {
 		amdgpu_cs_sq_ib_tail(v_context, context->ib_cpu + len);
 		ip = AMDGPU_HW_IP_VCN_ENC;
@@ -496,6 +502,7 @@ amdgpu_cs_vcn_dec_destroy(amdgpu_device_handle device_handle,
 	igt_assert_eq(r, 0);
 
 	free_resource(&msg_buf);
+	free_resource(&v_context->session_ctx_buf);
 }
 
 static void
@@ -579,6 +586,8 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 0;
 	context->ib_cpu[len++] = 0;	/* pre encode mode */
 	context->ib_cpu[len++] = 0;	/* chroma enabled : false */
+	context->ib_cpu[len++] = 0;
+	context->ib_cpu[len++] = 0;
 	*st_size = (len - st_offset) * 4;
 
 	/* slice control */
@@ -600,7 +609,7 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 1;	/* quarter pel enabled */
 	context->ib_cpu[len++] = 100;	/* BASELINE profile */
 	context->ib_cpu[len++] = 11;	/* level */
-	if (context->vcn_ip_version_major == 3) {
+	if (context->vcn_ip_version_major >= 3) {
 		context->ib_cpu[len++] = 0;	/* b_picture_enabled */
 		context->ib_cpu[len++] = 0;	/* weighted_bipred_idc */
 	}
@@ -641,7 +650,7 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 0;	/* scene change sensitivity */
 	context->ib_cpu[len++] = 0;	/* scene change min idr interval */
 	context->ib_cpu[len++] = 0;
-	if (context->vcn_ip_version_major == 3)
+	if (context->vcn_ip_version_major >= 3)
 		context->ib_cpu[len++] = 0;
 	*st_size = (len - st_offset) * 4;
 
@@ -684,6 +693,7 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 1;
 	context->ib_cpu[len++] = 0;
 	context->ib_cpu[len++] = 1;
+	context->ib_cpu[len++] = 0;
 	*st_size = (len - st_offset) * 4;
 
 	/* op init rc */
@@ -707,6 +717,15 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	igt_assert_eq(r, 0);
 }
 
+static void
+amdgpu_cs_vcn_ib_zero_count(struct mmd_context *context, int *len, int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++)
+		context->ib_cpu[(*len)++] = 0;
+}
+
 static int32_t
 h264_se(struct buffer_info *buf_info)
 {
@@ -1046,7 +1065,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 			struct mmd_context *context, struct vcn_context *v_context,
 			int frame_type)
 {
-	struct amdgpu_mmd_bo bs_buf, fb_buf, vbv_buf;
+	struct amdgpu_mmd_bo bs_buf, fb_buf, input_buf;
 	int len, r, i;
 	unsigned	int width = 160, height = 128, buf_size;
 	uint32_t *p_task_size = NULL;
@@ -1067,12 +1086,12 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	context->num_resources = 0;
 	alloc_resource(device_handle, &bs_buf, 4096, AMDGPU_GEM_DOMAIN_GTT);
 	alloc_resource(device_handle, &fb_buf, 4096, AMDGPU_GEM_DOMAIN_GTT);
-	alloc_resource(device_handle, &vbv_buf, buf_size, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &input_buf, buf_size, AMDGPU_GEM_DOMAIN_GTT);
 	context->resources[context->num_resources++] = v_context->enc_buf.handle;
 	context->resources[context->num_resources++] = v_context->cpb_buf.handle;
 	context->resources[context->num_resources++] = bs_buf.handle;
 	context->resources[context->num_resources++] = fb_buf.handle;
-	context->resources[context->num_resources++] = vbv_buf.handle;
+	context->resources[context->num_resources++] = input_buf.handle;
 	context->resources[context->num_resources++] = context->ib_handle;
 
 
@@ -1084,13 +1103,13 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	memset(fb_buf.ptr, 0, 4096);
 	r = amdgpu_bo_cpu_unmap(fb_buf.handle);
 
-	r = amdgpu_bo_cpu_map(vbv_buf.handle, (void **)&vbv_buf.ptr);
+	r = amdgpu_bo_cpu_map(input_buf.handle, (void **)&input_buf.ptr);
 	igt_assert_eq(r, 0);
 
 	for (i = 0; i < ALIGN(height, 32) * 3 / 2; i++)
-		memcpy(vbv_buf.ptr + i * ALIGN(width, 256), frame + i * width, width);
+		memcpy(input_buf.ptr + i * ALIGN(width, 256), frame + i * width, width);
 
-	r = amdgpu_bo_cpu_unmap(vbv_buf.handle);
+	r = amdgpu_bo_cpu_unmap(input_buf.handle);
 	igt_assert_eq(r, 0);
 
 	len = 0;
@@ -1125,7 +1144,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		if (context->vcn_ip_version_major == 1)
 			context->ib_cpu[len++] = 0x00000020;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU vcn 1 */
 		else
-			context->ib_cpu[len++] = 0x0000000a;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU vcn 2,3 */
+			context->ib_cpu[len++] = 0x0000000a;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU other vcn */
 		context->ib_cpu[len++] = 0x00000002;	/* RENCODE_DIRECT_OUTPUT_NALU_TYPE_SPS */
 		context->ib_cpu[len++] = 0x00000011;	/* sps len */
 		context->ib_cpu[len++] = 0x00000001;	/* start code */
@@ -1141,7 +1160,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		if (context->vcn_ip_version_major == 1)
 			context->ib_cpu[len++] = 0x00000020;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU vcn 1*/
 		else
-			context->ib_cpu[len++] = 0x0000000a;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU vcn 2,3*/
+			context->ib_cpu[len++] = 0x0000000a;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU other vcn*/
 		context->ib_cpu[len++] = 0x00000003;	/* RENCODE_DIRECT_OUTPUT_NALU_TYPE_PPS */
 		context->ib_cpu[len++] = 0x00000008;	/* pps len */
 		context->ib_cpu[len++] = 0x00000001;	/* start code */
@@ -1164,8 +1183,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x34210000;
 	}
 	context->ib_cpu[len++] = 0xe0000000;
-	for (i = 0; i < 13; i++)
-		context->ib_cpu[len++] = 0x00000000;
+	amdgpu_cs_vcn_ib_zero_count(context, &len, 13);
 
 	context->ib_cpu[len++] = 0x00000001;
 	context->ib_cpu[len++] = 0x00000008;
@@ -1177,8 +1195,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 0x00000000;
 	context->ib_cpu[len++] = 0x00000001;
 	context->ib_cpu[len++] = 0x00000003;
-	for (i = 0; i < 22; i++)
-		context->ib_cpu[len++] = 0x00000000;
+	amdgpu_cs_vcn_ib_zero_count(context, &len, 22);
 
 	*st_size = (len - st_offset) * 4;
 
@@ -1188,13 +1205,13 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	if (context->vcn_ip_version_major == 1)
 		context->ib_cpu[len++] = 0x0000000b;	/* RENCODE_IB_PARAM_ENCODE_PARAMS vcn 1*/
 	else
-		context->ib_cpu[len++] = 0x0000000f;	/* RENCODE_IB_PARAM_ENCODE_PARAMS vcn 2,3*/
+		context->ib_cpu[len++] = 0x0000000f;	/* RENCODE_IB_PARAM_ENCODE_PARAMS other vcn*/
 	context->ib_cpu[len++] = frame_type;
 	context->ib_cpu[len++] = 0x0001f000;
-	context->ib_cpu[len++] = vbv_buf.addr >> 32;
-	context->ib_cpu[len++] = vbv_buf.addr;
-	context->ib_cpu[len++] = (vbv_buf.addr + ALIGN(width, 256) * ALIGN(height, 32)) >> 32;
-	context->ib_cpu[len++] = vbv_buf.addr + ALIGN(width, 256) * ALIGN(height, 32);
+	context->ib_cpu[len++] = input_buf.addr >> 32;
+	context->ib_cpu[len++] = input_buf.addr;
+	context->ib_cpu[len++] = (input_buf.addr + ALIGN(width, 256) * ALIGN(height, 32)) >> 32;
+	context->ib_cpu[len++] = input_buf.addr + ALIGN(width, 256) * ALIGN(height, 32);
 	context->ib_cpu[len++] = 0x00000100;
 	context->ib_cpu[len++] = 0x00000080;
 	context->ib_cpu[len++] = 0x00000000;
@@ -1206,7 +1223,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];	/* size */
 	context->ib_cpu[len++] = 0x00200003;	/* RENCODE_H264_IB_PARAM_ENCODE_PARAMS */
-	if (context->vcn_ip_version_major != 3) {
+	if (context->vcn_ip_version_major <= 2) {
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
@@ -1229,6 +1246,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
+		context->ib_cpu[len++] = 0x00000001;
 	}
 	*st_size = (len - st_offset) * 4;
 
@@ -1238,20 +1256,21 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	if (context->vcn_ip_version_major == 1)
 		context->ib_cpu[len++] = 0x0000000d;	/* ENCODE_CONTEXT_BUFFER  vcn 1 */
 	else
-		context->ib_cpu[len++] = 0x00000011;	/* ENCODE_CONTEXT_BUFFER  vcn 2,3 */
+		context->ib_cpu[len++] = 0x00000011;	/* ENCODE_CONTEXT_BUFFER  other vcn*/
 	context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
 	context->ib_cpu[len++] = v_context->cpb_buf.addr;
 	context->ib_cpu[len++] = 0x00000000;	/* swizzle mode */
 	context->ib_cpu[len++] = 0x00000100;	/* luma pitch */
 	context->ib_cpu[len++] = 0x00000100;	/* chroma pitch */
-	context->ib_cpu[len++] = 0x00000003; /* no reconstructed picture */
+	context->ib_cpu[len++] = 0x00000002; /* no reconstructed picture */
 	context->ib_cpu[len++] = 0x00000000;	/* reconstructed pic 1 luma offset */
 	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32);	/* pic1 chroma offset */
+	if (context->vcn_ip_version_major == 4)
+		amdgpu_cs_vcn_ib_zero_count(context, &len, 2);
 	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32) * 3 / 2;	/* pic2 luma offset */
 	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32) * 5 / 2;	/* pic2 chroma offset */
 
-	for (i = 0; i < 136; i++)
-		context->ib_cpu[len++] = 0x00000000;
+	amdgpu_cs_vcn_ib_zero_count(context, &len, 280);
 	*st_size = (len - st_offset) * 4;
 
 	/* bitstream buffer */
@@ -1260,7 +1279,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	if (context->vcn_ip_version_major == 1)
 		context->ib_cpu[len++] = 0x0000000e;	/* VIDEO_BITSTREAM_BUFFER vcn 1 */
 	else
-		context->ib_cpu[len++] = 0x00000012;	/* VIDEO_BITSTREAM_BUFFER vcn 2,3 */
+		context->ib_cpu[len++] = 0x00000012;	/* VIDEO_BITSTREAM_BUFFER other vcn */
 	context->ib_cpu[len++] = 0x00000000;	/* mode */
 	context->ib_cpu[len++] = bs_buf.addr >> 32;
 	context->ib_cpu[len++] = bs_buf.addr;
@@ -1343,7 +1362,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 
 	free_resource(&fb_buf);
 	free_resource(&bs_buf);
-	free_resource(&vbv_buf);
+	free_resource(&input_buf);
 }
 
 static void
-- 
2.25.1
