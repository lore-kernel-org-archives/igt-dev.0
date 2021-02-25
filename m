Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD676EC6E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Feb 2021 09:19:29 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date: Thu, 25 Feb 2021 14:39:54 +0530
Message-Id: <20210225090954.31197-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_invalid_dotclock: Skip the test
 if big joiner is supported
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

Currently the test assumes that the modes with clock more than the
maximum dot clock will be rejected. This fails in case of
platforms that combine multiple pipes and modes higher than the
maximum dotclock can still be supported.

This patch adds a check to skip the test if big joiner can be
supported for a given platform and connector.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_invalid_dotclock.c | 51 ++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/tests/kms_invalid_dotclock.c b/tests/kms_invalid_dotclock.c
index 402629ab..5692736b 100644
--- a/tests/kms_invalid_dotclock.c
+++ b/tests/kms_invalid_dotclock.c
@@ -44,6 +44,44 @@ static bool has_scaling_mode_prop(data_t *data)
 				    NULL, NULL, NULL);
 }
 
+static bool
+is_dsc_capable(int drm_fd, drmModeConnector *connector)
+{
+	int debugfs_fd = igt_debugfs_dir(drm_fd);
+	char filename[128];
+	char buf[512];
+	bool dsc = false;
+
+	sprintf(filename, "%s-%d",
+		kmstest_connector_type_str(connector->connector_type),
+		connector->connector_type_id);
+
+	strcat(filename, "/i915_dsc_fec_support");
+
+	if (igt_debugfs_simple_read(debugfs_fd, filename, buf,
+				    sizeof(buf)) > 0)
+		dsc = strstr(buf, "DSC_Sink_Support: yes") ? true : false;
+
+	close(debugfs_fd);
+
+	return dsc;
+}
+
+static bool
+can_bigjoiner(data_t *data)
+{
+	drmModeConnector *connector = data->output->config.connector;
+	uint32_t devid = intel_get_drm_devid(data->drm_fd);
+
+	/*
+	 * GEN11 and GEN12 require DSC to support bigjoiner.
+	 */
+	if (AT_LEAST_GEN(devid, 11))
+		return is_dsc_capable(data->drm_fd, connector);
+
+	return false;
+}
+
 static int
 test_output(data_t *data)
 {
@@ -62,6 +100,15 @@ test_output(data_t *data)
 	 */
 	if (has_scaling_mode_prop(data))
 		return 0;
+	/*
+	 * Newer platforms can support modes higher than the maximum dot clock
+	 * by using pipe joiner, so skip if big joiner is supported.
+	 */
+	if (can_bigjoiner(data)) {
+		igt_info("Platform supports bigjoiner with %s\n",
+			  output->name);
+		return 0;
+	}
 
 	/*
 	 * FIXME test every mode we have to be more
@@ -76,6 +123,8 @@ test_output(data_t *data)
 		      LOCAL_DRM_FORMAT_MOD_NONE,
 		      &fb);
 
+	kmstest_unset_all_crtcs(data->drm_fd, data->res);
+
 	for (i = 0; i < data->res->count_crtcs; i++) {
 		int ret;
 
@@ -135,8 +184,6 @@ igt_simple_main
 	data.res = drmModeGetResources(data.drm_fd);
 	igt_assert(data.res);
 
-	kmstest_unset_all_crtcs(data.drm_fd, data.res);
-
 	data.max_dotclock = i915_max_dotclock(&data);
 	igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
