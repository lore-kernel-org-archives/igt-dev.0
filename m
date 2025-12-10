Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4B3D3B9A9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 09:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB5E10E6B6;
	Wed, 10 Dec 2025 09:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lo9wWPCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0954510E6B6
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765359555; x=1796895555;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7QwDr4pCY4T2+GWkwV6sluZqBd6AQx3nEPiX5oEtXyQ=;
 b=Lo9wWPCEWAwD+weo9qA8G82scJ+aNmv/Nbma36nD8LhBVbTBH7/w5THO
 BEUjHqzKk1SBiPWwCDCvrzz4Co1VkvexB6Kc0UYKbYdWpngqZHi9UZKY4
 qux8LZyQdi00kbV70TjiAptak4qPBcIHeOH58Nbz1VVjtHzre5hcUeYcV
 LxXhT7pQzwQw+MKn736YLY9a8wn7uBxAZg66QuM3gDEnlAjJC/Th2fhRJ
 NSkU79ndglhuVud89GaGLN1soeOeIf2QsIKbhgfV5Ws8XrHO1BkqEwaCZ
 AYPAGaFS2oamzV/c6+iI3e6P8Vr3BRf8ymlk9LcdrOp5585vu43aPNxUT w==;
X-CSE-ConnectionGUID: S7rUMxgzSL+wmiWDPQbo0A==
X-CSE-MsgGUID: W26mUVvJQ5qhpU69H85F9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77943238"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="77943238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:39:14 -0800
X-CSE-ConnectionGUID: w9xKUyIuRhOXhQThfeSPXg==
X-CSE-MsgGUID: GgclYm+xQ2SEuxw0/rF7WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="233865768"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:39:13 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/10] lib/kms: Introduce igt_display_n_crtcs()
Date: Wed, 10 Dec 2025 11:38:55 +0200
Message-ID: <20251210093903.15934-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
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

