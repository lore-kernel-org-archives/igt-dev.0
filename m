Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF88110E5D1
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Mar 2022 05:29:31 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Sat, 12 Mar 2022 00:29:09 -0500
Message-ID: <20220312052910.357949-5-dingchen.zhang@amd.com>
In-Reply-To: <20220312052910.357949-1-dingchen.zhang@amd.com>
References: <20220312052910.357949-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v3 4/5] lib/igt_amd: refactor checker of debugfs
 interface existence
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

[why]
The existed amdgpu debugfs helpers to check existance/support of
connector's debugfs entry have a bunch of code redundant. Since
the generic debugfs interface checker is defined, we'd refactor
to avoid code redundancy.

[how]
- call generic helper igt_amd_output_has_debugfs() for debugfs
  interface existence check for DSC, HPD, LINK SETTING, PSR CAP
  etc.
- call psr state check helper for existed basic PSR test case.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 lib/igt_amd.c          | 100 +++--------------------------------------
 tests/amdgpu/amd_psr.c |  12 +----
 2 files changed, 6 insertions(+), 106 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 59e503a2..888da44a 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -289,25 +289,7 @@ static bool igt_amd_output_has_debugfs(int drm_fd, char *connector_name, const c
  */
 static bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
 {
-	int fd;
-	int res;
-	struct stat stat;
-
-	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
-	if (fd < 0) {
-		igt_info("output %s: debugfs not found\n", connector_name);
-		return false;
-	}
-
-	res = fstatat(fd, DEBUGFS_DSC_CLOCK_EN , &stat, 0);
-	if (res != 0) {
-		igt_info("%s debugfs not supported\n", DEBUGFS_DSC_CLOCK_EN);
-		close(fd);
-		return false;
-	}
-
-	close(fd);
-	return true;
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_DSC_CLOCK_EN);
 }
 
 /**
@@ -739,25 +721,7 @@ int igt_amd_read_dsc_param_slice_bpg(int drm_fd, char *connector_name)
  */
 static bool igt_amd_output_has_hpd(int drm_fd, char *connector_name)
 {
-        int fd;
-        int res;
-        struct stat stat;
-
-        fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
-        if (fd < 0) {
-                igt_info("output %s: debugfs not found\n", connector_name);
-                return false;
-        }
-
-        res = fstatat(fd, DEBUGFS_HPD_TRIGGER, &stat, 0);
-        if (res != 0) {
-                igt_info("%s debugfs not supported\n", DEBUGFS_HPD_TRIGGER);
-                close(fd);
-                return false;
-        }
-
-        close(fd);
-        return true;
+        return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_HPD_TRIGGER);
 }
 
 /**
@@ -904,25 +868,7 @@ void igt_amd_write_link_settings(
  */
 bool igt_amd_output_has_link_settings(int drm_fd, char *connector_name)
 {
-	int fd;
-	int res;
-	struct stat stat;
-
-	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
-	if (fd < 0) {
-		igt_info("output %s: debugfs not found\n", connector_name);
-		return false;
-	}
-
-	res = fstatat(fd, DEBUGFS_DP_LINK_SETTINGS, &stat, 0);
-	if (res != 0) {
-		igt_info("output %s: %s debugfs not supported\n", connector_name, DEBUGFS_DP_LINK_SETTINGS);
-		close(fd);
-		return false;
-	}
-
-	close(fd);
-	return true;
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_DP_LINK_SETTINGS);
 }
 
 /*
@@ -1016,25 +962,7 @@ void igt_amd_write_ilr_setting(
  */
 bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
 {
-	int fd;
-	int res;
-	struct stat stat;
-
-	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
-	if (fd < 0) {
-		igt_info("output %s: debugfs not found\n", connector_name);
-		return false;
-	}
-
-	res = fstatat(fd, DEBUGFS_EDP_ILR_SETTING, &stat, 0);
-	if (res != 0) {
-		igt_info("output %s: %s debugfs not supported\n", connector_name, DEBUGFS_EDP_ILR_SETTING);
-		close(fd);
-		return false;
-	}
-
-	close(fd);
-	return true;
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);
 }
 
 /**
@@ -1044,25 +972,7 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
  */
 bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name)
 {
-	int fd;
-	int res;
-	struct stat stat;
-
-	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
-	if (fd < 0) {
-		igt_info("output %s: debugfs not found\n", connector_name);
-		return false;
-	}
-
-	res = fstatat(fd, DEBUGFS_EDP_PSR_CAP, &stat, 0);
-	if (res != 0) {
-		igt_info("output %s: %s debugfs not supported\n", connector_name, DEBUGFS_EDP_PSR_CAP);
-		close(fd);
-		return false;
-	}
-
-	close(fd);
-	return true;
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_PSR_CAP);
 }
 
 /**
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 865511d0..94cafd22 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -35,7 +35,6 @@
  */
 IGT_TEST_DESCRIPTION("Basic test for enabling Panel Self Refresh for eDP displays");
 
-#define DEBUGFS_PSR_STATE "psr_state"
 /* After a full update, a few fast updates are necessary for PSR to be enabled */
 #define N_FLIPS 6
 /* DMCUB takes some time to actually enable PSR. Worst case delay is 4 seconds */
@@ -109,8 +108,6 @@ static int check_conn_type(data_t *data, uint32_t type) {
 }
 
 static void run_check_psr(data_t *data, bool test_null_crtc) {
-	char buf[8];
-	char *connector_name;
 	int fd, edp_idx, dp_idx, ret, i, psr_state;
 	igt_fb_t ref_fb, ref_fb2;
 	igt_fb_t *flip_fb;
@@ -158,14 +155,7 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-		connector_name = output->name;
-		fd = igt_debugfs_connector_dir(data->fd, connector_name, O_RDONLY);
-		igt_assert(fd >= 0);
-
-		ret = igt_debugfs_simple_read(fd, DEBUGFS_PSR_STATE, buf, sizeof(buf));
-		igt_require(ret > 0);
-
-		psr_state =  (int) strtol(buf, NULL, 10);
+		psr_state =  igt_amd_read_psr_state(data->fd, output->name);
 		igt_fail_on_f(psr_state < 1, "PSR was not enabled for connector %s\n", output->name);
 		igt_fail_on_f(psr_state == 0xff, "PSR is invalid for connector %s\n", output->name);
 		igt_fail_on_f(psr_state != 5, "PSR state is expected to be at 5 on a "
-- 
2.25.1
