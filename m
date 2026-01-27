Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5565D2F004
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565E210E54B;
	Tue, 27 Jan 2026 11:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KioxOM+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164C510E54B
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769514997; x=1801050997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UptjuOQRMYYv8SQLUn5wMhXeg13YheLgPqH/6F0tUuA=;
 b=KioxOM+xpm5oEREpM3Lp0cUJgy7CjsrwSLdMnJT0BhQW4pNUrZSw/lv4
 jbVBZrgWYZ4D0adYoA7ZouLfWjwOOq8mIpqBsOKif0s7cJ1pl3kmsbk8+
 p2daxk4ehluoSVNTLofHBsfKYO1XveQGOJUto+9us5ceWauDuYmArLxRn
 uG1Ohnvn/pmFx+BfDG9HibBYdwhuEy5R+/9EA+I7vMN1bqlsdIo2PtIc+
 Nx0AEu1AsP5PlLy2AbaYaYO3Vc/Jr2t8qHLwiByzBUvQd/cExYCr37xHj
 dkhEgMsJkwHsUEcD3TRUDDI17NGkhPHd4v8l7jN9lnVJN8iFHU4AUjci2 Q==;
X-CSE-ConnectionGUID: SZa5fFcWRvqfD+R3QlJrWg==
X-CSE-MsgGUID: kh9W7UPhTsGKfy5Pm4oXfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81011377"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81011377"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:37 -0800
X-CSE-ConnectionGUID: 6ZtvWy+6QGeJJb3oqKhO+Q==
X-CSE-MsgGUID: PInTEft+T2eluDUbwrWlkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208010894"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 5/8] tests/kms_setmode: use
 __intel_get_pipe_from_crtc_index() directly
Date: Tue, 27 Jan 2026 13:56:02 +0200
Message-ID: <6dd77ef811b5d6267d51c772b369ff7b73eec0a8.1769514879.git.jani.nikula@intel.com>
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

tests/kms_setmode is the only user of kmstest_get_pipe_from_crtc_id()
that actually needs the pipe instead of CRTC index. And it needs it only
for logging and test naming.

As a temporary measure, use __intel_get_pipe_from_crtc_index() directly
to allow cleaning up kmstest_get_pipe_from_crtc_id().

tests/kms_setmode should probably use igt_display_require() to handle
all of the resource management, but the conversion is not
straightforward, and igt_display_require() might not be flexible enough
at this point.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c       | 2 +-
 lib/igt_kms.h       | 1 +
 tests/kms_setmode.c | 6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b033e0276801..16fae622fd11 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1303,7 +1303,7 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
  * The hardware pipe may be different from the CRTC index. Figure out the CRTC
  * index to pipe mapping from the debugfs.
  */
-static int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
+int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 {
 	char buf[2];
 	int debugfs_fd, pipe, res = 0;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8d6a820856ef..bd6125989945 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -147,6 +147,7 @@ void kmstest_dump_mode(drmModeModeInfo *mode);
 #define HDISPLAY_6K_PER_PIPE 6144
 #define HDISPLAY_5K_PER_PIPE 5120
 
+int __intel_get_pipe_from_crtc_index(int fd, int crtc_index);
 int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a7f7a5606bb3..9c0649e17bd0 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -350,8 +350,10 @@ static void setup_crtcs(const struct test_config *tconf,
 
 		crtc->crtc_idx = cconf[i].crtc_idx;
 		crtc->crtc_id = resources->crtcs[crtc->crtc_idx];
-		crtc->pipe_id = kmstest_get_pipe_from_crtc_id(drm_fd,
-							      crtc->crtc_id);
+
+		/* FIXME: avoid __intel_get_pipe_from_crtc_index() */
+		crtc->pipe_id = is_intel_device(drm_fd) ?
+			__intel_get_pipe_from_crtc_index(drm_fd, crtc->crtc_idx) : crtc->crtc_idx;
 
 		crtc->connector_count = 1;
 		for (j = i + 1; j < connector_count; j++)
-- 
2.47.3

