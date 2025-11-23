Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599AECFA46B
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E69910E17F;
	Sun, 23 Nov 2025 15:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDzZa8yc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25A110E189
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910540; x=1795446540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tv8xof7nnOk7y57hOBfvY9ABcRDYfhxk2bbM/iHeYfw=;
 b=YDzZa8ycuS2VTGvpv99Icf2aM3xaYXJXDXHklE84hOorBewZSSyTYLQg
 t2l3mtTq7QZJNSPPnAfn3g6IhA0OGMtEZR+J86Qb8CAxnX/hi7aXJ0+Cb
 /1E72sZ+xLbCNHEkQa/ngClcPkGbzRIRyXH4AuKMlsxof5oRQP2/t+du0
 OyiUyyLeofFh2VQdomgy1o7z/YOOv8FlVwguIxBIhoOZEMI29r3uJebQy
 nPGOzG0N6VkcLL2kyW5fkihe3Hg0Ue+aLhjKQeIyHM+3By9UBGmjv6xc3
 l1ssTajHNW+9Hzd3hFeRf7wevsJZmguJ+W0c0wOYA/K04oJoOcygvMXtx w==;
X-CSE-ConnectionGUID: knrXMuuZROKPmisuSeAIxQ==
X-CSE-MsgGUID: YmA1QMnUTfu1NwNV43bpow==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615220"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:59 -0800
X-CSE-ConnectionGUID: 9wHwFJXGR1qrjLY9mw2USA==
X-CSE-MsgGUID: JhHZZbFsSqmckBsJdRQWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903849"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:59 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 29/35] tests/kms_draw_crc: use display-aware pipe CRC
 helper
Date: Sun, 23 Nov 2025 20:54:06 +0530
Message-Id: <20251123152412.599801-30-kunal1.joshi@intel.com>
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

Switch kms_draw_crc to use igt_pipe_crc_new_for_display so it derives the CRTC index from the display state instead of assuming the pipe index equals the CRTC index.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_draw_crc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 4877e757c..717b66c6a 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -103,7 +103,9 @@ static void find_modeset_params(void)
 			continue;
 
 		mode = igt_output_get_mode(output);
-		pipe_crc = igt_pipe_crc_new(drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_pipe_crc_new_for_display(&display,
+					   pipe,
+					   IGT_PIPE_CRC_SOURCE_AUTO);
 		/*Only one pipe/output is enough*/
 		break;
 	}
-- 
2.25.1

