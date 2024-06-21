Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3304AC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 08:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DA610F0DD;
	Fri, 21 Jun 2024 08:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIfefHAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB9C10F0DC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 08:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718960120; x=1750496120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTVKz1MNVlgtoGMCkT0mzZSSlxZN/ZEGS65o5H14A2M=;
 b=cIfefHAC5S8AXBtMbvxWLORDVU1nahi06MV/9cXOl9YZmvecEKN9uNv+
 6bCfy1n5F4Qmgw/cbGxGimqxeq2PpUvy1zQMFN2Vkjg3FXt2nhApvGocU
 Cul8fB8Z7lORe+z4+CPSsjXsGucLrO7H36xePb4B3YQsbWjNDiyppqfK6
 Lp2Elem3W0E17wEneJM9iyAc06uPXGiv0lu+VvJmMGo2CH5cNcSIMeYCT
 +upWB50Kspf52N4VHB2ndO8BPMjTGwL2zx1r/pFRXjTTawttfKJmEmVDl
 wHxiqSczHjAQOd9SCVAWi1Q0PPrYfYN+QLxWeS/sRo+9HVXXn5vUabwkN Q==;
X-CSE-ConnectionGUID: eUC/pmm7QCSFG/sueWyNsw==
X-CSE-MsgGUID: x7ghCYI5R/WrM/GdpIQa0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41387666"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="41387666"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:55:20 -0700
X-CSE-ConnectionGUID: JcM6oswDQwuxG92oV0bUGQ==
X-CSE-MsgGUID: ECrm0TEORAavoB4oWvVhxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="42609044"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:55:19 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [i-g-t 1/4] tests/kms_vrr: Skip low RR mode check for
 seamless-virtual subtest
Date: Fri, 21 Jun 2024 14:17:08 +0530
Message-ID: <20240621084711.68444-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
References: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
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

As the low RR mode is not at all using in seamless-*-virtual
subtest, don't check for it.

Cc: Manasi Navare <navaremanasi@chromium.org>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 4b040fbe4..6fd04505e 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -865,7 +865,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 
 	/* Search for a low refresh rate mode. */
-	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
+	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
 		return true;
 
 	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
-- 
2.43.2

