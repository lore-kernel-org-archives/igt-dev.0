Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF937EC1EB6
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDBF10E8A0;
	Thu,  5 Feb 2026 13:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nI2hbyIT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6163010E89E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298242; x=1801834242;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qIyW3BEZFzaqb/mVaohmepgB5Z+9b1stz1A6FlT9qOE=;
 b=nI2hbyITg9vrewK+EORMvefLMUxSzgUSiRwEBbsx51wTyCux7Q/dNK22
 uyNfvnMCur0Dw7rljB55v6k/Mzk7lqbLG0UBsg68HakMygizuG37EBGOS
 E5w8mYWPM/aEHzJlIy78c6LTZe+SAGp1n8YvTNZ28KmGx7+ck46QJHYXL
 XhbGZLrcX4SRE80mvKqgA0cW3HYqWSOEksIg3gMwIp82yccFTX9LyLJ8c
 ohKSL7HKYjEy+hsQQDYaPv6UOwMyvDRUFS7IXSz5kT+fRDk1mD4M0ZFmh
 uiDnCN4mag5W3hDTkWRr1A/lGKiPMDmhZFjITUYXR8DQw2Bh1zJNgUd7G A==;
X-CSE-ConnectionGUID: 7IDF2NOKTE2jlI2d+d2HvQ==
X-CSE-MsgGUID: /wevblNkRtObUiLB4qDVXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70693525"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70693525"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:41 -0800
X-CSE-ConnectionGUID: 9ImL7xwHR/apbQzKKVhA9A==
X-CSE-MsgGUID: dcBl+1YYTZS5pMylxF/mMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215499268"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:39 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/12] tests/kms: Clean up some for_each_pipe() local
 'crtc' variables
Date: Thu,  5 Feb 2026 15:30:12 +0200
Message-ID: <20260205133019.9161-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
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

Move the 'crtc = igt_crtc_for_pipe()' to the start of the
for_each_pipe() loop in order to simplify following
for_each_pipe()->for_each_crtc() conversions.

Done with cocci:
 #include "scripts/iterators.cocci"

@@
iterator name for_each_pipe;
typedef igt_crtc_t;
identifier PIPE, CRTC;
expression DISPLAY;
@@
for_each_pipe(DISPLAY, PIPE)
{
+ igt_crtc_t *CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
...
- igt_crtc_t *CRTC;
...
- CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
...
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_multidisplay_modeset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 6ece43f95adc..000053933e8c 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -152,15 +152,14 @@ static void test_init(struct data_t *data)
 		data->pipe_crc_dprx[i] = NULL;
 
 	for_each_pipe(display, i) {
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
 		igt_output_t *output;
-		igt_crtc_t *crtc;
 
 		/* For each valid pipe, get one connected display.
 		 * This will let displays connected to MST hub be
 		 * tested
 		 */
 		output = igt_get_single_output_for_pipe(display, i);
-		crtc = igt_crtc_for_pipe(display, i);
 		data->primary[i] = igt_crtc_get_plane_type(crtc,
 							   DRM_PLANE_TYPE_PRIMARY);
 		data->output[i] = output;
-- 
2.52.0

