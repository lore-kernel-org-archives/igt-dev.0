Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5632D30CC1
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 21:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5185910E545;
	Tue, 13 Jan 2026 21:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcuKJZAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3EA10E545
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 21:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768338960; x=1799874960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZVkSvJPMk5Yfe/j+/E3kCDU9QCtOFK39lcSbmRMuBqE=;
 b=OcuKJZAIlnieRmjsbEGi9Gpexl/v/Zva3ved9cVbrrHswn4fy4N+eRUs
 MjJ9CRPh0G3r2JeYiOP+9a7IGQhay4tp1bk5FCsL1A+cnLpV+MS1BvAxF
 PL/XhAmZoDJxvtSTSrW7Wc5eRrwCN15NEVBewfrFOn5xE2sh5JDibVTmc
 T1cc+akk/rKJ+P+fPrkA8HHzLwx11q7tFGSDktdrD7BDtFi2sKvMBnAfM
 +LemMZTRu4Kie8o5YSXE6qPOhH6bI1p+LtS/opMZtpdGeLBo7eBR0bdVJ
 uZxvoQw+6c6Wkj0ZoSqSBFpqZPIXAnMFB+w32fg4/tjSbue7bSgR7nikl g==;
X-CSE-ConnectionGUID: Jgd3I7FIRaqO26Fm4gqN8w==
X-CSE-MsgGUID: oseA0dMJRE2EBgn8ONF8uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69688299"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69688299"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 13:16:00 -0800
X-CSE-ConnectionGUID: HqmY8N3VQRyx6Bc4mxd/QA==
X-CSE-MsgGUID: oXdIYkMiQs2qMIOaKMjogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="242017841"
Received: from dut4086lnl.fm.intel.com ([10.105.10.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 13:16:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, priyanka.dandamudi@intel.com,
 stuart.summers@intel.com
Subject: [PATCH] tests/intel/xe_exec_multi_queue: No engines in virtual test
 expected
Date: Tue, 13 Jan 2026 21:15:59 +0000
Message-ID: <20260113211558.149105-2-jonathan.cavitt@intel.com>
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

In the xe_exec_multi_queue@virtual test, we currently assert that at
least one engine with a given class on a given GT ID exists.  However,
the way we generate these class and GT ID pairs is through brute-force
(I.E. list all engine classes that support multi queue, then list all GT
IDs, to generate all pairs).  This frequently results in invalid class
and GT pairs (E.G. attempting to find RCS on GT ID 1).

While a smart solution that only generates valid class and GT ID
pairings would be preferred here, doing so would probably be overkill,
so just remove the igt_assert case and exit silently if no engines are
found.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 6bc6f9f63b..9a02744967 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -995,7 +995,9 @@ test_exec_virtual(int fd, int gt, int class)
 
 		eci[n++] = *hwe;
 	}
-	igt_assert(n);
+
+	if (!n)
+		return;
 
 	test_exec(fd, eci, n, n, n, 0);
 	test_exec(fd, eci, n, n, n, PREEMPT_MODE);
-- 
2.43.0

