Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C365C79F87
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 12:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14FC10E0FE;
	Mon,  5 Jan 2026 12:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONLNoaMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C546610E0FE
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767617287; x=1799153287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jltJIlhMhR5WKt+TidG74TkprSWlVt5sa9s0nb7mNpA=;
 b=ONLNoaMl3VErZSnmwrCAKQpC+MVe7Fc5LX1Ow2VQqS3bCkJY3YpKftrF
 TYxC/kNOVY4/DbWaSrwq9z3KIEhNofobGXm/tTj9UsijrUgiCFgG7rX+l
 AS3Qkd2Fx7l4CgrMGbc9+96VKwqPPaNGcYXcRC5lm1N1ZGTMgOKLZFYl3
 sn3xk9ogtgJNSxCGIDhg2o08DV74m8NTXy3O/MbHbg6ItRjOYgmDgDTSZ
 dDTDk03QLUmIt3+SIJvxvljlAS0a5yeKFPvZILC+cbNx5/SIHHpkb7ROs
 1uU2RPblrgjNGOpxtiKWgh6nzfG+mq9Au4oO/n74Dr4WJdE2S52qCcCOj A==;
X-CSE-ConnectionGUID: nVp1/Y2MT2yuKuWlXkk01A==
X-CSE-MsgGUID: EwvP1qHcR8a0qvXfwEEYag==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56542445"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="56542445"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 04:48:07 -0800
X-CSE-ConnectionGUID: pfj8eAuaTkGd6Bu+sXKqMw==
X-CSE-MsgGUID: wmW5wGwBTHemEN1dlg16gw==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.165])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 04:48:06 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH i-g-t v2 0/5] Add xe3p compute kernels and preemption support
Date: Mon,  5 Jan 2026 13:47:58 +0100
Message-ID: <20260105124757.1421059-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Enable compute-square + preemption tests for CrescentIsland.

v2: reorder, loop_kernel_duration requires loop kernel added before

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>

Shuicheng Lin (1):
  lib/intel_compute: Add loop_kernel_duration support for xe3p

Zbigniew Kempczyński (4):
  lib/intel_compute: Add compute-square for xe3p
  lib/intel_compute: Add loop and loop-count shaders for xe3p
  lib/intel_compute: Add xe3p SIP support
  lib/intel_compute: Enable xe3p preemption testing

 lib/intel_compute.c                |  398 +++-
 lib/intel_compute_krn_loop.h       |   36 +
 lib/intel_compute_krn_loop_count.h |   34 +
 lib/intel_compute_krn_sip.h        | 3127 ++++++++++++++++++++++++++++
 lib/intel_compute_krn_square.h     |   41 +
 lib/intel_compute_square_kernels.c |   11 +
 lib/xehp_media.h                   |    1 +
 7 files changed, 3647 insertions(+), 1 deletion(-)

-- 
2.43.0

