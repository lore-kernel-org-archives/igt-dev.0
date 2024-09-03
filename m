Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F60CD37AC
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 19:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A291F10E071;
	Tue,  3 Sep 2024 19:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2hdaj+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C11610E071
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 19:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725393588; x=1756929588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fI0LOg0U/9BlK6iDtWyoV8ozDpMLUDTLPf8iZXfNZko=;
 b=X2hdaj+LvwOXc+WogVf4g99D6G5b31DBZxKF0Ik6IF6fC1hTwHvfew2d
 xBP+LKpD6bHkDYJmYSM+h8JE5ND2i2O8zno4fZw7hJcHo9ABTjBsmSJRC
 Mi7odmvPcfEJyVqelsvm6PrKW6UY8yR6rhCLda9KxvrcYwFKMS/jW0Joq
 IoVYAm5A2taGq6V8jVbY7VOCk9k9ypIqJKeORaVZ0rdI50GMILmLeaW8D
 77VxHF2cmcDvxqx2WcGNlhGI/zwMToGJV+gQywG3Mk6+ilbXQIT1UZFNi
 5Tbx55KSmP3mM/jn1CxFpVsRsqEZ4TbJa1K5Wzy01Hm1gsN8d+CdPrODP Q==;
X-CSE-ConnectionGUID: OX6ntmgeTNCwO6AousbX/g==
X-CSE-MsgGUID: xzbogXnWTMy9J5Sg4yU86w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34587316"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="34587316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 12:59:48 -0700
X-CSE-ConnectionGUID: TGnzAOUXQkmiIEYaAiJwHQ==
X-CSE-MsgGUID: n2zd63e5QwGe9kPtMjWmrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69183821"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 12:59:47 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/kms_psr: Add condition to check for eDP
 output before asserting PSR update
Date: Wed,  4 Sep 2024 01:29:17 +0530
Message-ID: <20240903195917.1527829-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903195917.1527829-1-ramanaidu.naladala@intel.com>
References: <20240903195917.1527829-1-ramanaidu.naladala@intel.com>
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

We do not have ALPM on the DP2.1 Panel Replay. Due to this, the
SRD_STATUS [SRD State] doesn't change from SRDENT_ON after Panel
Replay is enabled until it gets disabled. As a result, the igt
tests fail. To resolve this issue, add a condition to skip the
check in the 'psr_wait_update_if_enabled' function for DP2.1 PR.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_psr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index cf0ce4bb8..8671f33ea 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -642,7 +642,8 @@ static void run_test(data_t *data)
 		expected = "screen GREEN";
 		break;
 	}
-	igt_assert(psr_wait_update_if_enabled(data));
+	if (strstr(data->output->name, "eDP-") != NULL)
+		igt_assert(psr_wait_update_if_enabled(data));
 	manual(expected);
 }
 
-- 
2.43.0

