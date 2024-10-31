Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F06AE68958
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 07:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C925D10E002;
	Thu, 31 Oct 2024 07:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQg6YPTK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D5810E002
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 07:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730360174; x=1761896174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nlJANTzsJk0l/dXSIGgAfEdcP+UZXTLl7GgxqNocZz8=;
 b=fQg6YPTKWAPU4ggwcEYFiLBLO/sGMvmcP8ZKralPG7UncI6hJbUAxVY4
 r92zSC4/cIPfVzvW2g67AXMY28Wy3ITpFBof5y4jNdBOkbdq9WsarNQwZ
 modXcUdRtcKJQTn2SMXYNQNIPMeSuvzoHXBQAMJejmR7CCuaxPCkP5tI8
 t+Ba6GKqtIyzo0rjPFwIC8sWIx3NmM3Zo13wKL/SmZWxX7uSPSstaiqcn
 ri25DArKWojlRhDhoXs5/szOkKcKoUPn2CoXFofqRxy3GLBn1OYBhrpUw
 yhzulm8K/8AL1LAEVVnnSY0SrG/+aQDAZ78jOfxdWpD2tGwGSUwJ+c9dy Q==;
X-CSE-ConnectionGUID: BhPQDwZxRNiKnTxoc2OOWg==
X-CSE-MsgGUID: 27kbnmwKTyCgb2JE4mbxbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="32921597"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="32921597"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 00:36:13 -0700
X-CSE-ConnectionGUID: uWCTPhSnSFau49dM4aFSBg==
X-CSE-MsgGUID: PAQQuokjTZiENEBQVchY1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82970235"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.165])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 00:36:12 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/xe_exec_comput_mode: Use valid exec queue for bind
Date: Thu, 31 Oct 2024 08:36:04 +0100
Message-Id: <20241031073604.35976-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Using gt_id as exec queue for binding is wrong and it works by accident
because bcs engine used in the subtest reside on tile 0. But trying
to run the test on engine which resides on different tile just fails.
Lets use default binding engine for this.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index e49633ace8..8fba9daef7 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -472,7 +472,7 @@ static void lr_mode_workload(int fd)
 							ALLOC_STRATEGY_LOW_TO_HIGH);
 
 	sync.addr = to_user_pointer(&vm_sync);
-	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, spin_addr, bo_size, &sync, 1);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, spin_addr, bo_size, &sync, 1);
 	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 
 	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true);
-- 
2.34.1

