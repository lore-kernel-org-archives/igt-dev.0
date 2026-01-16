Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27B1C982CD
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 15:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6256410E8CB;
	Fri, 16 Jan 2026 15:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/Bu396P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF4C10E8CB
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768578406; x=1800114406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YVutt2jDlsunOS3fWrQ73oyDam52LWR6BxT+XopQbng=;
 b=d/Bu396PaGHFkTKJlsUhFQ11KAZ2O0mxGLGGp1P8dRXPLlLR6/At//I+
 MdhaRH6tvHKanmPa6f7ZXsdhaZ4KeBn/lul7+CxadqgS8P1Ax2F3lJDWr
 a7prAMwPHgKXPTUxaK8P7ZDZ6TFEaIFYVC0BB7E8O/lTvFayv/v/kZW13
 EAUmXknyeE8tLJHJOBjfJuaYubxhUHi13a/5dBQUUAVQMS5m4A6XtG2cg
 NFk8IkJCcoS/1uCePm76g3ieev/KuUsMViSMJFKcxkl0dkRZwADsWiuA0
 l84TV2YbCPHqFsPl7N0vcuUCENWhyH5D4v1Fd8/cXPJdOZiJ2y2nsuaLH g==;
X-CSE-ConnectionGUID: iskHRpFlQmKHskgxAOytiw==
X-CSE-MsgGUID: QjZ4xfcZTfSn4srlAMEsxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="68905294"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="68905294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 07:46:46 -0800
X-CSE-ConnectionGUID: pvmg3inrSFKZvaX9T9sGGw==
X-CSE-MsgGUID: 4X/jLl9NQ3aukDwpkefUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="209749404"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.180])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 07:46:45 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH i-g-t v4 0/5] Add xe3p compute kernels and preemption support
Date: Fri, 16 Jan 2026 16:46:37 +0100
Message-ID: <20260116154636.204553-7-zbigniew.kempczynski@intel.com>
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
 7 files changed, 3646 insertions(+), 1 deletion(-)

-- 
2.43.0

