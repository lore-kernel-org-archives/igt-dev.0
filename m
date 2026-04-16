Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC708F8A146
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9416210E86B;
	Thu, 16 Apr 2026 09:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJ/Tnb0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C683D10E84B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776330749; x=1807866749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wa1KGtHMeZ8/uKT9ivPDgLacFzvHi0vEDF+lkycQosg=;
 b=fJ/Tnb0CU61xIsOfC12LKFpsfuM0FgsgDZeVdRFspkVOB92aWkGi2WbO
 q4stjxHs8IPIM0kyUG6JWH/xSKR1cnHXZ8xJiDEAV9cf4PG6xh36oEdi9
 VdDmL8GfWIb9vnS1Vo4MGj9/FbCIuBxfd/9Zo4xhvmA7L+enyjI5gDUND
 ZEKj2CUlGiHZDOHt8cslaSh3MOzI7MixcMt3wH1h+9zbteuDpjVMgR0SR
 NU0dr3EEgAbKGZLmeNdMz/8KmLW1tobnF1t5GksGXB7c09Bhn51UkIB3a
 T3g36c69RhGeDWNkxiXqghykJMj95cfVmZh9CbG3dv0hAyDiH+7RoFSMB A==;
X-CSE-ConnectionGUID: kT/4zvv6QRKo0XFpkxWI8g==
X-CSE-MsgGUID: 22fIXj3nTNiGtcMsBXBQTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99973305"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="99973305"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:10:58 -0700
X-CSE-ConnectionGUID: V0bp0kwGRRe2HzlSXx1z0Q==
X-CSE-MsgGUID: JXXV0i5dTwK+/kXSfIO3rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230608741"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:10:58 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 1/3] tools/vmtb: Define IGT tests used as VF migration
 workloads
Date: Thu, 16 Apr 2026 10:35:42 +0200
Message-Id: <20260416083544.2441874-2-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20260416083544.2441874-1-adam.miszczak@linux.intel.com>
References: <20260416083544.2441874-1-adam.miszczak@linux.intel.com>
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

New VF busy migration scenarios are expected to utilize IGT tests as workloads,
specifically several subtests from 'xe_exec_reset', 'xe_exec_threads', 'xe_ccs'
and 'xe_compute_preempt'.
Extend IgtExecutor support for relevant IGTs (IgtType definitions and mappings).

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/bench/executors/igt.py | 96 +++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 6 deletions(-)

diff --git a/tools/vmtb/bench/executors/igt.py b/tools/vmtb/bench/executors/igt.py
index a08f71d54..f443fb99e 100644
--- a/tools/vmtb/bench/executors/igt.py
+++ b/tools/vmtb/bench/executors/igt.py
@@ -17,17 +17,101 @@ logger = logging.getLogger('IgtExecutor')
 
 
 class IgtType(enum.Enum):
