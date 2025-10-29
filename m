Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FFACCF9F0
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 14:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6202E10E7D8;
	Wed, 29 Oct 2025 14:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glR5hqPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDB710E7D8
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761748909; x=1793284909;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=eqMPseIwhU7Mj0Q3ly5mINtl8/WCbA7TldUs/9alJaQ=;
 b=glR5hqPAgMEV+u9tsDYeWhesPFfz3kQP8NL10wlFlaEZMYDbYXovp2Dv
 FOMeEC6+eZY8nKwPmgyNRmuG8b6jf6zGJPvm0zQLPHKYI9uIma1ZvTIQc
 0uFh2nbvhDCNSxzcwzcIbEny8yROr40Njh3WZQantO3sFzg8PdJ1Uck3j
 FGK5TUwt0LhQjpl5gInDcaSSUY4nV457X9nHkhLDxdMTMyldIY210lzHm
 qtBcLTD+fk7IJjQhbDgVsl8LDDuS4gtFW7NC1WYfu9uDRFXwiRUVTUzlS
 l0YH2oWSiLkrKLRYZoMQEwS4ImlyDDdXGhXROsoyCsNWA3Iek5w7bvX2f Q==;
X-CSE-ConnectionGUID: EemysQueSpST78LE361MJA==
X-CSE-MsgGUID: 1RnyGktsSbGjaTMg0TZW8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74548900"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="74548900"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:41:49 -0700
X-CSE-ConnectionGUID: ro8JMw5bQ0ibNYmKSRUspA==
X-CSE-MsgGUID: fSjZLCe/R1ewowgF1LSatw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="216343697"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:41:47 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 29 Oct 2025 11:41:34 -0300
Subject: [PATCH] igt_kms: Rename igt_pipe member enabled to valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-rename-igt_pipe-dot-enabled-to-valid-v1-1-2aea1e009732@intel.com>
X-B4-Tracking: v=1; b=H4sIAJ0nAmkC/x2NQQqDMBAAvyJ77oIumlC/IkVis7ULNglJEEH8e
 xePM4eZEwpn4QJjc0LmXYrEoNA9Gnh/XVgZxSsDtTR0LT0xc3A/tWudkyRGHyuqWjb2WCPubhO
 PRJZsb0xvjQVNpcwfOe7N9LquPyJgfiF2AAAA
X-Change-ID: 20251029-rename-igt_pipe-dot-enabled-to-valid-227274664767
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, 
 Arkadiusz Hiler <arkadiusz.hiler@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The boolean member enabled was added to struct igt_pipe by commit
b743593074ba ("lib/igt_kms: Add support for display with non-contiguous
pipes") to allow having array of pipes in struct igt_display to be
indexed by enum pipe.

The chosen terminology can be a bit confusing, because one could
interpret it as the pipe actively processing pixels.  Let's use "valid"
as an alternative name for that member to avoid the confusion.

Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/igt_kms.c                   | 17 ++++++++---------
 lib/igt_kms.h                   | 19 +++++++++++++------
 tests/intel/gem_eio.c           |  2 +-
 tests/intel/kms_joiner_helper.c |  2 +-
 tests/kms_cursor_legacy.c       |  2 +-
 5 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2eaf483d47d2..3b22d60f5942 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2714,15 +2714,15 @@ static void igt_fill_display_format_mod(igt_display_t *display);
  * @display: pointer to igt_display_t
  * @pipe: pipe which need to check
  *
- * Skip a (sub-)test if the pipe not enabled.
+ * Skip a (sub-)test if the pipe not valid.
  *
  * Should be used everywhere where a test checks pipe and skip
- * test when pipe is not enabled.
+ * test when pipe is not valid.
  */
 void igt_require_pipe(igt_display_t *display, enum pipe pipe)
 {
-	igt_skip_on_f(pipe >= display->n_pipes || !display->pipes[pipe].enabled,
-			"Pipe %s does not exist or not enabled\n",
+	igt_skip_on_f(pipe >= display->n_pipes || !display->pipes[pipe].valid,
+			"Pipe %s does not exist\n",
 			kmstest_pipe_name(pipe));
 }
 
@@ -2970,8 +2970,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		pipe = &display->pipes[pipe_enum];
 		pipe->pipe = pipe_enum;
 
-		/* pipe is enabled/disabled */
-		pipe->enabled = true;
+		pipe->valid = true;
 		pipe->crtc_id = resources->crtcs[i];
 		/* offset of a pipe in crtcs list */
 		pipe->crtc_offset = i;
@@ -3507,7 +3506,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 
 	for (i = 0; i < display->n_pipes; i++) {
 		igt_pipe_t *pipe = &display->pipes[i];
-		if (pipe->enabled)
+		if (pipe->valid)
 			full_pipe_mask |= (1 << i);
 	}
 
@@ -6841,7 +6840,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 				}
 			}
 
