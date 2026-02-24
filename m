Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA72E9B249
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 10:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAA210E549;
	Tue, 24 Feb 2026 10:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CABePwJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EBE10E26E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771930045; x=1803466045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KuLVCUa50UoR8wxkBh1jRpzBBm4sgdCJgV+B9u/e0oM=;
 b=CABePwJWJFtEVGtjho4aYxD9Su/VOzMZ4KacBsDu1tI8XixywPEqdo76
 COI8wc0s8wGUm5nJKhMDTYGVSu/qqe00KDw5X6H+++B8/mPqEmfSSFL8S
 sIc43ZDx1S/2+0LqnzknbflUDh2/poYR9JKy1d1h3v1GU9G8tKM0uHdG+
 oJy4L6pVt7n7uHj8tNN/vG0zBbbbX6YAKyGSsAkUq3upbLV5MzmirLvQd
 wq//FXE2Jlyan0zMhZPqwDA3Wvl5XgikwjICTuhgMA3TpoQqA6E3Pbhuq
 Kja2Mw4G7uzcqb8qv+C+1kCgBdZdFThxiscnEMrsI1VXOsAiJ5QRRGHui Q==;
X-CSE-ConnectionGUID: 2ORrL6glQzWYnGkjATAhJg==
X-CSE-MsgGUID: 1U4m02kWTLWjbHG3AQTYTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72852300"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72852300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:47:25 -0800
X-CSE-ConnectionGUID: av/YBaBgR8a+bYuK8wyWag==
X-CSE-MsgGUID: ih7HX6OwSyyfJrlbM6UU/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246446328"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 02:47:23 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, kamil.konieczny@linux.intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on SR-IOV
 VF
Date: Tue, 24 Feb 2026 16:50:42 +0530
Message-ID: <20260224112041.297334-2-nitin.r.gote@intel.com>
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

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 tests/intel/xe_configfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 0db4af201..ab55e333b 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -409,6 +409,7 @@ int igt_main()
 
 	igt_describe("Validate ctx_restore_post_bb with invalid options");
 	igt_subtest("ctx-restore-post-bb-invalid") {
+		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore_invalid(configfs_device_fd, "post");
 		close_configfs_group(configfs_fd, configfs_device_fd);
@@ -416,6 +417,7 @@ int igt_main()
 
 	igt_describe("Validate ctx_restore_post_bb");
 	igt_subtest("ctx-restore-post-bb") {
+		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "post");
 		close_configfs_group(configfs_fd, configfs_device_fd);
@@ -423,6 +425,7 @@ int igt_main()
 
 	igt_describe("Validate ctx_restore_mid_bb with invalid options");
 	igt_subtest("ctx-restore-mid-bb-invalid") {
+		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore_invalid(configfs_device_fd, "mid");
 		close_configfs_group(configfs_fd, configfs_device_fd);
@@ -430,6 +433,7 @@ int igt_main()
 
 	igt_describe("Validate ctx_restore_mid_bb");
 	igt_subtest("ctx-restore-mid-bb") {
+		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "mid");
 		close_configfs_group(configfs_fd, configfs_device_fd);
-- 
2.50.1

