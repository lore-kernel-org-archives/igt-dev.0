Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BC4E7716D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 12:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE35410EE3B;
	Thu,  5 Dec 2024 12:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMbC7FGE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4532610EE3B
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733401617; x=1764937617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XHxp7vHvWwW715wRhwkdkX+vpd9sR6N51mkz49k+PrE=;
 b=VMbC7FGEiPz2DMYkeeWmA1LU/3btB2vdDHGZtY0/mh41KmbudVCQsxTM
 PlL9EiAb5cmXUUeZ/gbJWaDyxdhWwuMPexulxxvc1r0MLozS2UIrcauI/
 kSc8O/eWYjLS9/y3VNAcfFrVbBBRRPpc711i0+yoYo4xApTtLkonUML0C
 ump7RdGQR/VSKE/LLsMRIu1XHjEptIaUPFGgipLy8KeSlwVY/EwCfvzTY
 RTlYY8jhyRtWNpPMEZJy+cVd++zDTQAtKR0RA00LeSI0A6+Q9gyZfwY7m
 PeDDmDxVfDTlLCzh/IbGN7CMzTg2cJcdbs0ciSb6lMDrxZKgOCpk5EASk g==;
X-CSE-ConnectionGUID: k8VdVAjPTGaHCXQMLh+7lg==
X-CSE-MsgGUID: MqreRo5KSreLuNEpkRqPCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33842367"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33842367"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 04:26:57 -0800
X-CSE-ConnectionGUID: bxSYm+6wRJmOWCf6r9cKxg==
X-CSE-MsgGUID: 9G3vJKGARoSqN1d1eRkj1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99121141"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 04:26:55 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_scaling_modes: Add informative
 messages for skipped scaling mode tests
Date: Thu,  5 Dec 2024 17:55:27 +0530
Message-ID: <20241205122528.3761118-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205122528.3761118-1-ramanaidu.naladala@intel.com>
References: <20241205122528.3761118-1-ramanaidu.naladala@intel.com>
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

Add `igt_info` messages to provide more context when skipping outputs
that do not support scaling mode. Include `igt_info` messages to
indicate when invalid pipe/output combinations are skipped.

V1: Fix alignment issues. (Pranay)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_scaling_modes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 5fd34c4b2..e8aeb7409 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -117,8 +117,11 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		igt_display_reset(display);
 
-		if (!has_scaling_mode(output))
+		if (!has_scaling_mode(output)) {
+			igt_info("Output %s does not support scaling mode.\n",
+				igt_output_name(output));
 			continue;
+		}
 
 		igt_output_set_pipe(output, pipe);
 		if (!intel_pipe_output_combo_valid(display))
-- 
2.43.0

