Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91BF10E340
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Nov 2022 21:53:13 +0000 (UTC)
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Mon, 28 Nov 2022 16:53:25 -0500
Message-ID: <20221128215325.308197-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/amdgpu/amd_psr: print DSC status
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Since we now support DSC/PSR-SU interoperability, it useful to have this
information at our disposal when we are validating PSR-SU visual
confirm. So, print the current DSC status in test_init() if the relevant
connector has DSC support.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 lib/igt_amd.c          | 2 +-
 lib/igt_amd.h          | 1 +
 tests/amdgpu/amd_psr.c | 7 +++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index bef9c193..2e028968 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -320,7 +320,7 @@ static bool igt_amd_output_has_debugfs(int drm_fd, char *connector_name, const c
  * @drm_fd: DRM file descriptor
  * @connector_name: The connector's name, on which we're reading the status
  */
-static bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
+bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
 {
 	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_DSC_CLOCK_EN);
 }
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 428bfe6f..c6d3bdd8 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -149,6 +149,7 @@ bool igt_amd_is_tiled(uint64_t modifier);
 /* IGT DSC helper functions */
 bool is_dp_dsc_supported(int drm_fd, char *connector_name);
 bool is_dp_fec_supported(int drm_fd, char *connector_name);
+bool igt_amd_output_has_dsc(int drm_fd, char *connector_name);
 void igt_amd_require_dsc(igt_display_t *display, int drm_fd);
 int igt_amd_read_dsc_clock_status(int drm_fd, char *connector_name);
 void igt_amd_write_dsc_clock_en(int drm_fd, char *connector_name, int dsc_force);
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 966a0dcc..3c3113ab 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -165,6 +165,7 @@ static void update_color_strip(igt_fb_t *fb, pos_t *old, pos_t *new, double r, d
 /* Common test setup. */
 static void test_init(data_t *data)
 {
+	bool dsc_on;
 	igt_display_t *display = &data->display;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
@@ -202,6 +203,12 @@ static void test_init(data_t *data)
 	data->pfb_w = data->w / 2;
 	data->pfb_h = data->h / 2;
 
+	if (igt_amd_output_has_dsc(data->fd, data->output->name)) {
+		dsc_on = igt_amd_read_dsc_clock_status(data->fd,
+						       data->output->name);
+		igt_info("DSC status: %s\n", dsc_on ? "enabled" : "disabled");
+	}
+
 	if (opt.visual_confirm) {
 		/**
 		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
-- 
2.38.1
