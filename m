Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D4EC5DF70
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4895210E866;
	Sat, 21 Feb 2026 03:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAaNYAPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E13110E866
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644014; x=1803180014;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pKu0ADtJrQtEhFZdNfMOAeefL4pASh9JZlGpbm0oc2A=;
 b=DAaNYAPrLVByf9BlSaAhKMODZtr1WmcoLQnSkgJQiwM9mR/ko/0MiG9M
 WXoxJSPxFzJ/aTdR+KuGkxdHTYqIdY0G+OS+7x0ie0Z2e/mWKToldry6/
 qJZDBNaACM+Mc/sNhPNfu+OZjCLyrUMmMvwknMgZ8/T/Pl66ArtcajblL
 Fjo+GsLQgFOaYena5ujyB9l5OOBKecmpXthkegNu0uRw92bs7Ie5dbktA
 UEsX4Q/acqJfWgPycAXHktR6VqScbuczgig90Wn7EPApQ/cJIjGIx3cd9
 x7aaQ+R/G+MN6NUYHQ6dpUV3WPOMAke7BNRQN602F6Ryua5CJcrsSCYCs Q==;
X-CSE-ConnectionGUID: 9TdLkMtrQaWfEuXgBBo3Kg==
X-CSE-MsgGUID: AqiPjr0HT52Jdbxx7RYkUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="75345746"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="75345746"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:14 -0800
X-CSE-ConnectionGUID: iYGHh4DoTuqCilgPuVA8dg==
X-CSE-MsgGUID: NMxCH38PRfGD7S0wzhosBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252720222"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:13 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 02/23] tests/intel/kms_psr2_sf: Don't pass zero
 initialized 'data.pipe' to intel_fbc_supported_on_chipset()
Date: Sat, 21 Feb 2026 05:19:41 +0200
Message-ID: <20260221032003.30936-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
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

Instead of alwas passing the zero initalized data.pipe
(== PIPE_A) to intel_fbc_supported_on_chipset() iterate
over all the CRTCs and properly check if any of them
supports FBC.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_psr2_sf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 31db6760c73e..f79d9b0b751e 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1171,7 +1171,7 @@ int igt_main()
 		"pr-"
 	};
 	int psr_status[] = {PSR_MODE_2, PR_MODE_SEL_FETCH};
-	bool fbc_chipset_support;
+	bool fbc_chipset_support = true;
 	int disp_ver;
 
 	igt_fixture() {
@@ -1185,7 +1185,6 @@ int igt_main()
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		disp_ver = intel_display_ver(data.devid);
-		fbc_chipset_support = intel_fbc_supported_on_chipset(data.drm_fd, data.pipe);
 
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.primary_format = DRM_FORMAT_XRGB8888;
@@ -1199,6 +1198,10 @@ int igt_main()
 		for_each_crtc_with_valid_output(&data.display, crtc,
 						data.output) {
 			data.pipe = crtc->pipe;
+
+			if (!intel_fbc_supported_on_chipset(data.drm_fd, data.pipe))
+				fbc_chipset_support = false;
+
 			for (i = 0; i < ARRAY_SIZE(psr_status); i++) {
 				data.psr_mode = psr_status[i];
 				output_supports_pr_psr2_sel_fetch = pipe_output_combo_valid(&data);
-- 
2.52.0

