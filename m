Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A31FCA5FAF
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 17:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6D310E63D;
	Tue, 20 Jan 2026 17:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJMgTQ4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDC310E63E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929451; x=1800465451;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FRzm3ktPLdoCoRvx3oB/6TivQai8GMlbimIMU1bprFU=;
 b=fJMgTQ4ccJKFBJ2db9cdzPerukH0UpoYdNXhkv0ZSLNaHGpyGpfvjG42
 f/ln6HQFXAN8p34KiNeMBZUqNqKNEYaT4vepu3fq4Jn1AZCeAJvTB2++W
 AzjjqNn5knEXtDOYHX/w+HeIHsikbYiz5XxWSX2AQvq8pQ6qDw/fScugT
 9WOw+xTwy3aP7IJXdaYnHLqhLaa9Ezsq1HkRRRmrlAoRLglNk/8cPKo+w
 IAPq13+PWa6Tyt9BW8hyb2Bs5ZZweoIUiT+92w6pJSixdJDiX4+GD9qIt
 goTFsOfyaHyEJH6Tz/+5a+e7+m4AsoUxDQAg09RkOO4SAHsUwy5Ev2mWW g==;
X-CSE-ConnectionGUID: xxPb2+H5RLOPPhDimwjazQ==
X-CSE-MsgGUID: fTolJ7Y4T12ZdWK50Xz7EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81519241"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81519241"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:31 -0800
X-CSE-ConnectionGUID: SLYMtdM8Sba/CHxLpE55ZQ==
X-CSE-MsgGUID: A3xTweQSRCWdtSUjWwxA6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205798491"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:29 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/12] lib/crc: Convert igt_pipe_crc away from enum pipe
Date: Tue, 20 Jan 2026 19:16:50 +0200
Message-ID: <20260120171656.15840-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use the correct crtc_index/crtc_offset rather than the
incorrect pipe for the pipe crc debugfs stuff. Currently
the two match 1:1 so no functional change, but if/when we
change the pipe<->crtc mapping this needs to be done correctly.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_pipe_crc.c | 32 ++++++++++++++++----------------
 lib/igt_pipe_crc.h |  6 ++----
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
index 866bf2881cbd..9a79edd51531 100644
--- a/lib/igt_pipe_crc.c
+++ b/lib/igt_pipe_crc.c
@@ -189,7 +189,7 @@ struct _igt_pipe_crc {
 	int crc_fd;
 	int flags;
 
-	enum pipe pipe;
+	int crtc_index;
 	char *source;
 };
 
@@ -215,7 +215,7 @@ void igt_require_pipe_crc(int fd)
 }
 
 static igt_pipe_crc_t *
-pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
+pipe_crc_new(int fd, int crtc_index, const char *source, int flags)
 {
 	igt_pipe_crc_t *pipe_crc;
 	char buf[128];
@@ -235,14 +235,14 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
 	pipe_crc = calloc(1, sizeof(struct _igt_pipe_crc));
 	igt_assert(pipe_crc);
 
-	sprintf(buf, "crtc-%d/crc/control", pipe);
+	sprintf(buf, "crtc-%d/crc/control", crtc_index);
 	pipe_crc->ctl_fd = openat(debugfs, buf, O_WRONLY);
 	igt_assert(pipe_crc->ctl_fd != -1);
 
 	pipe_crc->crc_fd = -1;
 	pipe_crc->fd = fd;
 	pipe_crc->dir = debugfs;
-	pipe_crc->pipe = pipe;
+	pipe_crc->crtc_index = crtc_index;
 	pipe_crc->source = strdup(env_source);
 	igt_assert(pipe_crc->source);
 	pipe_crc->flags = flags;
@@ -253,39 +253,39 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
 /**
  * igt_pipe_crc_new:
  * @fd: fd of the device
- * @pipe: display pipe to use as source
+ * @crtc_index: CRTC to use as source
  * @source: CRC tap point to use as source
  *
- * This sets up a new pipe CRC capture object for the given @pipe and @source
+ * This sets up a new pipe CRC capture object for the given @crtc_index and @source
  * in blocking mode.
  *
- * Returns: A pipe CRC object for the given @pipe and @source. The library
+ * Returns: A pipe CRC object for the given @crtc_index and @source. The library
  * assumes that the source is always available since recent kernels support at
  * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
  */
 igt_pipe_crc_t *
-igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
+igt_pipe_crc_new(int fd, int crtc_index, const char *source)
 {
-	return pipe_crc_new(fd, pipe, source, O_RDONLY);
+	return pipe_crc_new(fd, crtc_index, source, O_RDONLY);
 }
 
 /**
  * igt_pipe_crc_new_nonblock:
  * @fd: fd of the device
- * @pipe: display pipe to use as source
+ * @crtc_index: CRTC to use as source
  * @source: CRC tap point to use as source
  *
- * This sets up a new pipe CRC capture object for the given @pipe and @source
+ * This sets up a new pipe CRC capture object for the given @crtc_index and @source
  * in nonblocking mode.
  *
- * Returns: A pipe CRC object for the given @pipe and @source. The library
+ * Returns: A pipe CRC object for the given @crtc_index and @source. The library
  * assumes that the source is always available since recent kernels support at
  * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
  */
 igt_pipe_crc_t *
-igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source)
+igt_pipe_crc_new_nonblock(int fd, int crtc_index, const char *source)
 {
-	return pipe_crc_new(fd, pipe, source, O_RDONLY | O_NONBLOCK);
+	return pipe_crc_new(fd, crtc_index, source, O_RDONLY | O_NONBLOCK);
 }
 
 /**
@@ -380,7 +380,7 @@ void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc)
 
 	igt_assert_eq(write(pipe_crc->ctl_fd, src, strlen(src)), strlen(src));
 
-	sprintf(buf, "crtc-%d/crc/data", pipe_crc->pipe);
+	sprintf(buf, "crtc-%d/crc/data", pipe_crc->crtc_index);
 
 	igt_set_timeout(10, "Opening crc fd, and poll for first CRC.");
 	pipe_crc->crc_fd = openat(pipe_crc->dir, buf, pipe_crc->flags);
@@ -560,7 +560,7 @@ igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
 void
 igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
 {
-	unsigned vblank = kmstest_get_vblank(drm_fd, pipe_crc->pipe, 0) + 1;
+	unsigned vblank = kmstest_get_vblank(drm_fd, pipe_crc->crtc_index, 0) + 1;
 
 	return igt_pipe_crc_get_for_frame(drm_fd, pipe_crc, vblank, crc);
 }
diff --git a/lib/igt_pipe_crc.h b/lib/igt_pipe_crc.h
index 171f082300ec..f648b2c9231e 100644
--- a/lib/igt_pipe_crc.h
+++ b/lib/igt_pipe_crc.h
@@ -9,8 +9,6 @@
 #include <stdbool.h>
 #include <stdint.h>
 
-enum pipe;
-
 /**
  * igt_pipe_crc_t:
  *
@@ -48,9 +46,9 @@ char *igt_crc_to_string(igt_crc_t *crc);
 
 void igt_require_pipe_crc(int fd);
 igt_pipe_crc_t *
-igt_pipe_crc_new(int fd, enum pipe pipe, const char *source);
+igt_pipe_crc_new(int fd, int crtc_index, const char *source);
 igt_pipe_crc_t *
-igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source);
+igt_pipe_crc_new_nonblock(int fd, int crtc_index, const char *source);
 void igt_pipe_crc_free(igt_pipe_crc_t *pipe_crc);
 void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc);
 void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc);
-- 
2.52.0

