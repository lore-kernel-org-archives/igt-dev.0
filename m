Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E48D49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2DC10E9B9;
	Fri, 30 Jan 2026 10:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUh3+1oo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B8610E9B9
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770367; x=1801306367;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QO6s/JSZqYoOO7v0694R7U/UylCgHIim9e3txLlBGvk=;
 b=ZUh3+1ooZu8tPs/3rPY6aXYTkfauzR6KB2XDTNa4Eg2W1xaw27NsQ1/I
 WDtdDdFV+gMEg4TJ6oM/v5JuygViCyvQJbmEdV+B1s9oj+JECBB3Fen5N
 fsTyUYaJSHB0PsjyviRmHacj+5di5CZ5VRLhgUuL4GWoVgRYyMvX/AXhk
 f4G77hA92sdBpCqMDiYgHi40DLfCDpEOIqe7iMqPSkiGn7MWtNZTuWFpj
 ZV5Duq+7vIajDqFPOsoo4QvRnczKHebzPmIZPDWL+LF+hcuOcMCkVUbb8
 WtrxFchKDQ0O365fSTHfi5G8jLc0h3FGVMEVBGZfARSCy1O33ep0DgUax A==;
X-CSE-ConnectionGUID: JV8yG1ksTwCZxiEzi7eqsA==
X-CSE-MsgGUID: S9D4dETNSn6ob98HPG5EfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88593131"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="88593131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:46 -0800
X-CSE-ConnectionGUID: I4tuChsFRM2PXtnpft9dJA==
X-CSE-MsgGUID: 3yeuHAFeTJC+/wyHCrsPcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213354737"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:45 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/15] lib/kms: Introduce for_each_crtc*()
Date: Fri, 30 Jan 2026 12:52:23 +0200
Message-ID: <20260130105237.14481-2-ville.syrjala@linux.intel.com>
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

Add for_each_crtc*() as the crtc based replacement for
the for_each_pipe*() iterators (which will eventually get
nuked).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 432c67d11780..a4857ea0e574 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -682,6 +682,19 @@ static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output
 		output->config.valid_crtc_idx_mask & (1 << (pipe));
 }
 
+/**
+ * igt_crtc_connector_valid:
+ * @crtc: CRTC to check.
+ * @output: #igt_output_t to check.
+ *
+ * Checks whether the given CRTC and output can be used together.
+ */
+static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *output)
+{
+	return igt_output_is_connected(output) &&
+		output->config.valid_crtc_idx_mask & (1 << crtc->pipe);
+}
+
 #define for_each_if(condition) if (!(condition)) {} else
 
 /**
@@ -744,6 +757,23 @@ static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output
 	for_each_pipe_static(pipe) \
 		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid)
 
+/**
+ * for_each_crtc:
+ * @display: a pointer to an #igt_display_t structure
+ * @crtc: The CRTC
+ *
+ * This for loop iterates over all CRTCs.
+ *
+ * Note that this cannot be used to enumerate per-CRTC subtest names since it
+ * depends upon runtime probing of the actual kms driver that is being tested.
+ * Use #for_each_pipe_static instead.
+ */
+#define for_each_crtc(display, crtc) \
+	for ((crtc) = &(display)->crtcs[0]; \
+	     (crtc) < &(display)->crtcs[(display)->n_crtcs]; \
+	     (crtc)++) \
+		for_each_if ((crtc)->valid)
+
 /**
  * for_each_pipe_with_valid_output:
  * @display: a pointer to an #igt_display_t structure
@@ -765,6 +795,27 @@ static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output
 			for_each_if ((((output) = &(display)->outputs[con__]), \
 						igt_pipe_connector_valid((pipe), (output))))
 
+/**
+ * for_each_crtc_with_valid_output:
+ * @display: a pointer to an #igt_display_t structure
+ * @crtc: CRTC for which this @crtc / @output combination is valid.
+ * @output: The output for which this @crtc / @output combination is valid.
+ *
+ * This for loop is called over all connected outputs. This function
+ * will try every combination of @crtc and @output.
+ *
+ * If you only need to test a single output for each pipe, use
+ * for_each_crtc_with_single_output(), if you only need an
+ * output for a single CRTC, use igt_get_single_output_for_pipe().
+ */
+#define for_each_crtc_with_valid_output(display, crtc, output) \
+	for ((output) = &(display)->outputs[0], (crtc) = &(display)->crtcs[0]; \
+	     assert(igt_can_fail()), (crtc) < &(display)->crtcs[(display)->n_crtcs] && \
+		     (output) < &(display)->outputs[(display)->n_outputs]; \
+	     (output) = (output) + 1 < &(display)->outputs[(display)->n_outputs] ? \
+		     (output) + 1 : ((crtc)++, &(display)->outputs[0])) \
+		for_each_if ((crtc)->valid && igt_crtc_connector_valid((crtc), (output)))
+
 igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 					   igt_output_t **chosen_outputs);
 
@@ -785,6 +836,23 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 		for_each_if (*__output && \
 			     ((pipe) = (__output - __outputs), (output) = *__output, 1))
 
+/**
+ * for_each_crtc_with_single_output:
+ * @display: a pointer to an #igt_display_t structure
+ * @crtc: The CRTC for which this @crtc / @output combination is valid.
+ * @output: The output for which this @crtc / @output combination is valid.
+ *
+ * This loop is called over all CRTCs, and will try to find a compatible output
+ * for each CRTC. Unlike for_each_pipe_with_valid_output(), this function will
+ * be called at most once for each pipe.
+ */
+#define for_each_crtc_with_single_output(display, crtc, output) \
+	for (igt_output_t *__outputs[igt_display_n_crtcs(display)], \
+	     **__output = __igt_pipe_populate_outputs((display), __outputs); \
+		 __output < &__outputs[igt_display_n_crtcs(display)]; __output++) \
+		for_each_if (*__output && \
+			     ((crtc) = igt_crtc_for_pipe((display), (__output - __outputs)), (output) = *__output, 1))
+
 /**
  * for_each_valid_output_on_pipe:
  * @display: a pointer to an #igt_display_t structure
-- 
2.52.0

