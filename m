Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A746CCD4855
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 23:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C75210E1FE;
	Mon, 11 May 2026 23:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLY3xVlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E785F10E91E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778542596; x=1810078596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ZMg7HDnFDvco/i/B3Db4dl2OnncJknlExu72scEb9o=;
 b=OLY3xVlWT874yfn1Klgv/hXpQmDovZquJZLp9LF4JGN4Q8h6oUJfRPuy
 BQHTmNZ9nPLrd8MkC2eeL5izKfC4VDHnfpc9AEh3GdG+HSao9wkbUemCU
 wFdoXaNTTkyKuEWoi2E69zihUCpdvJyedTtXO+PcH5gnvPwAH0NeF7VPG
 s+9DwwhLQCI0F1KFhrAIl2/fU8bheI/UBQSDASOvH4q0FmlDVBgAWS6LX
 s/LlICMHNxul3lyte3IXxv3qziXI4+zaTOFpjJWHJogZEiXIPTmlas5PI
 eL3H6AlyD4vOpsPLZw5vS+XEJ4X1hBnMRV/2JlHyOY1B0kxrN/IgvTsjx w==;
X-CSE-ConnectionGUID: 4X1CXvyCSTqnRuBLUM/4sg==
X-CSE-MsgGUID: P4dOcYK6SlOU2Hy4vak1pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90027397"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208,223";a="90027397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 16:36:35 -0700
X-CSE-ConnectionGUID: 1HHMFYdYTqqfCYJnUAgTLw==
X-CSE-MsgGUID: VV1RIkhHRGWyurTlrwxNOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
 d="scan'208,223";a="237687255"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa009.jf.intel.com with ESMTP; 11 May 2026 16:36:34 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, x.wang@intel.com, Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 0/3] tests/intel/xe_pat: dynamic PAT index selection for
 pat-index-auto
Date: Mon, 11 May 2026 23:36:19 +0000
Message-ID: <20260511233622.2074382-1-zongyao.bai@intel.com>
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

From Xe2 onwards, the PAT table has grown large enough that exhaustive
testing of all index combinations is impractical. This series introduces
a new pat-index-auto dynamic subtest that selects PAT indices from the
hardware PAT software configuration at runtime, improving coverage across
runs without hard-coding platform-specific tables.

The main patch adds pat-index-auto, which builds a test mode set in two
stages:
  Mandatory entries: one representative WT, coherent, and non-coherent
    entry, always included for baseline coverage.
  Random entries: remaining valid PAT entries shuffled with Fisher-Yates
    and appended up to the configured test count (12 by default, 6 in
    simulation mode).

Zongyao Bai (3):
  tests/intel/xe_pat: fix typo in r2 wc debug print
  tests/intel/xe_pat: drop redundant manual srand initialization
  tests/intel/xe_pat: Add dynamic PAT index selection for pat-index-auto

 tests/intel-ci/xe.fast-feedback.testlist |   1 +
 tests/intel/xe_pat.c                     | 167 +++++++++++++++++++++--
 2 files changed, 160 insertions(+), 8 deletions(-)

-- 
2.43.0

