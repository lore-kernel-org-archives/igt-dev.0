Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275DED35179
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC67410ED26;
	Wed,  1 Apr 2026 11:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTatp+yM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B2E10EF8E
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043855; x=1806579855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zQ+sOsuRlcLXbHwjR84m4aAfyP55hnEV7NJVFM6FkHM=;
 b=bTatp+yMtEC4yOSr6IBx29PpKyDmhlI/j1wvMlzh40v0j07NJYsPoLXy
 xw5jzGdh3iTVNTA7C6C/ou/qvti59aKNxtpT7cV9Y42ug9IGi5JWV81ZV
 o9j53gJ63ROHiYxqHbQAgadkJfFN37w0hs0egqmQdlTSBijViB3U1JHM+
 K6fRyJ6GsuIESCmmxdYovpd3S5C+k35sqc4PVkVuFvOWyw+hEQ9y/cR5e
 1GyHSYVkVXzk+4XaGPEN9/61JOxJRzMi/m06lfZgouWKDea69A4tfKQE5
 v2A420Q3G/3ayoZNa8IU/0ey14KXdo/tpxsJiPZxGVD4yC+BtQ5uq3wSk w==;
X-CSE-ConnectionGUID: e1GvVCcASJCGdfhJlDfQgA==
X-CSE-MsgGUID: 1V4tXbraQ1aOV+8PXmhzLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79964433"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79964433"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:44:15 -0700
X-CSE-ConnectionGUID: YdrjcYbpRK64rCNoikib6Q==
X-CSE-MsgGUID: 44gM7VqJSue0fm8MTRyUEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223365675"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:44:13 -0700
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Sumit Kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_properties: Add skip on headless machines
Date: Wed,  1 Apr 2026 17:12:44 +0530
Message-ID: <20260401114244.410255-1-sumit.kishore@intel.com>
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

Print debug messages for sub-tests which are expected to
skip on headless display systems.

v2: Use existing library function, instead of
    defining new (karthik)
v3: Add headless display check in,
    colorop_properties function (Pranay)

Signed-off-by: Sumit Kishore <sumit.kishore@intel.com>
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

