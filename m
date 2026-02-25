Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F2DFD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4CB10E773;
	Wed, 25 Feb 2026 12:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYgNpJ8S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3AE10E772
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023918; x=1803559918;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ls5o6lpEwC5zxcP0+peMyppwzFq/NUSNYKocJCjaDBM=;
 b=aYgNpJ8SV5wfnGwqfxcEcprJNVedVb6FE73PtfYxl4N4UNgqxRnIyKed
 Un9dC1jXRwBumnVT4nDFFsJCYybNhjWijWZNUsfMJ8obidD6drYONI6KF
 TZUUUkJopqJxRj4PBKGG+GH/reH4tSfuUMEbN5ZES4MiYis0Vxx3Y7Dyr
 /7VH7XECfgYPZyJjc7FR1QyUSX+580qtczk1LxqjwJmJMVNzgpF/1jYte
 UIRLH1bHkl9QU3WQngjkufkX3Ss7TIHdei0gjqepXFBHOiKuj02oOsB8x
 1LypS4r/MY0IaspWv3Ogd/CNAQJuPg/UbiCNSCgy2iaje0O15mR+AMSIn Q==;
X-CSE-ConnectionGUID: hrWcpAB1ReGn2di+Hc2lAA==
X-CSE-MsgGUID: ie4/2VRMTIORbtZx7fqUhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76927676"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76927676"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:58 -0800
X-CSE-ConnectionGUID: QQZobBg4SnWfXjux9FLTPg==
X-CSE-MsgGUID: FoI7FhhEQQabxU33V/+LlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="221226987"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:58 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/19] lib/kms: Nuke for_each_plane_on_pipe()
Date: Wed, 25 Feb 2026 14:51:02 +0200
Message-ID: <20260225125108.31119-14-ville.syrjala@linux.intel.com>
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

for_each_plane_on_pipe() is now unused. Get rid of it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 39e006a28e9e..c721675ea817 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -815,20 +815,6 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 	for_each_connected_output((display), (output)) \
 		for_each_if (igt_pipe_connector_valid((pipe), (output)))
 
-/**
- * for_each_plane_on_pipe:
- * @display: a pointer to an #igt_display_t structure
- * @pipe: Pipe to enumerate valid outputs over
- * @plane: The enumerated plane.
- *
- * This for loop iterates over all planes associated to the given @pipe.
- * If there are no valid planes for this pipe, nothing happens.
- */
-#define for_each_plane_on_pipe(display, pipe, plane)			\
-	for (int j__ = 0; assert(igt_can_fail()), \
-		     (plane) = &igt_crtc_for_pipe((display), (pipe))->planes[j__], \
-		     j__ < igt_crtc_for_pipe((display), (pipe))->n_planes; j__++)
-
 /**
  * for_each_plane_on_crtc:
  * @crtc: CRTC to enumerate valid outputs over
-- 
2.52.0

