Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346D3CFA46B
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD70D10E152;
	Sun, 23 Nov 2025 15:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVQmmahm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A2010E152
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910527; x=1795446527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrBWyYt9B8UC4QArn50uUD8kzVdwwWrsFnrNAgSoaOU=;
 b=OVQmmahmXRtH/QQ1DbqrqAEYwZYxzEzehjCIWcgf+U2AaoiPVmXXzsnH
 Oe7zUqAq7Q3PNWGdjZMsRIrJJmk0Q9HNJ3jkyD0uszMxoqAtr+cYSUq6F
 lUE++d3ExvWYAU1tYLdd5STiJPfczx03Kc0iouQovX6gFAXdWzF+HVevv
 PTWswG33KIZ0gOPOgrkzMWmm2KimAruALMxD4oxUktmFrsrHxbtHT++yu
 BjcZ97xYSo79ItfgDY6sqglmnDNtpipHVjkf7NSz8lyk1KC7dyvEKYsxc
 HqNskGOrMaMxVHLSPso24q2l6DVpEBggGJ1UM/aaETPCWnzGMsWn0Azvd Q==;
X-CSE-ConnectionGUID: FFlqolQIRWm/yPkQdo+JHg==
X-CSE-MsgGUID: 8x9RC8C5TuqQqORj7Q8t/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615204"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615204"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:47 -0800
X-CSE-ConnectionGUID: 4DlYvwSdSWGpJrk5ArTQBA==
X-CSE-MsgGUID: GQtfRkbhT3ePMJwtjlo99A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903810"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:46 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 20/35] tests/kms_ccs: use display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:57 +0530
Message-Id: <20251123152412.599801-21-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123152412.599801-1-kunal1.joshi@intel.com>
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_ccs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index ab081aa75..9087e1dea 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1052,8 +1052,9 @@ static int test_ccs(data_t *data)
 		 IGT_FORMAT_ARGS(data->format), IGT_MODIFIER_ARGS(data->ccs_modifier));
 
 	if (data->flags & TEST_CRC) {
-		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-						  IGT_PIPE_CRC_SOURCE_AUTO);
+		data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+							    data->pipe,
+							    IGT_PIPE_CRC_SOURCE_AUTO);
 
 		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
 		    try_config(data, fb_flags, &crc)) {
-- 
2.25.1

