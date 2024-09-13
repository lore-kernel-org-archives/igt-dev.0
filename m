Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512A9FA372B
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 08:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E821A10ECC2;
	Fri, 13 Sep 2024 08:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlvF8QSO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0C910ECC2
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 08:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726216454; x=1757752454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dWD9ft6TZh9w3kRje70TMEpmeODVarG9TVVOG7iX+ag=;
 b=WlvF8QSOtxzifSSwrWiCn91Pil0daoWZG4StYSc/4l7SLFqy9/MwuGJc
 uWtft2FUWsGh6nUPWdhBj5237Lm4wmQl46AhmW6rGK0LrS17swLxCMMYw
 YdgqTy9d2kAG/GiHi4mV7LUKHOTG0KWEwOT27qQcmB/2sfGnDL5geQBeW
 Y/5tLr/h0a04x3glwISep1kPbln/vSL6ylYqDSHatesKu14ta1emL119A
 5+3hazYt0xC6N9nFxggOPmnefghq2Hzg27UTuRVosG2FCff7zwelaoDFg
 CHw8ySdzOw5PYkH2Qwc3gZ4/0gj+AxLOom6M9vhIeaCsugAILvIgmbT4E w==;
X-CSE-ConnectionGUID: 7wy86UMCQMqwYpdfSHz8Vw==
X-CSE-MsgGUID: 9Lg/AbjNQ7C6uQbshS8mOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36486279"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="36486279"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 01:34:14 -0700
X-CSE-ConnectionGUID: RjEyYhwTRHifMgnfAoJgiQ==
X-CSE-MsgGUID: 3wwwl+/RQreDwaXTpX/lyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="72787946"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 01:34:12 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t] tests/kms_display_modes: Fix the plane setup in
 extended-mode-basic
Date: Fri, 13 Sep 2024 13:54:33 +0530
Message-ID: <20240913082433.738422-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The test forgets to set the output size of the planes. The
default plane output size will be taken from the fb dimensions
which means we end up upscaling the planes, which may not work
on all hardware.

Set the planes' output size to match the input size to avoid this.
The frambuffer was specifically created wide enough to cover both
outputs with 1:1 scaling.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9841
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com> (Re-float)
---
 tests/kms_display_modes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 1f0f811c8..f1d8ab03d 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -180,10 +180,12 @@ static void run_extendedmode_basic(data_t *data,
 	igt_plane_set_fb(plane[0], &fb);
 	igt_fb_set_position(&fb, plane[0], 0, 0);
 	igt_fb_set_size(&fb, plane[0], mode[0]->hdisplay, mode[0]->vdisplay);
+	igt_plane_set_size(plane[0], mode[0]->hdisplay, mode[0]->vdisplay);
 
 	igt_plane_set_fb(plane[1], &fb);
 	igt_fb_set_position(&fb, plane[1], mode[0]->hdisplay, 0);
 	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
+	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-- 
2.43.0

