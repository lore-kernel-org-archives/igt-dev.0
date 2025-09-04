Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F565CA1013
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 08:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1755E10E9AB;
	Thu,  4 Sep 2025 08:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQQgXIXW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F0310E9AB
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 08:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756974429; x=1788510429;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LCocpd9H5N3Kbnp8gJPjeBzxTAttKKpXzb6hpQCZCWA=;
 b=bQQgXIXWs9LN7dPraGuN++mXcUwS+i1uTzLr8sXYQQymLir9pOzZeIyo
 UEEt7acAtISw92Xby16MtDNkCJujaYy2o1dvPFXuE1GUMJ/CdOCV9fpef
 Jo6XVP5mLFp2UBbu9Us9aEZnNgvzqwhiCZj6vglALY58i7PoTRNkIrolq
 U36PWcsk97L4JSDzBuQwbNgtbXrjVAjErvcgnK8QPna7BqqnolJd2KX0m
 ajQFGQWe68RSNYtkUqCo6TgUU688TBualJUvE9TVkniLnuHgcZVXzMJnp
 V1l5tIq+Xd3vYpW5KPmFWZKkpDCHfSaaSpvWv7KOEAyD0admQMNie5s+G Q==;
X-CSE-ConnectionGUID: inuzFisDS2ys1Nju3liH0w==
X-CSE-MsgGUID: QlG233gLTeeSXLimldaI5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="61937996"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="61937996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:27:09 -0700
X-CSE-ConnectionGUID: 0QwMR+2TTWaZ6GNprukwfQ==
X-CSE-MsgGUID: 5z8t058FTA2zshHBfrRXlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="171945384"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa008.jf.intel.com with ESMTP; 04 Sep 2025 01:27:08 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v12 2/5] lib/xe: Add xe_vm_madvise ioctl support
Date: Thu,  4 Sep 2025 08:26:58 +0000
Message-ID: <20250904082701.2154029-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904082701.2154029-1-nishit.sharma@intel.com>
References: <20250904082701.2154029-1-nishit.sharma@intel.com>
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
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 lib/xe/xe_ioctl.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  5 ++++-
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 1e95af409..5608c8780 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -585,3 +585,60 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
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
+ * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE.
+ */
+void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
+		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
+{
+	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy), 0);
+}
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 6302d1a7d..8e13ffe65 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -99,5 +99,8 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		     uint32_t exec_queue, int64_t *timeout);
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       uint32_t exec_queue, int64_t timeout);
-
+int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
+		    uint32_t type, uint32_t op_val, uint16_t policy);
+void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
+		  uint32_t type, uint32_t op_val, uint16_t policy);
 #endif /* XE_IOCTL_H */
-- 
2.43.0

