Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFB8C25B10
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 11:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6237610E08C;
	Thu,  9 May 2024 11:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cL8iPrA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB4910E08C
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715252409; x=1746788409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VMTRWoa6NjaXBYRV3tb4UH8WZkZ1OI2ze+Rc3EDa6Uc=;
 b=cL8iPrA9kTkICIgfS0sddfaaj2RfSegsT0fbWAD+8bcwMbTZWJ5bZPyO
 8YDoX8kirZhQKydIwKVI6fnb3ebQgqu+QhD0JQB5kcw1DSvUNfsEphDKc
 AIe5gJE6DGH3rJM050zPHkqll3+JrVC0s7rue0HM9sImT1LltTlmVvNhF
 3Af3/W79J1W5K66DvqSWQc79SV7yN4O35q/H5JuzdhK/S4zrJ6jA7+e5g
 RSPWWHQMiG3CUdFD3AHA7LEKgHNvz/6R8h2Qv4VIdec0bmP5jEKXuLGuT
 URnmQZArahN6VzK09DaaGsZBQdHDNxE45GlCUKulaTaiPnwN/gl7Zb5MG g==;
X-CSE-ConnectionGUID: lwMsQOUxSDGoeDRR3tFJKg==
X-CSE-MsgGUID: Um6lLzrlQhK4JpfcNOTeDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11295276"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="11295276"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 04:00:08 -0700
X-CSE-ConnectionGUID: 40PWvLjfRnGrG9++YoHTkw==
X-CSE-MsgGUID: cbOdPK9+RlKCs1B74J9MIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="33739905"
Received: from mbernato-z370.igk.intel.com (HELO localhost) ([10.91.214.41])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 04:00:06 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH i-g-t] tests/sriov_basic: Restore the igt_sriov_is_pf check
Date: Thu,  9 May 2024 10:59:56 +0000
Message-ID: <20240509105956.4118226-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

The requirement `igt_sriov_is_pf` is essential for accurately skipping
tests in scenarios where the `sriov_totalvfs` attribute is absent. This
update restores the previously removed check to ensure proper test
behavior under such conditions.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/sriov_basic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 1bc082d76..74f1ce41d 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -120,6 +120,7 @@ igt_main
 
 	igt_fixture {
 		pf_fd = drm_open_driver(DRIVER_ANY);
+		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_vfs_supported(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
-- 
2.31.1

