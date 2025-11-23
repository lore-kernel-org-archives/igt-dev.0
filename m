Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AECBCFD318
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DAB10E18C;
	Sun, 23 Nov 2025 15:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTd4rE4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DF410E152
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910541; x=1795446541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d2iKYkuT377yDahqwKW+vlmweS3EkXb8CT5li4Y0AdA=;
 b=PTd4rE4jJBdalyUpbKJ4B3U3g6ZVnV+Ir4sWURpqcnafDcgifSpkeOua
 xhBsGPJVy06g8ZNAfFAh0Lq06xarFhzIPn9qD2zmE1tijN/2OfcC96OCQ
 QBm/zeapm/d8KPVxG3T9+Mpkb+DjBb4yozH5mfq0A2rlifUnbIRBD3uzV
 2iOG6JJ6dUU5B5D7V+M9o89IbMqC/SaQYDd/LS8T9xuu6OxTdz0AbWuzq
 cIe3+8Atwlen2ONyxt3+3gTbqQ23tP70CPve0ixPokayiejPTBrJISQrs
 Na+1LUQjwcIj212MjnzR403qKr3YFK/4OUjGcxT5pVD8mSPGNEJZQz8NZ w==;
X-CSE-ConnectionGUID: aT99gUauScm8e2Mq9HnW6w==
X-CSE-MsgGUID: T3e0oZk9SFCJxshP45zYug==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615222"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:09:01 -0800
X-CSE-ConnectionGUID: GCG0kR/VSSy+sozeBAnOcg==
X-CSE-MsgGUID: enYap1ltSNyilA9C2CT05A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903854"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:09:00 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 30/35] tests/kms_fbcon_fbt: use display-aware pipe CRC
 helper
Date: Sun, 23 Nov 2025 20:54:07 +0530
Message-Id: <20251123152412.599801-31-kunal1.joshi@intel.com>
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

Switch kms_fbcon_fbt to use the new pipe CRC helper that takes an explicit CRTC index so it does not assume the pipe index equals the CRTC index.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 2c8cbbb1e..c32eb8cc0 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -146,10 +146,11 @@ static bool fbc_check_cursor_blinking(struct drm_info *drm)
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t crc[2];
 	bool ret;
-	int i, pipe;
+	int i;
 
-	pipe = kmstest_get_pipe_from_crtc_id(drm->fd, drm->crtc_id);
-	pipe_crc = igt_pipe_crc_new(drm->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new_for_crtc(drm->fd,
+				 drm->crtc_id,
+				 IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(pipe_crc);
 	igt_pipe_crc_drain(pipe_crc);
-- 
2.25.1

