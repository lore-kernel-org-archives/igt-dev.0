Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE44C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47FE10E055;
	Fri, 14 Jun 2024 05:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdKfKvVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFA810E055
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718343538; x=1749879538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c8McMnvJyB0lv7vkKd615CBEHRy9tNSDTZx9YTWLQlY=;
 b=RdKfKvVz42qxMlJDFcE2nB2deg0qXogcajondF6GhQcSuL9NaZC0d7To
 nmkcJEXYALMWiFZq/x5o6wGbkKE6LZISfonODACaQM1FAXlgRFjTZe5pF
 cFQsF8nNImRR8VJqzUCq3KSLVgX+707+Nh+/0yrZ5jUhcryo8udW2Po+N
 o4cFABLIQ9TKruVuvS+CzXq7yY0UrK7OntuDre0eLFwFt37RGRn4zLmJh
 TF8d45zAdM3hRLCB+KhQq6m3jzDXnp6Y5ykdEgeEGRMKRe3eCgyybV80A
 ZE1yEI3VeWGUpd/mTxuH3yNRc1kQkvG6kmmySNkRNzm7poQl1VMxQLqME g==;
X-CSE-ConnectionGUID: JO8ABzTkSrOptrIsfQC1OA==
X-CSE-MsgGUID: iiow+BJnR9O2lWlXqHNFQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26331586"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26331586"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:38:58 -0700
X-CSE-ConnectionGUID: mzb93ikpR4qcF46BMrL1Ng==
X-CSE-MsgGUID: crCjespTSDeWnTxLOb3NJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77864037"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:38:56 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 2/7] lib/igt_psr: Psr status debugfs interface print
 "enabled" not "Enabled"
Date: Fri, 14 Jun 2024 08:38:34 +0300
Message-Id: <20240614053839.1822879-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614053839.1822879-1-jouni.hogander@intel.com>
References: <20240614053839.1822879-1-jouni.hogander@intel.com>
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

Psr status debugfs interface print "enabled" not "Enabled". Take this into
account in psr_mode psr_get_mode.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 964f18487..d1286276c 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -399,9 +399,9 @@ enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
 		return PSR_DISABLED;
 	}
 
-	if (strstr(buf, "Panel Replay Enabled"))
+	if (strstr(buf, "Panel Replay enabled"))
 		return PR_MODE;
-	else if (strstr(buf, "Panel Replay Selective Update Enabled"))
+	else if (strstr(buf, "Panel Replay Selective Update enabled"))
 		return PR_MODE_SEL_FETCH;
 	else if (strstr(buf, "PSR2 selective fetch: enabled"))
 		return PSR_MODE_2_SEL_FETCH;
-- 
2.34.1

