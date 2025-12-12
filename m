Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42454D59D6A
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 15:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEF310E903;
	Fri, 12 Dec 2025 15:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgRsCyfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04E410E903
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765554399; x=1797090399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HAm+qfvbWyl1YfNKq0orND6ebh9MCEbClHfB+6u3dhs=;
 b=TgRsCyfn+8Ztc77IfPUHB8Jjsenuu12XMTtaRR2zJ87FwFyOHQsPIUXU
 nyiOau7p5dSL7pz2kDSNOy/K+nLPAD25G2yEQBGBb2TX3k66m5jJf32FF
 7PxRdrkw1SMrxO6zZriA8nY+qJ4rTk7e1FiFJdlmCmvTHnoW3Nf6eyV09
 O3nDnnjhqI4V9aw9QRrfSO7cENGpcugzkYT1GmaSA+DzRDpB78U4VyzCr
 9NMt+H5XngGMuNfQ8sUhmKtix0XFyC0reWXbrTCGQkDrkxsaog4LNDb9h
 c7bwwO8Fvv1jKFYXGNK8MiLWP1mdr8e6NxOr26aFugJpbj5Hc1LwKVeQI w==;
X-CSE-ConnectionGUID: YkrCFv36TrqNE5KCI1lx2w==
X-CSE-MsgGUID: gU8m4gNURjer1N5kP2c4kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="55124591"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="55124591"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:38 -0800
X-CSE-ConnectionGUID: MgXnxzaqQ1eSyk446MHz5g==
X-CSE-MsgGUID: xzpBV4wISiyH9l5fadjY4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201295443"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:37 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 02/10] lib/kms: Introduce igt_display_n_crtcs()
Date: Fri, 12 Dec 2025 17:46:18 +0200
Message-ID: <20251212154626.29471-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
References: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Introduce igt_display_n_crtcs() as the new name for
igt_display_get_n_pipes(). The old name will get eliminated
later using cocci, but it's easier to introduce duplicate
names first because this needs to be used in a few messy macros
that cocci doesn't like.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 13 ++++++++++++-
 lib/igt_kms.h |  7 ++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d7da376bc0b..5b8598305f8c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3271,6 +3271,17 @@ out:
 	}
 }
 
+/**
+ * igt_display_n_crtcs:
+ * @display: A pointer to an #igt_display_t structure
+ *
+ * Returns: Total number of CRTCs for the given @display
+ */
+int igt_display_n_crtcs(igt_display_t *display)
+{
+	return display->n_pipes;
+}
+
 /**
  * igt_display_get_n_pipes:
  * @display: A pointer to an #igt_display_t structure
@@ -3279,7 +3290,7 @@ out:
  */
 int igt_display_get_n_pipes(igt_display_t *display)
 {
-	return display->n_pipes;
+	return igt_display_n_crtcs(display);
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 065cbeca09a8..4171e2baef61 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -577,6 +577,7 @@ int  igt_display_drop_events(igt_display_t *display);
 int  igt_display_get_n_pipes(igt_display_t *display);
 void igt_display_require_output(igt_display_t *display);
 void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
+int igt_display_n_crtcs(igt_display_t *display);
 
 const char *igt_output_name(igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
@@ -743,7 +744,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
  */
 #define for_each_pipe_with_valid_output(display, pipe, output) \
 	for (int con__ = (pipe) = 0; \
-	     assert(igt_can_fail()), (pipe) < igt_display_get_n_pipes((display)) && con__ < (display)->n_outputs; \
+	     assert(igt_can_fail()), (pipe) < igt_display_n_crtcs(display) && con__ < (display)->n_outputs; \
 	     con__ = (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe = pipe + 1, 0)) \
 		 for_each_if((display)->pipes[pipe].valid) \
 			for_each_if ((((output) = &(display)->outputs[con__]), \
@@ -763,9 +764,9 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
  * be called at most once for each pipe.
  */
 #define for_each_pipe_with_single_output(display, pipe, output) \
-	for (igt_output_t *__outputs[(display)->n_pipes], \
+	for (igt_output_t *__outputs[igt_display_n_crtcs(display)], \
 	     **__output = __igt_pipe_populate_outputs((display), __outputs); \
-		 __output < &__outputs[(display)->n_pipes]; __output++) \
+		 __output < &__outputs[igt_display_n_crtcs(display)]; __output++) \
 		for_each_if (*__output && \
 			     ((pipe) = (__output - __outputs), (output) = *__output, 1))
 
-- 
2.51.2

