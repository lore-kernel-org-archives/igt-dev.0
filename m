Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185ABD0BB5B
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 04:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C640510E8A1;
	Thu, 24 Oct 2024 04:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6KD/vru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C4810E8A0
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729745691; x=1761281691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OkgE8RuL95LwUDk7T06AlXRabkID07596KLt4CtwWB8=;
 b=Z6KD/vru7j0Ftj3YxsEoYu7VzXO+NYxvxfnALi4pyIGrsOuCF/Rf+jt4
 yHoIi68KnRzeV+XfjAn9XVrpy+a4ikzbmX2aR116zp2e9vwfMXkzbbz3u
 d7fF2dYYI4C6uyV3YUxaW56wbuaf63DxiQXyzgmCONxUxieE7yO+QFuzL
 09xW6UzEgFiXJhDfiEpm77zoDuNr9qjnUrOLpxiEvASf7u2lBm4uXkViW
 pj/hy1TUOTEr951Z1gCZg8815pL8/cm7ZeEBSgZLhOF01fzs6B/AeL0lW
 y5Sn5dYFhZffm1LS6M4KZZh6zDCf1PddMZTjehY1nirKWhN1lJQMAR2e7 w==;
X-CSE-ConnectionGUID: 8ACKsjQ0Qxy/9z0zFA3hdA==
X-CSE-MsgGUID: 6dZAj3IZQS2K+3PZpZKtBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46823184"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46823184"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 21:54:51 -0700
X-CSE-ConnectionGUID: j/OCj4d9SXGtr8nZ/VqDAQ==
X-CSE-MsgGUID: V99mdec9Q1CFFIPtEY42IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80400828"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 21:54:42 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com, pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 1/3] lib/igt_kms: Move backlight read and write to lib
Date: Thu, 24 Oct 2024 10:22:10 +0530
Message-Id: <20241024045212.1697869-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
References: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

move backlight_read and backlight_write functions from
kms_pm_backlight to library to reuse in other tests.

move and rename struct context to intel_backlight_context_t.
v2: Rename backlight_read to igt_backlight_read and backlight_write to
backlight_write (Suraj).
Add a new member to intel_backlight_context_t to cache vendor specific
backlight path.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 lib/igt_kms.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 12 ++++++++++
 2 files changed, 78 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bb35d4b82..5d8096a17 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7119,3 +7119,69 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output)
 	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
 	drmModeFreeConnector(temp);
 }
+
+/**
+ * igt_backlight_read:
+ * @result:	Pointer to store the result
+ * @fname:	Name of the file to read
+ * @context:	Pointer to the context structure
+ */
+int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context)
+{
+	int fd;
+	char full[PATH_MAX];
+	char dst[64];
+	int r, e;
+
+	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
+			    context->backlight_dir_path,
+			    context->path,
+			    fname) < PATH_MAX);
+
+	fd = open(full, O_RDONLY);
+	if (fd == -1)
+		return -errno;
+
+	r = read(fd, dst, sizeof(dst));
+	e = errno;
+	close(fd);
+
+	if (r < 0)
+		return -e;
+
+	errno = 0;
+	*result = strtol(dst, NULL, 10);
+	return errno;
+}
+
+/**
+ * igt_backlight_write:
+ * @value:		Value to write
+ * @fname:		Name of the file to write
+ * @context:	Pointer to the context structure
+ */
+int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context)
+{
+	int fd;
+	char full[PATH_MAX];
+	char src[64];
+	int len;
+
+	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
+			    context->backlight_dir_path,
+			    context->path,
+			    fname) < PATH_MAX);
+
+	fd = open(full, O_WRONLY);
+	if (fd == -1)
+		return -errno;
+
+	len = snprintf(src, sizeof(src), "%i", value);
+	len = write(fd, src, len);
+	close(fd);
+
+	if (len < 0)
+		return len;
+
+	return 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2b26d2bbf..bd154d1c1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -33,6 +33,7 @@
 #include <stdint.h>
 #include <stddef.h>
 #include <assert.h>
+#include <limits.h>
 
 #include <xf86drmMode.h>
 
@@ -513,6 +514,15 @@ typedef struct {
 	uint16_t tile_h_size, tile_v_size;
 } igt_tile_info_t;
 
+/* Backlight context*/
+typedef struct {
+	int max;
+	int old;
+	igt_output_t *output;
+	char path[PATH_MAX];
+	char backlight_dir_path[PATH_MAX];
+} igt_backlight_context_t;
+
 void igt_display_reset_outputs(igt_display_t *display);
 void igt_display_require(igt_display_t *display, int drm_fd);
 void igt_display_fini(igt_display_t *display);
@@ -1253,5 +1263,7 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
 int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
+int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
+int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

