Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DC2C54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 20:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1BD10ECCA;
	Fri,  1 Mar 2024 20:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AtrP8/gp";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4609710EC25
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 20:48:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421JHwGn014434; Fri, 1 Mar 2024 20:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=kl/n1RpvOrhPFRfWn5ImsuDJvDorl7WR/Bw1OKj5suQ
 =; b=AtrP8/gpmY5WQk4fF+s1WATkwY8F7R1LNqTymV4dnWzx+UnqCn16Ve1qe7/
 cvYydfuqXhp4mUKCshCgkOR2SWsGLau2Y5csZIlCHYP5lUrLeLZbenIqubwZZCV/
 kcbF/Sxyssiby94IAsJmiGMv6h/ynzWHs3YJKLzxT/sgviEJycfHXm14K55TE4vW
 h4VLp/ylX8I/R18iIwfCCigM/AAWPCdSprlu8wijotqjxo/L9AmGhWevL+dceM4w
 dV/VP4W1Kw74fe/VvrSd9tPluG1v055/u/AOG7KBwB7B+dO7s6sJsTnbcfGHP6s5
 eSp30HUDjiSWj/DLY+Bi7TjMoVA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wkfkf0xvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Mar 2024 20:47:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421KltNd025375
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Mar 2024 20:47:55 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 12:47:55 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 1 Mar 2024 12:47:33 -0800
Subject: [PATCH i-g-t v3 4/5] tests/kms_atomic: Add solid fill plane
 subtest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240301-solid-fill-v3-4-8dff68a8a566@quicinc.com>
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
In-Reply-To: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
CC: Simon Ser <contact@emersion.fr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709326073; l=10185;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Y2b6RlZC2YDat50KSHijegApGsIBD6VPC/xbSan6znc=;
 b=LosinDsiTwy3VkBkPig4Q8NAELjommPG9h1CNs5S/DzekgomgmDTB7ExxFrN9cDHMCkOZ4FEu
 aX5stOeXhiUCzPBTJ0m887YuzeftqosVV9XRCGB19dLpXLf/CppTfye
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -olE0j4g1uQ87JNIp_Ak145ruLIjp-dL
X-Proofpoint-ORIG-GUID: -olE0j4g1uQ87JNIp_Ak145ruLIjp-dL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_21,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=520 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403010171
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add a basic test for solid fill planes.

This test will first commit a single-color framebuffer plane then
a solid fill plane with the same contents. It then validates the solid
fill plane by comparing the resulting CRC with the CRC of the reference
framebuffer commit.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_atomic.c | 209 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 191 insertions(+), 18 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
old mode 100644
new mode 100755
index 2b6e9a8f0383..0598c5d71a85
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -43,6 +43,7 @@
 #include <stdint.h>
 #include <string.h>
 #include <errno.h>
+#include <math.h>
 #include <xf86drmMode.h>
 #include <cairo.h>
 #include "drm.h"
@@ -101,6 +102,15 @@
  * @params-fence:     fence parameters
  */
 
+/**
+ * SUBTEST: plane-%s-solid-fill
+ * Description: Test atomic modesetting on %arg[1] using solid fill property.
+ *
+ * arg[1]:
+ *
+ * @primary:        Primary plane
+ */
+
 #ifndef DRM_CAP_CURSOR_WIDTH
 #define DRM_CAP_CURSOR_WIDTH 0x8
 #endif
@@ -122,18 +132,45 @@ typedef struct {
 	igt_fb_t fb;
 } data_t;
 
+static struct {
+	uint32_t r, g, b;
+} colors[8] = {
+	/* Basic Colors */
+	{ .r = 0x00000000, .g = 0x00000000, .b = 0x00000000 },
+	{ .r = 0xffffffff, .g = 0x00000000, .b = 0x00000000 },
+	{ .r = 0x00000000, .g = 0xffffffff, .b = 0x00000000 },
+	{ .r = 0x00000000, .g = 0x00000000, .b = 0xffffffff },
+	{ .r = 0xffffffff, .g = 0xffffffff, .b = 0xffffffff },
+
+	/* Mid-grays */
+	{ .r = 0x40000000, .g = 0x40000000, .b = 0x40000000 },
+	{ .r = 0x80000000, .g = 0x80000000, .b = 0x80000000 },
+	{ .r = 0xcccccccc, .g = 0xcccccccc, .b = 0xcccccccc },
+};
+
 enum kms_atomic_check_relax {
 	ATOMIC_RELAX_NONE = 0,
 	CRTC_RELAX_MODE = (1 << 0),
 	PLANE_RELAX_FB = (1 << 1)
 };
 
