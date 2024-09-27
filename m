Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7713FCDD1B5
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 13:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E7610EC5F;
	Fri, 27 Sep 2024 13:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CweXKX+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7705110EC50
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445031; x=1758981031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HmV5I6KYJeP2xIc+luqNOx5fmiHWYPC+xdhEHS4BZQ=;
 b=CweXKX+vUy+kEBpZkf7PnnPFUNPgXubZlsLkOeCaqBgQ00Oxs9Xsd9tI
 /HKzKISILiggHqEu3n00lcgFS/T9wONjKrE/B7GbJ8QgNebwFa/4cKpvF
 lRVWVsJVna5Lmojm5b3nrsRhI0a3dPSR47EYJENIDCYXsHU3VQkQcDzDE
 klA0j2CMWP2Gzt1XAYjII/kZWcWL4wQLsCC2CTEM2yzM8H+qlBP2S8Sl+
 iXCpQeums3nUfVrxCYv1qDfEXPGMk3YAOEfnNXt2RTR8HtOR5XJkwfewf
 cdCMgPNCbUyqLwHPjg9+UubCsphVLhCH26B3fFZYacAEK1nLkx/M9fg2L w==;
X-CSE-ConnectionGUID: aIzgk0RhQzuETYreLaobtQ==
X-CSE-MsgGUID: guatetR+TCWNoktpIoSZhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49116012"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="49116012"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:50:31 -0700
X-CSE-ConnectionGUID: hyRVHNlvQu+tIluQf+SNwQ==
X-CSE-MsgGUID: jm324bq/TOiqwvUqAU9vBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72850039"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:50:29 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 5/6] lib/igt_kms: Handle EINVAL error as well
Date: Fri, 27 Sep 2024 19:32:21 +0530
Message-Id: <20240927140222.1688565-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927140222.1688565-1-kunal1.joshi@intel.com>
References: <20240927140222.1688565-1-kunal1.joshi@intel.com>
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

Previously, only -ENOSPC was handled, but -EINVAL
can also occur under certain conditions when the
mode can't be set.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Suggested-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9e15d25e6..dbd0e6262 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4927,7 +4927,7 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 
 		if (!ret)
 			return true;
-		else if (ret != -ENOSPC)
+		else if (ret != -ENOSPC && ret != -EINVAL)
 			return false;
 	}
 
-- 
2.40.1

