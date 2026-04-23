Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A16FAD3E7
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 04:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256D810E2EB;
	Thu, 23 Apr 2026 04:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktNsDQKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB2E10E2EB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 04:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776917944; x=1808453944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GHwv8ctaMKJrU5d5Q930AWDCkvW7Bgch3qKNwDv1B1c=;
 b=ktNsDQKIza3XRdbW9TmIryg15+mlCB2EsaJxSbWZnnoYle0EEGjAq2zg
 mA2W2V238O1ixpL/3BYKEpMNTNAVU28ueUu0aNspCt8XO+A0L1xzRRffw
 flhAOdKwH+yaiBiHR5ZlKjWPCMgjsTj1LilfTz6yWsTrWFtXz6hc202ca
 1iV2TVcrR3uGLR4n2c7WIhPeqmbRp+WUf5wx96HFhcVckRFHmgenWXDNB
 HghqXBXa5ay3SaDlpuNzPoxz5cIjuPKYRs6260l/TEKNiAFAIjb/qhbSi
 1uf+PeXLFDNXJXHJqTIoeN73EZF++5jnBk2BHWMervYT00lYk1RViQZxc A==;
X-CSE-ConnectionGUID: njQKx/TZQSibFypwQROgKA==
X-CSE-MsgGUID: GHt813OyRUKvb9L2rN6IFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88186946"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88186946"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 21:19:04 -0700
X-CSE-ConnectionGUID: U8lvj0ZJT4yafJqb/8H8Kw==
X-CSE-MsgGUID: 1Kp4WxeIS820rxnbUmguLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232855963"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 21:19:04 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v12 1/2] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync()
Date: Thu, 23 Apr 2026 04:18:53 +0000
Message-ID: <20260423041854.496640-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260423041854.496640-1-sobin.thomas@intel.com>
References: <20260423041854.496640-1-sobin.thomas@intel.com>
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

Add __xe_vm_bind_lr_sync helper function which returns standard error
codes instead of asserting on failure. This allows calling function
to handle VM bind failures explicitly while preserving the existing
xe_vm_bind_lr_sync() wrapper for tests. This enables callers that
expect bind / overcommit failures.

v7: Introduced xe_vm_bind_lr_sync_failable (Thomas)
v8: Modified xe_vm_bind_lr_sync_failable and xe_vm_bind_lr_sync to call
    __xe_vm_bind_lr_sync
v9: Removed redundant typecast and removed xe_vm_bind_lr_sync_failable

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/xe/xe_ioctl.c | 35 +++++++++++++++++++++++++----------
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 1dae56444..e13195e16 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -860,23 +860,38 @@ uint32_t xe_vm_madvise_purgeable(int fd, uint32_t vm_id, uint64_t start,
 }
 
 #define	BIND_SYNC_VAL	0x686868
-void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
-			uint64_t addr, uint64_t size, uint32_t flags)
+int __xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			 uint64_t addr, uint64_t size, uint32_t flags)
 {
-	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
+	uint64_t *sync_addr = malloc(sizeof(*sync_addr));
 	struct drm_xe_sync sync = {
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
-		.addr = to_user_pointer((uint64_t *)sync_addr),
+		.addr = to_user_pointer(sync_addr),
 		.timeline_value = BIND_SYNC_VAL,
 	};
-
-	igt_assert(!!sync_addr);
-	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, size, &sync, 1, flags);
-	if (*sync_addr != BIND_SYNC_VAL)
-		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
+	int ret = 0;
+
+	if (!sync_addr)
+		return -ENOMEM;
+	WRITE_ONCE(*sync_addr, 0);
+	ret = __xe_vm_bind(fd, vm, 0, bo, offset, addr, size, DRM_XE_VM_BIND_OP_MAP, flags,
+			   &sync, 1, 0,  DEFAULT_PAT_INDEX, 0);
+	if (ret)
+		goto out;
+
+	if (READ_ONCE(*sync_addr) != BIND_SYNC_VAL)
+		xe_wait_ufence(fd, sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
 	/* Only free if the wait succeeds */
-	free((void *)sync_addr);
+out:
+	free(sync_addr);
+	return ret;
+}
+
+void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			uint64_t addr, uint64_t size, uint32_t flags)
+{
+	igt_assert_eq(__xe_vm_bind_lr_sync(fd, vm, bo, offset, addr, size, flags), 0);
 }
 
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index ceb380685..768f77246 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -120,6 +120,8 @@ struct drm_xe_mem_range_attr
 void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
 			uint64_t offset, uint64_t addr,
 			uint64_t size, uint32_t flags);
+int __xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			 uint64_t addr, uint64_t size, uint32_t flags);
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 			  uint64_t addr, uint64_t size);
 #endif /* XE_IOCTL_H */
-- 
2.52.0

