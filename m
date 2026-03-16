Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DE1F46442
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 09:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB1510E395;
	Mon, 16 Mar 2026 09:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NdjNLQMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89A410E395
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773655055; x=1805191055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5G8yrPHBPQcdVPekzgCC419mY3Hb9AK/N1/ap+PyuzY=;
 b=NdjNLQMimJMQIRMJD14XPBhLGBVhRZBHuV4+BQ5DzkIMp+A9m3vvPER4
 eJZI/ki8C2NQPZGtTb7MOuuP3S7kOb5vJ3OZXYClVO24OcI6aYfqn7rWR
 8o+Fp7DisYTOJEHfYA/TM6bPsz7ZQsAgEQWFD9dgrijD1735NhiBAV6ea
 S47NxKxFxIbHXdoMU47jpK0P2BiI2yi3nPJOpqU51gT50VNA5zNwJ/BVl
 fTvD9kzb3H2HxNBiLsg7F6yDgO1ezRjgmL+98uTAD0Fu7u4A/WRYrx52r
 4LCYosC8jolMmfG5KW7UOeJoAw+Qyjk+IuTNUNay/fYl7KNNbv2CVsevH A==;
X-CSE-ConnectionGUID: UuCfbMDZQHSmXmmLZ3294w==
X-CSE-MsgGUID: tzYGvKRnSs2mXtkFc0ptAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="97276303"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="97276303"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 02:57:34 -0700
X-CSE-ConnectionGUID: ercJpXUGTZy5ghvQFfR7vQ==
X-CSE-MsgGUID: XaZdlQmeQbCJPm+rFw4Xdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="221949954"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa008.jf.intel.com with ESMTP; 16 Mar 2026 02:57:32 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org,
	marcin.bernatowicz@linux.intel.com
Cc: lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 kamil.konieczny@linux.intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on SR-IOV
 VF
Date: Mon, 16 Mar 2026 16:01:14 +0530
Message-ID: <20260316103114.137910-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

The ctx-restore subtests use intel_register_read() via direct MMIO
(PCI BAR) access to verify that the batch buffer wrote the expected
register values. On SR-IOV Virtual Functions (VF), only a very limited
subset of registers is accessible. Registers like 0x4F100 are not
exposed to VFs, so the read always returns 0, causing a false test
failure.

Skip all ctx-restore subtests (post-bb, mid-bb, and their invalid
variants) when the device is running in SR-IOV VF mode.

v2: Use igt_skip_on_f instead of igt_require_f, reads better (Marcin)

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 tests/intel/xe_configfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 0db4af201..755524e7c 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -409,6 +409,7 @@ int igt_main()
 
 	igt_describe("Validate ctx_restore_post_bb with invalid options");
 	igt_subtest("ctx-restore-post-bb-invalid") {
+		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore_invalid(configfs_device_fd, "post");
 		close_configfs_group(configfs_fd, configfs_device_fd);
@@ -416,6 +417,7 @@ int igt_main()
 
 	igt_describe("Validate ctx_restore_post_bb");
 	igt_subtest("ctx-restore-post-bb") {
+		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "post");
 		close_configfs_group(configfs_fd, configfs_device_fd);
@@ -423,6 +425,7 @@ int igt_main()
 
 	igt_describe("Validate ctx_restore_mid_bb with invalid options");
 	igt_subtest("ctx-restore-mid-bb-invalid") {
+		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore_invalid(configfs_device_fd, "mid");
 		close_configfs_group(configfs_fd, configfs_device_fd);
@@ -430,6 +433,7 @@ int igt_main()
 
 	igt_describe("Validate ctx_restore_mid_bb");
 	igt_subtest("ctx-restore-mid-bb") {
+		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "mid");
 		close_configfs_group(configfs_fd, configfs_device_fd);
-- 
2.50.1

