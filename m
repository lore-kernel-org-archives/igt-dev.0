Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EA1EF8FF0
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 14:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678FA10EA0E;
	Wed,  4 Mar 2026 14:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mt88mDmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250F810EA05
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 14:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772634990; x=1804170990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GY9WaZitBDF1OLxd2fHfEF+yVOt6PH8bW4eTph1xnpM=;
 b=mt88mDmncAz6I2QMvPz92/TxadDqLhyEW/oksFpPch7M7hMc+gLNVQje
 3SaRdobmHYDpBrwGwEtXxtGvxSuoaaS7HyOKq382lHc9+H1UuHN5DkzrI
 ZIyVJQ0vYpZLCZIB1qBWKbt/VnpaWMyCY8ed64dIn8DGGaKAnng5PkYJ0
 ax4n4pRFCrXJsfdWYnGwug7s0Wd+nAD/iEWQhONxDtrwbCCmcr4Pp3b4g
 PnvRLOsO3g+bvDMtUyR8ncVwEnYCR/az6AGNJUR58QvZhKjeIy/m6Q3NC
 T2VbuAmtcTzyNkqqbhQ/EczYnzVUxj36n5wIjJ9trIPno+7oLsVUN4Shy g==;
X-CSE-ConnectionGUID: DTJ9SN7yQH2WHxzE8Ya3AQ==
X-CSE-MsgGUID: lMIx4ZN/QguhCsxlcgsmGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73743486"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73743486"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:36:30 -0800
X-CSE-ConnectionGUID: WQuzbs2wSFS38lLm9Ou3DA==
X-CSE-MsgGUID: 6s3VPywkS26Hija5f7wd5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="217517492"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:36:29 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/2] tests/intel/xe_eudebug_online: Set timeout for debugger
 VM fd sync
Date: Wed,  4 Mar 2026 15:36:18 +0100
Message-Id: <20260304143619.3854871-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304143619.3854871-1-jan.maslak@intel.com>
References: <20260304143619.3854871-1-jan.maslak@intel.com>
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

The vm_open_trigger() function opens a debugger VM fd via
DRM_XE_EUDEBUG_IOCTL_VM_OPEN leaving timeout_ns at zero. With a zero
timeout, fsync() on the fd may return -ETIMEDOUT immediately instead of
waiting for GPU cache invalidation to complete.

Set timeout_ns to VM_SYNC_TIMEOUT_NS to allow up to 2 seconds for
cache invalidation to complete.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 tests/intel/xe_eudebug_online.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 059f918a6..1af887bba 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -81,6 +81,7 @@
 
 #define STARTUP_TIMEOUT_MS	3000
 #define WORKLOAD_DELAY_US	(5000 * 1000)
+#define VM_SYNC_TIMEOUT_NS	(2ULL * NSEC_PER_SEC)
 
 #define PAGE_SIZE 4096
 
@@ -904,6 +905,7 @@ static void vm_open_trigger(struct xe_eudebug_debugger *d,
 	struct drm_xe_eudebug_vm_open vo = {
 		.client_handle = vm->client_handle,
 		.vm_handle = vm->vm_handle,
+		.timeout_ns = VM_SYNC_TIMEOUT_NS,
 	};
 	int fd;
 
-- 
2.34.1