-static inline int damage_rect_width(struct drm_mode_rect *r)
+/*
+ * Fixed point uint to floating point conversion based on
+ * Vulkan's UNORM conversion:
+ *
+ * https://registry.khronos.org/vulkan/specs/1.3/html/chap3.html#fundamentals-fixedconv
+ */
+static inline double unorm_to_float(uint32_t x)
+{
+	return x / (pow(2, 32) - 1);
+}
+
+static inline int rect_width(struct drm_mode_rect *r)
 {
 	return r->x2 - r->x1;
 }
 
-static inline int damage_rect_height(struct drm_mode_rect *r)
+static inline int rect_height(struct drm_mode_rect *r)
 {
 	return r->y2 - r->y1;
 }
@@ -1156,8 +1193,8 @@ static void atomic_plane_damage(data_t *data)
 
 	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
-			damage_rect_width(&damage[0]),
-			damage_rect_height(&damage[0]), 1.0, 0, 0);
+			rect_width(&damage[0]),
+			rect_height(&damage[0]), 1.0, 0, 0);
 	igt_put_cairo_ctx(cr_1);
 
 	igt_plane_set_fb(data->primary, &fb_1);
@@ -1183,8 +1220,8 @@ static void atomic_plane_damage(data_t *data)
 	cairo_set_source_surface(cr_2, fb_1.cairo_surface, 0, 0);
 	cairo_paint(cr_2);
 	igt_paint_color(cr_2, damage[0].x1, damage[0].y1,
-			damage_rect_width(&damage[0]),
-			damage_rect_height(&damage[0]), 0, 1.0, 0);
+			rect_width(&damage[0]),
+			rect_height(&damage[0]), 0, 1.0, 0);
 	igt_put_cairo_ctx(cr_1);
 	igt_put_cairo_ctx(cr_2);
 	igt_plane_set_fb(data->primary, &fb_2);
@@ -1213,8 +1250,8 @@ static void atomic_plane_damage(data_t *data)
 	cairo_set_source_surface(cr_1, fb_2.cairo_surface, 0, 0);
 	cairo_paint(cr_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
-			damage_rect_width(&damage[0]),
-			damage_rect_height(&damage[0]), 0, 1.0, 0);
+			rect_width(&damage[0]),
+			rect_height(&damage[0]), 0, 1.0, 0);
 	igt_put_cairo_ctx(cr_2);
 	igt_put_cairo_ctx(cr_1);
 	igt_plane_set_fb(data->primary, &fb_1);
@@ -1238,8 +1275,8 @@ static void atomic_plane_damage(data_t *data)
 
 	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
-			damage_rect_width(&damage[0]),
-			damage_rect_height(&damage[0]), 1.0, 1.0, 0);
+			rect_width(&damage[0]),
+			rect_height(&damage[0]), 1.0, 1.0, 0);
 	igt_put_cairo_ctx(cr_1);
 	igt_plane_set_fb(data->primary, &fb_1);
 	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
@@ -1266,11 +1303,11 @@ static void atomic_plane_damage(data_t *data)
 
 	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
-			damage_rect_width(&damage[0]),
-			damage_rect_height(&damage[0]), 0, 1.0, 1.0);
+			rect_width(&damage[0]),
+			rect_height(&damage[0]), 0, 1.0, 1.0);
 	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
-			damage_rect_width(&damage[1]),
-			damage_rect_height(&damage[1]), 0, 1.0, 0);
+			rect_width(&damage[1]),
+			rect_height(&damage[1]), 0, 1.0, 0);
 	igt_put_cairo_ctx(cr_1);
 	igt_plane_set_fb(data->primary, &fb_1);
 	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
@@ -1299,11 +1336,11 @@ static void atomic_plane_damage(data_t *data)
 
 	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
-			damage_rect_width(&damage[0]),
-			damage_rect_height(&damage[0]), 1.0, 0, 0);
+			rect_width(&damage[0]),
+			rect_height(&damage[0]), 1.0, 0, 0);
 	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
-			damage_rect_width(&damage[1]),
-			damage_rect_height(&damage[1]), 1.0, 1.0, 1.0);
+			rect_width(&damage[1]),
+			rect_height(&damage[1]), 1.0, 1.0, 1.0);
 	igt_put_cairo_ctx(cr_1);
 	igt_plane_set_fb(data->primary, &fb_1);
 	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
@@ -1322,6 +1359,128 @@ static void atomic_plane_damage(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb_2);
 }
 
