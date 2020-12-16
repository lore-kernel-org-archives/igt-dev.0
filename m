Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7121089C03
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Dec 2020 23:02:38 +0000 (UTC)
From: Sung Joon Kim <sungkim@amd.com>
Date: Wed, 16 Dec 2020 18:02:22 -0500
Message-Id: <20201216230223.24311-1-sungkim@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/2] lib: Add stride and size calculation for
 amdgpu + tiling
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
List-ID: <igt-dev@lists.freedesktop.org>

For amdgpu, we need to calculate the stride and size of framebuffer correctly during non-linear tiling mode

Signed-off-by: Sung Joon Kim <sungkim@amd.com>
---
 lib/igt_fb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 422a9e06..b99e8d07 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -670,6 +670,11 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		 * so the easiest way is to align the luma stride to 256.
 		 */
 		return ALIGN(min_stride, 256);
+	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
+		/*
+		 * For amdgpu device with tiling mode
+		 */
+		return ALIGN(min_stride, 512);
 	} else if (is_gen12_ccs_cc_plane(fb, plane)) {
 		/* clear color always fixed to 64 bytes */
 		return 64;
@@ -710,6 +715,12 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		size = roundup_power_of_two(size);
 
 		return size;
+	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
+		/*
+		 * For amdgpu device with tiling mode
+		 */
+		return (uint64_t) fb->strides[plane] *
+			ALIGN(fb->plane_height[plane], 512);
 	} else if (is_gen12_ccs_plane(fb, plane)) {
 		/* The AUX CCS surface must be page aligned */
 		return (uint64_t)fb->strides[plane] *
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
