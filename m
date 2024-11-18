Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF19D4920C
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 11:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD01210E48E;
	Mon, 18 Nov 2024 11:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ot/WxJ2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372E810E48E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731928549; x=1763464549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=73kGz0ZGiyHSBA58c9rmdk7lAVZItfC/4G18HGQzbsA=;
 b=Ot/WxJ2Ed7APGkjv6d4a/elbgcaEBHOaoPErofY77zpAg7heYwDNJ/wJ
 RQU/ws92iGV7RkX8ELMSFzm4SVUqbUzVTI/st7IOaxkAihOQPMEu5A2cS
 rxmNXRDBDralEOgW/O3ixt0v+qD6/RzrfatSPZ4PjPLZ6WeANdRIbZ7sZ
 e1d/xkeJudacFTkeiwAtQhlbXPWGK+tuZJlUoMljy1IqWeyFbmJ3LwdUT
 89H3eb40F3O3w9Plaq2kHTi5VLHggmSG1Ds9//MuhKV8V+Izj8ImEufeE
 RpG0YpgSr9xiFCk3FBxRi5w5NcjCL9CnpXy2PNUNXlGTy2f63bGBH/gZ3 w==;
X-CSE-ConnectionGUID: z9WiW0rAQkSPTEf1pLsOWA==
X-CSE-MsgGUID: z8MkBwwsQ1qK2rYHKME+YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43266233"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="43266233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:15:49 -0800
X-CSE-ConnectionGUID: bdkjKleXS2SnwwVJt10Nnw==
X-CSE-MsgGUID: d6HcZHZXSyW9l1qe1sP10Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89111661"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:15:47 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/intel-ci: Block all gem_exec_fair tests
Date: Mon, 18 Nov 2024 11:15:28 +0000
Message-Id: <20241118111528.4190241-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118111528.4190241-1-katarzyna.piecielska@intel.com>
References: <20241118111528.4190241-1-katarzyna.piecielska@intel.com>
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

As i915 schedules is not going to be improved there is no need to
execute gem_exec_fair tests. For now let's keep them for future
reference.

Ref:
https://gitlab.freedesktop.org/drm/intel/issues/2842
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12786

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel-ci/blacklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index cfc5491d5..d0b39111c 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -29,7 +29,7 @@ igt@gem_evict_alignment(@.*)?
 igt@gem_evict_everything(@.*)?
 igt@gem_exec_big@(?!.*single).*
 igt@gem_exec_capture@many-.*
-igt@gem_exec_fair@(?!.*basic).*
+igt@gem_exec_fair(@.*)?
 igt@gem_exec_fence@.*hang.*
 igt@gem_exec_flush@(?!.*basic).*
 igt@gem_exec_latency(@.*)?
-- 
2.34.1

