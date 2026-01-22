Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABA7D489BF
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 13:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8C810E9A3;
	Thu, 22 Jan 2026 13:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfHJ7BY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4F410E9A1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 13:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086807; x=1800622807;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=R2sA/MLxZ/K9aWoIV3nEoAaeMl+jDQaHrcOnbMxWJkI=;
 b=RfHJ7BY8eayp3XDQrqA3KGIVJImJBEsnIhcttTXQ7rBNPWHf4EmhMPqd
 F/2vxDJ+hy1u0gyyd8r3O8mjIysAgrn31KYu5PWCjcyPNqcIVAUbIvtwk
 BsvDfPpPNGVU9aXgYK/2gq7B9v+8jv/spT6kTXfBIuLqLaQcFdjMDPkbC
 aJnx7gqO9Qe9+ceq3gAE/iuPZmiusVcjqmDSUMNzB0bHpb3ZS+luh0//s
 CE2iDVWoQg64miKP9KrWLYj+dfHaFdRHwh05Xz/L2C6IKwYhapTTWCSDy
 sFOGbTcOoLfsI7dho2U/a3Kqwvmc87UYv+S8bBa5Bg7t6cZDXyiEJDzBg A==;
X-CSE-ConnectionGUID: PKfIXgelSFath5ONWbkCwA==
X-CSE-MsgGUID: 88HgG5/MQ++MOJm1Q0cOvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81045363"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81045363"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:00:07 -0800
X-CSE-ConnectionGUID: BFHRGMqXT/GyhT1U0eQh1g==
X-CSE-MsgGUID: rtDW5JPLSpKHpsLxKSmdNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237987315"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:00:06 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/10] lib/kms: Rename old_pipe to old_crtc
Date: Thu, 22 Jan 2026 14:59:33 +0200
Message-ID: <20260122125937.10807-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
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

Start renaming variables from 'pipe' to 'crtc'
where appropriate. igt_output_set_crtc() needs
a bit of extra care due to the old vs. new
stuff, so we start by just renaming 'old_pipe'
to 'old_crtc' which can then be excluded from
a later mass conversion.

Done with cocci:
 #include "scripts/iterators.cocci"

@@
typedef igt_crtc_t;
identifier OLD_CRTC =~ "old";
expression E;
@@
(
 igt_crtc_t *
-	OLD_CRTC
+	old_crtc
	;
|
 igt_crtc_t *
-	OLD_CRTC
+	old_crtc
	= E;
)
<...
- OLD_CRTC
+ old_crtc
...>

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f15aaae9ce35..46acda0dfe8e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5334,28 +5334,31 @@ static const char *igt_crtc_name(igt_crtc_t *crtc)
 void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj)
 {
 	igt_display_t *display = output->display;
-	igt_crtc_t *old_pipe = NULL;
+	igt_crtc_t *old_crtc = NULL;
 
 	igt_assert(output->name);
 
 	if (output->pending_pipe != PIPE_NONE)
-		old_pipe = igt_output_get_driving_crtc(output);
+		old_crtc = igt_output_get_driving_crtc(output);
 
 	LOG(display, "%s: set_crtc(%s)\n", igt_output_name(output),
 	    igt_crtc_name(pipe_obj));
 	output->pending_pipe = pipe_obj ? pipe_obj->pipe : PIPE_NONE;
 
-	if (old_pipe) {
+	if (old_crtc) {
 		igt_output_t *old_output;
 
-		old_output = igt_crtc_get_output(old_pipe);
+		old_output = igt_crtc_get_output(old_crtc);
 		if (!old_output) {
 			if (display->is_atomic)
-				igt_crtc_replace_prop_blob(old_pipe, IGT_CRTC_MODE_ID, NULL, 0);
+				igt_crtc_replace_prop_blob(old_crtc,
+							   IGT_CRTC_MODE_ID,
+							   NULL, 0);
 			else
-				igt_crtc_set_prop_changed(old_pipe, IGT_CRTC_MODE_ID);
+				igt_crtc_set_prop_changed(old_crtc,
+							  IGT_CRTC_MODE_ID);
 
-			igt_crtc_set_prop_value(old_pipe, IGT_CRTC_ACTIVE, 0);
+			igt_crtc_set_prop_value(old_crtc, IGT_CRTC_ACTIVE, 0);
 		}
 	}
 
-- 
2.52.0

