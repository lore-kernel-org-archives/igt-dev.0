Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806B6E77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 18:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CEC10E581;
	Mon, 30 Dec 2024 18:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaorPtlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649EB10E580
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 18:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735585099; x=1767121099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D8sV6g7v4Ctq2E1W8YGSJrwsWqGN/QryQR6ITu7PlWg=;
 b=GaorPtlwRTlX7tXRTC4SxCuy3mHI7phs+T9K5KiiZ4ERNN9VykXFI7/b
 9G1gGDvBDrkW4thi28Yyn5VGvFlNymH4L3KnC4ee2JxVzvbXVotHztsu+
 QN18bHMzpMaW6V9hgDOatHHBT0kIZRYVOSz1j9TPfrBYyiSiSRduPxwwB
 +L8DMnr5r+qixgOemi3TP21pVX2nNa7r3WmK8XOXXWqJaCvaL3gIw7DgS
 f8efB2XwYUJh3hT/HrgjFLAifAyfb1Z4yhJ1b5yhus36cW4xqnLl94S7I
 GAiDpkbM42dwJGJ50lpehPuzaUq5j2fLqUKm1UlxJUOPZFp7I9ykW/ywk g==;
X-CSE-ConnectionGUID: uvbiO/CqQkyaUMvh+mmaMg==
X-CSE-MsgGUID: SCUSZGqaS+2SB4L+4wupFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39803544"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="39803544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:19 -0800
X-CSE-ConnectionGUID: zNpIqOZlRaqBMyGD2zN8hw==
X-CSE-MsgGUID: v64y8droQFifHUQHBj6AWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="100728928"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:17 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/kms_cdclk.c: Modify skip condition
Date: Tue, 31 Dec 2024 00:33:14 +0530
Message-Id: <20241230190315.48821-6-swati2.sharma@intel.com>
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

Add vrefresh also as a parameter to check if highest and
lowest refresh rates are identical.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 67efdaa3f..fcbfa3f37 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -223,7 +223,9 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 		      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
 		      igt_output_name(output));
 
-	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
+	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay &&
+		      mode_hi.vdisplay == mode_lo.vdisplay &&
+		      mode_hi.vrefresh == mode_lo.vrefresh,
 		      "Highest and lowest mode resolutions are same; no transition\n");
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -302,7 +304,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		lowres_mode = *get_lowres_mode(output);
 
 		if (highres_mode.hdisplay == lowres_mode.hdisplay &&
-		    highres_mode.vdisplay == lowres_mode.vdisplay) {
+		    highres_mode.vdisplay == lowres_mode.vdisplay &&
+		    highres_mode.vrefresh == lowres_mode.vrefresh) {
 			igt_info("Highest and lowest mode resolutions are same on output %s; no transition will occur, skipping\n",
 				  igt_output_name(output));
 			continue;
-- 
2.25.1

