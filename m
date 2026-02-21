Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF87C5DF70
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD9D10E10E;
	Sat, 21 Feb 2026 03:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPf6FMZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE7B10E10E
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644073; x=1803180073;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Jeh7Gww7KTZa8ILpwLwKWoG7U7Ku9yL0xyy+HPtBtNQ=;
 b=ZPf6FMZWO4xv+YxkEBIABGXl87856dy3DO5JS/vijHK7J/Uf7rg6r1H8
 dZnEMTh8xCby6Unep2UCsJNMDkDlXvbDsjJCx8oHkteb1U+9RCW8MdC1n
 JNIhMGfj3fFVoar+fH5AFj44kyl5AZgZvWdfA6XZCNYsQwhwXYTbsOREU
 s3+8Hd5QbPkF8pxMY9nn9fxuNRgKc0niMXH5DEq7wp09lR53aNoizPbWt
 NW4rFcXXxTr13xvO8oXiw3CPOHj+uPdXHfDvl0bb3Cd0pKHId+VjoMrPi
 MrPEok5U75HdMqoTBZPAWXh9/9cWSmD8sPyK8OLzyyUyalfG3p4j4vy7b Q==;
X-CSE-ConnectionGUID: VsycNuIVSyiKhIzd/7NIFw==
X-CSE-MsgGUID: bfgWCgcwQbuB9f6RvPuLOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76597965"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="76597965"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:12 -0800
X-CSE-ConnectionGUID: UmDebIa2SSK1JjiBNwAZBw==
X-CSE-MsgGUID: YrQgdrnrT0a3YFgIc3uGyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214128805"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:11 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 17/23] tests/intel/kms_psr: Use igt_crtc_t instead of
 enum pipe
Date: Sat, 21 Feb 2026 05:19:56 +0200
Message-ID: <20260221032003.30936-18-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
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

Convert kms_psr to use igt_crtc_t instead of enum pipe.

The entire thing is about changing the return type of
get_pipe_for_output().

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

v2: The last 'enum pipe' is now gone due to an earlier fix

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_psr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index c730a6f23944..0475e68d6bf5 100644
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

