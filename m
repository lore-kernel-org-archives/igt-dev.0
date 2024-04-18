Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC353C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 09:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481F010FB56;
	Thu, 18 Apr 2024 09:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cN103nBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A614610FB56
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713432376; x=1744968376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jZryLln9k7277dHy6DQMDi/xfFsBYV6UyIZDFSW9FN0=;
 b=cN103nBaqHdP1vDg6tlghP3xCEasysacw2YxGIYxq4eZHsVyeTw37kAm
 kVAPxrNMFpL46OIZHytOMRuntE9fTZ4xCszXy6f45fRzU76c1HCXGzi3h
 luX03QbgBz0i0Vfbb/Wke8JzmHTbqmk8a2rzARVKHHTZY7Ci6e1P8zMSh
 9GvBV7dRjDeV+Tg347YkQKoeZ6xgiS9ct76wINrkEe7zErIwFVd7tUy41
 OSrli/CYMMjk9yilLiS48jElnAqyQrwD04QjBpP7LsGSzItHOI8mI9nGF
 2IcHsV4u+NMztyBskBB9GmKv2N8Sh4b0HLUvCjR+YigUhDMAEZpLUvGFb A==;
X-CSE-ConnectionGUID: TqFyMNtpTHWkped0PCm0jg==
X-CSE-MsgGUID: eHEoLnL+SJK/oL/ZuQ5vaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31447797"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31447797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:16 -0700
X-CSE-ConnectionGUID: poRPzlLoSCaLT2YeoKH/Vg==
X-CSE-MsgGUID: rTRUaQcpRE6jF7MCcpwJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="53855390"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:14 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V2 3/6] tests/intel/kms_pm_lpsp: Force joiner support in
 bigjoiner checks
Date: Thu, 18 Apr 2024 14:49:56 +0530
Message-ID: <20240418091959.781560-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
References: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
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

