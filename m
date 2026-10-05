Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911AECA6003
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313DF10E2AD;
	Mon,  5 Oct 2026 11:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7LYoQC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4898710E249
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791198892; x=1822734892;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JKqibcSjB+wv7cOJzOH52pe4lvyouxPoVOt2x6ShfyE=;
 b=N7LYoQC8lKhd4s/6Pgu/bmCVFPzIWpGiej3DjYFZ+4mUIkJeg/JS+jeW
 oHA+d5syMar7CfrHGiFFL2sbuury1RNC8OElxKJFjU7XK2scQhbjHVxvm
 ARGnGaokWJz1Zs44ygpqpFfXLP5XPGSzeBq1QQZf3t70CKxNelbo4AR0E
 7K4kQt8xIbhOOLT5BWGUIoTK//uOnjiCG/EQMHqcz835FVsRfMGLn4nhQ
 Tp1ZhrMpmdPRR0iSfZquTg/Gn1DyIxdwa9gBC+gm1alu40Tc05DMeZJF0
 ajgbf3E0e86RedyrYhD21X/NcX7RZ7D+KxYdf2Xeo9pMU/GIzI4hskdrs g==;
X-CSE-ConnectionGUID: 89Unwy/bSCi22h0sF62Z5A==
X-CSE-MsgGUID: uUpCkltpR/qqDuCAtQ5VvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91074684"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="91074684"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:14:51 -0700
X-CSE-ConnectionGUID: /pifw35rRN+6VryVmrlt5g==
X-CSE-MsgGUID: 9rojwwxzRPWarwVcOM/BHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="9474"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:14:50 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	"Thomas, Sobin" <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/2] Limit repeated dmesg records in results
Date: Mon,  5 Oct 2026 11:14:40 +0000
Message-ID: <20261005111442.2755785-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
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

From: "Thomas, Sobin" <sobin.thomas@intel.com>

Repeated kernel messages can make results huge causing the test
exit due to storage limitation. Add an optional --rate-limit N 
setting that keeps the first N consecutive identical dmesg records
and summarizes the remaining occurrences. The default is 0,
which preserves existing output.

Sobin Thomas (2):
  igt/runner: Refactor dmesg record buffering
  igt/runner: Add the rate limit feature for dmesg logs for runner

 runner/resultgen.c    | 205 ++++++++++++++++++++++++++++++++----------
 runner/runner_tests.c |   3 +
 runner/settings.c     |  30 +++++++
 runner/settings.h     |   1 +
 4 files changed, 191 insertions(+), 48 deletions(-)

-- 
2.43.0

