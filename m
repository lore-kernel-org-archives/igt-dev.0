Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ACCD49C9E
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4D610E9C0;
	Fri, 30 Jan 2026 10:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BM/JMoZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976B610E9C0
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770425; x=1801306425;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mnsjb20mT+6baWw29e9o2lEmM+bBN4TsVMScuDL+KmY=;
 b=BM/JMoZYmphEJQVhV3D+R0NoDN2YVCEEjq+rPArP8um9M0cbwGgVnIje
 Gb6WAC57xZmYzdB8hvEOGmHUXo1O1Dv8TO/jcpkImI4l6XCA0ipDfUU/m
 rtd/oInEtFg2EvzFxp4+WRQBH+7+dTwAMe9AZE+e+C7vJ0DTv8gXrm7Rz
 u5mAAIwmBTcX2Zcx3MDnyWfl7jekn3jYKXuEFSwG1gXJpcVC8O3WWd2Ik
 WZnLzhQ6AaZ8YlG+2zCYmKxCSNitLJmQXFhx7WU58fNnhy4WpC7vM0luj
 5cZEfCkfXni583Npjj2xV7XO5SYN3+073XyUEKw2DMeY8YS0Ly3WqzcHg g==;
X-CSE-ConnectionGUID: 9br7RC5VSA27yX5JXb+qdQ==
X-CSE-MsgGUID: ebZLlgyPSmWnBEC39UI+HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81653051"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81653051"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:45 -0800
X-CSE-ConnectionGUID: sMtjkmBKTSKGqvLQWDHfog==
X-CSE-MsgGUID: PGaPewt0TxqpA7LghSb67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208826887"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:44 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/15] lib/kms: Nuke for_each_pipe_with_*_output()
Date: Fri, 30 Jan 2026 12:52:37 +0200
Message-ID: <20260130105237.14481-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
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

The pipe based for_each_pipe_with_{single,valid}_output()
iterators are no longer used anywhere. Get rid of them
so that everyone is forced to use the new crtc based
counterparts instead.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a4857ea0e574..057a0f5e90e0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -774,27 +774,6 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
 	     (crtc)++) \
 		for_each_if ((crtc)->valid)
 
-/**
- * for_each_pipe_with_valid_output:
- * @display: a pointer to an #igt_display_t structure
- * @pipe: The pipe for which this @pipe / @output combination is valid.
- * @output: The output for which this @pipe / @output combination is valid.
- *
- * This for loop is called over all connected outputs. This function
- * will try every combination of @pipe and @output.
- *
- * If you only need to test a single output for each pipe, use
- * for_each_pipe_with_single_output(), if you only need an
- * output for a single pipe, use igt_get_single_output_for_pipe().
- */
-#define for_each_pipe_with_valid_output(display, pipe, output) \
-	for (int con__ = (pipe) = 0; \
-	     assert(igt_can_fail()), (pipe) < igt_display_n_crtcs(display) && con__ < (display)->n_outputs; \
-	     con__ = (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe = pipe + 1, 0)) \
-		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid) \
-			for_each_if ((((output) = &(display)->outputs[con__]), \
-						igt_pipe_connector_valid((pipe), (output))))
-
 /**
  * for_each_crtc_with_valid_output:
  * @display: a pointer to an #igt_display_t structure
@@ -819,23 +798,6 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
 igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 					   igt_output_t **chosen_outputs);
 
-/**
- * for_each_pipe_with_single_output:
- * @display: a pointer to an #igt_display_t structure
- * @pipe: The pipe for which this @pipe / @output combination is valid.
- * @output: The output for which this @pipe / @output combination is valid.
- *
- * This loop is called over all pipes, and will try to find a compatible output
- * for each pipe. Unlike for_each_pipe_with_valid_output(), this function will
- * be called at most once for each pipe.
- */
-#define for_each_pipe_with_single_output(display, pipe, output) \
-	for (igt_output_t *__outputs[igt_display_n_crtcs(display)], \
-	     **__output = __igt_pipe_populate_outputs((display), __outputs); \
-		 __output < &__outputs[igt_display_n_crtcs(display)]; __output++) \
-		for_each_if (*__output && \
-			     ((pipe) = (__output - __outputs), (output) = *__output, 1))
-
 /**
  * for_each_crtc_with_single_output:
  * @display: a pointer to an #igt_display_t structure
-- 
2.52.0

