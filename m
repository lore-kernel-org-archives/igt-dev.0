Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3445CAC5B0
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 13:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC4B10E127;
	Tue, 23 Sep 2025 13:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jV6yFpCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A200B10E126
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758633018; x=1790169018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zQEBCKQiUTR2TywriW7YlE76uqPZ3NcwSrNZ2OAF4NY=;
 b=jV6yFpCLr5mQDiumXe3AhZjc/LwymRbP2DooGLutEaEpkGboMgNsy3iN
 rpgF4Ijvqyr2rWqcnZGsNd7ar4nPWuE4BL2S56Alv1dlu3z0qpaqyGWEP
 LX6PPkoheeBQwFcO2yt3qLhCe7uCgIJ8ZoBOm8GhBvs8G+DK65BXs/3oL
 DI8VErHVV6arxhHc+vTTpgyUazdEWT2cJJVFklt7iM6+WgY8ETC7FrjhG
 UZwW2pTUne14KMqtj0XZJa5WSNTs0NZ9tzee/bzE8Z6R3pmezAVnd0imQ
 b3V5rxeadUeK1C6QQ7Qqm3BOzlxocFNBzeujcQRzCgQVjJQz7c8N+bBTd A==;
X-CSE-ConnectionGUID: dH0h1cb2RG6TrqBB73W7wg==
X-CSE-MsgGUID: 4rx8RzcxQwCLnozgBibxSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61026856"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="61026856"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:18 -0700
X-CSE-ConnectionGUID: sA5uuPMdTsGChnSUDnvFqA==
X-CSE-MsgGUID: x5jigDY8S26iYFxGq4sRyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="200461872"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.237])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:16 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v4 i-g-t 1/6] lib/xe_eudebug: Fix safe_pipe_read
Date: Tue, 23 Sep 2025 15:09:57 +0200
Message-Id: <20250923131002.24708-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
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

In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
misleading, as the pipe could be already broken. Do an early return with
-EPIPE if the poll fails.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 667c31c6e..8e5664496 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -271,6 +271,8 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 		if (!ret) {
 			catch_child_failure();
 			t += interval_ms;
+		} else if (ret == -1) {
+			return -EPIPE;
 		}
 	} while (!ret && t < timeout_ms);
 
-- 
2.34.1