+static uint32_t to_argb(uint32_t r, uint32_t g, uint32_t b)
+{
+	uint32_t color = 0xff000000;
+	uint8_t temp_r = r >> 24;
+	uint8_t temp_g = g >> 24;
+	uint8_t temp_b = b >> 24;
+
+	color |= temp_r << 16;
+	color |= temp_g << 8;
+	color |= temp_b;
+
+	return color;
+}
+
+static void test_solid_fill_plane(data_t *data, igt_output_t *output, igt_plane_t *plane)
+{
+	drmModeModeInfo *mode = igt_output_get_mode(output);
+	struct drm_mode_rect rect = { 0 };
+	struct igt_fb ref_fb;
+	igt_pipe_crc_t *pipe_crc;
+	igt_crc_t ref_crc, new_crc;
+	enum pipe pipe = data->pipe->pipe;
+	int height, width, i;
+	int ret;
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SOLID_FILL));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_PIXEL_SOURCE));
+
+	rect.x1 = 0;
+	rect.x2 = mode->hdisplay;
+	rect.y1 = 0;
+	rect.y2 = mode->vdisplay;
+
+	width = rect_width(&rect);
+	height = rect_height(&rect);
+
+	igt_plane_set_position(plane, rect.x1, rect.y1);
+	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+			    IGT_PIPE_CRC_SOURCE_AUTO);
+
+
+	for (i = 0; i < ARRAY_SIZE(colors); i++) {
+		uint32_t r = colors[i].r;
+		uint32_t g = colors[i].g;
+		uint32_t b = colors[i].b;
+		cairo_format_t fmt;
+		uint32_t *fb_data;
+
+		struct drm_mode_create_blob c;
+		struct drm_mode_destroy_blob d;
+		struct drm_mode_solid_fill blob_data = {
+			.r = r,
+			.g = g,
+			.b = b,
+			.pad = 0x0,
+		};
+
+		c.data = (uintptr_t) &blob_data;
+		c.length = sizeof(blob_data);
+
+		igt_debug("Testing color r: 0x%x (%f), g: 0x%x (%f), b: 0x%x (%f)\n",
+				r, unorm_to_float(r),
+				g, unorm_to_float(g),
+				b, unorm_to_float(b));
+
+		/* get reference CRC */
+		igt_create_color_fb(data->drm_fd, width, height,
+				    DRM_FORMAT_ABGR8888, DRM_FORMAT_MOD_LINEAR,
+				    unorm_to_float(r),
+				    unorm_to_float(g),
+				    unorm_to_float(b),
+				    &ref_fb);
+		igt_plane_set_fb(plane, &ref_fb);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		igt_get_cairo_ctx(ref_fb.fd, &ref_fb);
+		fb_data = (void *)cairo_image_surface_get_data(ref_fb.cairo_surface);
+		fmt = cairo_image_surface_get_format(ref_fb.cairo_surface);
+
+		/*
+		 * Check to make sure Cairo float->u8 conversion matches
+		 * expected ARGB8888 value
+		 */
+		if (fmt == CAIRO_FORMAT_ARGB32 && fb_data[0] != to_argb(r, g, b)) {
+			igt_warn("Resulting framebuffer data doesn't match color!\n");
+			continue;
+		}
+
+		igt_pipe_crc_start(pipe_crc);
+		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
+
+		ret = drmIoctl(data->display.drm_fd, DRM_IOCTL_MODE_CREATEPROPBLOB, &c);
+		igt_assert(ret == 0);
+
+		/* test solid fill plane */
+		igt_plane_set_solid_fill(plane, &rect, c.blob_id);
+		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "SOLID_FILL");
+
+		igt_display_commit_atomic(&data->display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET,
+					  NULL);
+
+		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &new_crc);
+
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+
+		/* Switch back to FB pixel source */
+		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "FB");
+
+		d.blob_id = c.blob_id;
+		ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_DESTROYPROPBLOB, &d);
+		igt_assert(ret == 0);
+	}
+
+	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 0);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_pipe_crc_stop(pipe_crc);
+	igt_pipe_crc_free(pipe_crc);
+	igt_remove_fb(data->drm_fd, &ref_fb);
+}
+
 static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	drmModeModeInfo *mode;
@@ -1634,6 +1793,20 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_describe("Test case for solid fill primary planes");
+	igt_subtest_with_dynamic("plane-primary-solid-fill") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				test_solid_fill_plane(&data, output, data.primary);
+				atomic_clear(&data, pipe, output);
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);

-- 
2.43.2