-			if (!display->pipes[pipes[i].idx + 1].enabled) {
+			if (!display->pipes[pipes[i].idx + 1].valid) {
 				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
 					 kmstest_pipe_name(display->pipes[pipes[i].idx + 1].pipe));
 				return false;
@@ -6863,7 +6862,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 				 max_dotclock, pipes[i - 1].force_joiner ? "Yes" : "No");
 			kmstest_dump_mode(pipes[i - 1].mode);
 
-			if (!display->pipes[pipes[i - 1].idx + 1].enabled) {
+			if (!display->pipes[pipes[i - 1].idx + 1].valid) {
 				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
 					 kmstest_pipe_name(display->pipes[pipes[i - 1].idx + 1].pipe));
 				return false;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7121ab985fd2..52154933b25f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -455,8 +455,15 @@ struct igt_pipe {
 	igt_display_t *display;
 	/* ID of a hardware pipe */
 	enum pipe pipe;
-	/* pipe is enabled or not */
-	bool enabled;
+
+        /*
+         * Indicates whether this pipe struct is valid and can be used. This can
+         * be false when the pipe is allocated as part of an array indexed by
+         * enum pipe, but the respective pipe is not reported by DRM, meaning
+         * that the pipe could not exist in the underlying hardware, could have
+         * been fused off, etc.
+         */
+        bool valid;
 
 	int n_planes;
 	int num_primary_planes;
@@ -694,7 +701,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
  */
 #define for_each_pipe(display, pipe) \
 	for_each_pipe_static(pipe) \
-		for_each_if((display)->pipes[(pipe)].enabled)
+		for_each_if((display)->pipes[(pipe)].valid)
 
 /**
  * for_each_pipe_with_valid_output:
@@ -713,7 +720,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 	for (int con__ = (pipe) = 0; \
 	     assert(igt_can_fail()), (pipe) < igt_display_get_n_pipes((display)) && con__ < (display)->n_outputs; \
 	     con__ = (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe = pipe + 1, 0)) \
-		 for_each_if((display)->pipes[pipe].enabled) \
+		 for_each_if((display)->pipes[pipe].valid) \
 			for_each_if ((((output) = &(display)->outputs[con__]), \
 						igt_pipe_connector_valid((pipe), (output))))
 
@@ -1220,10 +1227,10 @@ uint32_t igt_reduce_format(uint32_t format);
  * @display: pointer to igt_display_t
  * @pipe: pipe which need to check
  *
- * Skip a (sub-)test if the pipe not enabled.
+ * Skip a (sub-)test if the pipe not valid.
  *
  * Should be used everywhere where a test checks pipe and skip
- * test when pipe is not enabled.
+ * test when pipe is not valid.
  */
 void igt_require_pipe(igt_display_t *display,
 		enum pipe pipe);
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 9389efb9683b..3544cb1fb3f5 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1032,7 +1032,7 @@ static void display_helper(igt_display_t *dpy, int *done)
 		int pipe;
 
 		pipe = rand() % dpy->n_pipes;
-		if (!dpy->pipes[pipe].enabled)
+		if (!dpy->pipes[pipe].valid)
 			continue;
 		output = igt_get_single_output_for_pipe(dpy, pipe);
 		if (!output)
diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index 17a22d34a3da..d2a3117fec26 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -105,7 +105,7 @@ void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *mas
 
 	*master_pipes = 0;
 	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
-		if (display->pipes[pipe].enabled && display->pipes[pipe + 1].enabled) {
+		if (display->pipes[pipe].valid && display->pipes[pipe + 1].valid) {
 			*master_pipes |= BIT(pipe);
 			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
 		}
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index ed1c77d5593b..865853c38fac 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -294,7 +294,7 @@ static void stress(igt_display_t *display,
 		}
 	} else {
 		num_crtcs = 1;
-		if(display->pipes[pipe].enabled) {
+		if(display->pipes[pipe].valid) {
 			arg.crtc_id = crtc_id[0] = display->pipes[pipe].crtc_id;
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
 		}

---
base-commit: 7cc368821eaceafddf710879851ffd76f97ecb4e
change-id: 20251029-rename-igt_pipe-dot-enabled-to-valid-227274664767

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

