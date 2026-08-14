Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A3CC5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 02:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EE810E0AB;
	Fri, 14 Aug 2026 02:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HwsNPHZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B9B10E0AB
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 02:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786673563; x=1818209563;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4EhPkDmx+AFsnkcEWre0tIJTLpTfrgNPg6Y9IkSXPmI=;
 b=HwsNPHZ0+3PyrHmsH5p322uW0/kMKuSdxjjLpK4rTOqXeqTESgVMiEZt
 VWmRlvXPLzPbc8l/76g+T0Bfpwld9+P5EMFlMxAP6Hdy5rKst4HqScQYi
 rtRVbrr3xN8Jd9OvMSu/9ZNy/nQFcfrzkLe7Cz5tY3oYftlc3yA4wIeKb
 3b6bo0c2wKWEd1NponQrC9VGsAf8zBHnq7o/2DuLETEdwoV8+nh4nS+gI
 kSP8VuU0U7FAINW7WeEqXiOPPlcTWpDt1EH2KUJNiMgpGshdGTYfb6hVJ
 fbOD4Nlqw4sQ0fLfulcTom0I+w87J2HqXKs8qDNTI27HXZSbMauZlLyAQ w==;
X-CSE-ConnectionGUID: yMsK2jkUSGm3FGyuEUv0MQ==
X-CSE-MsgGUID: FtK1GZvbTE+RShUnymXBpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97601514"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97601514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 19:12:43 -0700
X-CSE-ConnectionGUID: atfKXCs8RSu/rbHrMaT/jg==
X-CSE-MsgGUID: VZGDRwyAQO6R7Hi7UFYduw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="268368841"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 19:12:42 -0700
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t] tests/xe_waitfence: Add user-fence-no-signal subtest
Date: Fri, 14 Aug 2026 07:42:42 +0530
Message-ID: <20260814021241.2807767-2-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add a negative test that creates a buffer object, maps it,
and calls __xe_wait_ufence() waiting for a value that is
never written to the buffer. The test verifies that the ioctl returns
-ETIME on timeout rather than hanging indefinitely, reproducing the
hang scenario observed when a user fence is never signaled.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_waitfence.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index ff92a13fa3..ecdce9f93b 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -138,6 +138,37 @@ waitfence(int fd, enum waittype wt)
 	}
 }
 
+/**
+ * SUBTEST: user-fence-no-signal
+ * Functionality: waitfence
+ * Description: Create a BO, map it, and call __xe_wait_ufence waiting for a
+ *              value that is never written. Expects -ETIME on timeout.
+ * Test category: negative test
+ */
+static void
+user_fence_no_signal(int fd)
+{
+	uint32_t vm, exec_queue, bo;
+	uint64_t *ptr;
+	int64_t timeout = NSEC_PER_SEC;
+	int ret;
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
+
+	bo = xe_bo_create(fd, vm, SZ_4K, system_memory(fd), 0);
+	ptr = xe_bo_map(fd, bo, SZ_4K);
+	igt_assert(ptr != MAP_FAILED);
+
+	ret = __xe_wait_ufence(fd, ptr, 0xdeadbeef, exec_queue, &timeout);
+	igt_assert_eq(ret, -ETIME);
+
+	munmap(ptr, SZ_4K);
+	gem_close(fd, bo);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: invalid-flag
  * Functionality: waitfence
@@ -291,6 +322,9 @@ int igt_main()
 	igt_subtest("engine")
 		waitfence(fd, ENGINE);
 
+	igt_subtest("user-fence-no-signal")
+		user_fence_no_signal(fd);
+
 	igt_subtest("invalid-flag")
 		invalid_flag(fd);
 
-- 
2.43.0

