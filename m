Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4689C30658
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 06:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D2B10E780;
	Wed, 26 Jun 2024 06:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqT60WDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F1110E086
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 06:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719383474; x=1750919474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBqTLaneuNd4Blacs+0A1jW76T+FXxHR206mTtD4XjA=;
 b=NqT60WDtLOIixPOREoFkTFuUT7221YJj67P9Rq+XfJ2PMXb3kl7LMTMr
 jiiNfit4isrToHM+kSG7t4OnCOSha6HlWYWAeOT2JSk4/2M6K/fSG+oHX
 tg8ZBSqMNlt4qhrbeyt1740d/B9Vg2O8uCLX1rbUYZCG4gWs5NW8phQNH
 zGU3fml5DdPDRpULt+mLwUBSuxJGM2UhAJJF6kLTwXzNw0KSdAS8D3I8G
 4pganpJ2pfLHFmjCWqzGy9NniDs9rq8b2TxMp7DYZ+Vq8tog6lK/2qBvj
 c26DfijqEyzx4/oFW30lnUHW1UNZeQT2YHkKlWjge57kgt1myrErgB4a2 w==;
X-CSE-ConnectionGUID: Q60B3DOuREeEeUjIyMi1Qg==
X-CSE-MsgGUID: eT19NhdJQTO3PTuRXD8NHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16583007"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16583007"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 23:31:14 -0700
X-CSE-ConnectionGUID: Q7zvfknRRnabm5XcA5xr+w==
X-CSE-MsgGUID: XO5m0Q1lQp+xX/zpr3K/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="43768224"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.70])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 23:31:13 -0700
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 2/2] lib/gpu_cmds: Typo fix
Date: Wed, 26 Jun 2024 08:30:18 +0200
Message-Id: <20240626063018.2931-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626063018.2931-1-dominik.karol.piatkowski@intel.com>
References: <20240626063018.2931-1-dominik.karol.piatkowski@intel.com>
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

Fixed typo in description of one of the dwords in
xehp_emit_state_base_address.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/gpu_cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 2a502505e..2e29cc6c4 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -1032,7 +1032,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 		intel_bb_out(ibb, 0);
 	else
 		intel_bb_out(ibb, 0xfffff000 | 1);
-	/* intruction buffer size */
+	/* instruction buffer size */
 	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);           //dw15
 
 	/* Bindless surface state base address */
-- 
2.34.1

