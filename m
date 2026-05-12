Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0526ACD4F24
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 15:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78D010E036;
	Tue, 12 May 2026 15:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGxSMHV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9551310E036
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778600411; x=1810136411;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4n4DgIYoAaZBjNEyN2CrZilwbQOwk7jl7y34ml/spe8=;
 b=hGxSMHV9KYnrwMld0+oZN4qyvYHkGRlEUlBPhvTQCVDbryLipKCVztAw
 imx4+i5I1q3WU4tFWvKSAlfpyiaRdHhb4/sStsQSn8NJX19KlmIrT4leH
 jM3vg7eN+qtOPkTEr/jh+Oxv4K61teiBrpNpA03Xl3h419nQRkJKJI762
 gC9Zjj3XFYQKjer06pdPvKB54k6pr51QOcF/P/n2u+0PW4KavujWsguMD
 OJ8QCLgHwtMMojTeky7vh5bIb0AxfatJ51ModlMwWhZaOiU/bypdzeDCi
 DukBP1E+7YeCNcO+mkfIkirFeKb877dKySCOMibbs25LASOqi1O8S8uFL Q==;
X-CSE-ConnectionGUID: r6ojTMOkQFystPH2Ci1tug==
X-CSE-MsgGUID: FwgYSvSiT0abdMOzwsty6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83385949"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="83385949"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 08:39:22 -0700
X-CSE-ConnectionGUID: gJniioEnQZKF30kGAe6YZA==
X-CSE-MsgGUID: z8rAcrohQ9aBI+aG+6aylw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="236941385"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.21])
 by orviesa010.jf.intel.com with ESMTP; 12 May 2026 08:39:20 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t] lib/xe: Retry xe_vm_bind on transient -EBUSY
Date: Tue, 12 May 2026 15:39:19 +0000
Message-ID: <20260512153919.3676059-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

__xe_vm_bind_assert() can intermittently fail with -EBUSY when the
kernel rejects the bind because it detects in-flight work that has
not yet completed. This is transient condition the call is expected
to succeed once the competing work settles.

Add a retry loop (up to 5 attempts) that re-issues __xe_vm_bind()
whenever -EBUSY is returned, before asserting success. All other
error codes are treated as fatal and propagate immediately to
igt_assert_eq() as before.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/xe/xe_ioctl.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index e13195e16..3a307f95f 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -242,9 +242,24 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
 			  uint32_t num_syncs, uint32_t prefetch_region, uint64_t ext)
 {
-	igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
-				   op, flags, sync, num_syncs, prefetch_region,
-				   DEFAULT_PAT_INDEX, ext), 0);
+	int ret, retries = 0;
+
+retry:
+	ret = __xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
+			   op, flags, sync, num_syncs, prefetch_region,
+			   DEFAULT_PAT_INDEX, ext);
+
+	if (ret && retries < 5) {
+		/*
+		 * Retry on transient -EBUSY, which can occur when the
+		 * kernel is contended by in-flight background work
+		 */
+		retries++;
+		goto retry;
+	}
+
+	igt_assert_eq(ret, 0);
+	return;
 }
 
 void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t offset,
-- 
2.43.0

