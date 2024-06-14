Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377C5C27C77
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A76910EC34;
	Fri, 14 Jun 2024 05:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlrXJWMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8D510EC32
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718343541; x=1749879541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z7IxTlfXEE4nQ/J3Qa8kzRX8FLrIquKDHrcfzu7udDA=;
 b=NlrXJWMS5jLhhVIzOrQXS3kxEdg7Gm9BWv+tS3TSmr50W/xlujsnVCvE
 quAMjyk5SFFm2kAWWkMjJ9l42+d2zpyIXr7fQlJs8Eq3dHicGf62ZxHuc
 D2TZwJuknWyzo7M5YI/Z6DhM/T0bG8BbEdsMYX1VcalNwkK1ik5M2f4Aq
 hOd+bOwt+5JsiUmSTstlmqOqifNBZmWZq0kdzvndQEo6wWYRAzIeQbVEJ
 SmVx6dglkYZSe/X77Amv7W7Tniulov56C/6tr/fwqGNjQFiuTi7KL0LDY
 j1FzDlvaKjSekGtOItjTdyAOyNXAf0wHEIQ3OzNIOQbzKwZOIH3Iy7zjx A==;
X-CSE-ConnectionGUID: k6P4Ot7FRpa/aPnjHd3bvg==
X-CSE-MsgGUID: km6MZdL0SD6T26wGSz85Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26331589"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26331589"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:39:01 -0700
X-CSE-ConnectionGUID: VIaBPiRKQiy++NuBZoJM7w==
X-CSE-MsgGUID: z82PidIiTYuIO13Kt4mG4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77864054"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:38:59 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 4/7] tests/intel/kms_psr_stress_test: Provide output
 to psr_wait_entry
Date: Fri, 14 Jun 2024 08:38:36 +0300
Message-Id: <20240614053839.1822879-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614053839.1822879-1-jouni.hogander@intel.com>
References: <20240614053839.1822879-1-jouni.hogander@intel.com>
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

