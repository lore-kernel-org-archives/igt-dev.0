Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F73F44853
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 12:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AE010E130;
	Fri, 10 Apr 2026 12:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBvsV2Ci";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F91810E130
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775824381; x=1807360381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Hf7tiyhwngSb2cba0e+2yR2H0lGVOIrMIcj/HyepHg=;
 b=dBvsV2Cij7JC8I7QAieRBvCNKO3zdfn5dxcby+wO9cCAvkQNgVgPsLFc
 GwQtIHO7H8Ur8cWJ18S7TZARJucb5sp/Pklp6ZfpAPDoDjldI8qPgVCYr
 sTWEmvT95vRJZBbtcOQ4BQdSLpUq2BxrYJ4AUhaBSShRKmlNHOY+tZGVJ
 HlF1gkZHlJYBrUI+/Y6mUzwh5BolpLn4TzZh8cEXm2a8chsV5ogcMxG2L
 vVJ6qpxhVJPMUbaL9Pc8z0WWqQnCzgz4JmQ+EseeeYgM5KdqTZ+UQPR0/
 HUciYIgGhMl9Sls4QWD/dvhUb8kVdZlOWVlRGuirTIlRPquLjaq8h6uVN A==;
X-CSE-ConnectionGUID: yjxYdBrwQnuYPDcxBJ0Lrw==
X-CSE-MsgGUID: rFXwJLYUSVe0eS5uDSe2XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76720405"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76720405"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 05:33:01 -0700
X-CSE-ConnectionGUID: l5XNzIYqTSajCzfPhh4hqw==
X-CSE-MsgGUID: MymkWDbOSJCQYSj4iuckMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="259539708"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 05:32:59 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Skip CDCLK bump validation when
 dotclocks match
Date: Fri, 10 Apr 2026 18:11:43 +0530
Message-Id: <20260410124143.1015272-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When the highest and lowest resolution modes share the same dotclock,
no CDCLK bump is expected.

Skip CDCLK bump validation when the highres and lowres modes have the
same dotclock, replacing the previous resolution-based is_equal() check
with a dotclock comparison via has_same_dotclock().

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 662bdbe43..48bd7276f 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -84,11 +84,9 @@ static bool is_4k(drmModeModeInfo mode)
 	        mode.vrefresh >= VREFRESH);
 }
 
-static bool is_equal(drmModeModeInfo mode_hi, drmModeModeInfo mode_lo)
+static bool has_same_dotclock(drmModeModeInfo mode_hi, drmModeModeInfo mode_lo)
 {
-	return (mode_hi.hdisplay == mode_lo.hdisplay &&
-		mode_hi.vdisplay == mode_lo.vdisplay &&
-		mode_hi.vrefresh == mode_lo.vrefresh);
+	return mode_hi.clock == mode_lo.clock;
 }
 
 static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
@@ -204,7 +202,7 @@ static void test_mode_transition(data_t *data, igt_crtc_t *crtc,
 	igt_require_f(is_4k(mode_hi), "Mode >= 4K not found on output %s\n",
 	              igt_output_name(output));
 
-	igt_skip_on_f(is_equal(mode_hi, mode_lo), "Highest and lowest mode resolutions are same; no transition\n");
+	igt_skip_on_f(has_same_dotclock(mode_hi, mode_lo), "Highest and lowest modes have same dotclock; no CDCLK bump expected\n");
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -278,8 +276,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 
 		mode_lowres[count] = *get_lowres_mode(output);
 
-		if (is_equal(mode_highres[count], mode_lowres[count])) {
-			igt_info("Highest and lowest mode resolutions are same on output %s; no transition will occur, skipping\n",
+		if (has_same_dotclock(mode_highres[count], mode_lowres[count])) {
+			igt_info("Highest and lowest modes have same dotclock on output %s; no CDCLK bump expected, skipping\n",
 				  igt_output_name(output));
 			continue;
 		}
-- 
2.25.1

