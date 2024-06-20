Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B2DC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 08:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A19C10E2F4;
	Thu, 20 Jun 2024 08:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0NO32z3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B54F10E2F4
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718872598; x=1750408598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LTVKz1MNVlgtoGMCkT0mzZSSlxZN/ZEGS65o5H14A2M=;
 b=J0NO32z3t4lu2ZH8cBy2WSWcv6T+tUPbEOFj+awRUNXWy0Ogn0OCoWcW
 y7pmGPjV5s7z4ayemQICucQJkugZ7+5BLOyHoOyeZ4fIFXTUCcT6gJXQO
 Su0CZFjptiKQbke1P3ifv28U9gmKpiNvxDYVKD+6zfIrqaICLyaWcPS6n
 9grx+u3zWFye2YlrDFuzKkOcSDvS1d3tVWdNYr8Zp5EIdnBfl81M8LlFF
 JDfKlpSxVw+2EdSDq8Gr1SH3YUSrLYECa3JI587Bcbv9C6ulg1weXdi7M
 /N86hVRqPa7xKfyxs0gk+pANfpXmNML1PRY9yEjFSJVDM9tDxiSzurIBA Q==;
X-CSE-ConnectionGUID: krGUIDFzRauvS7Ln51S1ew==
X-CSE-MsgGUID: KFSbM7hbQ7KWDe/O9pwDXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19611491"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="19611491"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 01:36:37 -0700
X-CSE-ConnectionGUID: dRy5VoluSjOf+df9MuBq0A==
X-CSE-MsgGUID: +7Ai9TziTw6ViZoPyVMrRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42026177"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 01:36:35 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [i-g-t 1/2] tests/kms_vrr: Skip low RR mode check for
 seamless-virtual subtest
Date: Thu, 20 Jun 2024 13:58:33 +0530
Message-ID: <20240620082834.4169435-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

