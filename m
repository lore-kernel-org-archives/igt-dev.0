Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F34ECD343F
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 03:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB4A10E258;
	Tue, 12 May 2026 03:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGXE06sz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511E410E258
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 03:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778556907; x=1810092907;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zx16PnMChTc10IOIuKdwZIqHz9HBkf5yGG76bNaxHmY=;
 b=aGXE06szFx/afmDjguUf2Hf8bLoHAWiKWH9vQeW9Eq06v/IaKz4oaWWe
 G2y4QTVOLFiSVQjntUf71iugbs/UFbmuuCsGp+U94wpE3wN8Hhs2CK7J+
 gTjQDw3RJLEpwGx+zmlwIgETo4yVjcliLinBUegOlm8ZClwsQfGYykTv5
 GnuLhxEf7pIEbskG4mEw46xpys0VmM/rVnsAylirJUSJnatg2JD3L9WJn
 yVohXPKPuIeAeZgyDFBwMCn6CdgDq7WCUldo1vkO6ygeyH2JXj9cXvJy5
 YJMoBHp7PhAKPIQz+/6RX6/Tj6ANong76gtjt63EDudO/5K0yBg5LYdAK Q==;
X-CSE-ConnectionGUID: tv02WnCnRX63YW0wGxLYnQ==
X-CSE-MsgGUID: oK/xIpdnRYCChonoBpUJeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="82021485"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="82021485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 20:35:06 -0700
X-CSE-ConnectionGUID: FLB8EhzySbuHvnPTvDQ4qQ==
X-CSE-MsgGUID: NcT1C7BeTqKGIbvIy4Sjfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="233168084"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.21])
 by fmviesa006.fm.intel.com with ESMTP; 11 May 2026 20:35:05 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t] lib/intel_pat: skip UC compression when FlatCCS
 unavailable
Date: Tue, 12 May 2026 03:35:04 +0000
Message-ID: <20260512033504.3665416-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

Use igt_require in place of igt_assert to avoid treating unsupported
platform conditions as test errors in CI. Since UC compression is
supported only on FlatCCS platforms, skip the test on platforms without
FlatCCS.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/intel_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 2f35bb772..bcf31b4b2 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -276,7 +276,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
 	igt_assert(intel_gen(dev_id) >= 20);
-	igt_assert(HAS_FLATCCS(dev_id));
+	igt_require_f(HAS_FLATCCS(dev_id), "FlatCCS not available on platform, skipping");
 
 	intel_get_pat_idx(fd, &pat);
 	igt_assert_f(pat.uc_comp != XE_PAT_IDX_INVALID,
-- 
2.43.0

