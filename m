Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7861D10E136
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 01:17:44 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 13 Sep 2023 21:17:30 -0400
Message-ID: <20230914011732.343775-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/3] lib/amdgpu: Fix family id failed during
 initialization
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jesse Zhang <jesse.zhang@amd.com>

Starting subtest: userptr-with-IP-DMA
Starting dynamic subtest: userptr
(amd_basic:1766) amdgpu/amd_command_submission-CRITICAL: Test assertion failure function amdgpu_test_exec_cs_helper, file ../lib/amdgpu/amd_command_submission.c:84:
(amd_basic:1766) amdgpu/amd_command_submission-CRITICAL: Failed assertion: r == 0
(amd_basic:1766) amdgpu/amd_command_submission-CRITICAL: Last errno: 62, Timer expired
(amd_basic:1766) amdgpu/amd_command_submission-CRITICAL: error: -62 != 0
Stack trace:
  #0 ../lib/igt_core.c:1988 __igt_fail_assert()
  #1 ../lib/amdgpu/amd_command_submission.c:85 amdgpu_test_exec_cs_helper()
  #2 ../tests/amdgpu/amd_basic.c:308 __igt_unique____real_main623()
  #3 ../tests/amdgpu/amd_basic.c:623 main()
  #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
  #6 [_start+0x25]
Due to the incorrect family_id, it result in the
userptr test fail. So correct the initial value of
the family id when setting up amdgpu blocks.

v2 : - keep initialization of family_id to FAMILY_VI( Vitaly)
     - added comments (Vitaly)

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 29 +++++++++++++++++++++--------
 lib/amdgpu/amd_ip_blocks.h |  4 ++--
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 7f8d4a4cd..96130ccd5 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -304,7 +304,7 @@ x_compare_pattern(const struct amdgpu_ip_funcs *func,
 	return ret;
 }
 
-static const struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
+static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.family_id = FAMILY_VI,
 	.align_mask = 0xff,
 	.nop = 0x80000000,
@@ -318,7 +318,7 @@ static const struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.get_reg_offset = gfx_v8_0_get_reg_offset,
 };
 
-static const struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
+static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.family_id = FAMILY_VI,
 	.align_mask = 0xff,
 	.nop = 0x80000000,
@@ -332,7 +332,7 @@ static const struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.get_reg_offset = gfx_v8_0_get_reg_offset,
 };
 
-const struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
+struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
 	.type = AMD_IP_GFX,
 	.major = 8,
 	.minor = 0,
@@ -340,7 +340,7 @@ const struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
 	.funcs = &gfx_v8_x_ip_funcs
 };
 
-const struct amdgpu_ip_block_version compute_v8_x_ip_block = {
+struct amdgpu_ip_block_version compute_v8_x_ip_block = {
 	.type = AMD_IP_COMPUTE,
 	.major = 8,
 	.minor = 0,
@@ -348,7 +348,7 @@ const struct amdgpu_ip_block_version compute_v8_x_ip_block = {
 	.funcs = &gfx_v8_x_ip_funcs
 };
 
-const struct amdgpu_ip_block_version sdma_v3_x_ip_block = {
+struct amdgpu_ip_block_version sdma_v3_x_ip_block = {
 	.type = AMD_IP_DMA,
 	.major = 3,
 	.minor = 0,
@@ -368,7 +368,7 @@ struct amdgpu_ip_blocks_device amdgpu_ips;
 struct chip_info g_chip;
 
 static int
-amdgpu_device_ip_block_add(const struct amdgpu_ip_block_version *ip_block_version)
+amdgpu_device_ip_block_add(struct amdgpu_ip_block_version *ip_block_version)
 {
 	if (amdgpu_ips.num_ip_blocks >= AMD_IP_MAX)
 		return -1;
@@ -674,16 +674,29 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	case GFX9: /* tested */
 	case GFX10:/* tested */
 	case GFX10_3: /* tested */
+	case GFX11: /* tested */
 		amdgpu_device_ip_block_add(&gfx_v8_x_ip_block);
 		amdgpu_device_ip_block_add(&compute_v8_x_ip_block);
 		amdgpu_device_ip_block_add(&sdma_v3_x_ip_block);
+		/*
+		 * The handling of a particular family _id is done into
+		 * each function and as a result the field family_id would be overwritten
+		 * during initialization which matches to actual family_id.
+		 * The initial design assumed that for different GPU families, we may
+		 * have different implementations, but it is not necessary.
+		 * TO DO: move family id as a parameter into IP functions and
+		 * remove it as a field
+		 */
+		for (int i = 0; i <  amdgpu_ips.num_ip_blocks; i++)
+			amdgpu_ips.ip_blocks[i]->funcs->family_id = amdinfo->family_id;
+
 		/* extra precaution if re-factor again */
 		igt_assert_eq(gfx_v8_x_ip_block.major, 8);
 		igt_assert_eq(compute_v8_x_ip_block.major, 8);
 		igt_assert_eq(sdma_v3_x_ip_block.major, 3);
 
-		igt_assert_eq(gfx_v8_x_ip_block.funcs->family_id, FAMILY_VI);
-		igt_assert_eq(sdma_v3_x_ip_block.funcs->family_id, FAMILY_VI);
+		igt_assert_eq(gfx_v8_x_ip_block.funcs->family_id, amdinfo->family_id);
+		igt_assert_eq(sdma_v3_x_ip_block.funcs->family_id, amdinfo->family_id);
 		break;
 	default:
 		igt_info("amdgpu: GFX11 or old.\n");
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 673a177ea..7f6fb3fb4 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -85,13 +85,13 @@ struct amdgpu_ip_block_version {
 	const int major;
 	const int minor;
 	const int rev;
-	const struct amdgpu_ip_funcs *funcs;
+	struct amdgpu_ip_funcs *funcs;
 };
 
 /* global holder for the array of in use ip blocks */
 
 struct amdgpu_ip_blocks_device {
-	const struct amdgpu_ip_block_version *ip_blocks[AMD_IP_MAX];
+	struct amdgpu_ip_block_version *ip_blocks[AMD_IP_MAX];
 	int			num_ip_blocks;
 };
 
-- 
2.25.1
