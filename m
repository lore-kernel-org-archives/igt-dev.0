Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBE3CA5FB7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 17:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB6110E63D;
	Tue, 20 Jan 2026 17:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdeCQokU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D2510E63D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 17:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929466; x=1800465466;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1SgYmChezuHqM3hUci2yqDmlSQE1Ulwx506+SOLEqRw=;
 b=AdeCQokURqbtBWwwlcipBeL5IBhuxgkAp61MH6exOxmEOLBo30phIQQd
 Zqo4MHSOJRewsJ0ccdhtXi/sWXdbbDAVmEMmipznwgVoU5hQfbzBQJRIk
 IOWJwXDEZBpIbK9OMbpe2hTpJ4ZAiAXoF6JNhhU9g5H6BZDjmUG3AhrYV
 NES3CznZroY+Jw7Vt3QA/Rcjq0j1zA4VffRMoZmnXfjyi0HLU6idm8oIf
 D1sXErqIdRF/xhx6+Et0FvmJj+v+vDvT9YZ81g8OPs9v1lhGGnWv8o1N7
 6GjAeu1D+HzJqvFO8l2/Ml+xhBcPm/8w2YWTyOnU26zUAdUNC3M09w2rt w==;
X-CSE-ConnectionGUID: +pJGXTDTT4COa+MJrkYI8Q==
X-CSE-MsgGUID: K7zeKHchR5iJee9lzn/i3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81519255"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81519255"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:46 -0800
X-CSE-ConnectionGUID: ETtxg91iQ7mOeLRT2hWrcA==
X-CSE-MsgGUID: 9YpSUXCGR8CoGuyaUlWDjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205798553"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:44 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/12] lib/kms: Use igt_crtc_crc_new_nonblock() more
Date: Tue, 20 Jan 2026 19:16:54 +0200
Message-ID: <20260120171656.15840-12-ville.syrjala@linux.intel.com>
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

Switch over to igt_crtc_crc_new_nonblock() from
igt_pipe_crc_new_nonblock() even for the places that
don't have a igt_crtc_t around. This make it more
obvious where we need to modify the tests when fully
switching over from pipe to igt_crc_t.

Done with cocci:
 #include "scripts/iterators.cocci"

@find_data@
iterator name pipe_test;
type T;
T DATA;
identifier FD;
identifier DISPLAY;
@@
igt_display_require(&DATA.DISPLAY, DATA.FD);

@depends on find_data@
find_data.T *DATA;
identifier find_data.FD;
identifier find_data.DISPLAY;
expression PIPE;
@@
- igt_pipe_crc_new_nonblock(DATA->FD, PIPE
+ igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&DATA->DISPLAY, PIPE)
	,...)

@local_fd depends on find_data@
find_data.T *DATA;
identifier find_data.FD, FD2;
identifier find_data.DISPLAY;
expression PIPE;
@@
int FD2 = DATA->FD;
<...
- igt_pipe_crc_new_nonblock(FD2, PIPE
+ igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&DATA->DISPLAY, PIPE)
	,...)
...>

@depends on local_fd@
find_data.T *DATA;
identifier find_data.FD;
identifier FD2;
@@
- int FD2 = DATA->FD;
... when != FD2

@depends on find_data@
typedef igt_display_t;
identifier DISPLAY, find_data.FD;
expression PIPE, E;
find_data.T *DATA;
@@
 igt_display_t *DISPLAY = E;
<...
- igt_pipe_crc_new_nonblock(DATA->FD, PIPE
+ igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(DISPLAY, PIPE)
	,...)
...>

@depends on find_data@
identifier find_data.DISPLAY, find_data.FD;
expression PIPE;
find_data.T find_data.DATA;
@@
- igt_pipe_crc_new_nonblock(DATA.FD, PIPE
+ igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&DATA.DISPLAY, PIPE)
	,...)

@@
igt_display_t *DISPLAY;
expression PIPE;
@@
- igt_pipe_crc_new_nonblock(DISPLAY->drm_fd, PIPE
+ igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(DISPLAY, PIPE)
	,...)

@@
expression DISPLAY, PIPE;
@@
igt_crtc_crc_new_nonblock(...)
{
<...
- igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(DISPLAY, PIPE)
+ igt_pipe_crc_new_nonblock(DISPLAY->drm_fd, PIPE
	,...)
...>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_cursor_edge_walk.c | 2 +-
 tests/kms_pipe_crc_basic.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index d77787e51b97..eaf4c59b8a19 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -284,7 +284,7 @@ static void prepare_crtc(data_t *data)
 	data->jump_y = (mode->vdisplay - data->curh) / 2;
 
 	/* create the pipe_crc object for this pipe */
-	data->pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, data->pipe,
+	data->pipe_crc = igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&data->display, data->pipe),
 						   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc w/o cursor */
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 8861dc7b26bd..fb2f5f8ebe96 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -167,7 +167,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 		if (flags & TEST_NONBLOCK) {
 			igt_pipe_crc_t *pipe_crc;
 
-			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe,
+			pipe_crc = igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&data->display, pipe),
 							     IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
 			igt_pipe_crc_start(pipe_crc);
-- 
2.52.0

