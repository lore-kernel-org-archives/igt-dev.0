Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FB0FD374E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591DA10E10F;
	Wed, 25 Feb 2026 12:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKtnHOux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AC410E10F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023876; x=1803559876;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hb/qL4wMWWl1bRFMRQy2vsSkuQ2g4obWta+joTgFiCA=;
 b=RKtnHOuxoniKSGZZ6/n3lZIXUNyTSjuL7PBTncIlpig9Pcpury6Y7pyx
 EHIZgrx2rEQaBxHQd3fo+cWPwzofIbPNV5pNbN/28Eh86UqV7nIqXgrPz
 IWXs6TSTg1il2Y11T99EIH0SZ+v2IsZOBjFr45TZo9nzZdvaxKJnqMdzx
 NfM9jDMC5++FXK1BpYKkctKXck5vJvo5tcRPsYtznGh3bPkc1H7e5gAA2
 M+/GrRZXgyhUzYE/co7JrEOiBTm03YXvu7igYJkpD5+epZDxpQG/4QHbI
 g1IExcaqOVkmmssM5N/6wwZztOQPj7OKC47itw2eL1D+16cuDXgRwniN1 w==;
X-CSE-ConnectionGUID: 3tZVaX5TRPuzHKWaXG9TKw==
X-CSE-MsgGUID: u74eZWg3RWWneTs/hsGzag==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73102098"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73102098"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:15 -0800
X-CSE-ConnectionGUID: +BYcZh8tS1a3OP1Sz590jw==
X-CSE-MsgGUID: IhSaYkAOTwq5XM2MtWAXbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215451438"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:14 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/19] tests/kms_plane_multiple: Clean up n_planes stuff
Date: Wed, 25 Feb 2026 14:50:50 +0200
Message-ID: <20260225125108.31119-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

kms_plane_multiple currently assumes that every CRTC has as many
planes as the first CRTC. That is definitely not the case for some
Intel hardware, so stop assuming it. Instead make sure the number
of planes is simply valid for both CRTCs taking part in the test.

As a bonus we get rid of an annoying igt_crtc_for_pipe() call.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane_multiple.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 11029eb7f634..e1b5e8bce47f 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -476,11 +476,13 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 					  igt_output_t *output1, igt_output_t *output2,
 					  uint64_t modifier)
 {
-	igt_display_t *display = &data->display;
 	color_t blue  = { 0.0f, 0.0f, 1.0f };
 	igt_crc_t crc1, crc2;
-	int n_planes = opt.all_planes ?
-		       igt_crtc_for_pipe(display, 0)->n_planes : DEFAULT_N_PLANES;
+	int n_planes;
+
+	n_planes = min(crtc1->n_planes, crtc2->n_planes);
+	if (!opt.all_planes)
+		n_planes = min(n_planes, DEFAULT_N_PLANES);
 
 	/*
 	 * Note: We could use the dynamic way of calculating the maximum planes here
-- 
2.52.0

