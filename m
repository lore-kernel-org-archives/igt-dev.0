Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E1FCA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 14:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD7610EBEF;
	Fri, 29 Aug 2025 14:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3zo0vbD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6956110EBEF
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756479270; x=1788015270;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tbLC68fIT42evEVbtKaUe8gi0oOKhju2xIUalJye9b0=;
 b=A3zo0vbDDje0nijte64bTa9TzrLB1gpUd62y4NgkUvpAmCZq83yAK5Ed
 hl2LrK3sXnsUDx41fBZlLXhnJ4jUM9DXRGjrsTkN2uEp3FK2wroMuCSft
 5tXMAXn5mfbfqcdxAVXa8BeC/YUvp1k5Z5Aukqx5YMAn0flBcDbNw0Ig0
 CSM2WZUkFLKskRjrivVUiyt43Ehe5qWhrioHi6wIaMZ9Hpydotz/HoSAI
 dMnAYCCdkRhfKPuSnidgF3A2xjqpNLp8puE+mOS2z5b3DiNBy2zJV9EQ3
 kfkN1qO5xQcZXjBAiBhz7kQtOxz4646jsRb60a36eGFVmUylVniskhW4S w==;
X-CSE-ConnectionGUID: n/4tLp96RfOCm3KeLANUpA==
X-CSE-MsgGUID: nWudIIftS/a5VWWdrm9cMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="76364629"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76364629"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:54:30 -0700
X-CSE-ConnectionGUID: DaFb7d2/T5eF8Exs9XnvXA==
X-CSE-MsgGUID: htlkgedHQJiQxQ68CLNNFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175694445"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa005.jf.intel.com with ESMTP; 29 Aug 2025 07:54:28 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 2/5] lib/xe: Add xe_vm_madvise ioctl support
Date: Fri, 29 Aug 2025 14:54:19 +0000
Message-ID: <20250829145422.559494-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829145422.559494-1-nishit.sharma@intel.com>
References: <20250829145422.559494-1-nishit.sharma@intel.com>
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

xe_vm_madvise() defined which issues madvise ioctl DRM_IOCTL_XE_MADVISE for
VM region advising the driver about expected usage or memory policy for
specified address range. MADVISE ioctl requires pointer to drm_xe_madvise
structure as one of the inputs. Depending upon type of madvise operation
like Atomic, Preferred LOC or PAT required members of drm_xe_madvise
structure are initialized and passed in MADVISE ioctl.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/xe/xe_ioctl.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  5 +++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 1e95af409..b64ba3106 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -585,3 +585,61 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue, &timeout), 0);
 	return timeout;
 }
+
+int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
+		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
+{
+	struct drm_xe_madvise madvise = {
+		.type = type,
+		.extensions = ext,
+		.vm_id = vm,
+		.start = addr,
+		.range = range,
+	};
+
+	switch (type) {
+	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
+		madvise.atomic.val = op_val;
+		break;
+	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
+		madvise.preferred_mem_loc.devmem_fd = op_val;
+		madvise.preferred_mem_loc.migration_policy = policy;
+		igt_debug("madvise.preferred_mem_loc.devmem_fd = %d\n",
+			  madvise.preferred_mem_loc.devmem_fd);
+		break;
+	case DRM_XE_MEM_RANGE_ATTR_PAT:
+		madvise.pat_index.val = op_val;
+		break;
+	default:
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

