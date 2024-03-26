Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393DDCD11DD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 13:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C1C10EE3E;
	Tue, 26 Mar 2024 13:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKI9Stm4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A54910E9E2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711459243; x=1742995243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gFyjRpWW9UtrhTXoLFxp1H0/vo5aJU69IxHQs4bUWWw=;
 b=QKI9Stm4d2B19431pnA+xCz0gKe6TjrlE2th2n9g4KEKsPdjQLaZOvix
 6hTm0b2aUk6jNXz7JA9UAmAPg+DXLyVquC8Dz1ocLP4fP1szDmFbvP1HG
 iwlAtjoPIlWBKHlLYQsKC95pExFueN60l48rJ6s4lAoS5yP59TQ3bC7Vs
 RVYeVwtWwIfHknaNwVMY8t+kfQp/K8brKVuC7TZEdZc8GQcg83KtbCPWc
 K7Tg0OPAtMqFj1HP9gIInxLWYZBGcmoaO3LytUWxlaJShhfjFtq729wNX
 HG0JuCIKzbEq3wn8YaIKsnVQby9c8dbDYizr/QxEAC+F/TCrMaNyRaKaT A==;
X-CSE-ConnectionGUID: 7NTFs/GaR3uFbEMTcsaeJQ==
X-CSE-MsgGUID: 2G70NfGiRiac5TSEBjJjaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10302173"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10302173"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 06:20:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20508283"
Received: from rvuia-mobl.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.55.55])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 06:20:41 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_pm_dc: Ensure PSR is enabled
Date: Tue, 26 Mar 2024 15:20:11 +0200
Message-Id: <20240326132012.3747302-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
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

In certain cases PSR support is informed, but it doesn't get enabled
due to some limitations. This is causing failures which are actually just
expected behaviour. Fix this by checking PSR is really enabled and skip in
case it is not

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9737
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_pm_dc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 7deebf83d..176f7a04b 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -399,6 +399,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
 	dc_counter_before_psr = read_dc_counter(data->debugfs_fd, dc_flag);
 	setup_output(data);
 	setup_primary(data);
+	igt_require(!psr_disabled_check(data->debugfs_fd));
 	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
 	check_dc_counter(data, dc_flag, dc_counter_before_psr);
 	cleanup_dc_psr(data);
@@ -605,6 +606,7 @@ static void test_pkgc_state_psr(data_t *data)
 	prev_value = read_pkgc_counter(data->debugfs_root_fd);
 	setup_output(data);
 	setup_primary(data);
+	igt_require(!psr_disabled_check(data->debugfs_fd));
 	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
 	psr_dpms(data, DRM_MODE_DPMS_OFF);
 	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
-- 
2.34.1

