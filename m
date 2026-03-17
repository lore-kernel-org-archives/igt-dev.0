Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD7DFB5EBC
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 04:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9199410E33F;
	Tue, 17 Mar 2026 04:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6kl0rra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7D910E343
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 04:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773723542; x=1805259542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=seO9dPxwkSD7ujdux3VfWWR0fg0bOjPDfbpGLGS6Lkw=;
 b=S6kl0rraj08aMo/6XKgTq8U0OcOe6tM/2dHXli1bypuNXg0c3fb3fyEm
 0/loU/tLMLawZ156BXLhiGeYHpyS7JA5BSrhta9CtTAuA8cjESW2h+3x0
 aUoNK9siUTnAswc8jlC6GieGUIm3qlDarHjwTXncCxGj0KaTHAUfyh6PX
 IAnu6SBPkpnlP65SdKAtkjtW/bh+UjgQO9BBATUznCSBpq72jlDXUeGCn
 pemwN7YRZZ+ycgP/Y6S5pgqSX5sSxGNw/xq0BxFEVqIGjWzJbtuhYRY2Q
 /sggV404RW0OM08VGtBfBu8jw2Gl94sLWvGt6zM1I26I7dZkg4jHcsHy4 g==;
X-CSE-ConnectionGUID: Qnmq1mObTZW5zSDHPADN0w==
X-CSE-MsgGUID: C/9NspQtRZ+gWzAxg/L3Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78642302"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78642302"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 21:59:02 -0700
X-CSE-ConnectionGUID: vn0p3Ns1SP2GuD5gkM7V4Q==
X-CSE-MsgGUID: 2sTtIfeBQr+IyiJC76TPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="216552271"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 21:59:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use lowest mode for crc
 subtest
Date: Tue, 17 Mar 2026 10:26:55 +0530
Message-Id: <20260317045655.45527-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317045655.45527-1-santhosh.reddy.guddati@intel.com>
References: <20260309082450.1897617-1-santhosh.reddy.guddati@intel.com>
 <20260317045655.45527-1-santhosh.reddy.guddati@intel.com>
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

Currently The CRC subtest uses mode[0] which maps to preffered high
refresh mode. On panels with multiple modes, pick the lower mode to
speed up crc test.

V2: Rename and move the function to lib to re-use (Ramanaidu)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4a2930968..ab1f01d44 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -819,8 +819,8 @@ static void test_crc(data_t *data)
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	/* make things faster by using a smallish mode */
-	mode = &data->output->config.connector->modes[0];
+	/* make things faster by using a lower bandwidth mode */
+	mode = igt_output_get_lowclk_mode(data->output);
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
-- 
2.34.1

