Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01B110E39D
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 03:47:34 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 7 Aug 2023 20:47:10 -0700
Message-ID: <20230808034713.6805-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20230808034713.6805-1-quic_abhinavk@quicinc.com>
References: <20230808034713.6805-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 1/3] lib/igt_fb: add a helper to find
 drm_id from matching string
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

In preparation to support multiple output formats for writeback,
add a helper which takes the drm format string from the format_desc
as input and returns the matching drm_id.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 lib/igt_fb.c | 28 ++++++++++++++++++++++++++++
 lib/igt_fb.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 8f5e3db9f50b..55ef63cc71dc 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -384,6 +384,18 @@ static const struct format_desc_struct *lookup_drm_format(uint32_t drm_format)
 	return NULL;
 }
 
+static const struct format_desc_struct *lookup_drm_format_str(const char *name)
+{
+	const struct format_desc_struct *format;
+
+	for_each_format(format) {
+		if (!strcmp(format->name, name))
+			return format;
+	}
+
+	return NULL;
+}
+
 /**
  * igt_format_is_yuv_semiplanar:
  * @format: drm fourcc pixel format code
@@ -4657,6 +4669,22 @@ const char *igt_format_str(uint32_t drm_format)
 	return f ? f->name : "invalid";
 }
 
+/**
+ * igt_drm_format_str_to_format:
+ * @drm_format: name string of drm_format in format_desc[] table
+ *
+ * Returns:
+ * The drm_id for the format string from the format_desc[] table.
+ */
+uint32_t igt_drm_format_str_to_format(const char *drm_format)
+{
+	const struct format_desc_struct *f = lookup_drm_format_str(drm_format);
+
+	igt_assert_f(f, "can't find a DRM format for (%s)\n", drm_format);
+
+	return f->drm_id;
+}
+
 /**
  * igt_fb_supported_format:
  * @drm_format: drm fourcc to test.
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 73bdfc8669d8..834aaef54dea 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -215,6 +215,9 @@ const char *igt_format_str(uint32_t drm_format);
 bool igt_fb_supported_format(uint32_t drm_format);
 bool igt_format_is_yuv(uint32_t drm_format);
 bool igt_format_is_yuv_semiplanar(uint32_t format);
+
+uint32_t igt_drm_format_str_to_format(const char *drm_format);
+
 bool igt_format_is_fp16(uint32_t drm_format);
 int igt_format_plane_bpp(uint32_t drm_format, int plane);
 void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
-- 
2.40.1
