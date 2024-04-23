Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EC9C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 12:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538C113146;
	Tue, 23 Apr 2024 12:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEdWqFC3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4B810FC28
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 12:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713875583; x=1745411583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jZryLln9k7277dHy6DQMDi/xfFsBYV6UyIZDFSW9FN0=;
 b=LEdWqFC39P9hJx2dmk3dUQOra8PUG1TIx2ZscAjAfhySD4AmUfN9TH6W
 MyoW+b+OT7DMvOD3oP9NxyjlUC3Daoi+5xu4GoqddGl4/VyyuXK7g57yM
 qj19v2cEjFT1UILtguE7TY4uD3GMUbPHEVuwSsVt5CHJdG6aig1ehv5Be
 EFAGWI92Eq9tH/XobE9OdtiaPmcpCQ2T+ylcMxvHDNBKiv7g2GTYJTuOW
 4grhvtTWaRv8xVDx3IqBAbgNKyrmdaYHc2uLqApJKG8DakBB/pOYBboDh
 APyE/WqjUnxmNWbcGebTFppsCDkRcXmfZgQqzpQLD/AVT3vZnL7hxqnnA A==;
X-CSE-ConnectionGUID: z6I1vTXNTd+WGB69PK3fZw==
X-CSE-MsgGUID: sd3kHJJfR0yk/Qnwj/t0rA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20067051"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20067051"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:33:03 -0700
X-CSE-ConnectionGUID: Nht92f4fTCiW2aIMDV49yg==
X-CSE-MsgGUID: CUKbJPRtTCKXzt3XHAyeHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24361338"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:33:01 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V4 4/7] tests/intel/kms_pm_lpsp: Force joiner support in
 bigjoiner checks
Date: Tue, 23 Apr 2024 17:56:33 +0530
Message-ID: <20240423122636.1241111-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
References: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_lpsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index a76b423f4..f9ac508fb 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -163,6 +163,9 @@ static bool test_constraint(data_t *data)
 	mode = igt_output_get_mode(data->output);
 
 	/* For LPSP avoid Bigjoiner. */
+	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
+		return false;
+
 	if (igt_bigjoiner_possible(mode, max_dotclock)) {
 		for_each_connector_mode(data->output) {
 			mode = &data->output->config.connector->modes[j__];
-- 
2.43.2

