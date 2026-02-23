Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68530E98E03
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 08:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA6110E271;
	Mon, 23 Feb 2026 08:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfzQ7tu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3514A10E26C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771834336; x=1803370336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=704gxS03xUhUgnBiVHvv4P1Rdsc7ZI5ULpQFCPmy53A=;
 b=CfzQ7tu/tpXpFcVJjq9IoFcQor7N8mi8os8oHMxjpzpwYpU//1vJBr0C
 PQnfGxV6krylxbW6f+CtwnIXeYLLq87Kwxwhe4YZ4cJuRQ5Fst7POR6Bx
 ICxDdb5CWWcIrGzaaL+90Qv4/nhipPjPNxYK3ktKZ0N1ZFztQpqo9RrD7
 wj8PN68bh7haRFiQsFVP90SVsX8Jbn7S+8adqKhuOC5/ZIcd8zMrfEtNL
 rc40+xWlhHbAA6WVWMaTJAmI7VTPqHNGT99V9l51c8JP/x3nuHXhUnPIF
 eTlr/LVLFhJ+DBsKXryvSHy9a2uFSAye+Cn1Ye25MlRwXgzMMLpa6w8n8 A==;
X-CSE-ConnectionGUID: pL+ebbiQTWSnXkoA8gMVig==
X-CSE-MsgGUID: ZyhV2qSlQf6xCQbDvoGYXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="75431410"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="75431410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 00:12:16 -0800
X-CSE-ConnectionGUID: z79LMrsJRtqRTDIDxLNlMg==
X-CSE-MsgGUID: aQ9waL4BR/avmE0oXLloAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215625127"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 00:12:14 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/kms_pipe_stress: Clamp the source
 size to the FB bounds
Date: Mon, 23 Feb 2026 14:02:59 +0530
Message-ID: <20260223083259.187783-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223083259.187783-1-sowmiya.s@intel.com>
References: <20260223083259.187783-1-sowmiya.s@intel.com>
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
2.43.0

