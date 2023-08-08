Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9330D10E22E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 03:47:30 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 7 Aug 2023 20:47:11 -0700
Message-ID: <20230808034713.6805-3-quic_abhinavk@quicinc.com>
In-Reply-To: <20230808034713.6805-1-quic_abhinavk@quicinc.com>
References: <20230808034713.6805-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 2/3] lib/igt_fb: allow
 igt_fb_get_fnv1a_crc() to handle YUV formats
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

To validate YUV formats for writeback, allow igt_fb_get_fnv1a_crc()
to handle YUV formats.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 lib/igt_fb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 55ef63cc71dc..1e3deeaf551a 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4755,7 +4755,7 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	if (fb->drm_format != DRM_FORMAT_XRGB8888)
+	if (!igt_format_is_yuv(fb->drm_format) || fb->drm_format != DRM_FORMAT_XRGB8888)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -4782,7 +4782,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 		for (x = 0; x < fb->width; x++) {
 			unsigned int i;
 			uint32_t pixel = le32_to_cpu(line[x]);
-			pixel &= 0x00ffffff;
+			if (fb->drm_format == DRM_FORMAT_XRGB8888)
+				pixel &= 0x00ffffff;
 
 			for (i = 0; i < sizeof(pixel); i++) {
 				uint8_t component = (pixel >> (i * 8)) & 0xff;
-- 
2.40.1
