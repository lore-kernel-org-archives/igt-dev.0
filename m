Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591D0C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 13:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D8010E0A9;
	Tue, 21 Jul 2026 13:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZJj1plu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3B710E759
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784639047; x=1816175047;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=arTBssCGyM62GEkAodlQayVc5a3EGuUUMojoKhsQ2tk=;
 b=VZJj1pluQ6zIP6p4BizGwoz9X6PcF5by9kNrEnjZt1IG6mLUKKFMyTEw
 mzVbd/tc7OYK+lU7hpSou1WSh/OTdP+ir+3xuOIPqhTr1Kad6erTEKHLl
 If+Zv/hWbZ/QLKIGvCNGpZBxe6gRiESJsnI2vbV+SuitX2eNqg7e5FcIe
 d7Bd9p/auNz5wbpPqVkhWgmbxuLTEtoNJZvhnBtPKaTk0oKOzxglglHnq
 Wb2VDf2sHKyiEP9ZXUYAXaswzadXY932Q2BhM8xHlC8Ipiuiau0eU+7jf
 IcbtTye1PUEDMlwcWatN7St68S9Cx3guDYCOp8ap1jxBs0ztIKGoeZYEZ g==;
X-CSE-ConnectionGUID: AxL0riGTSoKFA+593BLPzA==
X-CSE-MsgGUID: NzR8E8ubRg6b4B5KJmnPUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="84367209"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="84367209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:04:07 -0700
X-CSE-ConnectionGUID: sgBBjTm5RfqziKlNrAxzfw==
X-CSE-MsgGUID: 4NbI/oiJQXe6K+5ErS8+mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="259735634"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jul 2026 06:04:06 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_exec_threads: whitelist expected
 multi-queue hang dmesg warns
Date: Tue, 21 Jul 2026 18:34:05 +0530
Message-ID: <20260721130405.25573-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Multi-queue hang subtests hang one queue and reset the whole group.
Sibling jobs that never started get logged by the KMD as
"Check job timeout: ... not started" at warn level, which shows up as a
dmesg-warn in CI even though the test passes.

These warnings are expected for multi-queue hangs (single-queue hangs
don't hit this path), so whitelist them when the subtest has both
MULTI_QUEUE and HANG set.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_exec_threads.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 0480df779..21529e863 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1468,6 +1468,19 @@ static void threads(int fd, int flags)
 	pthread_barrier_destroy(&barrier);
 }
 
+/*
+ * Multi-queue hang subtests hang one queue of a group. The group's queues
+ * are scheduled together, so sibling jobs stay queued behind the hung one and
+ * never start; when the TDR resets the group, the KMD reports each unstarted
+ * sibling as "Check job timeout: ... not started". These warns are expected
+ * (single-queue hangs don't hit this path); whitelist them to avoid spurious
+ * dmesg-warn in CI.
+ */
+static void ignore_multi_queue_hang_warnings_in_dmesg(void)
+{
+	igt_emit_ignore_dmesg_regex("Check job timeout: .*not started");
+}
+
 int igt_main()
 {
 	const struct section {
@@ -1735,6 +1748,9 @@ int igt_main()
 				igt_assert(!(s->flags & BALANCER));
 			}
 
+			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
+				ignore_multi_queue_hang_warnings_in_dmesg();
+
 			threads(fd, s->flags);
 		}
 	}
-- 
2.50.1

