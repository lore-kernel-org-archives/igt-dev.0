Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B0B10A88E3
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 16:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DCD10EB3E;
	Thu, 26 Mar 2026 16:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AafLH6N4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DE410EA50
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774541434; x=1806077434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q+jFa93GcfITT47x0ITA1EJxRzektz6fwuwh/bdPbxI=;
 b=AafLH6N4q70MdrHDi14nQIQbdluEU5fjX1CAK6GA7YGcWJJoL6mg2eUG
 FQyIqxolIF7kEV3RgRArKjTXVJGqMOL8pe9u8ABN2miaud6c726+nfyS2
 ETpMYFedGXP+hC8gp3GyZhc4CWume/Z4TPpmPSjtm2Jj1dXnkgOpML4Zs
 3W8xZKZNozxu0K1yZZAzNmB9ywZTFDUJTEgWNnpXZIuMVQlHbZMYSeVHN
 wxSGNsEnz3/I77YMHGs7zYtdwG5q1MTG8Udodrs94p9EHqDXaiLVsjNFy
 Sz8J2HW5L9I3o+FGsHXkYtn4YWtBOgGiCiYnUI63J3Em+8/OxvEFI2Bcj Q==;
X-CSE-ConnectionGUID: ArSZtLwQTSOUs/G0LZYxNw==
X-CSE-MsgGUID: ucFRsbAoRw2UZRxfCsLq9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75488980"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75488980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:10:34 -0700
X-CSE-ConnectionGUID: GqbnhDykTMeVBwPsEjT8Tg==
X-CSE-MsgGUID: 2ZBA3B5UT4m9XA4MbtTeTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229505977"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.251])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:10:33 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dev@lankhorst.se,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 4/5] lib/xe: add __xe_vm_bind_lr_sync() failable bind
 helper
Date: Thu, 26 Mar 2026 17:10:06 +0100
Message-ID: <20260326161007.39294-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326161007.39294-1-thomas.hellstrom@linux.intel.com>
References: <20260326161007.39294-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add __xe_vm_bind_lr_sync() which performs a synchronous LR VM bind and
returns an error code instead of asserting, allowing callers to handle
expected failures such as -ENOMEM or -ENOSPC from the dmem cgroup
controller.

Refactor xe_vm_bind_lr_sync() to delegate to the new helper and assert
on the result, preserving existing behaviour for callers that do not
need to inspect the error.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/xe/xe_ioctl.c | 79 ++++++++++++++++++++++++++++++++++++++---------
 lib/xe/xe_ioctl.h |  3 ++
 2 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index ea3f2fcaa..9a0903bfb 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -822,40 +822,89 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 }
 
 #define	BIND_SYNC_VAL	0x686868
-void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
-			uint64_t addr, uint64_t size, uint32_t flags)
+/**
+ * __xe_vm_bind_lr_sync() - Bind a BO into an LR VM, returning errors.
+ * @fd: xe device file descriptor.
+ * @vm: VM id (must have been created with %DRM_XE_VM_CREATE_FLAG_LR_MODE).
+ * @bo: GEM handle to bind.
+ * @offset: Offset within @bo.
+ * @addr: GPU virtual address to map at.
+ * @size: Size of the mapping.
+ * @flags: %DRM_XE_VM_BIND_FLAG_* flags.
+ *
+ * Like xe_vm_bind_lr_sync() but returns an error code instead of asserting,
+ * allowing callers to handle expected failures such as -%ENOMEM or -%ENOSPC
+ * from the dmem cgroup controller.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
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
+	int err;
 
-	igt_assert(!!sync_addr);
-	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, size, &sync, 1, flags);
-	if (*sync_addr != BIND_SYNC_VAL)
-		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
+	if (!sync_addr)
+		return -ENOMEM;
+
+	WRITE_ONCE(*sync_addr, 0);
+	err = __xe_vm_bind(fd, vm, 0, bo, offset, addr, size,
+			   DRM_XE_VM_BIND_OP_MAP, flags, &sync, 1, 0,
+			   DEFAULT_PAT_INDEX, 0);
+	if (err) {
+		free(sync_addr);
+		return err;
+	}
+
+	if (READ_ONCE(*sync_addr) != BIND_SYNC_VAL)
+		xe_wait_ufence(fd, sync_addr, BIND_SYNC_VAL, 0,
+			       NSEC_PER_SEC * 10);
 	/* Only free if the wait succeeds */
-	free((void *)sync_addr);
+	free(sync_addr);
+	return 0;
+}
+
+/**
+ * xe_vm_bind_lr_sync() - Bind a BO into an LR VM, asserting on error.
+ * @fd: xe device file descriptor.
+ * @vm: VM id (must have been created with %DRM_XE_VM_CREATE_FLAG_LR_MODE).
+ * @bo: GEM handle to bind.
+ * @offset: Offset within @bo.
+ * @addr: GPU virtual address to map at.
+ * @size: Size of the mapping.
+ * @flags: %DRM_XE_VM_BIND_FLAG_* flags.
+ *
+ * Delegates to __xe_vm_bind_lr_sync() and asserts that the operation
+ * succeeds.  Use __xe_vm_bind_lr_sync() directly when the caller needs to
+ * handle expected failures such as -%ENOMEM or -%ENOSPC.
+ */
+void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			uint64_t addr, uint64_t size, uint32_t flags)
+{
+	igt_assert_eq(__xe_vm_bind_lr_sync(fd, vm, bo, offset, addr, size, flags), 0);
 }
 
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 			  uint64_t addr, uint64_t size)
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
 
 	igt_assert(!!sync_addr);
-	*sync_addr = 0;
+	WRITE_ONCE(*sync_addr, 0);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, size, &sync, 1);
-	if (*sync_addr != BIND_SYNC_VAL)
-		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
-	free((void *)sync_addr);
+	if (READ_ONCE(*sync_addr) != BIND_SYNC_VAL)
+		xe_wait_ufence(fd, sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
+	free(sync_addr);
 }
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index b62d259fd..7f899ea93 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -114,6 +114,9 @@ int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
 struct drm_xe_mem_range_attr
 *xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start,
 				    uint64_t range, uint32_t *num_ranges);
+int  __xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
+			  uint64_t offset, uint64_t addr,
+			  uint64_t size, uint32_t flags);
 void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
 			uint64_t offset, uint64_t addr,
 			uint64_t size, uint32_t flags);
-- 
2.53.0

