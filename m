Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D5CCAC588
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 12:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC4F10E511;
	Mon,  8 Sep 2025 12:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n088Xiik";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1671610E511
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757336105; x=1788872105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+CEzyK7K/qzEznvk3zdDoUmWO6OEMkjQiFT7VX1KmaA=;
 b=n088XiikaaIL6J0xJMOKp+7i37ZXFeVX7NMFRLwRKzwu56+adLEcnKjW
 BWqNWXY9RQAfOcIOvtza8nIcgbkeV+XLW87GZA9Qex28fzTCkvn4L+VsZ
 RsL6l+qFp6cmuR8qhKGOJF4XswhDghPJ9A6DKhR7vTuVDYLJqYHuMEveT
 kVGeMGSqnjmST617FWTDIL1m65L+tJGSeoEwww2E+Rc7G+6fIRAL4WtmC
 LEUWUTOiHhS8Pu95+QaIoNDu1H+fNOGZ+IWQxrKQKzSNTgNTq2ImGH5TT
 OcVF/bRTm93SEBkzhdTDVhZN7PHhvVhD3R86epC0BkEtry6qlO8xiegys w==;
X-CSE-ConnectionGUID: Zhn7tKQ5Ro6sQDl2J4fj4Q==
X-CSE-MsgGUID: rbjvG2LPQ5Wt43HVcHUZkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70688726"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70688726"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:05 -0700
X-CSE-ConnectionGUID: 2RaDrMvQTeGemcB+tzvF2g==
X-CSE-MsgGUID: wmoDL23UROySOVm4gbOZjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="177101505"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.208])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:04 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 2/4] lib/igt_core: Block SIGINT during igt_vlog
Date: Mon,  8 Sep 2025 14:54:46 +0200
Message-Id: <20250908125448.13420-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Block SIGINT during igt_vlog to avoid deadlocks in multi-threaded SIGINT
scenarios.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/igt_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 4477cfef1..414fd9bce 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3198,6 +3198,11 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 		"CRITICAL",
 		"NONE"
 	};
+	sigset_t set, oldset;
+
+	sigemptyset(&set);
+	sigaddset(&set, SIGINT);
+	sigprocmask(SIG_BLOCK, &set, &oldset);
 
 	assert(format);
 
@@ -3276,6 +3281,7 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 	pthread_mutex_unlock(&print_mutex);
 
 out:
+	sigprocmask(SIG_SETMASK, &oldset, NULL);
 	free(line);
 	free(thread_id);
 }
-- 
2.34.1

