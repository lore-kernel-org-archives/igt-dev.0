Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9245CA0FED
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 08:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749E710E2F5;
	Tue, 26 Aug 2025 08:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V833QE81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1315A10E2F5
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756197700; x=1787733700;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oreWiOT7Vwd6B2aFIZ0V97RD1wcc2Z15X7PDmIbXrz0=;
 b=V833QE81L3VL7d+beLdvqLHsINAhm+wfNQ+E5RJjyKvIOp+15p46u3Pe
 /qUXibwdCivoqNzxxqA8scrYTHSzyBUIemDWJ13yW++6XblL3yEzK1LJB
 ikTgW142sQD9HECmRO8TzgcXIxdcU5oSRQ+SlUwwYDOlHPQxZIYyVMT1I
 u/TrNq4+zcMyESYDSOIaS5NqgHXkYOA2IfcI5J2hx4EEVeckynbPAaDy/
 YCbJ0r0O1EeoNbmFz/r27/f7rmywn45mi3lSdiFqH9HYo3gn9jvSiuvW9
 wdZ1letYXODwnb5QNE9jiFTcZK2y/SLgw1AMV9KwHdYXFW7FVbu/5qXLe w==;
X-CSE-ConnectionGUID: 6Fjddw2zTryjyye48vBVKA==
X-CSE-MsgGUID: Nf9dB6osTwuKoYMDBdklQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69020501"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69020501"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 01:41:40 -0700
X-CSE-ConnectionGUID: CT33vKkoRKevYxv7LucjYw==
X-CSE-MsgGUID: xR6+jk7YS2yWYXiAY7/YaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169124830"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa009.jf.intel.com with ESMTP; 26 Aug 2025 01:41:38 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com, nishit.sharma@intel.com
Subject: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Date: Tue, 26 Aug 2025 08:41:30 +0000
Message-ID: <20250826084133.897768-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826084133.897768-1-nishit.sharma@intel.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Added xe_vm_madvise() which issues madvise ioctl DRM_IOCTL_XE_MADVISE for
VM region advising the driver about expected usage or memory policy for
specified address range. MADVISE ioctl requires pointer to drm_xe_madvise
structure as one of the inputs. Depending upon type of madvise operation
like Atomic, Preferred LOC or PAT required members of drm_xe_madvise
structure are initialized and passed in MADVISE ioctl.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/xe/xe_ioctl.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  5 ++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 1e95af409..43bad8452 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -585,3 +585,59 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue, &timeout), 0);
 	return timeout;
 }
+
+int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
+		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
+{
+	struct drm_xe_madvise madvise = {};
+
+	madvise.extensions = ext;
+	madvise.vm_id = vm;
+	madvise.start = addr;
+	madvise.range = range;
+
+	if (type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
+		madvise.type = DRM_XE_MEM_RANGE_ATTR_ATOMIC;
+		madvise.atomic.val = op_val;
+	} else if (type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
+		madvise.type = DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC;
+		madvise.preferred_mem_loc.devmem_fd = op_val;
+		madvise.preferred_mem_loc.migration_policy = policy;
+		igt_debug("madvise.preferred_mem_loc.devmem_fd = %d\n",
+			  madvise.preferred_mem_loc.devmem_fd);
+	} else if (type == DRM_XE_MEM_RANGE_ATTR_PAT) {
+		madvise.type = DRM_XE_MEM_RANGE_ATTR_PAT;
+		madvise.pat_index.val = op_val;
+	} else {
+		igt_warn("Unknown attribute\n");
+		return -EINVAL;
+	}
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise))
+		return -errno;
+
+	return 0;
+}
+
+/**
+ * xe_vm_madvise:
+ * @fd: xe device fd
+ * @vm: vm_id of the virtual range
+ * @addr: start of the virtual address range
+ * @range: size of the virtual address range
+ * @ext: Pointer to the first extension struct, if any
+ * @type: type of attribute
+ * @op_val: fd/atomic value/pat index, depending upon type of operation
+ * @policy: Page migration policy
+ *
+ * Function initializes different members of struct drm_xe_madvise and calls
+ * MADVISE IOCTL .
+ *
+ * Returns 0 if success and asserts otherwise.
+ */
+int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
+		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
+{
+	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy), 0);
+	return 0;
+}
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 6302d1a7d..a5996cf65 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -99,5 +99,8 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		     uint32_t exec_queue, int64_t *timeout);
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       uint32_t exec_queue, int64_t timeout);
-
+int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
+		    uint32_t type, uint32_t op_val, uint16_t policy);
+int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
+		  uint32_t type, uint32_t op_val, uint16_t policy);
 #endif /* XE_IOCTL_H */
-- 
2.43.0

