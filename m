Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F03FCC9CB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 06:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F09510E658;
	Tue, 10 Mar 2026 06:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4DosxYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FC310E658
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773125009; x=1804661009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w5PRIM30EwMqGnoUGtI6ccNo+jyD0i8aV7pdqLiHRic=;
 b=I4DosxYtcwXKwS9YMbQVroiViFCPRYoQbs2UzNzeS8h3Wxb6xefrKvln
 aTBRyv4lwGCbED+VsLxqxemHVccwxmNm3rQshfV7q7uy9my7bG6146IuO
 btJNJfI6Q1GSTbrtGPN/LgtGK4yJuSyvcAyXYWwNCg1IUVzhdQn88sVbM
 wqIXAhYtmpjxqY3l5nrV91bfPp9mRHwSiiesdWsUjeOhKvRgErB5wiiCG
 9MmTYRO/EEnMYs9nXrX5DpV+URqNCXy0BE5NICfHUhjQUyb0DMf5Haqnr
 L9WRCeP2P2cHHq02X6qFzSVeDxfmKLNE6kFnm+LslYk+cHOG/mvnjtQhR w==;
X-CSE-ConnectionGUID: mDbkbWh1SJuUxEc5I5gaDA==
X-CSE-MsgGUID: QsKYrLGZRkmaKQxznIJ1pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78039264"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="78039264"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 23:43:28 -0700
X-CSE-ConnectionGUID: BQVsWPY4T/GigB1MHfMQ9w==
X-CSE-MsgGUID: JZlpBrKhQZCH0a4RWp8ftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="224440172"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.69])
 by orviesa004.jf.intel.com with ESMTP; 09 Mar 2026 23:43:27 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add check for display require
 output
Date: Tue, 10 Mar 2026 12:07:35 +0530
Message-Id: <20260310063735.40069-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add igt_display_require_output() check to ensure at least one display
output is available before running igt_kms tests.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 2f822abea..d1c4a5019 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -771,6 +771,7 @@ int igt_main()
 		igt_require(igt_setup_runtime_pm(data.drm_fd));
 		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 		/* Make sure our Kernel supports MSR and the module is loaded */
 		igt_require(igt_kmod_load("msr", NULL) == 0);
 
-- 
2.25.1

