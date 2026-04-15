Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11852F41986
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 10:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9C310E6BB;
	Wed, 15 Apr 2026 10:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqO1Cxt5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2D610E6BB
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776250196; x=1807786196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/xxlschJn4w/p9pF8VHYZdhpPbRXUAzHZQ6ERzNZ89U=;
 b=YqO1Cxt5F2iwNO9F9sYeNNBLI9wL0BM+qh3966OpZqMTBAhskKvGVzsA
 aw170n/8dHtKIKBTLsCkFAas0Ns9ibeyqnpT6fG58zvf4DYGrUiDlSHF1
 5LTRgf3Yw2QjUgUKyVBpLuU7rpUOaPmx/FNYcbioDAgGVbqFq5RD2Asc4
 uXJBgtID0n1ew2p8MkkvecC4F0TjtEGBaZJA9rIzmNX8tLG31ZprjWnmp
 fQVy8idB345cpuoJJUwm4acgxuBFmaubxduhPy8aJc01LghuR0FBToNEh
 yvlbhCSqocwOhPb1SvQh6G2fKKry0bzM52QyYy/af3qx60hW/LPdMq5gw w==;
X-CSE-ConnectionGUID: wL8xCKjMT4+EB3v2E1pVyg==
X-CSE-MsgGUID: yk9Ze+9MSQepMKpx6eW69A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81103825"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="81103825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 03:49:55 -0700
X-CSE-ConnectionGUID: +4IN+83gSIqiKOxscFIBkg==
X-CSE-MsgGUID: dv5j955zQoaBcBsiAFtOXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235330009"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 03:49:54 -0700
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Sumit Kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_properties: Add skip on headless machines
Date: Wed, 15 Apr 2026 16:18:06 +0530
Message-ID: <20260415104806.472042-1-sumit.kishore@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: Sumit Kishore <sumit.kishore@intel.com>

Skip the sub-tests on headless display systems.

v2: Use existing library function, instead of
    defining new (karthik)
v3: Add headless display check in,
    colorop_properties function (Pranay)
v4: Update the commit message (Pranay)

Signed-off-by: Sumit Kishore <sumit.kishore@intel.com>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_properties.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index f735839da..5164277b3 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -341,6 +341,8 @@ static void colorop_properties(igt_display_t *display, bool atomic)
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 
+	igt_display_require_output(display);
+
 	/* colorops are only available with atomic */
 	igt_skip_on(!display->is_atomic);
 
@@ -377,6 +379,8 @@ static void plane_properties(igt_display_t *display, bool atomic)
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 
+	igt_display_require_output(display);
+
 	for_each_crtc_with_single_output(display, crtc, output) {
 		igt_display_reset(display);
 
@@ -400,6 +404,8 @@ static void crtc_properties(igt_display_t *display, bool atomic)
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 
+	igt_display_require_output(display);
+
 	for_each_crtc_with_single_output(display, crtc, output) {
 		igt_display_reset(display);
 
-- 
2.43.0

