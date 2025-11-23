Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD2CFA46B
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F80E10E179;
	Sun, 23 Nov 2025 15:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOerhCfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAD210E179
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910508; x=1795446508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oaqr3TVyiN6ILMWakhpgOUH8lNfg1LeQhSi1qyR0pQM=;
 b=KOerhCfvr837WzCSg6690LUtlUqQf4ScSbtmhiUmTuLrwaw1uKRZBsxu
 6fS4FgrcyE4GHa9Hj3kP2Z/x27ZATV4EkpOVtg4LAiZ1adyCq8s3IqLOL
 jjWHBW0nwI/GCnnKRpRffEcVv8JjESQ+JYPNgNPG6U1hy1NtIw1vjquaM
 yL6jp4noVkc4t8kbLkHrt07kpO3CoE0NrwbAeMmWY8qYMceLYCYWFTrAU
 ppM3eVQ4Jtjh6Okga4/edwr5sGwMeWIF0cc7Y5FItK9Erfef8lG7S13rW
 8id0IAHHB1zg4Wdv0Baii2O72T1xbQ7dMUBYf4WUc8ARKmahQvf5YmBDH g==;
X-CSE-ConnectionGUID: l+PccA7EQWSDyI/Jh2FNvg==
X-CSE-MsgGUID: Y18t/MYfT7+PbRlpRNEBbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615168"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615168"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:28 -0800
X-CSE-ConnectionGUID: +Wy4VL87RzicnN+uw6ottw==
X-CSE-MsgGUID: tUUIQVjwTo6ZuMYgjy0vSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903738"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:28 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 07/35] tests/kms_hdr: use display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:44 +0530
Message-Id: <20251123152412.599801-8-kunal1.joshi@intel.com>
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

kms_hdr creates a pipe CRC helper with igt_pipe_crc_new(fd, data->pipe_id,
...), implicitly assuming that data->pipe_id matches the CRTC index used in
the debugfs crtc-<index>/crc/ paths. That assumption does not hold once CRTC
indices and hardware pipes diverge.

Switch the test setup to use igt_pipe_crc_new_for_display(&data->display,
data->pipe_id, IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are
derived from display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_hdr robust to non-trivial CRTC index to hardware pipe mappings
without otherwise changing the test logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_hdr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 40187275b..731e2820a 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -227,7 +227,8 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	data->primary =
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
-	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+					  data->pipe_id,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
-- 
2.25.1

