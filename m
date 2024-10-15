Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1A5D1D887
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 16:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDA710E5B9;
	Tue, 15 Oct 2024 16:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPQu7xMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292110E5B9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729009534; x=1760545534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ST3uPCTmKZHbwHobpdsR38YAywu7U4Ao3Dh5QNIGfyw=;
 b=fPQu7xMfR18wONn82W6P3y0VXgdj2bjlew5p5Oy69K9o+kSKmOAKBZt5
 FwxjbM5P1WWpI5Chxgt6TzEMDzUGqUXtUkxU67NzYLhOjttYZQDvIpB0c
 NgVgt9UqlV9wzLEiCbEylbLLJ/Xvy8PhVoFBYOltDy6DiKuCrRdUCEbpC
 OKn1Kn0AqJuX+/ho8W//xmqRFZ/IeUmAScwzrSPYFze/uj9ODnRQ/gvQv
 pnSMlzn8enkE0e1HkT9g3vvt0V+0Bbtu46gSRYKBrZmj+WRe9vrfxNSoA
 +2dPCUdnrOzZLyxYRz6jW5VQwL0d7pkh1uWPEYr6H0wDNDZaGtQ4klMke w==;
X-CSE-ConnectionGUID: H7EkS5OBQ4CnEOLrcVdN5Q==
X-CSE-MsgGUID: lsJpYqUoTnuXU4d1N/JTiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28616991"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28616991"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 09:25:34 -0700
X-CSE-ConnectionGUID: 08xSKMlcTl+w1qjtImPLng==
X-CSE-MsgGUID: l3En6ftkS12ziDIYbO6n7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77962846"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 09:25:32 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Move backlight read, write to lib
Date: Tue, 15 Oct 2024 21:53:35 +0530
Message-Id: <20241015162336.304730-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015162336.304730-1-santhosh.reddy.guddati@intel.com>
References: <20241015162336.304730-1-santhosh.reddy.guddati@intel.com>
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
kms_pm_backlight to library to re use in other tests.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 13 +++++++++++
 2 files changed, 73 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bb35d4b82..c9c0ca1d3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7119,3 +7119,63 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output)
 	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
 	drmModeFreeConnector(temp);
 }
+
+/**
+ * backlight_read:
+ * @result:		Pointer to store the result
+ * @fname:		Name of the file to read
+ * @context:	Pointer to the context structure
+ */
+int backlight_read(int *result, const char *fname, intel_backlight_context_t *context)
+{
+	int fd;
+	char full[PATH_MAX];
+	char dst[64];
+	int r, e;
+
+	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", INTEL_BACKLIGHT_PATH, context->path, fname)
+			    < PATH_MAX);
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
+ * backlight_write:
+ * @value:		Value to write
+ * @fname:		Name of the file to write
+ * @context:	Pointer to the context structure
+ */
+int backlight_write(int value, const char *fname, intel_backlight_context_t *context)
+{
+	int fd;
+	char full[PATH_MAX];
+	char src[64];
+	int len;
+
+	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", INTEL_BACKLIGHT_PATH, context->path, fname)
+		   < PATH_MAX);
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
index 2b26d2bbf..90b911e4d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -33,6 +33,7 @@
 #include <stdint.h>
 #include <stddef.h>
 #include <assert.h>
+#include <limits.h>
 
 #include <xf86drmMode.h>
 
@@ -513,6 +514,16 @@ typedef struct {
 	uint16_t tile_h_size, tile_v_size;
 } igt_tile_info_t;
 
+#define INTEL_BACKLIGHT_PATH "/sys/class/backlight"
+
+/* Backlight context*/
+typedef struct {
+	int max;
+	int old;
+	igt_output_t *output;
+	char path[PATH_MAX];
+} intel_backlight_context_t;
+
 void igt_display_reset_outputs(igt_display_t *display);
 void igt_display_require(igt_display_t *display, int drm_fd);
 void igt_display_fini(igt_display_t *display);
@@ -1253,5 +1264,7 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
 int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
+int backlight_read(int *result, const char *fname, intel_backlight_context_t *context);
+int backlight_write(int value, const char *fname, intel_backlight_context_t *context);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

