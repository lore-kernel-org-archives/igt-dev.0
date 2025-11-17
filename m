Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECA8CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 07:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE5910E2EC;
	Mon, 17 Nov 2025 07:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnfbsR7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697E610E2EC
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 07:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763365800; x=1794901800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N9W74uqLNgE4ENff3DEdykmY8aQkRX2NYDYple7vxF8=;
 b=mnfbsR7l55swxw44wu9GzwNykm8vy5daw0gnfkKDHuTowdzl1g60Exdo
 9+yITXpA35D4TzFI5JfwXJp8GF+adogPlaytxZ/9cGsNwaVYGCBrHrV3z
 oWhdI4SrQxJisdt19NusyZvt9quJnvGSt/aNEjEDCODkCMxrPZLAX+kzm
 mbvWHlxiai93JPjDMbLwvFoOKfzERpIul4RDm03Mi2eeUMGv8gbPO3c/l
 OazyPaCmv4mzzPy0HjpiJdW3xRJuQBHa7shUKoYJKZs2W8t6F1eUBiZFn
 sLWFhauMhsfHs+g2vPHMz3iU9Pgtu23iUv56lc/9vtA8z+FwhD1fy00pu w==;
X-CSE-ConnectionGUID: 8ciABxLRQdWBDrdKMGZnDw==
X-CSE-MsgGUID: HEhDI88iQH6+s7MDzUs2vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="90834723"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="90834723"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 23:50:00 -0800
X-CSE-ConnectionGUID: FkdulWcKTwyLjqk0ouMuXQ==
X-CSE-MsgGUID: 9mJSGGOYTg6NBkhAKYWW+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="221026463"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 23:49:57 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH] tests/intel/kms_dp_linktrain_fallback: log before assert
Date: Mon, 17 Nov 2025 13:35:52 +0530
Message-Id: <20251117080552.471414-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Improve logging in fallback test to reveal the real
reason behind the assert

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index fa58999e8..4d6740883 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -400,6 +400,11 @@ static void test_fallback(data_t *data, bool is_mst)
 		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
 		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
 
+		igt_debug("Fallback state: prev %dx%d, curr %dx%d, max %dx%d, retries=%u\n",
+			  prev_link_rate, prev_lane_count,
+			  curr_link_rate, curr_lane_count,
+			  max_link_rate,  max_lane_count,
+			  retries);
 		igt_assert_f((curr_link_rate < prev_link_rate ||
 			     curr_lane_count < prev_lane_count) ||
 			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
-- 
2.25.1

