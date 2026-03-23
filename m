Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C90EC01A6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C1110E3F7;
	Mon, 23 Mar 2026 09:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6DdQ5hi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1D010E3F1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774257217; x=1805793217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MbxzC83wBFeYqvvpZcEnVVf2T77ImIG4N11dYPSRSVI=;
 b=D6DdQ5hif/LWT2lPKPRgWpBU+okBwoV1PCW5NoorRKP+6lPc6TWQa4Gr
 q3Wm07h3LmcwlwQjVuwXJkaf9pTfoz06Q0pX2vDvF6WXnsCgTJgPbBQpU
 +NPoo74Q2lhcT+qFFtEmep5ynFcZlLLq1AuJngwwr1/w0eD9+hKHII3lL
 OUdpWwCiV9c+LrqL7A4+76sBKvfPlQiqaHmDk90LWvBqhx5NnakLSXBNn
 ziSM+ICtrxwaUFCpHvt9TX9keEr3/HoHAQkYG2lG5OBJ8VPW0h2m4czbz
 HzMeE81dmsOVStAyGT8bLlM4VVE7FOkbvrH/UNfq8Dp19XjoT3pJNf76h A==;
X-CSE-ConnectionGUID: 3u41rJXLQ5uKw8dLmvCXjQ==
X-CSE-MsgGUID: 2nmkgBTTQLW7LxhtCH6kkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75371578"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75371578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:13:37 -0700
X-CSE-ConnectionGUID: oorPsBkFQWeEdScYwqQiCg==
X-CSE-MsgGUID: ymf4SV6ERQC8jMUmVQ9Nqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="219164543"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:13:36 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/4] tests/kms_vrr: Avoid unnecessary PSR disable
Date: Mon, 23 Mar 2026 14:42:03 +0530
Message-ID: <20260323091205.100585-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323091205.100585-1-jeevan.b@intel.com>
References: <20260323091205.100585-1-jeevan.b@intel.com>
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

Use output instead of NULL in PSR helpers so PSR is disabled only
when supported by the sink, avoiding unnecessary global checks and
ensuring correct behavior on multi-eDP setups.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index ec0692b2f..ec17366c8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -912,9 +912,9 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 			igt_skip("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
 				 igt_output_name(output));
 
-		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
-		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
-			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, output) ||
+		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, output))
+			psr_disable(data->drm_fd, data->debugfs_fd, output);
 	}
 
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
-- 
2.43.0

