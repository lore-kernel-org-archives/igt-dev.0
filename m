Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A75CC4453A
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 02:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F0E10E505;
	Thu, 23 Jul 2026 02:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1UM9jHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7914710E505
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 02:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784773974; x=1816309974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xH7xv62S2kZ33uNi55EYAn9NpM3AkHO90Mya7LpWjOU=;
 b=C1UM9jHzWEuqZ/xxBLsSgV4vjLC4utg3H/G+1lZFUtWyQ8IPl+DAG4FJ
 0ttDEuS/Cdg+Kj8IIh4j/CcQUWtLF2eIeoIj1Bl/EcRVuMzPRaO0dZRnv
 z88DvlCtw799ucbj239tJU8rQNMo17177liaAizYkZ5Jdc9rpW+WEphua
 8lqDi9PeF1EOrP8avzZ0CLWASXCkkKBDsOOcpuSnTCg/Kt6AWvuFRuLka
 3830Zcmv6VbLzhbRruG3UiSxEifY4SMdVwvNMhPCznRDVAhFDQ//ZamT1
 WUommrfLLUKVeaAD6cmuNbLtZ06ppgJldS71TlQ6ExAW9KYNeb9lM/Sqp g==;
X-CSE-ConnectionGUID: UXRryP8yS8aUKyWo446iEg==
X-CSE-MsgGUID: q4CrA//oS3CU7Gnn7uq2kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96561991"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="96561991"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 19:32:54 -0700
X-CSE-ConnectionGUID: qAA5LIrYSwKHXO/PA3m/iA==
X-CSE-MsgGUID: Aa+kgSJgSn+WXoFxAFvbjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="262596923"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa005.jf.intel.com with ESMTP; 22 Jul 2026 19:32:53 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_threads: ignore expected hang
 timeout
Date: Thu, 23 Jul 2026 08:02:51 +0530
Message-ID: <20260723023251.4522-1-himanshu.girotra@intel.com>
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

The hang subtests hang a queue and reset to recover. Jobs that were
queued but never started are logged by the KMD at warn level as
"Check job timeout: ... not started".

This warn is expected, but CI flags warn-level dmesg lines and fails
the subtest even though it passes. Whitelist it for the hang subtests.

v2: Rework description and comment to be generic (Priyanka,Kamil)

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_exec_threads.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 0480df779..2974fc312 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1468,6 +1468,16 @@ static void threads(int fd, int flags)
 	pthread_barrier_destroy(&barrier);
 }
 
+/*
+ * Hang subtests reset the GPU to recover, so jobs that never started are
+ * logged as "Check job timeout: ... not started". This warn is expected;
+ * whitelist it to avoid spurious dmesg-warn failures in CI.
+ */
+static void ignore_multi_queue_hang_warnings_in_dmesg(void)
+{
+	igt_emit_ignore_dmesg_regex("Check job timeout: .*not started");
+}
+
 int igt_main()
 {
 	const struct section {
@@ -1735,6 +1745,9 @@ int igt_main()
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