-    EXEC_BASIC = 1
-    EXEC_STORE = 2
-    SPIN_BATCH = 3
+    # Basic/generic IGT tests:
+    EXEC_BASIC = enum.auto()
+    EXEC_STORE = enum.auto()
+    SPIN_BATCH = enum.auto()
+    # VF migration workloads - xe_exec_reset/long_spin subtests:
+    EXEC_RESET_LONG_SPIN_MANY_PREEMPT = enum.auto()
+    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_MEDIA = enum.auto()
+    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_THREADS = enum.auto()
+    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT0_THREADS = enum.auto()
+    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT1_THREADS = enum.auto()
+    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT = enum.auto()
+    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_MEDIA = enum.auto()
+    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_THREADS = enum.auto()
+    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT0_THREADS = enum.auto()
+    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT1_THREADS = enum.auto()
+    EXEC_RESET_LONG_SPIN_SYS_REUSE_MANY_PREEMPT_THREADS = enum.auto()
+    EXEC_RESET_LONG_SPIN_COMP_REUSE_MANY_PREEMPT_THREADS = enum.auto()
+    # VF migration workloads - xe_exec_reset/cancel subtests:
+    EXEC_RESET_CANCEL = enum.auto()
+    EXEC_RESET_CANCEL_PREEMPT = enum.auto()
+    EXEC_RESET_CANCEL_TIMESLICE_PREEMPT = enum.auto()
+    EXEC_RESET_CANCEL_TIMESLICE_MANY_PREEMPT = enum.auto()
+    # VF migration workloads - xe_exec_threads subtests:
+    EXEC_THREADS_BASIC = enum.auto()
+    EXEC_THREADS_BAL_BASIC = enum.auto()
+    EXEC_THREADS_CM_USERPTR_INVALIDATE = enum.auto()
+    EXEC_THREADS_BAL_MIXED_USERPTR_INVALIDATE = enum.auto()
+    EXEC_THREADS_MANY_QUEUES = enum.auto()
+    # VF migration workloads - xe_ccs subtest:
+    CCS_BLOCK_COPY_COMPRESSED = enum.auto()
+    # VF migration workloads - xe_compute_preempt subtest:
+    COMPUTE_PREEMPT_MANY = enum.auto()
 
 
 # Mappings of driver specific (i915/xe) IGT instances:
 # {IGT type: (i915 IGT name, xe IGT name)}
 igt_tests: typing.Dict[IgtType, typing.Tuple[str, str]] = {
-    IgtType.EXEC_BASIC: ('igt@gem_exec_basic@basic', 'igt@xe_exec_basic@once-basic'),
-    IgtType.EXEC_STORE: ('igt@gem_exec_store@dword', 'igt@xe_exec_store@basic-store'),
-    IgtType.SPIN_BATCH: ('igt@gem_spin_batch@legacy', 'igt@xe_spin_batch@spin-basic')
+    # Basic/generic IGT tests:
+    IgtType.EXEC_BASIC:
+      ('igt@gem_exec_basic@basic', 'igt@xe_exec_basic@once-basic'),
+    IgtType.EXEC_STORE:
+      ('igt@gem_exec_store@dword', 'igt@xe_exec_store@basic-store'),
+    IgtType.SPIN_BATCH:
+      ('igt@gem_spin_batch@legacy', 'igt@xe_spin_batch@spin-basic'),
+    # VF migration workloads - xe_exec_reset/long_spin subtests:
+    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT:
+      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt'),
+    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_MEDIA:
+      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-media'),
+    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_THREADS:
+      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-threads'),
+    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT0_THREADS:
+      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-gt0-threads'),
+    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT1_THREADS:
+      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-gt1-threads'),
+    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT:
+      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt'),
+    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_MEDIA:
+      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-media'),
+    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_THREADS:
+      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-threads'),
+    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT0_THREADS:
+      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads'),
+    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT1_THREADS:
+      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads'),
+    IgtType.EXEC_RESET_LONG_SPIN_SYS_REUSE_MANY_PREEMPT_THREADS:
+      ('n/a', 'igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads'),
+    IgtType.EXEC_RESET_LONG_SPIN_COMP_REUSE_MANY_PREEMPT_THREADS:
+      ('n/a', 'igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads'),
+    # VF migration workloads - xe_exec_reset/cancel subtests:
+    IgtType.EXEC_RESET_CANCEL:
+      ('n/a', 'igt@xe_exec_reset@cancel'),
+    IgtType.EXEC_RESET_CANCEL_PREEMPT:
+      ('n/a', 'igt@xe_exec_reset@cancel-preempt'),
+    IgtType.EXEC_RESET_CANCEL_TIMESLICE_PREEMPT:
+      ('n/a', 'igt@xe_exec_reset@cancel-timeslice-preempt'),
+    IgtType.EXEC_RESET_CANCEL_TIMESLICE_MANY_PREEMPT:
+      ('n/a', 'igt@xe_exec_reset@cancel-timeslice-many-preempt'),
+    # VF migration workloads - xe_exec_threads subtests:
+    IgtType.EXEC_THREADS_BASIC:
+      ('n/a', 'igt@xe_exec_threads@threads-basic'),
+    IgtType.EXEC_THREADS_BAL_BASIC:
+      ('n/a', 'igt@xe_exec_threads@threads-bal-basic'),
+    IgtType.EXEC_THREADS_CM_USERPTR_INVALIDATE:
+      ('n/a', 'igt@xe_exec_threads@threads-cm-userptr-invalidate'),
+    IgtType.EXEC_THREADS_BAL_MIXED_USERPTR_INVALIDATE:
+      ('n/a', 'igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate'),
+    IgtType.EXEC_THREADS_MANY_QUEUES:
+      ('n/a', 'igt@xe_exec_threads@threads-many-queues'),
+    # VF migration workloads - xe_ccs subtest:
+    IgtType.CCS_BLOCK_COPY_COMPRESSED:
+      ('n/a', 'igt@xe_ccs@block-copy-compressed'),
+    # VF migration workloads - xe_compute_preempt subtest:
+    IgtType.COMPUTE_PREEMPT_MANY:
+      ('n/a', 'igt@xe_compute_preempt@compute-preempt-many')
     }
 
 
-- 
2.39.1

