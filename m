Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBD5D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 10:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417D310E05E;
	Tue, 20 Jan 2026 10:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy9/+ory";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8F910E05E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768906491; x=1800442491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KIoni2tpqewK3zRl/WcO4SUkrjfi/vg/9IfKUxOpF+E=;
 b=Oy9/+ory9lDNdXSySEeQftAeJjx5NrVvw2svkrk9l/IFe4ogKdKadvA6
 3QN44NPUrpduIPTQ4CMyqPMITFtgV1GHFWDEhIq2+X0tt+Fwq6m50CSQP
 GSpHU6I+CUO2RO7wLI9QayPONXIUCpkjM50mpHjtn8CQcGcTf5dgjFkjN
 1EXc0JskTLlPYIaEufNIZAKYQQ21Fa2RDlLZDUTpQf1LMyXEXE3ytcbkf
 d3Q4supLgpE1ICLCVfV2pObjl2gXWeZFjDnQK2bXuMTJKWWk64QflWaT1
 YIuj6lkkgIP55edLtG1AdEa28nfznDO6K0+wrhFliAZvPqJrJ1JmHlcEy w==;
X-CSE-ConnectionGUID: QLfREp05RRqqa6WN2RnC+Q==
X-CSE-MsgGUID: 5U136iDHRZmrGpKgWzXYLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70163564"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70163564"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:54:50 -0800
X-CSE-ConnectionGUID: /uEsOC8kR1SccCbFgXolgg==
X-CSE-MsgGUID: C8FY5vvSS7CrGW3aUVYuyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210940254"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:54:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 1/3] lib/igt_kms: Always return CRTC index from
 kmstest_get_pipe_from_crtc_id()
Date: Tue, 20 Jan 2026 12:54:35 +0200
Message-ID: <062405da51425256100edf0a7de51a5aa4a51721.1768906414.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906414.git.jani.nikula@intel.com>
References: <cover.1768906414.git.jani.nikula@intel.com>
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

kms_setmode.c does use the result also for logging, which would now be
incorrect if pipe != CRTC index. But even there, it functionally
requires the CRTC index. The test needs other cleanups.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c               | 13 +++++--------
 lib/igt_kms.h               |  2 +-
 tests/intel/kms_fbcon_fbt.c |  2 +-
 tests/kms_async_flips.c     |  6 +++---
 tests/kms_setmode.c         |  3 +--
 5 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 77b3ae2afa01..57e6474f2c2d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1360,16 +1360,14 @@ static int __intel_get_pipe_from_crtc_id(int fd, int crtc_id, int crtc_idx)
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
@@ -1391,8 +1389,7 @@ int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id)
 
 	drmModeFreeResources(res);
 
-	return is_intel_device(fd) ?
-		__intel_get_pipe_from_crtc_id(fd, crtc_id, i) : i;
+	return i;
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e1044101707c..d25c166eba4a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -148,7 +148,7 @@ void kmstest_dump_mode(drmModeModeInfo *mode);
 #define HDISPLAY_6K_PER_PIPE 6144
 #define HDISPLAY_5K_PER_PIPE 5120
 
-int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
+int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 1b9e535ebffc..f6de4b0afef6 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -148,7 +148,7 @@ static bool fbc_check_cursor_blinking(struct drm_info *drm)
 	bool ret;
 	int i, pipe;
 
-	pipe = kmstest_get_pipe_from_crtc_id(drm->fd, drm->crtc_id);
+	pipe = kmstest_get_crtc_index_from_id(drm->fd, drm->crtc_id);
 	pipe_crc = igt_pipe_crc_new(drm->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(pipe_crc);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 71570385c32e..0ee0cdc47a96 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -560,7 +560,7 @@ static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int
 	int pipe;
 
 	memset(&wait_vbl, 0, sizeof(wait_vbl));
-	pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
+	pipe = kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id);
 	pipe_id_flag = kmstest_get_vbl_flag(pipe);
 
 	wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
@@ -732,7 +732,7 @@ static void test_invalid(data_t *data)
 
 static void queue_vblank(data_t *data)
 {
-	int pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
+	int pipe = kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id);
 	drmVBlank wait_vbl = {
 		.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT |
 			kmstest_get_vbl_flag(pipe),
@@ -855,7 +855,7 @@ static void test_crc(data_t *data)
 	igt_assert_eq(ret, 0);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
-					  kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
+					  kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(data->pipe_crc);
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 108e713610fd..8ed6113205f6 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -354,8 +354,7 @@ static void setup_crtcs(const struct test_config *tconf,
 					  resources->crtcs[crtc->crtc_idx]);
 		crtc->crtc_id = drm_crtc->crtc_id;
 		drmModeFreeCrtc(drm_crtc);
-		crtc->pipe_id = kmstest_get_pipe_from_crtc_id(drm_fd,
-							      crtc->crtc_id);
+		crtc->pipe_id = kmstest_get_crtc_index_from_id(drm_fd, crtc->crtc_id);
 
 		crtc->connector_count = 1;
 		for (j = i + 1; j < connector_count; j++)
-- 
2.47.3

