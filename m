Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD39E89CD4
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 03:41:25 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 30 Dec 2019 05:40:40 +0200
Message-Id: <20191230034040.21943-11-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-1-imre.deak@intel.com>
References: <20191230034040.21943-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 10/10] tests/kms_ccs: Add option to check
 the CCS planes
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

Add an option to check whether the framebuffer content was really
compressed.

Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c    | 15 ++++++++++++
 lib/igt_fb.h    |  4 ++++
 tests/kms_ccs.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e6a3ff07..c81b9de8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -502,6 +502,11 @@ static bool is_ccs_plane(const struct igt_fb *fb, int plane)
 	return plane >= fb->num_planes / 2;
 }
 
+bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane)
+{
+	return is_ccs_plane(fb, plane);
+}
+
 static bool is_gen12_ccs_plane(const struct igt_fb *fb, int plane)
 {
 	return is_gen12_ccs_modifier(fb->modifier) && is_ccs_plane(fb, plane);
@@ -513,6 +518,11 @@ static bool is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane)
 	       plane == 2;
 }
 
+bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane)
+{
+	return is_gen12_ccs_cc_plane(fb, plane);
+}
+
 static int ccs_to_main_plane(const struct igt_fb *fb, int plane)
 {
 	if (is_gen12_ccs_cc_plane(fb, plane))
@@ -521,6 +531,11 @@ static int ccs_to_main_plane(const struct igt_fb *fb, int plane)
 	return plane - fb->num_planes / 2;
 }
 
+int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int plane)
+{
+	return ccs_to_main_plane(fb, plane);
+}
+
 static unsigned fb_plane_width(const struct igt_fb *fb, int plane)
 {
 	const struct format_desc_struct *format = lookup_drm_format(fb->drm_format);
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 69132b41..5ed9e35a 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -170,6 +170,10 @@ void igt_fb_calc_crc(struct igt_fb *fb, igt_crc_t *crc);
 uint64_t igt_fb_mod_to_tiling(uint64_t modifier);
 uint64_t igt_fb_tiling_to_mod(uint64_t tiling);
 
+bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
+bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
+int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);
+
 /* cairo-based painting */
 cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb);
 cairo_surface_t *igt_cairo_image_surface_create_from_png(const char *filename);
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 9e5bb559..34fb0138 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -89,6 +89,8 @@ static const uint64_t ccs_modifiers[] = {
 	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
 };
 
+static bool check_ccs_planes;
+
 /*
  * Limit maximum used sprite plane width so this test will not mistakenly
  * fail on hardware limitations which are not interesting to this test.
@@ -115,6 +117,44 @@ static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
 	}
 }
 
+static void check_ccs_plane(int drm_fd, igt_fb_t *fb, int plane)
+{
+	void *map;
+	void *ccs_p;
+	size_t ccs_size;
+	int i;
+
+	ccs_size = fb->strides[plane] * fb->plane_height[plane];
+	igt_assert(ccs_size);
+
+	gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
+
+	map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_READ);
+
+	ccs_size = fb->strides[plane] * fb->plane_height[plane];
+	ccs_p = map + fb->offsets[plane];
+	for (i = 0; i < ccs_size; i += sizeof(uint32_t))
+		if (*(uint32_t *)(ccs_p + i))
+			break;
+
+	munmap(map, fb->size);
+
+	igt_assert_f(i < ccs_size,
+		     "CCS plane %d (for main plane %d) lacks compression meta-data\n",
+		     plane, igt_fb_ccs_to_main_plane(fb, plane));
+}
+
+static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb)
+{
+	int i;
+
+	for (i = 0; i < fb->num_planes; i++) {
+		if (igt_fb_is_ccs_plane(fb, i) &&
+		    !igt_fb_is_gen12_ccs_cc_plane(fb, i))
+			check_ccs_plane(drm_fd, fb, i);
+	}
+}
+
 static void generate_fb(data_t *data, struct igt_fb *fb,
 			int width, int height,
 			enum test_fb_flags fb_flags)
@@ -198,6 +238,9 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	} else
 		igt_assert_eq(ret, 0);
 
+	if (check_ccs_planes)
+		check_all_ccs_planes(data->drm_fd, fb);
+
 	fb->fb_id = f.fb_id;
 }
 
@@ -376,7 +419,24 @@ static void test_output(data_t *data)
 
 static data_t data;
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *opt_data)
+{
+	switch (opt) {
+	case 'c':
+		check_ccs_planes = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char *help_str =
+"  -c\tCheck the presence of compression meta-data\n"
+;
+
+igt_main_args("c", NULL, help_str, opt_handler, NULL)
 {
 	enum pipe pipe;
 
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
