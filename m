Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC13CFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CFD10E17F;
	Sun, 23 Nov 2025 15:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpLG4RlV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807A510E17F
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910538; x=1795446538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=glGt95mgz+BYKZRdvCT8tbQK1MivYUVc/XCWhxhdlQs=;
 b=kpLG4RlVt36JAxpFvtzpExS3dWhb7uNaZL5UZW9fqOreoR4KRLIpfOQA
 ua+q5ZHnXy6CHJXQKnnmGkXfu2gpoFCj7CiS5pW3mAyWFFuyfltCCkUBo
 W8W8Ks3Fopm6bbEtWAi0KJsg3dIRFhjVt/wBhndno4mfy6akupwxbwnc+
 a8sjl2oSN0VRhJ8AMJSRqWNh7eJnuq/dHbeJthDqx4YWvgOorSNv3VY2s
 ZID2slo5Q6ItirGnF06ZLLj1hyFWRQWkDbx52XdVXfmGNKUtnXS5Sr/b1
 IYD8UiJErTuDEuJxxml6mSHMwqxJPc4+bK2AGaLWIvZB9Q/2JIQzMVLpw g==;
X-CSE-ConnectionGUID: 0WazQAfNQC2UCGP88jPC6A==
X-CSE-MsgGUID: W3MMjJ8hQjGTJ8geSZdJiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615219"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615219"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:58 -0800
X-CSE-ConnectionGUID: xPwLyBayThiGLSCpMROsCw==
X-CSE-MsgGUID: +2CeH7m+TeGsdQxsikvC2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903844"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:58 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 28/35] tests/xe_pat: use display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:54:05 +0530
Message-Id: <20251123152412.599801-29-kunal1.joshi@intel.com>
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

Switch xe_pat to use igt_pipe_crc_new_for_display so it derives the CRTC index from the display state instead of assuming the pipe index equals the CRTC index.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/xe_pat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 59dfb6b11..4a61ea666 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -801,7 +801,9 @@ static void display_vs_wb_transient(int fd)
 			continue;
 
 		mode = igt_output_get_mode(output);
-		pipe_crc = igt_pipe_crc_new(fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+		pipe_crc = igt_pipe_crc_new_for_display(&display,
+					   pipe,
+					   IGT_PIPE_CRC_SOURCE_AUTO);
 		break;
 	}
 
-- 
2.25.1

