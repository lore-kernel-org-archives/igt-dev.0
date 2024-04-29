Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D179EC25B10
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 09:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7949E10FE2B;
	Mon, 29 Apr 2024 09:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBdnwPXV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E756510FE32
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714382169; x=1745918169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jZryLln9k7277dHy6DQMDi/xfFsBYV6UyIZDFSW9FN0=;
 b=gBdnwPXV88FZrzYnrF96WQI7EeLCAiUo80SFFWREab3uQPi/zLNR+g97
 M6Cl+TYBTIRu9NSZgNEzujMn5a9xfrSlUnyn5/Aev8NpqeJZJa6zI8IUm
 K3WM2jDCl7zIwHBa+Li/iK2lE8ZF6vKKgVRgyWRH1jkuFnNp16lwrGvih
 Zyy1ucBJoQBgoS8M/XrgZ1ofsUXtfW7pNl4tb2PiVI1hl+pBvK10xjbYo
 jDdkxO38NpMIGgIaXGNXYFXPUTDedR15hW3URBGhNB/982mQxMq3sjZsr
 zzCp2HdTBg9cf0aMjgH02LXN2gsKtBqhbQGp1UjfkrIbBOvisNBE4Nnkl w==;
X-CSE-ConnectionGUID: UMCFmiHAQjeg3A3PlnEScA==
X-CSE-MsgGUID: oHkeLc+mTiufOk8Td83lLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35428325"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="35428325"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:09 -0700
X-CSE-ConnectionGUID: RQ1rlgVFQmuKmfnMhah4Ug==
X-CSE-MsgGUID: izPxrPK8SdSuuc1qbLS38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26059874"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:07 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V5 5/8] tests/intel/kms_pm_lpsp: Force joiner support in
 bigjoiner checks
Date: Mon, 29 Apr 2024 14:39:27 +0530
Message-ID: <20240429090930.1905110-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
References: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
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

