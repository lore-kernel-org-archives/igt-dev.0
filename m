Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F1410F6FD6
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE1410EE7F;
	Wed,  1 Apr 2026 15:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYOWKmUg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9659B10E5BD
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775058318; x=1806594318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VUekPhD38KS9SIH05GmnIp6XogEOOgQ+Rs2hWecNalo=;
 b=YYOWKmUgAWBEpOqA9Vfex1pZ2REXavJZMh0rz82wdZfZJbLBZlvX/S7O
 rmKGdUBIsvPwZ1FwpMu4Y9sUeTnDXEOIBd4XTyoa9LhP3917+nv7JsnZN
 wKvxhNrgh/VLRBNSNv37taQdAK82qIUncjysH5raJWZh7XMgzS7FSI//v
 qBExuS7rmKh5rCDRuZJ72aoI5LjSht/oPi9xcXS+rds8CNYcgdP5UVVEm
 RUyJXuE25fu6RSMNZ1s4cVCks6cwMIVqBgSHhhicDNwKpf23kfFm/ZBtY
 azeMNNtmIXwyRTSUbedVZCgF6PJFwM9J+h69q4ZZsw25ZJTHvJADw7rAQ g==;
X-CSE-ConnectionGUID: SeB1KLZhSG6lqp6N9cyJrg==
X-CSE-MsgGUID: vFvv5D4rTW28cKgge29Y2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79988986"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79988986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:45:17 -0700
X-CSE-ConnectionGUID: mueaTw6ERmGnJcPEeuUlLA==
X-CSE-MsgGUID: tgztL1p4R8Od9BLoHjLmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226960125"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:45:16 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 6/7] tests/intel/kms_joiner: Require boundary mode for
 basic-max-non-joiner
Date: Wed,  1 Apr 2026 21:36:26 +0530
Message-Id: <20260401160627.1338526-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401160627.1338526-1-kunal1.joshi@intel.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
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

Skip when the returned mode's hdisplay is below the
platform's single-pipe limit.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_joiner.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 86226a3ba..765572d98 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -572,6 +572,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 static void test_basic_max_non_joiner(data_t *data)
 {
 	igt_display_t *display = &data->display;
+	int max_hdisplay = intel_get_max_pipe_hdisplay(data->drm_fd);
 	int count;
 	enum pipe pipe;
 	igt_output_t **outputs, *output;
@@ -597,6 +598,9 @@ static void test_basic_max_non_joiner(data_t *data)
 				igt_require(max_non_joiner_mode_found(data->drm_fd,
 								      output->config.connector,
 								      max_dotclock, &mode));
+				igt_require_f(mode.hdisplay >= max_hdisplay,
+					      "Max non-joiner mode %dx%d below single-pipe limit %d\n",
+					      mode.hdisplay, mode.vdisplay, max_hdisplay);
 				igt_output_override_mode(output, &mode);
 				igt_info("Appplying mode = %dx%d@%d\n", mode.hdisplay,
 					 mode.vdisplay, mode.vrefresh);
-- 
2.25.1

