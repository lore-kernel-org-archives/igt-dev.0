Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E0A10EA83
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 04:22:59 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Sep 2022 09:22:44 +0530
Message-Id: <20220929035245.6567-3-karthik.b.s@intel.com>
In-Reply-To: <20220929035245.6567-1-karthik.b.s@intel.com>
References: <20220929035245.6567-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 2/3] tests/kms_content_protection: Test
 Cleanup
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

Reset display to clean the state before starting the subtest.

Move the clean up part to a separate function so that cleanup code is
run even if there is a failure in the subtest. This prepares the test
for conversion to dynamic subtests.

Remove redundant mode override as we're anyway overriding with the
default mode.

Check if platform is capable of atomic commit before choosing
commit style in cleanup function.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_content_protection.c | 35 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index bfd53b78..ae30955e 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -170,18 +170,15 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
 			    enum igt_commit_style s)
 {
 	igt_display_t *display = &data.display;
-	drmModeModeInfo mode;
+	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 
-	igt_assert(kmstest_get_connector_default_mode(
-			display->drm_fd, output->config.connector, &mode));
-
-	igt_output_override_mode(output, &mode);
+	mode = igt_output_get_mode(output);
 	igt_output_set_pipe(output, pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data.red);
-	igt_fb_set_size(&data.red, primary, mode.hdisplay, mode.vdisplay);
+	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
 
 	igt_display_commit2(display, s);
 
@@ -322,7 +319,6 @@ static void test_content_protection_on_output(igt_output_t *output,
 					      int content_type)
 {
 	igt_display_t *display = &data.display;
-	igt_plane_t *primary;
 	bool ret;
 
 	test_cp_enable_with_retry(output, s, 3, content_type, false,
@@ -374,13 +370,6 @@ static void test_content_protection_on_output(igt_output_t *output,
 						  content_type, false,
 						  false);
 	}
-
-	test_cp_disable(output, s);
-	primary = igt_output_get_plane_type(output,
-					    DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(primary, NULL);
-	igt_output_set_pipe(output, PIPE_NONE);
-
 }
 
 static void __debugfs_read(int fd, const char *param, char *buf, int len)
@@ -478,6 +467,19 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
 		return true;
 }
 
+static void
+test_fini(igt_output_t *output, enum igt_commit_style s)
+{
+	igt_plane_t *primary;
+
+	test_cp_disable(output, s);
+	primary = igt_output_get_plane_type(output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data.display, s);
+}
+
 static void
 test_content_protection(enum igt_commit_style s, int content_type)
 {
@@ -495,6 +497,7 @@ test_content_protection(enum igt_commit_style s, int content_type)
 			if (!igt_pipe_connector_valid(pipe, output))
 				continue;
 
+			igt_display_reset(display);
 			modeset_with_fb(pipe, output, s);
 
 			if (!output_hdcp_capable(output, content_type))
@@ -502,6 +505,8 @@ test_content_protection(enum igt_commit_style s, int content_type)
 
 			test_content_protection_on_output(output, pipe, s, content_type);
 			valid_tests++;
+
+			test_fini(output, s);
 			/*
 			 * Testing a output with a pipe is enough for HDCP
 			 * testing. No ROI in testing the connector with other
@@ -692,7 +697,7 @@ static void test_content_protection_cleanup(void)
 			continue;
 
 		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
-		test_cp_disable(output, COMMIT_ATOMIC);
+		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 
 	igt_remove_fb(data.drm_fd, &data.red);
-- 
2.22.0
