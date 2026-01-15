Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CA7D46621
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 20:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BBB10E1A7;
	Thu, 15 Jan 2026 20:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVTER+Dt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AAB10E09D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 20:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768508313; x=1800044313;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D3lunjU/HYa6Ub6764qGaAKMjLGmPOk0i0EpilRxDN8=;
 b=GVTER+DtAYREsf1u6EkFHGNm7X2ZDJTgmV3vZ8djDTWHt1r1AcJUfG+G
 uYh2WptgCyOuMYhNTlNJIbTU5/Og0sP3hMGLFtVn7UrucIVIeQnskjtbM
 yoNhUWMvTzv01AMmrtgN5tKj7x0BHMtmtlFKUhfE/+wwYrPO1qBpTV9B8
 3wDmD4fa0j+UnWYA9OiuR6lvDcMWyn9TK1T0gWbKmsEPfhfzDsaVM8Tsd
 WrG86sms1+zhBGEiO6SX7h8cyHpWa2j925CHc61IfkakWPNLWm7Qju5Qs
 X/iI2EnCruKypwk0Xt3VSxErR0+coMtA054J9/jJASG7sQsMMRBg3/GUu Q==;
X-CSE-ConnectionGUID: nfmgdMGTSXOTYV06JRtgkQ==
X-CSE-MsgGUID: mGUz0hufQUiOLJI37yGZeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="68833162"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="68833162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 12:18:33 -0800
X-CSE-ConnectionGUID: eGY4lkp1RZWSFnDHcICajQ==
X-CSE-MsgGUID: f+sdGYKqQR2X7DpPngOk0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="204836477"
Received: from dut4086lnl.fm.intel.com ([10.105.8.126])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 12:18:33 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, priyanka.dandamudi@intel.com,
 stuart.summers@intel.com
Subject: [PATCH] tests/intel/xe_exec_multi_queue: No engines in virtual test
 expected
Date: Thu, 15 Jan 2026 20:18:32 +0000
Message-ID: <20260115201831.6718-2-jonathan.cavitt@intel.com>
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
and GT ID pairs.

While a smart solution that only generates valid class and GT ID
pairings would be preferred here, doing so would probably be overkill,
so just remove the igt_assert case and exit silently if no engines are
found.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

