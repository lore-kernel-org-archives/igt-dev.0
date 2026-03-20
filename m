Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B341E108B8F7
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6828410EAD1;
	Fri, 20 Mar 2026 11:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRoF1O7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B3F10EAD1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774005946; x=1805541946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cKzsAKNzeJS6fcUDjeI4u2KY+SgJYA/9/6dk7cd1EbI=;
 b=NRoF1O7+I4XR4Kl8GgfOF1D6OsooFwsRzdCcRUMVUxxnBS5l31RXjlmr
 O+Rjt6oM+YoIXFx3UrvBbwdPsa/YJqKb/6nnWo17UjJ1GlUs5TzjST2QI
 DQ5k47dPQ4GAJjQiPxsihoNqylj9in6KhuZpN5xi44AEsrL++yNFONKA4
 J1i1wB4gZHyW/csVgGcK/4sX80Y35EGxyjiZ4D9HOCJ0In7BH1zsTneVd
 qF/1dAK5RwKeInaREim5k9THp+DFkuF0Ow2Mab5d8sbLFkuXVh2lXitWB
 nRsqUQ8nII8URVj9pwiUEuNTzxRi1hJtILYIeauJk1oxXcg4BUrR22ruh A==;
X-CSE-ConnectionGUID: Jqr8q39uRUWlMJRqDzjg7A==
X-CSE-MsgGUID: ONAnW5A/QLWas5Q4N19T0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86451032"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="86451032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:46 -0700
X-CSE-ConnectionGUID: +AJy6qr+QXuQ9H+u/dLkXw==
X-CSE-MsgGUID: 6KIKqSGfQUavSzLW5DZubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223286922"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 7/7] tests/kms_atomic_transition:
 s/crtc->pipe/crtc->crtc_index/
Date: Fri, 20 Mar 2026 13:24:57 +0200
Message-ID: <0a71bc92f1e6683826840ea4b9edc31fe4a46dab.1774005763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774005763.git.jani.nikula@intel.com>
References: <cover.1774005763.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

This is a generic test and doesn't actually rely on the pipe per se. Use
the generic and GPU agnostic crtc->crtc_index instead of the vendor
specific crtc->pipe.

This allows us to better highlight the places where crtc->pipe is
actually needed and valid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Review tip: apply and use this to ignore the whitespace changes:

git show --color-words --word-diff-regex="\w+"
---
 tests/kms_atomic_transition.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 1e0553cb1b2b..5ae8da3c0cb4 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -873,16 +873,16 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 							     DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
-		if (!(mask & (1 << crtc->pipe))) {
+		if (!(mask & (1 << crtc->crtc_index))) {
 			if (igt_crtc_is_prop_changed(crtc, IGT_CRTC_ACTIVE)) {
-				event_mask |= 1 << crtc->pipe;
+				event_mask |= 1 << crtc->crtc_index;
 				igt_plane_set_fb(plane, NULL);
 			}
 
 			continue;
 		}
 
-		event_mask |= 1 << crtc->pipe;
+		event_mask |= 1 << crtc->crtc_index;
 
 		for_each_valid_output_on_crtc(&data->display,
 					      crtc,
@@ -919,7 +919,7 @@ static void refresh_primaries(data_t  *data, int mask)
 	igt_plane_t *plane;
 
 	for_each_crtc(&data->display, crtc) {
-		if (!((1 << crtc->pipe) & mask))
+		if (!((1 << crtc->crtc_index) & mask))
 			continue;
 
 		for_each_plane_on_crtc(crtc,
@@ -977,8 +977,8 @@ retry:
 		j += 1;
 
 		if (is_intel_device(data->drm_fd))
-			data->pipe_crcs[crtc->pipe] = igt_crtc_crc_new(crtc,
-							      IGT_PIPE_CRC_SOURCE_AUTO);
+			data->pipe_crcs[crtc->crtc_index] =
+				igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
 		for_each_valid_output_on_crtc(&data->display,
 					      crtc,
@@ -1096,7 +1096,7 @@ retry:
 
 	if (is_intel_device(data->drm_fd)) {
 		for_each_crtc(&data->display, crtc)
-			igt_pipe_crc_free(data->pipe_crcs[crtc->pipe]);
+			igt_pipe_crc_free(data->pipe_crcs[crtc->crtc_index]);
 	}
 
 	igt_remove_fb(data->drm_fd, &data->fbs[0]);
@@ -1117,12 +1117,12 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 					      output) {
 			int i;
 
-			for (i = crtc->pipe - 1; i >= 0; i--)
+			for (i = crtc->crtc_index - 1; i >= 0; i--)
 				if (outputs[i] == output)
 					break;
 
 			if (i < 0) {
-				outputs[crtc->pipe] = output;
+				outputs[crtc->crtc_index] = output;
 				num_outputs++;
 				break;
 			}
-- 
2.47.3

