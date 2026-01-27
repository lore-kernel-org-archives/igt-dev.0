Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B6ED2F004
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4A410E54B;
	Tue, 27 Jan 2026 11:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K79HuJoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F51C10E54C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769515002; x=1801051002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=02VpO45TafMrQLdGRPp08DjEXgAWJKfYL/pv16nIcUo=;
 b=K79HuJoTAobvHsO9QZKsUTfZwpsoH35e7hKBz18jBvcPKzx723uP+DWy
 XPe5foBK1Vs6n6LB/Hrke8XLIeIKS5BQLfwUMoItPUKJz9ykfat6DvnP8
 oQU37PZmh7yB7koc83V+CReBmRom7t6d+zgEbQ9ZYkItK1a3VO3WLB5Xh
 xza3vL7t2CpOzBhpVdCj1tLf/50ZnwP5i0trYXvIcnXu9t4I0SKkhAXZq
 dmEBQ+1O2WDcMKieLSAVDV/9ZleKY7iYoETHGGP97x5mnVE0gjvOND77E
 vN1+fnm78aea+g9epOz+eE/MUwqGa7xSZBju22w84mMF4R74rSAsXyOHe Q==;
X-CSE-ConnectionGUID: iGrDuHANTMGhjBhkqNpZrQ==
X-CSE-MsgGUID: EQhBWzcmRIyam9wyuQ8LjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93365892"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93365892"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:41 -0800
X-CSE-ConnectionGUID: /FRlqbUMT8KDsY+kqRuDcQ==
X-CSE-MsgGUID: b7Pk6KVYQHykltV6++m7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239222423"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 6/8] lib/igt_kms: Always return CRTC index from
 kmstest_get_pipe_from_crtc_id()
Date: Tue, 27 Jan 2026 13:56:03 +0200
Message-ID: <8de8e1bc00c16501153c87ef82d14492db8c822e.1769514879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769514879.git.jani.nikula@intel.com>
References: <cover.1769514879.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

All users of kmstest_get_pipe_from_crtc_id() actually need the CRTC
index, not the hardware pipe. Stop doing the CRTC index to hardware pipe
special case mapping on Intel devices. Rename the function
kmstest_get_crtc_index_from_id().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c               | 12 +++++-------
 lib/igt_kms.h               |  2 +-
 tests/intel/kms_fbcon_fbt.c |  6 +++---
 tests/kms_async_flips.c     | 10 +++++-----
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 16fae622fd11..6508400fd686 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1328,16 +1328,14 @@ int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 }
 
 /**
- * kmstest_get_pipe_from_crtc_id:
+ * kmstest_get_crtc_index_from_id:
  * @fd: DRM fd
  * @crtc_id: DRM CRTC id
  *
- * Returns: The crtc index for the given DRM CRTC ID @crtc_id. The crtc index
- * is the equivalent of the pipe id.  This value maps directly to an enum pipe
- * value used in other helper functions.  Returns 0 if the index could not be
- * determined.
+ * Returns: The crtc index for the given DRM CRTC ID @crtc_id. Returns 0 if the
+ * index could not be determined.
  */
-int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id)
+int kmstest_get_crtc_index_from_id(int fd, int crtc_id)
 {
 	drmModeRes *res;
 	drmModeCrtc *drm_crtc;
@@ -1359,7 +1357,7 @@ int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id)
 
 	drmModeFreeResources(res);
 
-	return is_intel_device(fd) ? __intel_get_pipe_from_crtc_index(fd, i) : i;
+	return i;
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index bd6125989945..432c67d11780 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -148,7 +148,7 @@ void kmstest_dump_mode(drmModeModeInfo *mode);
 #define HDISPLAY_5K_PER_PIPE 5120
 
 int __intel_get_pipe_from_crtc_index(int fd, int crtc_index);
-int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
+int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 1b9e535ebffc..36de84f9852f 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -146,10 +146,10 @@ static bool fbc_check_cursor_blinking(struct drm_info *drm)
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t crc[2];
 	bool ret;
-	int i, pipe;
+	int i, crtc_index;
 
-	pipe = kmstest_get_pipe_from_crtc_id(drm->fd, drm->crtc_id);
-	pipe_crc = igt_pipe_crc_new(drm->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+	crtc_index = kmstest_get_crtc_index_from_id(drm->fd, drm->crtc_id);
+	pipe_crc = igt_pipe_crc_new(drm->fd, crtc_index, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(pipe_crc);
 	igt_pipe_crc_drain(pipe_crc);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index c8586a5f947c..993ad37530b0 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -555,9 +555,9 @@ static void test_async_flip(data_t *data)
 
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int *seq)
 {
-	int pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
+	int crtc_index = kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id);
 	drmVBlank wait_vbl = {
-		.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(pipe),
+		.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(crtc_index),
 		.request.sequence = 1,
 	};
 
@@ -728,10 +728,10 @@ static void test_invalid(data_t *data)
 
 static void queue_vblank(data_t *data)
 {
-	int pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
+	int crtc_index = kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id);
 	drmVBlank wait_vbl = {
 		.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT |
-			kmstest_get_vbl_flag(pipe),
+			kmstest_get_vbl_flag(crtc_index),
 		.request.sequence = 1,
 		.request.signal = (long)data,
 	};
@@ -850,7 +850,7 @@ static void test_crc(data_t *data)
 			     &data->output->config.connector->connector_id, 1, mode);
 	igt_assert_eq(ret, 0);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id)),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id)),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(data->pipe_crc);
-- 
2.47.3

