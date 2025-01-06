Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A397BE77199
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 09:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E7410E5F0;
	Mon,  6 Jan 2025 09:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlU+GqFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E864910E1CC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736156679; x=1767692679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HeUHHgE1Fz17+MeNJ/oT8vyI291PuPRrvovYKJH9GfQ=;
 b=DlU+GqFlGR8ShVwcf83IOpoEHPwqWGb3ps1g3zL+MiSX7Z5ixZpHWF5g
 IbGy2kdvxvwEePTjuPwJQaR/tThZugm1pUczUcPoc2lEnQ530tmK1Ki4x
 TjBLSqgCVoi2ZYmGafMbWy/V2mTyYrOi49pR1OOJJxHpBSJo0XXSCNt5H
 Qtd1c8m2dtYWQJXTiGJ08sKlfPGAtMwLcG2+24VApijWbhM3FDQ4m/FLb
 kdEOdmajZixWTiPK1cLplQ/JZ85TJGIxfKDLk0BO3v62V70vRqZ4MIpIC
 AKKWUYIjifphUnjKrU21ztbdeAmOcBH28cg8Un+3P1D2ywHKKZHxVMPhG g==;
X-CSE-ConnectionGUID: Ze9bxlzPSEmYma16W9jT7Q==
X-CSE-MsgGUID: DRuRsINAQs6rCsdUg00RQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36413268"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="36413268"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 01:44:39 -0800
X-CSE-ConnectionGUID: R3KI+qBgS9+LpMwcY110Lw==
X-CSE-MsgGUID: fWzfzjeIQpWQPymf6Hq/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="107251565"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 01:44:37 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/chamelium/kms_chamelium_edid: Remove
 unnecessary hotplug detection in EDID test
Date: Mon,  6 Jan 2025 15:12:58 +0530
Message-ID: <20250106094259.931356-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106094259.931356-1-ramanaidu.naladala@intel.com>
References: <20250106094259.931356-1-ramanaidu.naladala@intel.com>
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

Remove redundant hotplug detection assertion from
test_suspend_resume_edid_change. Hotplug detection is unnecessary
after modeset disable.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index e572a6468..ff2a19e48 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -419,8 +419,6 @@ static void test_suspend_resume_edid_change(chamelium_data_t *data,
 	chamelium_reset_state(&data->display, data->chamelium, port,
 			      data->ports, data->port_count);
 
-	/* Catch the event and flush all remaining ones. */
-	igt_assert(igt_hotplug_detected(mon, CHAMELIUM_HOTPLUG_TIMEOUT));
 	igt_flush_uevents(mon);
 
 	/* First plug in the port */
-- 
2.43.0

