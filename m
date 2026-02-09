Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E5ECA5FEB
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9440010E33B;
	Mon,  9 Feb 2026 08:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqDzeKQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF7110E339
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770625276; x=1802161276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/eOK5jAyCF+uIi4QYoW7iv99jhx1DPyB5KP9CNgU7MQ=;
 b=hqDzeKQCecmR49Or0GOCbmC2sxircEvIgc2YgJxIhvEdMVsw5FM70KhQ
 qsHUkBMS7Or2xMFK+FSKINkC16JGGMIUbCAsNnaFesiDtMmXfAkh0hrpS
 Zdjo5CHBv+4zISRCYpzteusZdzrKA6Z21NgZ6xSdT5rz4/y95GyvjAvVK
 7DM+qOMt2LJkRldAh3/9a1Z3k0Q+/N/IbyRm+U9Mj1HDiVCbTrCam8fJH
 QwsCNn7oSrVxRynJQFjRSlkRrk4ER7CvyjUetPdiixMT6A3wSSEJvgVC8
 eKB6F8qZImO5f9e1wIwMWJ7aq8J1Dw45Bw9VYGEhDohx/Kx2GqT2hZtSM Q==;
X-CSE-ConnectionGUID: A5QKUyeQR5GAbVs9+ni2VA==
X-CSE-MsgGUID: OtGTnWUfSuiDXlBQDztYyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71718509"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="71718509"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:21:16 -0800
X-CSE-ConnectionGUID: r/dxOklNS0WnH7D/FxoDrA==
X-CSE-MsgGUID: 4WMmxy3vSueDBbFOadKWEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="210824258"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 00:21:14 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 1/2] tests/kms_plane: Skip cursor plane for source
 clamping
Date: Mon,  9 Feb 2026 14:01:47 +0530
Message-Id: <20260209083148.1088533-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209083148.1088533-1-pranay.samala@intel.com>
References: <20260209083148.1088533-1-pranay.samala@intel.com>
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

Avoid running source clamping tests on cursor plane,
which do not support clamping.

v4: Add a short comment (Jeevan)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 2be10f032..22c45ae5e 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1090,12 +1090,6 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 	bool result = true;
 	bool found = false;
 
-	/*
-	 * No clamping test for cursor plane
-	 */
-	if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
-		igt_skip("Clamping is invalid for the cursor plane.\n");
-
 	for (int i = 0; i < plane->format_mod_count; i++) {
 		if (data->mod == plane->modifiers[i]) {
 			found = true;
@@ -1288,6 +1282,10 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
+		/* Cursor planes do not support cropping, skip generating subtest on cursor plane */
+		if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
 		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
 			test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
-- 
2.34.1

