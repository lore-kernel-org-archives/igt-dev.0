Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C3AFD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3886810E772;
	Wed, 25 Feb 2026 12:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6y8i5bZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B1110E773
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023940; x=1803559940;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oznUJFMRb/ppc+kiUuYnnO4b6h9hrhTcEmsTIpgpCI4=;
 b=W6y8i5bZ99UpDVyLC+IqvQ9/or8insPAKYm8kuQ77uulq1ojCQ+v1099
 oSy753nsCnibHauF6VNruSSMr1KHcSf81guENl5CN6CwM9z5Z8ykWY0KW
 hzysXlwrxzFSwHjMTVuU7DQO/oqs6Kgs/VR2Wx35Qh071aNAKhfq4TELL
 mQh89BfdZxMuuX6rhzmHg1oHpoKsPCLcZDWpNc0KEFqY0XTEQFq+DJzgA
 NwYN7PoQdiuIS5cJV48axbsl4YMQphDbehtc4/jVGmj/VS0vYkujAp5Z3
 r6XhTJNsr6zrObAjp58teWqsEJfIeHSzAynhEEYEeYifjy5iYv33Ie60X Q==;
X-CSE-ConnectionGUID: KZkKLq4zS46tjKHP9Jy96g==
X-CSE-MsgGUID: w4Ve82RGRQmMHeHX+I15qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76927720"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76927720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:20 -0800
X-CSE-ConnectionGUID: f/72kCY9RoeGs2qixelGOA==
X-CSE-MsgGUID: oKf1mfCwQzaM2zw2kenOgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="221227022"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:19 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 19/19] lib/kms: Nuke for_each_valid_output_on_pipe()
Date: Wed, 25 Feb 2026 14:51:08 +0200
Message-ID: <20260225125108.31119-20-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

for_each_valid_output_on_pipe() is no unused. Get rid of it.

And with that we also lose the last caller of
igt_pipe_connector_valid() so nuke that one too.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8a3919a55e77..fb2597193467 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -670,19 +670,6 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 	return false;
 }
 
-/**
- * igt_pipe_connector_valid:
- * @pipe: pipe to check.
- * @output: #igt_output_t to check.
- *
- * Checks whether the given pipe and output can be used together.
- */
-static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output)
-{
-	return igt_output_is_connected(output) &&
-		output->config.valid_crtc_index_mask & (1 << (pipe));
-}
-
 /**
  * igt_crtc_connector_valid:
  * @crtc: CRTC to check.
@@ -801,20 +788,6 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 		for_each_if (*__output && \
 			     ((crtc) = igt_crtc_for_pipe((display), (__output - __outputs)), (output) = *__output, 1))
 
-/**
- * for_each_valid_output_on_pipe:
- * @display: a pointer to an #igt_display_t structure
- * @pipe: Pipe to enumerate valid outputs over
- * @output: The enumerated output.
- *
- * This for loop is called over all connected @output that can be used
- * on this @pipe . If there are no valid outputs for this pipe, nothing
- * happens.
- */
-#define for_each_valid_output_on_pipe(display, pipe, output) \
-	for_each_connected_output((display), (output)) \
-		for_each_if (igt_pipe_connector_valid((pipe), (output)))
-
 /**
  * for_each_valid_output_on_crtc:
  * @display: a pointer to an #igt_display_t structure
-- 
2.52.0

