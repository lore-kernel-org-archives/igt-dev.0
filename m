Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5265CCD18D
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 13:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556E410E076;
	Mon, 13 Oct 2025 13:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSkqBoNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7648910E076
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760362039; x=1791898039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L1N9mlhznfeo6H98QSq3aC8AAV44AhGU9e0aMwecAfM=;
 b=dSkqBoNadmBqn2V7//I8wgdw6uIsMK2DvdON0bzLTF5LxRN+2Iw9UGpl
 hr2Qp+KFhuumbBeccZcCZyxUpS5kO1kfM8gWXjgYtelk5/tkxLS7o6nMY
 OOGtS7iZh0KcLm/OI3a/yo3XN8LGPwnqzepowROL5QeszSteQlqN/0WiK
 mbwR5hjErjmfvpvdvNNkWX6Hc1jk8RRZVPgFAt44QrDtAsxmq2UzUHx5p
 1gorC4UefWLMiGJadF1V5yy6vtfxVYQFpocv2PqdH3UyFC38OIsr08UiA
 V8C4NFPVjQFx7YC3V20a5lU/GeA/yysUL/84eEMsmoAN+rzipsV9tvBJb Q==;
X-CSE-ConnectionGUID: nAhmWIBCRWetIgtZ5eNSWQ==
X-CSE-MsgGUID: oH5LZIAtQSaDey+2ui8xHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61541967"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="61541967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:27:19 -0700
X-CSE-ConnectionGUID: JLbvPLT1Qv+NDVbGeUHduQ==
X-CSE-MsgGUID: W9jITotlQD2sp6L2GXRmAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185861423"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:27:15 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_sriov_vram: Skip the test on devices
 without VRAM
Date: Mon, 13 Oct 2025 15:27:08 +0200
Message-Id: <20251013132708.20990-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Add a check to ensure the test runs only on devices with VRAM.

Fixes: 0ef6c917ab1e ("tests/intel/xe_sriov_vram: Add test checking VF access to VRAM")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6320
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_vram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
index 74e7dffe9a..6c3c8e0314 100644
--- a/tests/intel/xe_sriov_vram.c
+++ b/tests/intel/xe_sriov_vram.c
@@ -346,6 +346,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 
 	igt_fixture {
 		pf_fd = drm_open_driver(DRIVER_XE);
+		igt_require(xe_has_vram(pf_fd));
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
-- 
2.40.0

