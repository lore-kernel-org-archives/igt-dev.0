Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951DFC25B75
	for <igt-dev@archiver.kernel.org>; Thu,  6 Jun 2024 05:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A5010E050;
	Thu,  6 Jun 2024 05:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dme2irnF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F0710E050
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2024 05:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717653590; x=1749189590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YwTHuLpbJXNgoCDHfT42T6x3jFC6hfKBUm21PNDpV+A=;
 b=dme2irnFAtvZ/N8u1n1XN1imwzVO3wPdmFd3yHtDUVnA48bks6KANuOg
 eavSxVKtfRUFYEO9OF6rNCXU4YvdXxGv1l7nS+kZGbBKrBafvnCuEYUNO
 IAJYsXqUlto7q0wMnOG01USsHORIyrWIhiwbZKXm5UUQKDEM/MinwYkVG
 lQz+Svv5ZxVAmYelonXLE0OrAUFyvLTeFgChDCJXQPgboW+KS8l3qXHUP
 3USo0mHSqrUIGnSt4uB+6dA0lS8NIfGmNcM+G3TcnmodO+dgXzBXngYdX
 txFWGWJYrfl3+Bw2W8s9MRBx22wBTkIpm3uu3NjWBYeK6SU/yNPwqn2zh w==;
X-CSE-ConnectionGUID: /ScjX12WSI2+vq3KT9Nd2w==
X-CSE-MsgGUID: uRVe1ZQOSMaWcmvvWiuPQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25698750"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="25698750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:59:50 -0700
X-CSE-ConnectionGUID: 8BEkuBoOQvuyqaeiKdfxOQ==
X-CSE-MsgGUID: U8YAP9xhRQ+9GPP2MsDdcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="61050718"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:59:49 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: [PATCH i-g-t 1/3] tests/kms_vrr: Skip low RR mode check for
 seamless-virtual subtest
Date: Thu,  6 Jun 2024 11:22:03 +0530
Message-ID: <20240606055205.3296434-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240606055205.3296434-1-bhanuprakash.modem@intel.com>
References: <20240606055205.3296434-1-bhanuprakash.modem@intel.com>
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
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7f64d6806..9245305f8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -747,7 +747,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 
 	/* Search for a low refresh rate mode. */
-	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
+	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
 		return true;
 
 	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
-- 
2.43.2

