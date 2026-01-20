Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCA9D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 10:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A2710E023;
	Tue, 20 Jan 2026 10:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foQhJ7Fl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B701E10E023
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768906495; x=1800442495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bjlNnc9E4dCPY7Qo2YJ1xVB/aFTRTcp1C9+5KGbq+fw=;
 b=foQhJ7Fl7W2TAiTukRsQgQj4LCWjBfZ47U8jpYL8f9F+tHL/5acANf90
 kvfnX8VQlqsOB+9ssCVq71Z+WQ/eSjfZJ6TDBK7agrr5DfU85sfiHIsAx
 SHnrX9mbipUaiujau79IHNklROqY0RDYanqtbRuPkxpURrgVR0jr1HYlr
 QrJVjsYXKn1V8xm/MrK180JPAT1OZzvtXxB9rXX++2odRNzlmIEi+A93z
 pXwdEVhyDcjTmTptlEp0HggbBleyszdzc1ri6sacjAjNhIXxgF18X3fPR
 aHQyaN7qMEqjMrh1Qv+h3nZiuEGNR4r20WJ2mi80OHx+OdmzhkP025MuF w==;
X-CSE-ConnectionGUID: kIdCUUK6QOGb5XfBGtRMRQ==
X-CSE-MsgGUID: HlmAZRsMSqem9yejeUkyAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70163569"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70163569"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:54:55 -0800
X-CSE-ConnectionGUID: 3Z9zX4HtQheIrpNe/7hAlg==
X-CSE-MsgGUID: uMgymHvJTDCTy3g+Cc1ooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210940275"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:54:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 2/3] lib/igt_kms: Drop the ioctl fallback for CRTC id to
 pipe mapping
Date: Tue, 20 Jan 2026 12:54:36 +0200
Message-ID: <b0044dee19440afe71abc57789cc25383ed03df7.1768906414.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906414.git.jani.nikula@intel.com>
References: <cover.1768906414.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The kernel support for i915_pipe debugfs has been around for 2½ years in
both i915 and xe. Drop the ioctl fallback for simplicity. Rename the
function __intel_get_pipe_from_crtc_index() as it's now purely about
CRTC index and not id.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 44 +++++++++-----------------------------------
 1 file changed, 9 insertions(+), 35 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 57e6474f2c2d..f6769d31edcb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1312,51 +1312,27 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
 }
 
 /*
- * With non-contiguous pipes display, crtc mapping is not always same
- * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
- * hence allocating upper bound igt_pipe array to support non-contiguos
- * pipe display and reading pipe enum for a crtc using GET_PIPE_FROM_CRTC_ID
- * ioctl for a pipe to do pipe ordering with respect to crtc list.
+ * The hardware pipe may be different from the CRTC index. Figure out the CRTC
+ * index to pipe mapping from the debugfs.
  */
-static int __intel_get_pipe_from_crtc_id(int fd, int crtc_id, int crtc_idx)
+static int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 {
 	char buf[2];
 	int debugfs_fd, res = 0;
+	char pipe_char;
 
-	/*
-	 * No GET_PIPE_FROM_CRTC_ID ioctl support for XE. Instead read
-	 * from the debugfs "i915_pipe".
-	 *
-	 * This debugfs is applicable for both i915 & XE. For i915, still
-	 * we can fallback to ioctl method to support older kernels.
-	 */
-	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_idx, O_RDONLY);
+	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_index, O_RDONLY);
 
 	if (debugfs_fd >= 0) {
 		res = igt_debugfs_simple_read(debugfs_fd, "i915_pipe", buf, sizeof(buf));
 		close(debugfs_fd);
 	}
 
-	if (res <= 0) {
-		/* Fallback to older ioctl method. */
-		if (is_i915_device(fd)) {
-			struct drm_i915_get_pipe_from_crtc_id get_pipe;
-
-			get_pipe.pipe = 0;
-			get_pipe.crtc_id =  crtc_id;
+	igt_assert_f(res > 0, "Failed to read the debugfs i915_pipe.\n");
 
-			do_ioctl(fd, DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID,
-				 &get_pipe);
+	igt_assert_eq(sscanf(buf, "%c", &pipe_char), 1);
 
-			return get_pipe.pipe;
-		} else
-			igt_assert_f(false, "XE: Failed to read the debugfs i915_pipe.\n");
-	} else {
-		char pipe;
-
-		igt_assert_eq(sscanf(buf, "%c", &pipe), 1);
-		return kmstest_pipe_to_index(pipe);
-	}
+	return kmstest_pipe_to_index(pipe_char);
 }
 
 /**
@@ -3229,9 +3205,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	for (i = 0; i < resources->count_crtcs; i++) {
 		igt_crtc_t *pipe;
-		int pipe_enum = (is_intel_dev)?
-			__intel_get_pipe_from_crtc_id(drm_fd,
-						      resources->crtcs[i], i) : i;
+		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, i) : i;
 
 		pipe = igt_crtc_for_pipe(display, pipe_enum);
 		pipe->pipe = pipe_enum;
-- 
2.47.3

