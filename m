Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BE4C88E72
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 16:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8381D10F026;
	Mon, 14 Sep 2026 16:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/1lmONv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD24F10F025
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789404216; x=1820940216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yCRSaPqB/4kmAs0KxVCrTwVMSeoas4JuK1We26xBdtA=;
 b=A/1lmONvH9GGlXnws9jlIFYCsCFxgZGr6qvbznCQVlp6u5T5gNkbBR/b
 4/4kGt5LkW6dvbZZKKG3JXaxlO2uNKfsZvQ/CNSccoqLkNqk1CDpk630t
 i8uKtZ+SFNClDZORYy9oEK2Y2vbLXvDDTXPZDfFCUUz90asNee4wdv7tC
 U6Topx6Uump0Pjy3G74SQuZACvrWO10rV06IIThRV2Oe/SuZ7P2t1k3Ck
 YIvpphYzaKF3ZYlgMQeoPKr/z5bZuHevumnSoxyojBz85I6NRB+KELSYW
 +tzXy0sRQ4oWbpdpD4XhHH2s15UmtSE917gzaQ8XO2cnAfgFGu6EU+Wjg g==;
X-CSE-ConnectionGUID: Us3d36lGQcSQl1/caqS15w==
X-CSE-MsgGUID: RLuZuFYzTYWRls2kONxYXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92269702"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92269702"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 09:43:35 -0700
X-CSE-ConnectionGUID: atAUr1koSxKpaUYljH49fA==
X-CSE-MsgGUID: LOJPsVGLQhOdCPudGGwRIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269005942"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 09:43:33 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, alex.zuo@intel.com, nishit.sharma@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: Update gt reset dmesg ignore
 regex
Date: Tue, 15 Sep 2026 00:43:30 +0800
Message-ID: <20260914164330.436487-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

The error logging function in gt_reset_worker was recently updated from
xe_gt_err to xe_log_err_fatal, resulting in several of the error
messages being changed or updated.  These new error messages are still
expected, so update the igt_emit_ignore_dmesg_regex list in the reset
fault case to reflect the updated messaging protocol.

There's also occassional reports of GGTT tlb invalidation failures
caused by some race condition on the wedged GT.  These are safe and can
also be ignored.

Fixes: aafc4bcf3361 ("tests/intel/xe_exec_reset: add GT reset fault injection stress coverage")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_reset.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index e12279d23d..d673ad92f3 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -928,8 +928,12 @@ static int try_vm_create(int fd)
 
 static void ignore_gt_reset_fault_dmesg(void)
 {
-	igt_emit_ignore_dmesg_regex("reset failed \\(-ECANCELED\\)"
-				    "|declared device .* as wedged"
+	igt_emit_ignore_dmesg_regex("\\(-ECANCELED\\) .* GT: reset failed"
+				    "|\\(-EIO\\) WEDGED: Device declared wedged!"
+				    "|IOCTLs and executions are now blocked!"
+				    "|For recovery procedure, refer to .*"
+				    "|Please file a _new_ bug report at .*"
+				    "|Failed to invalidate GGTT \\(-ENOTRECOVERABLE\\)"
 				    "|GPU HANG"
 				    "|Failed to reset");
 }
-- 
2.53.0

