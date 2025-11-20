Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C98CF857C
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559A210E0F0;
	Thu, 20 Nov 2025 10:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUJiIFY7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C7210E0F0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634211; x=1795170211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WVNtubZfdOZM/ymPGHlnuZ9qCQbdT9eF/A1Mx38cajI=;
 b=XUJiIFY7G3FHUNzcYZkJKmtCOwNDj4zE+jVAFIorJpgrbsRVi08S3XQG
 1bbllY939gsD+AQLlMqg9d4/mOyJChaoMnLD99V7MQVfrgQViVrPXzoky
 lpLClV9QQD0wELtSMHGkze7PSeB4Zjl9PiIJLVT6glYi+aDNUIIe+vr+2
 QFhQp/HmLZ9fDOT4dWSHrl/lUA7mtemFeoQWQWehlFJKS75OWElE7MuFH
 h/sVgH0xjz+Zvt1c+cbnPhnID9qGvkxRisbodI5hB5mJoUouk/vpjYwhq
 0iL274wqaXXqaF9FIm/dxtYHFRcADNCY9WJdNNzFIk/Ifmmjm6b3lb0zW w==;
X-CSE-ConnectionGUID: pAO8pX42QYWmtJFYdWfLVA==
X-CSE-MsgGUID: aacvDB+MQ1Wo/SRbd8DwNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77161563"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="77161563"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:23:31 -0800
X-CSE-ConnectionGUID: 0ocuCj0LQSCzrPQ14cUNhw==
X-CSE-MsgGUID: czZe0kiTRD2iIaC7zWzgeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="221966003"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.6])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:23:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 2/2] lib/igt_kms: Drop the ioctl fallback for CRTC id to
 pipe mapping
Date: Thu, 20 Nov 2025 12:23:14 +0200
Message-ID: <4ee248cad827f7c6ccb2b35544a6571822abe87d.1763634045.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1763634045.git.jani.nikula@intel.com>
References: <cover.1763634045.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
both i915 and xe. Drop the ioctl fallback for simplicity.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 42 ++++++++----------------------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0ff56653a4a7..714b851e8037 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1193,24 +1193,15 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
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
+static int __intel_get_pipe_from_crtc_index(int fd, int crtc_idx)
 {
 	char buf[2];
 	int debugfs_fd, res = 0;
+	char pipe;
 
-	/*
-	 * No GET_PIPE_FROM_CRTC_ID ioctl support for XE. Instead read
-	 * from the debugfs "i915_pipe".
-	 *
-	 * This debugfs is applicable for both i915 & XE. For i915, still
-	 * we can fallback to ioctl method to support older kernels.
-	 */
 	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_idx, O_RDONLY);
 
 	if (debugfs_fd >= 0) {
@@ -1218,26 +1209,11 @@ static int __intel_get_pipe_from_crtc_id(int fd, int crtc_id, int crtc_idx)
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
+	igt_assert_eq(sscanf(buf, "%c", &pipe), 1);
 
-			return get_pipe.pipe;
-		} else
-			igt_assert_f(false, "XE: Failed to read the debugfs i915_pipe.\n");
-	} else {
-		char pipe;
-
-		igt_assert_eq(sscanf(buf, "%c", &pipe), 1);
-		return kmstest_pipe_to_index(pipe);
-	}
+	return kmstest_pipe_to_index(pipe);
 }
 
 /**
@@ -2985,9 +2961,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	for (i = 0; i < resources->count_crtcs; i++) {
 		igt_pipe_t *pipe;
-		int pipe_enum = (is_intel_dev)?
-			__intel_get_pipe_from_crtc_id(drm_fd,
-						      resources->crtcs[i], i) : i;
+		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, i) : i;
 
 		pipe = &display->pipes[pipe_enum];
 		pipe->pipe = pipe_enum;
-- 
2.47.3

