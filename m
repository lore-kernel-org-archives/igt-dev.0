Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E56CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 08:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAF410E5C1;
	Tue, 28 Oct 2025 08:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQLggzjk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7782C10E5C1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761641039; x=1793177039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zE35WJ5Au2SgdFk/w9sClCL75mfNStTQKfO5uhyTuNE=;
 b=nQLggzjkmtZwHcAnbeobkuT7WGxCXbuhFhE6dAzcNn8Bt+pF+JftNARi
 Bj4/pywZxBGech/SjCnXsO5sC+ZbJUvGma/7yQFovMPU6Fbf2kNS82P57
 Bjx8bMKVnA+icnakmoYBphB1jtr9irnKd0f3q9k9YMvKJqwSZZxPjoasw
 /AMCaDHr77H6gWIJO2JboWRNjjNMlONqGwxhmp/9qps6T27X64YPtmCY4
 9BKiuNDQ7rPQymMpnnN46hGS7CHQF0wr9SVcOfYnXgtuRi2xWbf9iPjCY
 hmxa3cdjczKksjZLQiiRDJA4Ci51Yixpb2ro0cBdiVwRc64d71KnI4axd g==;
X-CSE-ConnectionGUID: RXeE9jpLRrSnQpPgF+yg8Q==
X-CSE-MsgGUID: Xm5PqND/SuufPyDpq228sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63829501"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63829501"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:43:59 -0700
X-CSE-ConnectionGUID: AjSBChoWQYCd6vcQI/375g==
X-CSE-MsgGUID: VMbnXcw8R2ChXGeDCeuoyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184914690"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 01:43:55 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com
Subject: [PATCH v1 1/4] tests/kms_vrr: Correct TEST_LINK_OFF flag handling
Date: Tue, 28 Oct 2025 14:13:51 +0530
Message-ID: <20251028084354.2682743-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
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

Need to correct handling of TEST_LINK_OFF bit added in
data->flag while executing flip_and_measure.

Fixes: 67333a629385 ("tests/kms_vrr: Reduce unnecessary logging in specific test cases")
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 1d9e579b0..8347a3e00 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -513,7 +513,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 
 		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
 
-		if (data->flag != TEST_LINK_OFF)
+		if (!(data->flag & TEST_LINK_OFF))
 			igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz), Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f Hz)\n",
 				 i, rates_ns[i], (float)NSECS_PER_SEC / rates_ns[i],
 				 threshold_hi[i], (float)NSECS_PER_SEC / threshold_hi[i],
@@ -583,7 +583,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		while (get_time_ns() < target_ns - 10);
 	}
 
-	if (data->flag != TEST_LINK_OFF) {
+	if (!(data->flag & TEST_LINK_OFF)) {
 		igt_info("Completed %u flips, %u were in threshold for [", total_flip, total_pass);
 
 		for (int i = 0; i < num_rates; ++i) {
-- 
2.48.1

