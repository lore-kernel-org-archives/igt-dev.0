Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EEDD3C526
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 17:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D44D10E891;
	Thu, 17 Oct 2024 17:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvYm6wmq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC1510E891
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729185270; x=1760721270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6B1k/McTc3yKBdWblwO49QKtGVLNrIFYqFf+oJiCrE=;
 b=kvYm6wmqmRT3huwYZrqAPV5nGjIkRAtCmDrrwronyyx3crDpv/lu2zI2
 iCdGkIKzNFTM63HloIxIVo0dwh1orOS4ElDy6lsGaOgydPhgvCFlSQQM1
 J6PvUVYU89U9TJEJni/MpCWDvflGercHodbTsoplVektb0KFI3DhQQfIM
 ZlCLVak6r0iES5Zb4dL+lctal9ZIuuNjilhbLEWd9lwcCcpJXjEfL+w2V
 3CGAZkysNdDD9g1fwbjc4kY8Rkf6Ef392AMtylQ3viviMSycWdMeh2Awa
 hnqy3cLG6rHMKr1BzCP8xS3Em44EP4AlGkYN8Qmw2GiA4OMb6+jlt6Oli g==;
X-CSE-ConnectionGUID: ia8X012QSeKPqOgj9p0MRA==
X-CSE-MsgGUID: ShkK+T31Rben+IWNwATwLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28572304"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="28572304"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 10:14:30 -0700
X-CSE-ConnectionGUID: t7iOakimTH+mbGYJpl46Iw==
X-CSE-MsgGUID: PaEMph/xS9i3CRTbHqe71A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109348419"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 10:14:27 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Move backlight read and write to lib
Date: Thu, 17 Oct 2024 22:42:22 +0530
Message-Id: <20241017171223.533843-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017171223.533843-1-santhosh.reddy.guddati@intel.com>
References: <20241017171223.533843-1-santhosh.reddy.guddati@intel.com>
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
---
 lib/igt_kms.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 12 ++++++++++
 2 files changed, 78 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bb35d4b82..b85b38023 100644
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
+int igt_backlight_read(int *result, const char *fname, intel_backlight_context_t *context)
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
+int igt_backlight_write(int value, const char *fname, intel_backlight_context_t *context)
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
index 2b26d2bbf..3546aff72 100644
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
+} intel_backlight_context_t;
+
 void igt_display_reset_outputs(igt_display_t *display);
 void igt_display_require(igt_display_t *display, int drm_fd);
 void igt_display_fini(igt_display_t *display);
@@ -1253,5 +1263,7 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
 int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
+int igt_backlight_read(int *result, const char *fname, intel_backlight_context_t *context);
+int igt_backlight_write(int value, const char *fname, intel_backlight_context_t *context);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

