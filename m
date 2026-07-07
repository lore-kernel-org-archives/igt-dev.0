Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9E9C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 16:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7C810E514;
	Tue,  7 Jul 2026 16:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZrMQaJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9A010E514
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783441326; x=1814977326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=80+YntyQynxu0PqkQzPnqgP1oY2AYwRHaVT2fdaAG1M=;
 b=WZrMQaJd+g3PfMzMgI2qvPH45ZEcASrklbI1PYa25KTjlGFE5MCvgWQQ
 uRgXAJes1MjGqoP1RYqZgb7ZRZV143ZI8qGKqUaO4kSMYMfyuADbz3QYH
 L6Sz+CJekMV1lUz0hiL170tllWl2I8hLZzOmy5iQQvS2lysjPA9Qq7/NQ
 NIfdyqCLZ/edRslxZDKVm4l7tZv9lBCtHOOda3fOtJPCyk3g4TH2dQf1Q
 0nActEyOeS0EsUlGo54/AaR/60F7ambwKLcXhyK1+qoaHUYyzMxIqv5sx
 x/iSwT2oaXawqMMsrsux3/zOQmJAtzUUjnwkB0h7kvpdOMBTA7Ag+gGAY w==;
X-CSE-ConnectionGUID: h0hxk53MTjaF2RhpB6gzAw==
X-CSE-MsgGUID: n7pD9oitS/SO3+4rufjpww==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83203116"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83203116"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 09:22:05 -0700
X-CSE-ConnectionGUID: tIvp/BP4Tgy4Mhy8Xy4RDw==
X-CSE-MsgGUID: VNnrpu61QcGA8Oo5u3FyIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="252959357"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa010.jf.intel.com with ESMTP; 07 Jul 2026 09:22:04 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] tests/intel/xe_exec_system_allocator: Ignore expected CAT
 error in fault subtest
Date: Tue,  7 Jul 2026 16:21:56 +0000
Message-Id: <20260707162156.3050135-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

The 'fault' subtest submits an exec with a bogus batch address. The
kernel nacks the unresolvable pagefault, which the GuC escalates to a
memory CAT error and engine reset. The resulting 'CAT error' dmesg
messages are expected, not a real failure.

Emit an ignore-dmesg regex to suppress them in CI. It matches both
'Memory CAT error reported by GuC!' and 'Engine memory CAT error'
messages.

v2: Add comment in code & expand dmesg regex. (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 48ae738ec..50cd6ead7 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2740,10 +2740,16 @@ int igt_main()
 	igt_subtest("threads-shared-alloc-many-stride-malloc-race")
 		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, false);
 
-	igt_subtest_f("fault")
+	igt_subtest_f("fault") {
+		/*
+		 * Ignore memory CAT error messages in dmesg (both 'Memory CAT error reported by GuC!'
+		 * and 'Engine memory CAT error'), as they are expected when testing page faults.
+		 */
+		igt_emit_ignore_dmesg_regex("[Mm]emory CAT error");
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
 				  FAULT, NULL);
+	}
 
 	for (const struct section *s = psections; s->name; s++) {
 		igt_subtest_f("partial-%s", s->name)
-- 
2.43.0

