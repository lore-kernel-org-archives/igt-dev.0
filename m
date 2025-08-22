Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6656CA0FE1
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 09:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B75310EAAA;
	Fri, 22 Aug 2025 09:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqMYxbNL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE55610EAA9
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755853605; x=1787389605;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oreWiOT7Vwd6B2aFIZ0V97RD1wcc2Z15X7PDmIbXrz0=;
 b=IqMYxbNLu4OT+5iITbhRV7Mz/C3qpJavfmZzqTJRKIG9ZhoC7lKvevrH
 rhUxbjbwFe6Vmdqfd73ODxX2Ut2Xip0daMQ2sajI1HIkri0Ba1ALb3jtr
 azp4fksEwmHR/Ckgn17L4H1UawEe55S8uSM+6QSi02nXU5cCIiFqVauRH
 kDmxaXQhMnaZyHBwO4UUiBglHYd6KjuPMHHu8spTF65pfgCEGjDMdbgam
 NjzFaF42smWMRQcBNRdG+15Kbhqb+87ETFAGAVCz16GO8FKPrrKcMjLot
 UrZ5K1G88K0utRUqJsffUa+VInpinRRo5FCr4HdrsAaDLQ1mH51aSJ+UN A==;
X-CSE-ConnectionGUID: qsgbAcWMQnacFO6kqJcg5A==
X-CSE-MsgGUID: H40cXz/oQqiotwyUF/J0mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58021093"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58021093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:06:44 -0700
X-CSE-ConnectionGUID: Hp7Ch2CFRKSMvn5RCtmZ8w==
X-CSE-MsgGUID: WAEBzq/MQBy3VCfWTcG3Tg==
X-ExtLoop1: 1
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 02:06:43 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Date: Fri, 22 Aug 2025 09:06:36 +0000
Message-ID: <20250822090639.508747-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822090639.508747-1-nishit.sharma@intel.com>
References: <20250822090639.508747-1-nishit.sharma@intel.com>
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

