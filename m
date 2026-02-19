Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E523E9A04C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 07:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F8510E680;
	Thu, 19 Feb 2026 07:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kW3IkILU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F0910E692
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771486996; x=1803022996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6xFxWNr/3H+FKLnSUH14pYzhm1ugiTOIJDLHNwPw5Bo=;
 b=kW3IkILUvJcRhpLe480mCvZ0qMTWmHLw7xvQNKNg4kqq9K0JaVwkgSls
 9iZeRUfNZvGWsbcSLoL5zURn8dAfrt/pOmnOn3nABIB3NmAwq3//7tt0Y
 gWGzJYKY8XpE1GqQr4407GbExbCW7wbFwGxWw3IPqqbohBNW4brQLGbGG
 LWGo3juOSbHtL8nqRVbJO8GwWPRJNxsoO8QHaxlWiurb5UhOhbfB2sDdq
 5h7n+fpzdL/se1S/IiwrymugjjOBlonWMbsmnN0YuxEsLYnMGg3u/7Z11
 48kQqWNrCjJYeMNrIboeohXQgqv6rIW3s5WqbMkpt0GGbMdj8041AUUdh w==;
X-CSE-ConnectionGUID: Jx3RhU0HSUqqY5c/xf55hQ==
X-CSE-MsgGUID: bcPar5L3QeuHu1ZHtQzrKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72469631"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72469631"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 23:43:15 -0800
X-CSE-ConnectionGUID: ISaS7zKtSiGm/me0CduyxA==
X-CSE-MsgGUID: YU54cXHFT7yD64O1TSUGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213528620"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 23:43:14 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/intel/kms_pipe_stress: Clamp the source
 size to the FB bounds
Date: Thu, 19 Feb 2026 13:33:40 +0530
Message-ID: <20260219080349.139498-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219080349.139498-1-sowmiya.s@intel.com>
References: <20260219080349.139498-1-sowmiya.s@intel.com>
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

Use min_t(int, ...) for source size calculations
to start scaling from a size guaranteed to fit in the FB.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_pipe_stress.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 3caef8e18..e3f6de2c4 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -456,11 +456,14 @@ static int pipe_stress(struct data *data, igt_output_t *output,
 			plane_width = cursor_width;
 			plane_height = cursor_height;
 		} else {
-			universal_plane_set_fb(plane, &data->fb[pipe * MAX_PLANES + i],
-					       mode->hdisplay, mode->vdisplay);
+			struct igt_fb *fb = &data->fb[pipe * MAX_PLANES + i];
+			int src_width = min_t(int, mode->hdisplay, fb->width);
+			int src_height = min_t(int, mode->vdisplay, fb->height);
 
-			plane_width = (mode->hdisplay * 3) / 4;
-			plane_height = (mode->vdisplay * 3) / 4;
+			universal_plane_set_fb(plane, fb, src_width, src_height);
+
+			plane_width = (src_width * 3) / 4;
+			plane_height = (src_height * 3) / 4;
 
 			ret = try_plane_scaling(data, plane, plane_width, plane_height);
 
-- 
2.48.1

