Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3851FD530A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 19:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1E010EBEC;
	Fri, 27 Feb 2026 19:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlmkVZVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC9610EBEC
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772219241; x=1803755241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7/exj2g3DmuSWGl1isBpekdbt+O6t+ujjl9p0fPSIUI=;
 b=HlmkVZViV7XO8oDfFdNEWTCN3hB763dc4j/ikzNyCLWMdbIHqqMttMHr
 P69gJDz/7MrnVK3e1iWtp94V5Gq5s6JThfeGCDRdUnxxJFivmAJNDv+IA
 Pbkm20UnNYKDqDx06K6KCbfJ4YMKt9r4sWBl7BDEcuetacfRcVAOlsz96
 nDqjxh7C3k5u1HKZx1ScLv/jA2M/SZo52PJTGz/OipHv7Y25JJWK8CLwu
 EVkmsSAEuuidW2tb4kpbQQ8QhLuU8J9ERsVk5StHn1QXKcLRI0OMJOnJm
 KJL83c3fy8m9SVARkUwUH3Bn7DQVJ7XbEDHDQ/2P85cvRUnL1k1lykoqe Q==;
X-CSE-ConnectionGUID: bpB1KeR4TDefASjSMBrgZg==
X-CSE-MsgGUID: hdN6of/fTDC3n5EjsNxuHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="72509988"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="72509988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 11:07:21 -0800
X-CSE-ConnectionGUID: ZZdeTQBXRNqSs8/IzW99cA==
X-CSE-MsgGUID: QFCDI1eQR8Kh3cd5JiZx7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221609422"
Received: from dut4086lnl.fm.intel.com ([10.105.10.85])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 11:07:21 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2] tests/intel/kms_fbcon_fbt: Drop igt_device_set_master call
Date: Fri, 27 Feb 2026 19:07:20 +0000
Message-ID: <20260227190719.19511-2-jonathan.cavitt@intel.com>
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

In kms_fbcon_fbt, igt_set_device_master is already called on the target
fd by drm_open_driver_master, so doing so again in the subtest function
is unnecessary.

v2: Do not modify kms_pm_rpm (Kamil)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 36de84f985..e44be15f60 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -371,7 +371,6 @@ static void restore_fbcon(struct drm_info *drm)
 
 static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
 {
-	igt_device_set_master(drm->fd);
 	kmstest_set_vt_graphics_mode();
 
 	igt_require(feature->supported_on_chipset(drm->fd, drm->debugfs_fd));
-- 
2.43.0

