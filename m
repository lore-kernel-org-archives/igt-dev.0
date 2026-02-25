Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E886EFD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9223710E772;
	Wed, 25 Feb 2026 12:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbVjEHzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3622D10E772
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023911; x=1803559911;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=saQl3v2GB94Yxk3MHSj8GOQB8NU5kXogCX1yBz0rQWg=;
 b=BbVjEHzzB3ptfVJbLLQlJb5tkFgUffBkV2gg3lW4g7bmzI0hQ46kb+nS
 2fopsDJ7FK145iKE7WUWZS9qkEs3dYXuLItbFzta5W9cHv2ZdUO0pcauM
 MlKhQBng3npQmxp1blGzawZqZs2VHYxDa/NQk0OXWuqk/GEsFUKFQb/PH
 JHCvgpINSwaIzfAS3MrELHUuFVeMH+CWjlDZo+HjmFMi34evLxd+YaIsg
 ndHnSesGDUGUuqBICkVbKrbcQEXjkjcu1NfZjKVUmaUnfF2PR5C49kuI0
 laUL7wHw01CEHzEhDVyF3lHK8++EVz8cDi/VH4uN9PRdPCmtgkZKO+Fgj g==;
X-CSE-ConnectionGUID: Eu035fFbQJytsA83Z3YvQw==
X-CSE-MsgGUID: XezBbDH0Qg60bOLtO0Wt8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83772234"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83772234"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:51 -0800
X-CSE-ConnectionGUID: 0HzgmQk0T0qgDHqRWDgYuw==
X-CSE-MsgGUID: ZK+JSgVGSZ6O1FgCyhvqng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213350066"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/19] lib/kms: Introduce for_each_plane_on_crtc()
Date: Wed, 25 Feb 2026 14:51:00 +0200
Message-ID: <20260225125108.31119-12-ville.syrjala@linux.intel.com>
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

Add for_each_plane_on_crtc() as the crtc based replacement
for for_each_plane_on_pipe().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9dc933d537ef..39e006a28e9e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -829,6 +829,19 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 		     (plane) = &igt_crtc_for_pipe((display), (pipe))->planes[j__], \
 		     j__ < igt_crtc_for_pipe((display), (pipe))->n_planes; j__++)
 
+/**
+ * for_each_plane_on_crtc:
+ * @crtc: CRTC to enumerate valid outputs over
+ * @plane: The enumerated plane.
+ *
+ * This for loop iterates over all planes associated to the given @crtc.
+ * If there are no valid planes for this CRTC, nothing happens.
+ */
+#define for_each_plane_on_crtc(crtc, plane) \
+	for (int j__ = 0; assert(igt_can_fail()), \
+		     (plane) = &(crtc)->planes[j__], \
+		     j__ < (crtc)->n_planes; j__++)
+
 /**
  * for_each_connector_mode:
  * @output: Output to enumerate available modes.
-- 
2.52.0

