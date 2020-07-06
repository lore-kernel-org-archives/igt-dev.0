Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518756E2EC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2020 04:40:24 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Mon,  6 Jul 2020 10:10:29 +0530
Message-Id: <20200706044038.8203-3-mohammed.khajapasha@intel.com>
In-Reply-To: <20200706044038.8203-1-mohammed.khajapasha@intel.com>
References: <20200706044038.8203-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 02/11] lib/igt_kms: Add igt_require_pipe()
 function
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add igt_require_pipe() fn to check whether a pipe is enabled or not

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_kms.c | 17 +++++++++++++++++
 lib/igt_kms.h | 13 +++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b9bfe4e3..acf0559e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1873,6 +1873,23 @@ void igt_display_reset(igt_display_t *display)
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane);
 static void igt_fill_display_format_mod(igt_display_t *display);
 
+/*
+ * igt_require_pipe:
+ * @display: pointer to igt_display_t
+ * @pipe: pipe which need to check
+ *
+ * Skip a (sub-)test if the pipe not enabled.
+ *
+ * Should be used everywhere where a test checks pipe and skip
+ * test when pipe is not enabled.
+ */
+void igt_require_pipe(igt_display_t *display, enum pipe pipe)
+{
+	igt_skip_on_f(!display->pipes[pipe].enabled,
+			"Pipe %s does not exist or not enabled\n",
+			kmstest_pipe_name(pipe));
+}
+
 /* Get crtc mask for a pipe using crtc id */
 static int
 __get_crtc_mask_for_pipe(drmModeRes *resources, igt_pipe_t *pipe)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0b5e707a..36b15147 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -857,4 +857,17 @@ int igt_connector_sysfs_open(int drm_fd,
 			     drmModeConnector *connector);
 uint32_t igt_reduce_format(uint32_t format);
 
+/*
+ * igt_require_pipe:
+ * @display: pointer to igt_display_t
+ * @pipe: pipe which need to check
+ *
+ * Skip a (sub-)test if the pipe not enabled.
+ *
+ * Should be used everywhere where a test checks pipe and skip
+ * test when pipe is not enabled.
+ */
+void igt_require_pipe(igt_display_t *display,
+		enum pipe pipe);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
