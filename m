Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11C7FEA80C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 05:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606A510E79F;
	Wed, 25 Mar 2026 05:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MV2G+/9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C008A10E1EB
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 05:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774418190; x=1805954190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iGh7i96d9szPnIel7oVJDtUHzCTKWtkkwmTxWk4B2Bo=;
 b=MV2G+/9sZrXiq5nmTxqaJwK7IOb8FYq4Zo5jXh92tZ9tUwbRVwV4IR8Y
 uUnqidcyINEhjf/IlU1e4yF5Y55Db3Aems9Qcg96/jY7XnrKTKLanTW8+
 bD05LqzNFw7kJjF1TEP8unUnJ6um3gBOflnEdnr8gPULJizFwnZAhQEqZ
 GjFyyO5gH8OP3eIrZ8eem1mEqE/Joj7i7yLqAzJSj8ZtXzd4k4IbYiPmp
 Sq6A2nVOsdc6yc5/pNzWBhRT5u9/CIkrBNb+w/5zxFk5GM+g8pYDbvbXC
 iGo+Axn2LqJkAF6RfPs3XoXjTu1MWWDDxI/wJjaKmtUwPT3yHMKyfsnFg g==;
X-CSE-ConnectionGUID: 03WI++DkTSOrQ1PUUNcHzA==
X-CSE-MsgGUID: dvfJBiPESNSt0LFdwdxQMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62999229"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="62999229"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:56:30 -0700
X-CSE-ConnectionGUID: MpobhfRsRh6STDFez1vl3w==
X-CSE-MsgGUID: RRZ6+40dQVSTz9CMlL4ngA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224842549"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:56:29 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v7 i-g-t 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync
Date: Wed, 25 Mar 2026 05:55:49 +0000
Message-ID: <20260325055552.2496156-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325055552.2496156-1-sobin.thomas@intel.com>
References: <20260320100554.2427448-1-sobin.thomas@intel.com>
 <20260325055552.2496156-1-sobin.thomas@intel.com>
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

Introduce a new failable variant that returns error codes instead of
asserting, allowing callers to handle errors explicitly.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/xe/xe_ioctl.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 16aae05c9..30c8a15f6 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -795,6 +795,42 @@ void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 	free((void *)sync_addr);
 }
 
+int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo, uint64_t offset,
+			   uint64_t addr, uint64_t size, uint32_t flags)
+{
+	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
+	struct drm_xe_sync sync = {0};
+	int ret = 0;
+	int64_t timeout = NSEC_PER_SEC * 10;
+
+	if (!sync_addr)
+		return -ENOMEM;
+
+	*sync_addr = 0;
+
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = BIND_SYNC_VAL;
+
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, size, DRM_XE_VM_BIND_OP_MAP, flags,
+			   &sync, 1, 0,  DEFAULT_PAT_INDEX, 0);
+
+	if (ret)
+		goto out;
+
+	if (*sync_addr != BIND_SYNC_VAL) {
+		ret = __xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL,
+				       0, &timeout);
+	if (ret)
+		goto out;
+	}
+
+out:
+	free((void *)sync_addr);
+	return ret;
+}
+
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 			  uint64_t addr, uint64_t size)
 {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 3ea651063..eba10bd34 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -116,6 +116,8 @@ struct drm_xe_mem_range_attr
 void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
 			uint64_t offset, uint64_t addr,
 			uint64_t size, uint32_t flags);
+int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo, uint64_t offset,
+			   uint64_t addr, uint64_t size, uint32_t flags);
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 			  uint64_t addr, uint64_t size);
 #endif /* XE_IOCTL_H */
-- 
2.43.0

