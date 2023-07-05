Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1370D10E0DE
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 08:01:23 +0000 (UTC)
From: Alan Liu <HaoPing.Liu@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 5 Jul 2023 16:01:14 +0800
Message-ID: <20230705080115.31011-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 1/2] drm-uapi/drm_mode: sync with latest uAPI
 changes for checksum_region
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alan Liu <HaoPing.Liu@amd.com>, Lili.Gong@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add struct drm_checksum_region and struct drm_checksum_crc as the
userspace data for using checksum_region feature.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 include/drm-uapi/drm_mode.h | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index e4a2570a6..dec073921 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -1209,6 +1209,48 @@ struct drm_mode_rect {
 	__s32 y2;
 };
 
+/**
+ * struct drm_checksum_region - The enablement and region of checksum_region
+ * @x_start: Horizontal starting coordinate of the region.
+ * @y_start: Vertical starting coordinate of the region.
+ * @x_end: Horizontal ending coordinate of the region.
+ * @y_end: Vertical ending coordinate of the region.
+ * @checksum_region_enable: To enable or disable checksum_region.
+ *
+ * Userspace uses this structure to configure the region and enablement for
+ * checksum_region. Userspace should not submit a region out of the displayable
+ * region because there is nothing to display and need protection.
+ */
+struct drm_checksum_region {
+        __u32 x_start;
+        __u32 y_start;
+        __u32 x_end;
+        __u32 y_end;
+        __u8 checksum_region_enable;
+        __u8 pad[7];
+};
+
+/**
+ * struct drm_checksum_crc - The CRC value of the corresponding checksum region.
+ * @crc_r: CRC value of red color.
+ * @crc_g: CRC value of green color.
+ * @crc_b: CRC value of blue color.
+ * @frame_count: a referenced frame count to indicate which frame the CRC values
+ *  are generated at.
+ *
+ * Userspace uses this structure to retrieve the CRC values of the current
+ * checksum region. @frame_count will be reset once a new region is updated or
+ * it reaches a maximum value. Currently these CRC values are designed to
+ * be validated with pre-saved CRC values, so userspace doesn't need to concern
+ * about the algorithm used to compute the CRC.
+ */
+struct drm_checksum_crc {
+        __u32 crc_r;
+        __u32 crc_g;
+        __u32 crc_b;
+        __u32 frame_count;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1
