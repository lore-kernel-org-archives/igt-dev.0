Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAC910ED678
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 13:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FB010EE41;
	Fri, 27 Mar 2026 13:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeRw7kC9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4953410E073
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617882; x=1806153882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hDJd1tPwUZI/kQulAxubnpXxL2WNhK21qwmBJEpsIV0=;
 b=YeRw7kC9T4yOJo7JKxy6lEDeZ6rvJFK8hjLNzUI5ZrwAxTYr8CBE4ZjD
 ZQSirFzbpm3XNJ3e8KYY6gXOkBeZc/cZqThG0a6wnyJ7jJdcDUvg1hAiv
 EmDJHehHP0qUhoxmcgm5i8dSDKPyZQLfWIvqP233WSaJi/wEKZBk1L5St
 FY/sBgC7A7WyX4O/298uzvTzRWLyuDAtpcmpJaRnQ9drs1Wn0xTwGSIoH
 /l+vRnpmNwTg7H4pvXi2eY6y5Epz6jt498MSK8fj0SmupWBuokAgEiSvv
 5FdQMHa0EMK57lKP+d7DXxlAyX0M27SvovEAlxTdhYq9BPYsdSgHohNOA w==;
X-CSE-ConnectionGUID: HI9yPJv6SGmIWsdANwFBew==
X-CSE-MsgGUID: V6bH2CL/S0y6mx0BIC0f+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75804634"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75804634"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:24:42 -0700
X-CSE-ConnectionGUID: KHciqWxvTuayYZ9rdHpLmA==
X-CSE-MsgGUID: qfYifxwSQB6YE7+ihF6pIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="230239083"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:24:42 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v8 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync()
Date: Fri, 27 Mar 2026 13:24:25 +0000
Message-ID: <20260327132427.2681193-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260327132427.2681193-1-sobin.thomas@intel.com>
References: <20260327132427.2681193-1-sobin.thomas@intel.com>
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
xe_vm_bind_lr_sync() wrapper for tests.

Refactor the implementation to use proper return-code handling and
user-fence synchronization, and add xe_vm_bind_lr_failable() for
callers that expect bind / overcommit failures.

v7: Introduced xe_vm_bind_lr_sync_failable (Thomas)
v8: Modified xe_vm_bind_lr_sync_failable and xe_vm_bind_lr_sync to call
    __xe_vm_bind_lr_sync

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/xe/xe_ioctl.c | 36 ++++++++++++++++++++++++++++++------
 lib/xe/xe_ioctl.h |  4 ++++
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index ea3f2fcaa..a8d315dfb 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -822,23 +822,47 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
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
 		.addr = to_user_pointer((uint64_t *)sync_addr),
 		.timeline_value = BIND_SYNC_VAL,
 	};
+	int ret = 0;
 
-	igt_assert(!!sync_addr);
-	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, size, &sync, 1, flags);
-	if (*sync_addr != BIND_SYNC_VAL)
+	if (!sync_addr)
+		return -ENOMEM;
+
+	WRITE_ONCE(*sync_addr, 0);
+
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, size, DRM_XE_VM_BIND_OP_MAP, flags,
+			   &sync, 1, 0,  DEFAULT_PAT_INDEX, 0);
+
+	if (ret)
+		goto out;
+
+	if (READ_ONCE(*sync_addr) != BIND_SYNC_VAL)
 		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
 	/* Only free if the wait succeeds */
+out:
 	free((void *)sync_addr);
+	return ret;
+}
+
+void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			uint64_t addr, uint64_t size, uint32_t flags)
+{
+	igt_assert_eq(__xe_vm_bind_lr_sync(fd, vm, bo, offset, addr, size, flags), 0);
+}
+
+int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			   uint64_t addr, uint64_t size, uint32_t flags)
+{
+	return __xe_vm_bind_lr_sync(fd, vm, bo, offset, addr, size, flags);
 }
 
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index b62d259fd..a7e38ea04 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -117,6 +117,10 @@ struct drm_xe_mem_range_attr
 void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
 			uint64_t offset, uint64_t addr,
 			uint64_t size, uint32_t flags);
+int __xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			 uint64_t addr, uint64_t size, uint32_t flags);
+int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			   uint64_t addr, uint64_t size, uint32_t flags);
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 			  uint64_t addr, uint64_t size);
 #endif /* XE_IOCTL_H */
-- 
2.52.0

