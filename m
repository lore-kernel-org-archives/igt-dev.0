Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A196C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 09:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0447810E9C0;
	Thu, 13 Jun 2024 09:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3fNkClC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C1F10E242
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718270761; x=1749806761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z7IxTlfXEE4nQ/J3Qa8kzRX8FLrIquKDHrcfzu7udDA=;
 b=R3fNkClCU9zODtNg6GhTAuuJAjyNny1XRx0Uuyw+Ipc0m8sUpikQWLme
 PSqxRxoEoOdVXOY/S3AURQlE4J5iD3bwgr7urktmJV9gZFifta0W2WPeH
 VRz+EuBuGmB3RTaeGBPRomZggaK1KUCLZK0nuyOUVnoEhJt2s0oynXBEw
 tSoCw2pp/UFOmrZnfqFhP/jwPru/5iJ2KW1rEYuz5ReV9IclhyhMuyHMx
 IGL2dxFul4kVAncryNrfJiIuIcDQcLPMHPJf5aT9+jHf71qQQ4gR5LIc9
 MyjuEsbSxGgSuEc3lL8oK3hq5hoRRMx3YBPJM6PEhWC+w1dJBrJLkLH96 g==;
X-CSE-ConnectionGUID: mDFC1SU+RGGmj+0fQ4Xgyg==
X-CSE-MsgGUID: gBHVKdYWQIiMerDDuOdr1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18004698"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18004698"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:58 -0700
X-CSE-ConnectionGUID: 1NYhLG60Ryu/jnGlV1YjBg==
X-CSE-MsgGUID: aB5P9IniTQq4jcycyxLcjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40045503"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:33 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 4/6] tests/intel/kms_psr_stress_test: Provide output
 to psr_wait_entry
Date: Thu, 13 Jun 2024 12:25:12 +0300
Message-Id: <20240613092514.1288801-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613092514.1288801-1-jouni.hogander@intel.com>
References: <20240613092514.1288801-1-jouni.hogander@intel.com>
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

Psr_wait_entry requires providing output if Panel Replay PSR modes are
used.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_psr_stress_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index bca3bd513..d6e2340b8 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -232,7 +232,7 @@ static void prepare(data_t *data)
 
 	data->initial_state = psr_get_mode(data->debugfs_fd, NULL);
 	igt_require(data->initial_state != PSR_DISABLED);
-	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state, NULL));
+	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state, data->output));
 }
 
 static void cleanup(data_t *data)
-- 
2.34.1

