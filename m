Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09324CCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 07:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0C910EAA3;
	Thu, 26 Sep 2024 07:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ji5LH+9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0B210EAA3
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 07:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727334338; x=1758870338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S4oDE9Yzlszae/BG2D+pqbiW6dBdE/6UON1P/gdhtJI=;
 b=Ji5LH+9hkr7Rud6pjTfWvDBPyibrL4yNwKIjAzFmd3za/TQ/0NEOU7cX
 AFAJKLN+0Ti9ZOXKafb8IjLRxHpRRLd6rlJddPxciw/tTedP8g71szfGm
 joBGIBLlPx3waPdz58pk+xfiMza3L1dTa75gkTU7wF+rEsNocdaoU/OKM
 ZHkpM+qxG3/LP85LL8bAX36jCWQo1u6Ziok92F0hmbPtxHP0wHXT/+vFb
 9UemxQ0HIYXq4Kx2CAZ+76sdeKrJI7EbqIxTAvH1W49wnQvKZSxN8DaKh
 LExWSpWAx7ERsX/zKxXF6si3AyL+M/noCwiiBHavyjUC6APmfHsz6FaQd Q==;
X-CSE-ConnectionGUID: 1cr3K0UhRvCpC7fUFQR4qg==
X-CSE-MsgGUID: 4o8GmTjjR6KxAKItEyfs7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26225168"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="26225168"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 00:05:38 -0700
X-CSE-ConnectionGUID: X/wj4zAwQpmlcmVLWeJPdA==
X-CSE-MsgGUID: tBAKet4GS4Cuqt9UeawwiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="76812910"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.145])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 00:05:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 2/2] lib/igt_psr: Assert on sink/source state mismatch
Date: Thu, 26 Sep 2024 10:05:17 +0300
Message-Id: <20240926070517.1326936-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926070517.1326936-1-jouni.hogander@intel.com>
References: <20240926070517.1326936-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Assert if sink state is not PSR active while source state is PSR
active. This makes it easier to identify failure due to sink/source
mismatch.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 963385967..0eb002633 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -117,8 +117,10 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 	active = strstr(buf, state);
 
 	env = getenv("IGT_PANEL_REPLAY_IGNORE_SINK_STATUS");
-	if (active && output && (!env || !atoi(env)))
+	if (active && output && (!env || !atoi(env))) {
 		active = psr_active_sink_check(debugfs_fd, output);
+		igt_assert_f(active, "PSR sink/source state mismatch\n");
+	}
 
 	return active;
 }
-- 
2.34.1

