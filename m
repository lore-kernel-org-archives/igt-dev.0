Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD63F8DFEA
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A67D10E992;
	Fri, 17 Apr 2026 08:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loUwu3uy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AC410E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776415436; x=1807951436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T+eMKQTu+cyZ4BX5/XbP2RStcMfYDHv3VogFkmKUzLc=;
 b=loUwu3uyZjPZUCHZSyZRyogJklk3qHbsXBQ3K2if4vyvWDhCy5OXOfDs
 1lIa/4Vv9LeT71KxJrlPTEt/YNbKz2Yi613qLhITylS8Y2ee/1Tp6BCnl
 yvRcsGy87wWqm1klE4613HhSbEE//qfd2iUWBv6gTenTEKC52BKuKNZSP
 /6I3wfwIkcb2ECUdPmMCtGRT0TbBluH8foJ6TULickZF9OLR8WQRzf5QN
 284wBIJAbRfJ5UNdOuUrKcVQBoPAybLwpIeS+kTIBdmTT0RFE+Ug0rq5k
 8vM/BgB6qFXyeZqZuhvC1LyQkjN3TSnveUJyL9FxTp9ekCghgvkTHboeo Q==;
X-CSE-ConnectionGUID: 1SSUTktiRqWyteVBUQeteg==
X-CSE-MsgGUID: Z87cBqClQDmaDOYkiFXuTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81308448"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81308448"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:43:56 -0700
X-CSE-ConnectionGUID: tmrWVdVhSh2F+dnmnqObXQ==
X-CSE-MsgGUID: 1OJvAEqeRaC9XJi8+xbH6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235361750"
Received: from unknown (HELO linux-Meteor-Lake-Client-Platform.iind.intel.com)
 ([10.223.55.75])
 by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 01:43:55 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 7/7] tests/intel/kms_pm_dc: Remove unused pkgc functions
Date: Fri, 17 Apr 2026 14:05:06 +0530
Message-ID: <20260417083506.33404-8-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417083506.33404-1-mohammed.thasleem@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
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

Clean up unused pkgc residency functions.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 48 -----------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index e268b0696..bf2d22ddc 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -530,54 +530,6 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
-static unsigned int read_pkgc_counter(int debugfs_root_fd)
-{
-	char buf[4096];
-	char *str;
-	int len;
-
-	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
-	igt_skip_on_f(len < 0, "PKGC state file not found\n");
-	buf[len] = '\0';
-	str = strstr(buf, "Package C10");
-	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
-
-	return get_dc_counter(str);
-}
-
-static void test_pkgc_state_dpms(data_t *data)
-{
-	unsigned int timeout_sec = 6;
-	unsigned int prev_value = 0, cur_value = 0;
-
-	prev_value = read_pkgc_counter(data->debugfs_root_fd);
-	setup_dc_dpms(data);
-	dpms_off(data);
-	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
-		  timeout_sec * 1000, 100);
-	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
-	dpms_on(data);
-	cleanup_dc_dpms(data);
-}
-
-static void test_pkgc_state_psr(data_t *data)
-{
-	unsigned int timeout_sec = 6;
-	unsigned int prev_value = 0, cur_value = 0;
-
-	prev_value = read_pkgc_counter(data->debugfs_root_fd);
-	setup_output(data);
-	setup_primary(data);
-	igt_require(!psr_disabled_check(data->debugfs_fd));
-	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
-	psr_dpms(data, DRM_MODE_DPMS_OFF);
-	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
-		  timeout_sec * 1000, 100);
-	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
-	psr_dpms(data, DRM_MODE_DPMS_ON);
-	cleanup_dc_psr(data);
-}
-
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
-- 
2.43.0

