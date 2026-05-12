Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DF7CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 06:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A660A10E56C;
	Tue, 12 May 2026 06:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htNAgpXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A589910E02C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 06:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778566246; x=1810102246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hVZVPT++lxGXm4+CGUqxcFnAqhFpRlThzjqh954Nh7Y=;
 b=htNAgpXZ2+eQtjLUgOtyX20l+s9kR48lYOXjCdCla1BcGWioa3zotCg1
 Y5eYe2SwZ60KW7K0us4bcEMrhHJjba49ZwF36f38oMH6dyV985PcZ/6AV
 w+QtxYwOAY7C1QR3clFMFFVc/a20sUA4dr1JwRZlI/L/hoAeIrqgJLncD
 uiHLqZ5ziklmxk0ZT1b90/jioB2FvSD9L+rem+/7Ckg1jWqOo0+uN1ki+
 9QXdD5k4bC1dr/KKqTV6XQlQ+5k7OPkNuOm+sb8HLzRWGex9gWPJcL/ED
 acFhiq1wB/aKv9wkhu3xRLejK5tFxx1lXMdwoZCqgsuNhO6jx0hdkpJ5D g==;
X-CSE-ConnectionGUID: Fb5vKBgtRqqOhbCRltimfg==
X-CSE-MsgGUID: LC0BCpdCQAWoTrXJmZQpgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83318516"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="83318516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:10:46 -0700
X-CSE-ConnectionGUID: rb9Ny80ZSE6rtV8ZS0L8OA==
X-CSE-MsgGUID: g83p0IkWS1qk4VZv6U0Zsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="237903333"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:10:45 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_madvise: Drop assert on cleanup unbind
 in atomic subtests
Date: Tue, 12 May 2026 11:40:35 +0530
Message-ID: <20260512061035.190653-1-varun.gupta@intel.com>
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

The __xe_vm_bind_assert() for UNMAP can sporadically fail with EBUSY
because GPU migration to VRAM may still hold pages when the cleanup
unbind is issued after exec completion.  The unbind before
xe_vm_destroy is best-effort cleanup, use __xe_vm_bind() (non-assert)
instead.

Fixes: 44dea557914c ("tests/intel/xe_madvise: Add atomic-device subtest")
Fixes: 2642f23c1dbe ("tests/intel/xe_madvise: Add atomic-global subtest")
Fixes: 6f88532e2fe2 ("tests/intel/xe_madvise: Add atomic-cpu subtest")

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_madvise.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index cdb115d7e..8f88de0de 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -872,8 +872,8 @@ static void test_atomic_device(int fd, struct drm_xe_engine_class_instance *eci)
 	igt_assert_eq(data->data, 1);
 
 	xe_exec_queue_destroy(fd, exec_queue);
-	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
-			    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0);
+	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
+		     DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
 	free(data);
 	xe_vm_destroy(fd, vm);
 }
@@ -955,8 +955,8 @@ static void test_atomic_global(int fd, struct drm_xe_engine_class_instance *eci)
 	igt_assert_eq(data->data, n_cpu_ops + 1);
 
 	xe_exec_queue_destroy(fd, exec_queue);
-	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
-			    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0);
+	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
+		     DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
 	free(data);
 	xe_vm_destroy(fd, vm);
 }
@@ -1028,8 +1028,8 @@ static void test_atomic_cpu(int fd, struct drm_xe_engine_class_instance *eci)
 	igt_assert_eq(data->data, 0);
 
 	xe_exec_queue_destroy(fd, exec_queue);
-	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
-			    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0);
+	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
+		     DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
 	free(data);
 	xe_vm_destroy(fd, vm);
 }
-- 
2.43.0

