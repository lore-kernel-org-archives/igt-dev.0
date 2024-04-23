Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C854C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 20:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B6911367B;
	Tue, 23 Apr 2024 20:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xp07b4IK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450DE11367B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713903372; x=1745439372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6cE/3zJmZnxMW7WGHZ6Gt2nXE0bUZeeBTldxBTWSZjI=;
 b=Xp07b4IKDPWvt0BTSzbU0gyP70EcqqtqsSM/Rd3UkXQm8LtiZ2qbU2Cj
 3qPsW95y6it0wNuSCfzn50QXBubSKgeKxNrUBP1+ClUkyp9EqhnO6E1nx
 NJ14FtfhG+AjgOXXTMmmk/whVcUTGd6oC0b91HWQLPKXrx4NMC5R/7y5e
 +6+HiAqZreCOC3CggOqbWO00dEPRPB+6yGIz2ymcSClIjtxjM0Isc+9XP
 EWDwXTxe22Ki6ocman3VdLSWVS9OPtcTfAMIRrK62YE3QQLfwXiwcZ2TW
 5OsYSoJVYwnOyBd1sSxSSZapppNIMrSHyS9O8/jQ8ZJ2l5ZbmMLF1zf7+ Q==;
X-CSE-ConnectionGUID: Iqnfi72PTM+DKJ24+67wMw==
X-CSE-MsgGUID: OY06+O9uTpSRSLqKVdGrTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20205325"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20205325"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 13:16:12 -0700
X-CSE-ConnectionGUID: HzS6oexlRBeB2dr2RplwdQ==
X-CSE-MsgGUID: RS6uxH8cQQSHlXX5V5Ld7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24995711"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 13:16:11 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, oak.zeng@intel.com, matthew.auld@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_vm.c: Enforce explicit WB caching in
 bind-flag-invalid
Date: Tue, 23 Apr 2024 13:16:01 -0700
Message-Id: <bf76c34f97ed5e2ff935d4e8ff31c68dd13eb2d8.1713902821.git.jagmeet.randhawa@intel.com>
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

Update the bind-flag-invalid test by replacing xe_bo_create
with xe_bo_create_caching, which introduces an additional
parameter for setting the CPU caching mode explicitly.
The cpu_caching parameter is now set to DRM_XE_GEM_CPU_CACHING_WB,
aligning the buffer object's caching policy with the Write-Back (WB)
memory type expected by intel_get_pat_idx_wb. Previously,
xe_bo_create relied on a default cpu_caching that may or
may not have been compatible with intel_get_pat_idx_wb.

Suggested-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 13cca2752..d40a6d76e 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1776,13 +1776,14 @@ static void bind_flag_invalid(int fd)
 	uint32_t bo, bo_size = xe_get_default_alignment(fd);
 	uint64_t addr = 0x1a0000;
 	uint32_t vm;
+	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
 	struct drm_xe_vm_bind bind;
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 
 	vm = xe_vm_create(fd, 0, 0);
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	bo = xe_bo_create_caching(fd, vm, bo_size, vram_if_possible(fd, 0), 0, cpu_caching);
 	sync[0].handle = syncobj_create(fd, 0);
 
 	memset(&bind, 0, sizeof(bind));
-- 
2.25.1

