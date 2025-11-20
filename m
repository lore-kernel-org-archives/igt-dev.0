Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1178CCF857B
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B574910E740;
	Thu, 20 Nov 2025 10:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXuBrFhr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3DF10E740
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634518; x=1795170518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9SIxaEPlUA0SlVwmebOrOXhLdTSJ06OtdUJC+V9PC3w=;
 b=PXuBrFhrUzdTOAJ8TeO2yqa71hkZ0VHeg43qnJ79a4Kf1eoej3hwD3Pm
 w33EMK1L5R33PsTO8PUvcz9IBXVyB50uMa90GV1c17VwI51uQy3ovR9H0
 PuGIYgWOYr+x6C65grqS0OV0ElgMQDmdEeRf/uZAWSuonRmmsop39mTWl
 6Uut0Rhdm/7aRnu4E0coN6bxupnI4FjnY1U5a9zcMxdH5aqufvAkndRAa
 azYI6wBJXglv1f18cFfdvyTVDPrZWbZJDx+gnEeD2SKKdDKKPJDGktUmW
 yErmAKoUtaELIXEVyfrKGyyjtZBpnztINFe0VoQZnbhZLe3iGB62L9fFj Q==;
X-CSE-ConnectionGUID: /YDlofYyR6ypTVvVyj6dTg==
X-CSE-MsgGUID: mAQxopDRRoiCq+zxsh3hwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65736289"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65736289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:28:38 -0800
X-CSE-ConnectionGUID: B6n1sp95SAOpHFC7cNWPZA==
X-CSE-MsgGUID: d8hffpc2RTOYpg/Kk7BXhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="221966479"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:28:37 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_sharpness_filter: Skip pipes without
 minimum scaler support
Date: Thu, 20 Nov 2025 16:05:32 +0530
Message-Id: <20251120103532.1055144-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251120103532.1055144-1-swati2.sharma@intel.com>
References: <20251120103532.1055144-1-swati2.sharma@intel.com>
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

Add a check in sharpness filter tests to skip pipes that do not support
at least two scalers. This avoids running the test on unsupported
hardware paths and prevents false failures.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sharpness_filter.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index ef3ce3995..2c33ed4c3 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -439,6 +439,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			data->pipe = &display->pipes[data->pipe_id];
 			data->mode = igt_output_get_mode(data->output);
 
+			if (get_num_scalers(display, pipe) < 2) {
+				igt_info("%s: Doesn't support minimum 2 scalers.\n",
+				kmstest_pipe_name(data->pipe_id));
+				continue;
+			}
+
 			if (!has_sharpness_filter(data->pipe)) {
 				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
 				kmstest_pipe_name(data->pipe_id));
-- 
2.25.1

