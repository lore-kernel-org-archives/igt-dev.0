Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6997C47DD3
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 02:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BCD10E315;
	Mon, 22 Jan 2024 02:45:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EBC10E317
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 02:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705891519; x=1737427519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ylQkjvTSYV9PydmPEif1T6A3Ap7bsECfMUqBuidxkas=;
 b=ZWJXwVmWGGW0Le1jhuJS+vO05c7EPSt2Smjo0r34TF0MtTj3+en1OZQU
 xnMUhGYophzDLy1wbLPaeoNvvpJ2alcwUHzXOZn80cLxmnGYiSX7Dflyg
 eLxiEFB/6n96egoppFZSEMJNGZHf9p01DN7sxggl4vJNY3mdebSS6vWN5
 3Bg18Fnz2MOtfQuEkOcNcY9oMP+wsrrWkMhIgBwQlDGIW5I9q6nssTTZM
 Wpo214nocT1x4ivzUdeysVEMpShEnkswrXobSvr+IUewTo+TYdG9lEc4f
 1dt9FCAT7QpjqK4Ek2hiIEjXwRiBApEPb2Un9AqqmkJYPDRfpX4M91rIh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22570009"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="22570009"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 18:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="819533126"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="819533126"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orsmga001.jf.intel.com with ESMTP; 21 Jan 2024 18:45:15 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v4 3/3] tests/xe_waitfence: Removed duplicate code in waitfence
Date: Mon, 22 Jan 2024 08:15:43 +0530
Message-Id: <20240122024543.456795-4-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240122024543.456795-1-krishnaiah.bommu@intel.com>
References: <20240122024543.456795-1-krishnaiah.bommu@intel.com>
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Removed duplicate code in xe_waitfence@waitfence

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/xe/xe_ioctl.c          | 35 -----------------------------------
 lib/xe/xe_ioctl.h          |  2 --
 tests/intel/xe_waitfence.c |  4 ++--
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 39605a019..49c5d359e 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -523,41 +523,6 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	return timeout;
 }
 
-/**
- * xe_wait_ufence_abstime:
- * @fd: xe device fd
- * @addr: address of value to compare
- * @value: expected value (equal) in @address
- * @exec_queue: exec_queue id
- * @timeout: absolute time when wait expire
- * @flag: wait flag
- *
- * Function compares @value with memory pointed by @addr until they are equal.
- * Asserts that ioctl returned without error.
- *
- * Returns elapsed time in nanoseconds if user fence was signalled.
- */
-int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
-			       uint32_t exec_queue, int64_t timeout,
-			       uint16_t flag)
-{
-	struct drm_xe_wait_user_fence wait = {
-		.addr = to_user_pointer(addr),
-		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
-		.flags = flag,
-		.value = value,
-		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
-		.timeout = timeout,
-		.exec_queue_id = exec_queue,
-	};
-	struct timespec ts;
-
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
-	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
-
-	return ts.tv_sec * 1e9 + ts.tv_nsec;
-}
-
 void xe_force_gt_reset(int fd, int gt)
 {
 	char reset_string[128];
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 8a92073b0..03932561d 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -90,8 +90,6 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		     uint32_t exec_queue, int64_t *timeout);
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       uint32_t exec_queue, int64_t timeout);
-int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value, uint32_t
-			       exec_queue, int64_t timeout, uint16_t flag);
 void xe_force_gt_reset(int fd, int gt);
 
 #endif /* XE_IOCTL_H */
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index e6354b3ff..6ed9d56f8 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -36,7 +36,7 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
 }
 
-static int64_t wait_with_eci_abstime(int fd, uint64_t *addr, uint64_t value,
+static int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
 				     uint32_t exec_queue, int64_t timeout,
 				     uint16_t flag)
 {
@@ -117,7 +117,7 @@ waitfence(int fd, enum waittype wt)
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
 		timeout = current + MS_TO_NS(10);
-		signalled = wait_with_eci_abstime(fd, &wait_fence, 7,
+		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7,
 						  exec_queue, timeout,
 						  DRM_XE_UFENCE_WAIT_FLAG_ABSTIME);
 		igt_debug("wait type: ENGINE ABSTIME - timeout: %" PRId64
-- 
2.25.1

