Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41749C54FD2
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51EF10E7F7;
	Fri, 20 Feb 2026 14:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcYXJHsw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFD310E7F9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596183; x=1803132183;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BzxbdholTMja83Kj0rEbZyTJPdSGRzOrXYnIMP4kx7s=;
 b=XcYXJHswQ+NUgmLrSmcKmhFojTsi3MYEnhOGhdSY8I46KSS7Rm5kmAzb
 MebTi80nTIOZTu+apcQIcSg7X1sZTtzxWV1unWHx1hCUtqFJcXafpD5IU
 5iUE+rIfYDOtZ1fYkjdkvRM1AwWDdvujLtMKSrjMjJUWMhWO+BSBfjuEQ
 lebzDgdDw0v/Axd2r9+BF/kLAfRdeMxR5lagXGx2tmXOinzE/wxpgeCbF
 4CE6xd+zRlkvTdOSa8N/VGWQOyhmqYs/J+prAXsRCmSngnXkT5EH46zjR
 jzIjev71SeMo7VYif34laZaYbTTsKBLWcXZNCyc/QUNXNBgys7N3w8+cA g==;
X-CSE-ConnectionGUID: nG0l5z4CR1mysxLM5nCCzA==
X-CSE-MsgGUID: pbwpsCm2Tdu7DNxdbyFMUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72389012"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72389012"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:03:03 -0800
X-CSE-ConnectionGUID: 85/YtWlMRSe8lt1d+fZ4RA==
X-CSE-MsgGUID: awHjALpQRdOMLpBf+jxXCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252543973"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:03:01 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/21] tests/intel/kms_psr: Use igt_crtc_t instead of
 enum pipe
Date: Fri, 20 Feb 2026 16:01:47 +0200
Message-ID: <20260220140154.4138-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
References: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
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

Convert most of kms_psr to use igt_crtc_t instead of
enum pipe.

The entire thing is about changing the return type of
get_pipe_for_output().

Note that there is still one 'enum pipe pipe' variable left
in kms_psr, and it's yet another buggy piece of code
where the uninitialized 'pipe' is passed to some function
(intel_fbc_supported_on_chipset() in this case). Fixing
that probably needs some actual thought...

 #include "scripts/iterators.cocci"

@ret_pipe@
typedef igt_output_t;
typedef igt_crtc_t;
identifier FUNC;
igt_crtc_t *CRTC;
parameter list[N] P;
@@
- enum pipe
+ igt_crtc_t *
FUNC(P)
{
<...
- return CRTC->pipe;
+ return CRTC;
...>
}

@depends on ret_pipe@
identifier ret_pipe.FUNC;
@@
- enum pipe
+ igt_crtc_t *
FUNC(...);

@depends on ret_pipe@
identifier ret_pipe.FUNC;
@@
FUNC(...)
+ ->pipe

@depends on ret_pipe@
identifier ret_pipe.FUNC, PIPE;
expression list[ret_pipe.N] EP;
@@
{ ...
  enum pipe PIPE;
+ igt_crtc_t *crtc;
<+... when != PIPE = ...
- PIPE = FUNC(EP)->pipe;
+ crtc = FUNC(EP);
+ PIPE = crtc->pipe;
...+>
}

@depends on ret_pipe@
identifier ret_pipe.FUNC;
expression list[ret_pipe.N] EP;
@@
- igt_crtc_for_pipe(..., FUNC(EP)->pipe)
+ FUNC(EP)

@@
identifier PIPE;
igt_crtc_t *CRTC;
@@
{...
- PIPE = CRTC->pipe;
<+... when != PIPE = ...
- PIPE
+ CRTC->pipe
...+>
}

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
identifier PIPE;
@@
{...
- enum pipe PIPE;
... when != PIPE
}

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_psr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index c411981c0104..3bdc8a1e6b66 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -691,7 +691,7 @@ static void setup_test_plane(data_t *data, int test_plane)
 	igt_display_commit(&data->display);
 }
 
-static enum pipe get_pipe_for_output(igt_display_t *display,
+static igt_crtc_t * get_pipe_for_output(igt_display_t *display,
 				     igt_output_t *output)
 {
 	igt_crtc_t *crtc;
@@ -705,7 +705,7 @@ static enum pipe get_pipe_for_output(igt_display_t *display,
 			continue;
 		}
 
-		return crtc->pipe;
+		return crtc;
 	}
 
 	igt_assert_f(false, "No pipe found for output %s\n",
@@ -714,7 +714,7 @@ static enum pipe get_pipe_for_output(igt_display_t *display,
 
 static void test_setup(data_t *data)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	drmModeConnectorPtr connector;
 	bool psr_entered = false;
 
@@ -729,7 +729,7 @@ static void test_setup(data_t *data)
 		igt_require_f(data->fbc_flag,
 			      "Can't test FBC with PSR\n");
 
-	pipe = get_pipe_for_output(&data->display, data->output);
+	crtc = get_pipe_for_output(&data->display, data->output);
 	data->crtc_id = data->output->config.crtc->crtc_id;
 	connector = data->output->config.connector;
 
@@ -750,7 +750,7 @@ static void test_setup(data_t *data)
 		if (psr_wait_entry_if_enabled(data)) {
 			if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
 				igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
-									  pipe),
+									  crtc->pipe),
 									  "FBC still disabled\n");
 			psr_entered = true;
 			break;
-- 
2.52.0

