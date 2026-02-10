Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66250EF0702
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 04:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6F510E4B4;
	Tue, 10 Feb 2026 04:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmINp9vO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2BF10E4B3
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 04:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770699468; x=1802235468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s/3diX1xiwPLky6K5GM0Lz3aRKAexD0R9CgaVAwfBPM=;
 b=kmINp9vOdEv6GMgLrk71r8kv2HuuVb+TE16EDxvlvVjnDVq6WHm2q8bb
 r/Wv+N/BrPMgAVUESZXY4SiZjapFL08JxB9ScOd2nUvntdoDzgaIjvI+C
 suLZMn1sf6f7xdoHnGVH7vXxgwQSg6uD9h7DbGVAedWBrryenHYX6kgGu
 AX+lrj4qT2Ac5rfS2hvBbdhIwKZmHV+IM9HJdkMOxLY0QYhovpj2Wyy6g
 wR2HYCpQkowMqnCx4dvpBuhZwNCdO38Qkcavr9QfXavbwNfDhBHYEUMtN
 Me+k3femy/bZHtrtvNoZJ3k9ZsTBdS01IPqxobB57JOYUp+4mna6ypwnQ A==;
X-CSE-ConnectionGUID: utno0Dk3RCCKXMi6RvZOHg==
X-CSE-MsgGUID: WS2t53tjSjObfk0VxJed2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82925833"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82925833"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:57:48 -0800
X-CSE-ConnectionGUID: cDWj8pV1Q56xpCmLvXNAgA==
X-CSE-MsgGUID: D4r0lMDeQHaFItAoakV+YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211346951"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2026 20:57:46 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v5 1/2] tests/kms_plane: Skip cursor plane for source
 clamping
Date: Tue, 10 Feb 2026 10:38:21 +0530
Message-Id: <20260210050822.1095409-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210050822.1095409-1-pranay.samala@intel.com>
References: <20260210050822.1095409-1-pranay.samala@intel.com>
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

v2: Add a short comment (Jeevan)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
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

