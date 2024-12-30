Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88291E7718F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 18:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4481010E57F;
	Mon, 30 Dec 2024 18:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WI1ggnCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4203810E57B
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 18:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735585094; x=1767121094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zgDqTHzou0P4L88Tvck1drLgxP/rWz+Tls6MnmB/GgI=;
 b=WI1ggnCC4cr+jXUI9ytuBvHfcR+1XFY2i0ruVQZDlNS1V1pcxP7zVJuX
 CGIYTH+UOOz4SIOsDmOtP90reSsLLv18zkVZ2fnYMF1mgtrzReeJH8qE0
 QYFfjNzBiZMVO2mYf1uMwr160wKh/gKWljnGNesMt0Zp4E/lAatcd9L3Q
 I+JIRk3o1cFBHJqB7gQeYE2V0JmHTwor6idDyPyBrRo1JkBeJ+iwYZM1R
 PqfvB1L7RCnNDwco9l7YKjiftEieBcWCbSp8EOownAEtbhbAne+WnrvQD
 619brhiuS3ON+46YXiRWoOLy7ctaoYZ8WwBUwjh7/9dcTOb5JVIuxZ1nx w==;
X-CSE-ConnectionGUID: Ys2RN6O6TP6VECIq81rzEQ==
X-CSE-MsgGUID: 5wNaYu+DTmm1VHXDz0flmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39803541"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="39803541"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:14 -0800
X-CSE-ConnectionGUID: Fnw6DYlmS0OBoElYwE950w==
X-CSE-MsgGUID: Yn7mmoxISRyWCcEsUM3goA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="100728914"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:12 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/6] tests/intel/kms_cdclk: Modify highest resolution
 restriction
Date: Tue, 31 Dec 2024 00:33:11 +0530
Message-Id: <20241230190315.48821-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241230190315.48821-1-swati2.sharma@intel.com>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
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

Currently, highres is considered as mode equal to 4K. Modify this
restriction to consider highres as >= 4K.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index f1a019eb7..e78d22e1d 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -165,8 +165,8 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 
 		igt_output_set_pipe(output, pipe);
 		mode = *igt_output_get_highres_mode(output);
-		igt_require_f(mode.hdisplay == HDISPLAY_4K && mode.vdisplay == VDISPLAY_4K &&
-			      mode.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
+		igt_require_f(mode.hdisplay >= HDISPLAY_4K && mode.vdisplay >= VDISPLAY_4K &&
+			      mode.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
 			      igt_output_name(output));
 
 		igt_output_override_mode(output, &mode);
@@ -219,8 +219,8 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	mode = igt_output_get_mode(output);
 	mode_lo = *get_lowres_mode(output);
 	mode_hi = *igt_output_get_highres_mode(output);
-	igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && mode_hi.vdisplay == VDISPLAY_4K &&
-		      mode_hi.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
+	igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
+		      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
 		      igt_output_name(output));
 
 	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
@@ -285,8 +285,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		height = max(height, mode->vdisplay);
 
 		mode_hi = *igt_output_get_highres_mode(output);
-		igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && mode_hi.vdisplay == VDISPLAY_4K &&
-			      mode_hi.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
+		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
+			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
 			      igt_output_name(output));
 
 		igt_output_set_pipe(output, i);
@@ -333,8 +333,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		igt_assert(mode);
 
 		mode_hi = *igt_output_get_highres_mode(output);
-		igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && mode_hi.vdisplay == VDISPLAY_4K &&
-			      mode_hi.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
+		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
+			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
 			      igt_output_name(output));
 
 		igt_output_override_mode(output, &mode_hi);
-- 
2.25.1

