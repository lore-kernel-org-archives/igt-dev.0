Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A56D29C4C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 17:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9281389F31;
	Mon, 19 Jan 2026 17:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1GiaSZQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C667189F31
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 17:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768842621; x=1800378621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JcyAjMNv0f/l8Ou3P75Co8wCNLNqO4pffbi/t+96J10=;
 b=d1GiaSZQs1roh/DdRAcRxEa7S3GjGlq+cOwSY1lB1rurX6G5VyWPVxX3
 fsK/RNV5QH4iT8tUNesgcn+SyO7oP1+Tw9ZnCVipxFscm4M7mpcw1wTRl
 z+iXNHtINLlbBcPWQkkcYZghlIDo7dcVlCyqP9rYOgyYInoaGZ8wO402j
 q5a6SCG3FEJvXebzcD1PAXtgJDAgvlguiZQNHe9hAf3L76S3f1epWQheG
 g6m7OhQYGrK/ptBIubyF+Xx4aA72l7mWeoDFov7vNZm5H7eMhezM65YLE
 nKSqw7bo9xb8YpAyTVbrN8XNHytynh9de1+C+QaOeYxGPQqk4pExxNp5X w==;
X-CSE-ConnectionGUID: W4Emz3yyQlWjlW3hceGkaA==
X-CSE-MsgGUID: /QT4QIADTfe5G9Kr7iJmEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57611989"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="57611989"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 09:10:20 -0800
X-CSE-ConnectionGUID: HEhC4KYGRAWl0wGhku41Ow==
X-CSE-MsgGUID: cRArE5xPTkmiBDQmPAyY+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="210412276"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.142])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 09:10:18 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH i-g-t v5 0/5] Add xe3p compute kernels and preemption support
Date: Mon, 19 Jan 2026 18:10:14 +0100
Message-ID: <20260119171013.442579-7-zbigniew.kempczynski@intel.com>
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
v3: drop kernel_addr variable and reuse XE2_ADDR_STATE_CONTEXT_DATA_BASE
v4: use variables instead of hardcoded sizes
v5: add missing loop_noopt.cl file

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

 lib/intel_compute.c                |  397 +++-
 lib/intel_compute_krn_loop.h       |   36 +
 lib/intel_compute_krn_loop_count.h |   34 +
 lib/intel_compute_krn_sip.h        | 3127 ++++++++++++++++++++++++++++
 lib/intel_compute_krn_square.h     |   41 +
 lib/intel_compute_square_kernels.c |   11 +
 lib/xehp_media.h                   |    1 +
 opencl/loop_noopt.cl               |   15 +
 8 files changed, 3661 insertions(+), 1 deletion(-)
 create mode 100644 opencl/loop_noopt.cl

-- 
2.43.0

