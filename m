Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645D2108B901
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F9D10EAB0;
	Fri, 20 Mar 2026 11:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXcNw5Oc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE5810EAB0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774005931; x=1805541931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vpxepeVl2PKs3aV3rTP3lPf/AlUubXz0groqYD5Rk0o=;
 b=XXcNw5OcIoBkL3nLyFfEsxiZzANP7L4LCj3XUnodKUzbzGJuDaPWpObm
 7uP8q+3vYWpNSrr5JjZAAq3MxTKwpwDZIi0K0XGSBqqc9lvVtK6EinzjW
 weqS6rRp2xkdJkHCRTVJqjuyUmEw+HgNP2P2ccfiLTxEdBq6KBKwyFCAB
 a2173mT7OE0t3PjXAd61AbvxbdufYE4+NMFpjRmVZU84Tqe5W7NMbZlTB
 XGnQX1NNXqg4v4P7dMsNEDseRSuRlBoWGjOq+9JmbaC5D/eDRnaJS+92M
 BEXnxwHpW60ICaeYx/LXDcnhRfWC3aNc9nCHXTTn6n46/MK9uqUJHDQbb g==;
X-CSE-ConnectionGUID: aZJHkonHTymp4dUROjxYyQ==
X-CSE-MsgGUID: nR5Jdz8GQdix7AEKNkUlng==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="97705954"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="97705954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:12 -0700
X-CSE-ConnectionGUID: Zd65QbT0R+uwEbzSO3f52Q==
X-CSE-MsgGUID: U3H7N7XuQ6iUAEHQdj/uDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253759110"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t 1/7] tests/amdgpu/amd_plane:
 s/crtc->pipe/crtc->crtc_index/
Date: Fri, 20 Mar 2026 13:24:51 +0200
Message-ID: <16b7fc1d6322d827d5539d06d80ad5dd503fc9c7.1774005763.git.jani.nikula@intel.com>
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

For amdpgu, crtc->crtc_index == crtc->pipe always. Use the generic and
GPU agnostic crtc->crtc_index instead of the vendor specific crtc->pipe.

This allows us to better highlight the places where crtc->pipe is
actually needed and valid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Hung <alex.hung@amd.com>

Review tip: apply and use this to ignore the whitespace changes:

git show --color-words --word-diff-regex="\w+"
---
 tests/amdgpu/amd_plane.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 6831fc43e4a6..da0dc7822575 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -155,20 +155,17 @@ static void test_init(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		data->crtc[crtc->pipe] = crtc;
-		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
-								    DRM_PLANE_TYPE_PRIMARY);
-		data->overlay[crtc->pipe] = igt_crtc_get_plane_type_index(crtc,
-									  DRM_PLANE_TYPE_OVERLAY,
-									  0);
-		data->overlay2[crtc->pipe] = igt_crtc_get_plane_type_index(crtc,
-									   DRM_PLANE_TYPE_OVERLAY,
-									   1);
-		data->cursor[crtc->pipe] = igt_crtc_get_plane_type(crtc,
-								   DRM_PLANE_TYPE_CURSOR);
-		data->pipe_crc[crtc->pipe] =
-			igt_crtc_crc_new(crtc,
-					 IGT_PIPE_CRC_SOURCE_AUTO);
+		data->crtc[crtc->crtc_index] = crtc;
+		data->primary[crtc->crtc_index] =
+			igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		data->overlay[crtc->crtc_index] =
+			igt_crtc_get_plane_type_index(crtc, DRM_PLANE_TYPE_OVERLAY, 0);
+		data->overlay2[crtc->crtc_index] =
+			igt_crtc_get_plane_type_index(crtc, DRM_PLANE_TYPE_OVERLAY, 1);
+		data->cursor[crtc->crtc_index] =
+			igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_CURSOR);
+		data->pipe_crc[crtc->crtc_index] =
+			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0, n = 0; i < display->n_outputs && n < max_pipes; ++i) {
@@ -199,7 +196,7 @@ static void test_fini(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
+		igt_pipe_crc_free(data->pipe_crc[crtc->crtc_index]);
 	}
 
 	igt_display_reset(display);
-- 
2.47.3

