Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF09EFB5175
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6217610E2E8;
	Mon,  6 Apr 2026 22:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJzfkj/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1914510E2E8
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514439; x=1807050439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OaQX+iMKlm3hMLsDZt7+3FuTpMwSPyUWBCIdMUGdgWU=;
 b=CJzfkj/PIhAYS0dIiSTBUkD2lzLKGDqUivF+F0H2YKbCwskVZAlhrUJ4
 Lw7opSHDJ4QFeqUcfGEh1hN+T+NQjbDVMMsVc/Amlk3qoHvxE7L2UIau/
 /6xH61DeCKHS+auwEv9WOuzo7fTTMkmGF7crdkFwj93zcsbGuvT200qUk
 lwJZ4vBdYmqm2JVvYzCA1uBPZOCTEzZSP1LSp6JguFKr9LznikkGI5rmB
 lLsUpun7KPPPCFSkxwFepP571dufaYd5JRZex3oWf2eT3HxI/AiGjthjc
 oaZGRVlHW8ONr54pAV0pMb7v72OSYj8z/bdEoQkygLFTIO/2I/gY1O78+ Q==;
X-CSE-ConnectionGUID: YRIvP9hyTiqHgMPPxqbaFg==
X-CSE-MsgGUID: JGnNfIVtSMCl/NWM0B4i2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="99094818"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208,223";a="99094818"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:27:19 -0700
X-CSE-ConnectionGUID: iN/xB1b9SFO8oUzGBNNDyQ==
X-CSE-MsgGUID: 3tZfzvE0QluLxcVi1F1Iog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
 d="scan'208,223";a="221416440"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 15:27:18 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 0/5] Randomize PAT test subset
Date: Mon,  6 Apr 2026 22:26:58 +0000
Message-ID: <20260406222703.3217769-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119231900.3797119-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
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

From Xe2 onwards, the PAT index has become large, making exhaustive
testing of all combinations impractical. This patch introduces a hybrid
testing approach to maintain comprehensive coverage. The PAT index test
list is constructed using a two-phase approach: Mandatory Entries and
Random Entries.

  v2:
     Modify patch tests/intel/xe_pat: switch PAT tests to igt_srandom()
     remove igt_srandom() because it is called in common_init().

  v3:
     - Separate patches based on their intended goals and features.
     - Dynamically generating test modes from the platform PAT instead of 
       hardcoded tables.(suggested by Xin Wang)
     - Rebase

Zongyao Bai (5):
  fixup! tests/intel/xe_pat: limit number of dynamic tests
  fixup! tests/xe: add some vm_bind pat_index tests
  tests/intel/xe_pat: cache and decode PAT entries
  tests/intel/xe_pat: detect wt support from cached PAT entries
  tests/intel/xe_pat: randomly generate test PAT set to cover more PAT
    index

 tests/intel/xe_pat.c | 371 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 275 insertions(+), 96 deletions(-)

-- 
2.43.0

