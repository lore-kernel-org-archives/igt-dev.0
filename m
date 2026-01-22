Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D5ED46977
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 12:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A7C10E9A1;
	Thu, 22 Jan 2026 12:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kzXtMjrC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F91910E9A8
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086785; x=1800622785;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JtQLzEi8Bo62qL09mWc31bxn9GiieBGjkKWyd+8lzy0=;
 b=kzXtMjrCuZ40DS+84qcW6KIpMJVJohTY9E35jDsJYjfXTQOpOHRZ/50F
 2P46faVclMFqAGPwm3x65lVW6K7uDQXnkt4muLTULJk32uTnvtW9oEG+y
 5Q1zw3LrqwgZkA97jwhUSqOIEo3QCW4XmzzTCsSot7az+m/4R2DmpOVrU
 5k/d4VX0OvHLiOh4G6O5BCg5dgWXffBH4pcEXXJRaoBs1WO4q0NRd9YTf
 y52hqIiuDmmgRbq+XvjXhq32Ga6O09J9x3IAtdxEYCRoTdShNzjwUVuKR
 OCW9ASclGofuHzm8VDFVCIHoq9df9XrZbr90H5NmtToII7SQL9CEhjt8A w==;
X-CSE-ConnectionGUID: euC+ikb7Tn69y6d41s+BDw==
X-CSE-MsgGUID: MGn8HqRjS9ilajLoUwK+Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81045320"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81045320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:44 -0800
X-CSE-ConnectionGUID: oKIqzUsHQDuN3ngkqegpYA==
X-CSE-MsgGUID: OJRjEWKkTsex7gmHidaw7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237987035"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:43 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/10] tests/kms_content_protection: Convert
 igt_pipe_is_free() to igt_crtc_is_free()
Date: Thu, 22 Jan 2026 14:59:27 +0200
Message-ID: <20260122125937.10807-2-ville.syrjala@linux.intel.com>
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

Change igt_pipe_is_free() to take the full igt_crtc_t, rename
the function to igt_crtc_is_free() to match. One more step in
hiding the notion of pipes from tests.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_content_protection.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index f1b98424db79..f324bc6de65f 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -391,12 +391,13 @@ static void test_cp_enable_with_retry(igt_output_t *output,
 
 }
 
-static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
+static bool igt_crtc_is_free(igt_crtc_t *crtc)
 {
+	igt_display_t *display = crtc->display;
 	int i;
 
 	for (i = 0; i < display->n_outputs; i++)
-		if (display->outputs[i].pending_pipe == pipe)
+		if (display->outputs[i].pending_pipe == crtc->pipe)
 			return false;
 
 	return true;
@@ -876,7 +877,9 @@ test_content_protection_mst(int content_type)
 
 		pipe_found = false;
 		for_each_pipe(display, pipe) {
-			if (igt_pipe_is_free(display, pipe) &&
+			igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+
+			if (igt_crtc_is_free(crtc) &&
 			    igt_pipe_connector_valid(pipe, output)) {
 				pipe_found = true;
 				break;
-- 
2.52.0

