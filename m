Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E034CCD193
	for <igt-dev@archiver.kernel.org>; Sat, 18 Oct 2025 16:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A5010E084;
	Sat, 18 Oct 2025 16:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQxl0oGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4D310E084
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Oct 2025 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760804159; x=1792340159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uhe++V05mzXkfZAwTPYCeG5VSpzPF40O8De1v1az7Eg=;
 b=GQxl0oGgi3/BIpXQXDuSw8834hHKCnSNgs+oSmVlMysdoRrrJ2TqC5zk
 sjBClIf95bXMrdmyf/HU0xY8cZdX51Cma2MH6rXBah8Z3RaSWgttf5SMU
 E1JgNaEhuvp70O7SkSxHuevXTJ4E4qXdA2i8zJfDIhefwo1jAdlIHHA5R
 Qx3ixrYal8aKb8X0w96Mxq7N4mGW2ChOtsaWYEejAEG7hAUl8+WCZ6WvA
 jBr2/SlZ1IdZgMkwyeCa/fjkUsp9vwUeo+j0Pg2rwt1nTp3XlkeXu358j
 U5eyu49MV+r9ZBnAVwLPFH7dGeZF7CbdMM3xMaDP5RKGpFkPUoSQwHzyF A==;
X-CSE-ConnectionGUID: uHq2SgOTTwiGCpuhocB3tw==
X-CSE-MsgGUID: hFZ6KTAxQOuXgv7F7Zs6TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63139622"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="63139622"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 09:15:59 -0700
X-CSE-ConnectionGUID: kONzLnxwSVmMIWL0dBwoEw==
X-CSE-MsgGUID: vP0z/WxlQIuBFTUCqoucmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="183390676"
Received: from mfidelix-mobl3.gar.corp.intel.com (HELO localhost)
 ([10.94.248.204])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 09:15:57 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t 0/3] SR-IOV: PF restore_auto_provisioning helpers
Date: Sat, 18 Oct 2025 18:15:46 +0200
Message-ID: <20251018161549.999459-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

This series adds helpers to restore the PF's default auto-provisioning
state and uses them in tests to ensure clean teardown after VF disable.

Link: https://lore.kernel.org/intel-xe/20251015091211.592-1-michal.wajdeczko@intel.com/

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Marcin Bernatowicz (3):
  lib/xe/xe_sriov_debugfs: Add PF restore_auto_provisioning helpers
  lib/xe/xe_sriov_provisioning: Add helper to disable VFs and restore
    auto provisioning
  tests/intel: Use xe_sriov_disable_vfs_restore_auto_provisioning()

 lib/xe/xe_sriov_debugfs.c         | 40 +++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h         |  2 ++
 lib/xe/xe_sriov_provisioning.c    | 16 +++++++++++++
 lib/xe/xe_sriov_provisioning.h    |  1 +
 tests/intel/xe_pmu.c              |  2 +-
 tests/intel/xe_sriov_scheduling.c |  6 ++---
 6 files changed, 63 insertions(+), 4 deletions(-)

-- 
2.43.0

