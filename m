Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E16FD7F98
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 11:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFD710EB0C;
	Fri, 27 Feb 2026 11:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISIvbq+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CD610EB0C
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 11:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772192503; x=1803728503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fWG0vvIKJ+byImpnODGVmMDpVewGq1waqLaOOdn9bwg=;
 b=ISIvbq+eP9E9C6ru/i+q2V45AadzOLxFQc2DDZ93r6BD7HdfLCfuFCVW
 b5uwYLD9nxpsiApFaVM3n+OUMm0O56Q20XzmYi9UK+9L/dbJ+0U2USdQG
 fte6qEGiZkeRAmsWOR6uTzq+GakIle8pXO0debZfF80X8DITU+vK5sxIr
 qvwx8q3pcOh7UDp11RD5xvlZNJ8qayCi/7FT0Zv8dAy/M9wEGhJzeJp2W
 XvBjgvvucntZ/D9RUTmsmBUid541tgH6EqEUup/tv5P008NeR+C+NxFAl
 05Hd2QV2PTDiuZG/4olqRK3K4i2EC9yPs3uvx6S8+pTru7GHfpzoSaLFR A==;
X-CSE-ConnectionGUID: 4GkvpnnUSJOoiBkDrSpqxQ==
X-CSE-MsgGUID: J0xwwBvhSoCrdCdONXbdGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73241318"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73241318"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 03:41:43 -0800
X-CSE-ConnectionGUID: 9dyQq/NERzqHTlYjqVsu7g==
X-CSE-MsgGUID: CHi63s0QTjKxm93dPqka3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="254655440"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 03:41:43 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/2] tests/intel/xe_eudebug_online: Set timeout for debugger
 VM fd sync
Date: Fri, 27 Feb 2026 12:41:32 +0100
Message-Id: <20260227114133.2850125-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227114133.2850125-1-jan.maslak@intel.com>
References: <20260227114133.2850125-1-jan.maslak@intel.com>
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

Set timeout_ns to DRM_XE_EUDEBUG_VM_SYNC_MAX_TIMEOUT_NSECS to allow
up to 10 seconds for cache invalidation to complete.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_eudebug_online.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 059f918a6..6009da4d6 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -904,6 +904,7 @@ static void vm_open_trigger(struct xe_eudebug_debugger *d,
 	struct drm_xe_eudebug_vm_open vo = {
 		.client_handle = vm->client_handle,
 		.vm_handle = vm->vm_handle,
+		.timeout_ns = DRM_XE_EUDEBUG_VM_SYNC_MAX_TIMEOUT_NSECS,
 	};
 	int fd;
 
-- 
2.34.1

