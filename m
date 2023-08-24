Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A15710E595
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 16:15:18 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 24 Aug 2023 12:15:03 -0400
Message-ID: <20230824161504.154365-2-aurabindo.pillai@amd.com>
In-Reply-To: <20230824161504.154365-1-aurabindo.pillai@amd.com>
References: <20230824161504.154365-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/3] tests/amdgpu/amd_mall: remove UMR dependency
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove the dependency on the userspace tool UMR to check MALL status
and fully rely on debugfs for simplicity of test setup.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c           | 26 +++++++++++++-------------
 lib/igt_amd.h           |  2 +-
 tests/amdgpu/amd_mall.c | 31 +++++++------------------------
 3 files changed, 21 insertions(+), 38 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 1a720ff56..49ca9e6d9 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1182,27 +1182,27 @@ static bool get_dm_capabilites(int drm_fd, char *buf, size_t size) {
  * @brief check if AMDGPU mall_capable interface entry exist and defined
  *
  * @param drm_fd DRM file descriptor
- * @return true if mall_capable debugfs interface exists and defined
- * @return false otherwise
+ * @return true if dm capabilities interface exists and MALL is supported
+ * @return false if capabilites could not be read.
  */
-bool igt_amd_is_mall_capable(int drm_fd)
+void igt_amd_get_mall_status(int drm_fd, u32 *supported, u32 *enabled)
 {
-	char buf[1024], mall_read[10];
+	char buf[1024];
 	char *mall_loc;
 
-	if (!get_dm_capabilites(drm_fd, buf, 1024))
-		return false;
+	*supported = false;
+	*enabled = false;
 
-	mall_loc = strstr(buf,"mall: ");
-	if (!mall_loc)
+	if (!get_dm_capabilites(drm_fd, buf, 1024))
 		return false;
 
-	sscanf(mall_loc, "mall: %s", mall_read);
-
-	if (!strcmp(mall_read, "yes"))
-		return true;
+	mall_loc = strstr(buf, "mall supported: yes");
+	if (mall_loc)
+		*supported = true;
 
-	return false;
+	mall_loc = strstr(buf, "enabled: yes");
+	if (mall_loc && *supported)
+		*enabled = true;
 }
 
 /**
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index c05b4b730..db226e0d0 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -199,6 +199,6 @@ bool igt_amd_has_visual_confirm(int drm_fd);
 int  igt_amd_get_visual_confirm(int drm_fd);
 bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm option);
 
-bool igt_amd_is_mall_capable(int drm_fd);
+void igt_amd_get_mall_status(int drm_fd, u32 *supported, u32 *enabled);
 bool igt_amd_output_has_odm_combine_segments(int drm_fd, char *connector_name);
 #endif /* IGT_AMD_H */
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index 6016d5e8c..178203e8b 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -57,7 +57,8 @@ struct line_check {
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	bool mall_capable = false;
+	u32 mall_capable = false;
+	u32 mall_en = false;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
@@ -65,7 +66,7 @@ static void test_init(data_t *data)
 
 	igt_display_reset(display);
 
-	mall_capable =  igt_amd_is_mall_capable(data->fd);
+	igt_amd_get_mall_status(data->fd, &mall_capable, &mall_en);
 	igt_require_f(mall_capable, "Requires hardware that supports MALL cache\n");
 
 	/* find a connected output */
@@ -101,44 +102,26 @@ static void test_fini(data_t *data)
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 }
 
-static bool check_cmd_output(const char *line, void *data)
-{
-	struct line_check *check = data;
-
-	if (strstr(line, check->substr)) {
-		check->found++;
-	}
-
-	return false;
-}
 static void test_mall_ss(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	igt_fb_t rfb;
-	int exec_ret;
-	struct line_check line = {0};
 	igt_crc_t test_crc, ref_crc;
+	u32 mall_supp, mall_en;
 
 	test_init(data);
 
 	igt_create_pattern_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
 	igt_plane_set_fb(data->primary, &rfb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
-	sleep(MALL_SETTLE_DELAY);
-
-	igt_system_cmd(exec_ret, "umr -O bits -r *.*.HUBP0_HUBP_MALL_STATUS | grep MALL_IN_USE");
-
-	igt_skip_on_f(exec_ret != IGT_EXIT_SUCCESS, "Error running UMR\n");
 
-	line.substr = "1 (0x00000001)";
-	igt_log_buffer_inspect(check_cmd_output, &line);
+	sleep(MALL_SETTLE_DELAY);
 
-	igt_assert_eq(line.found, 1);
+	igt_amd_get_mall_status(data->fd, &mall_supp, &mall_en);
+	igt_fail_on_f(!(mall_supp && mall_en), "MALL did not get enabled\n");
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &test_crc);
-
 	igt_assert_crc_equal(&ref_crc, &test_crc);
 
 	igt_remove_fb(data->fd, &rfb);
-- 
2.41.0
