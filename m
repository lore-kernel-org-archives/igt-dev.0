Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74B5FD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B20510E772;
	Wed, 25 Feb 2026 12:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBIAOmUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4788D10E772
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023929; x=1803559929;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gwwDGs/pWKI9f2PKTRghYt6C62gLiNRFiDVwN1T+G6w=;
 b=FBIAOmUBDe2Gl59e2RMrfpi7y4b7GQhy3e41HFX0WTod7pQ3Uhbr+zie
 CZqXAoTE7gHxW5thcOh9K8obB45zjHJTuBM9Zh2AjJJySP/HwK0BJYCXt
 am29MFPNBqzHLa0swi8rCmqiJe42IYFj9B5426bdyZ9bKi6H6diC64cqS
 CNIs9K7ezxeV/5xBFIYndQqV3lA9U5pFuG3onU/tgFAkqDuK4iXxN/h0s
 mChy+4RKWxtro0n2bUJ5VNK+ilsq66xsDMuBqO3FRZDJrxVeBL2zBCmi4
 T58j4l8cD+eqabzDVxkN+J1rF1ZC50Rj0UMxq0SVvlK1DMAKJR3L7ck+v A==;
X-CSE-ConnectionGUID: GT2BRQzWQiu8dZLhzph3PA==
X-CSE-MsgGUID: 4nFQQduHSEyVAX9vgJ07oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83772238"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83772238"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:09 -0800
X-CSE-ConnectionGUID: eMrs5O8PRveEeSeuQSatOw==
X-CSE-MsgGUID: ZU8CowxyTkqnf1jUH9MHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213350088"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:08 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/19] lib/kms: Intreoduce
 for_each_valid_output_on_crtc()
Date: Wed, 25 Feb 2026 14:51:05 +0200
Message-ID: <20260225125108.31119-17-ville.syrjala@linux.intel.com>
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

Add for_each_valid_output_on_crtc() as the crtc based replacement
for for_each_valid_output_on_pipe().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c721675ea817..8a3919a55e77 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -815,6 +815,20 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 	for_each_connected_output((display), (output)) \
 		for_each_if (igt_pipe_connector_valid((pipe), (output)))
 
+/**
+ * for_each_valid_output_on_crtc:
+ * @display: a pointer to an #igt_display_t structure
+ * @crtc: CRTC to enumerate valid outputs over
+ * @output: The enumerated output.
+ *
+ * This for loop is called over all connected @output that can be used
+ * on this @crtc . If there are no valid outputs for this CRTC, nothing
+ * happens.
+ */
+#define for_each_valid_output_on_crtc(display, crtc, output) \
+	for_each_connected_output((display), (output)) \
+		for_each_if (igt_crtc_connector_valid((crtc), (output)))
+
 /**
  * for_each_plane_on_crtc:
  * @crtc: CRTC to enumerate valid outputs over
-- 
2.52.0

