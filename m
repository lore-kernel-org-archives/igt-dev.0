Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDADC05024
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4641135C4;
	Wed, 17 Apr 2024 14:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Io+wFQ06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCC81135C1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713364780; x=1744900780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HG/wCDHZatX33uwRWZAAMJpWRH+XMtajCcO0p71j6I8=;
 b=Io+wFQ06R9Mecpm0qFy81PYZBZGmfUxptJ7HZ6zUdjnd0hc5fycRpv7+
 n2zMN+jgB+cCDGj6zpoqg0evM8CQbFW3BbhN8GYGuI+soLr5+hfZuOTvI
 a4TN/3Ujkq5Pq3FjBid8wXFU1UmN3e1NtulUtsp0IZ0UY5G/q/9pGjamR
 l7HntEv4/+dN++S3MNWgJcrocgR6tj0o6lknaglorHLLWmZex5kiZjYgk
 GZAxzE/iAvcCn1AEjNy2s0pWIO+Y7Q1zGoTnaAFlLUDgWM1mbqERurAoW
 kvDZnVNLlQhcfDVT2sHZsixM882CFnA4oRX3CmU4rs4Bl9ZhX98kI+DNI Q==;
X-CSE-ConnectionGUID: a+wX8A6+Rw+hrHQl76Mljw==
X-CSE-MsgGUID: I4BvWE2JQvOXfXqPfkB1vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9083650"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9083650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:40 -0700
X-CSE-ConnectionGUID: CPErkP32QBeGhiJi/uGtlw==
X-CSE-MsgGUID: cA3N0s/0S6u3tpOfZSMypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53859887"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:39 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/6] lib/igt_kms: Force joiner support in bigjoiner
 checks
Date: Wed, 17 Apr 2024 20:03:21 +0530
Message-ID: <20240417143325.720515-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
References: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5271010be..80c22a86d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6334,6 +6334,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	struct {
 		enum pipe idx;
 		drmModeModeInfo *mode;
+		bool force_joiner;
 	} pipes[IGT_MAX_PIPES];
 	int max_dotclock;
 
@@ -6351,6 +6352,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 
 		pipes[pipes_in_use].idx = output->pending_pipe;
 		pipes[pipes_in_use].mode = igt_output_get_mode(output);
+		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
 		pipes_in_use++;
 	}
 
@@ -6362,21 +6364,24 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	max_dotclock = igt_get_max_dotclock(display->drm_fd);
 
 	/*
-	 * if mode resolution > 5K (or) mode.clock > max dot-clock, then ignore
+	 * if force joiner (or) mode resolution > 5K (or) mode.clock > max dot-clock,
+	 * then ignore
 	 *  - if the consecutive pipe is not available
 	 *  - last crtc in single/multi-connector config
 	 *  - consecutive crtcs in multi-connector config
 	 *
 	 * in multi-connector config ignore if
-	 *  - previous crtc (mode resolution > 5K or mode.clock > max dot-clock) and
+	 *  - previous crtc (force joiner or mode resolution > 5K or mode.clock > max dot-clock) and
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
-		if ((igt_bigjoiner_possible(pipes[i].mode, max_dotclock) &&
+		if (((pipes[i].force_joiner ||
+		      igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) &&
 		     ((pipes[i].idx >= (total_pipes - 1)) ||
 		      (!display->pipes[pipes[i].idx + 1].enabled) ||
 		      ((i < (pipes_in_use - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
-		    ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock) &&
+		    ((i > 0) && (pipes[i - 1].force_joiner ||
+				 igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock)) &&
 		     ((!display->pipes[pipes[i - 1].idx + 1].enabled) ||
 		      (abs(pipes[i].idx - pipes[i - 1].idx) <= 1)))) {
 			igt_debug("Pipe/Output combo is not possible with selected mode(s).\n");
-- 
2.43.2

