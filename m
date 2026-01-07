Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD4BCF6BEE
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 05:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D9210E048;
	Wed,  7 Jan 2026 05:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fM4yu4f1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F211310E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 05:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767763449; x=1799299449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XXKpsKv3xjlecPxgGGt8f2NnAlWympItf1d8j5C1uGI=;
 b=fM4yu4f1ekGB8PwrQ+kdnOreZu4OrNKL6aFCFXQT1z4lp5TLcg4l3FDe
 GJsmyVuumv8wMiN32c1/xHIjpVcKxI50N0VgEgFXzmTqjYTjBX+eHyw/5
 ZSEX/NYxwXKj1eVMLb2bHngLQOleqnauIHaHHkC8rw/TRaPAB32rUE/7H
 o1kdFZHsePJ/7JuRf6tOd/EmioUhdpM2AvBTOKGt2DxuFWp3yl+Hxm8b6
 kqOKkuVgudFPNW3Qqav7NSiOQb93xzILQQsEpaBLyEsA8YSQBCatLOLya
 hJD+xUWBBZvklNLMnvjVh9GBEcmRaymDxbafWAfL0KBlphXTplSn35eSG w==;
X-CSE-ConnectionGUID: fh5hFRw4QDWGNePVs9S0VQ==
X-CSE-MsgGUID: Www5Bi1jS52GbAUsKBSulQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68869462"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68869462"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:24:09 -0800
X-CSE-ConnectionGUID: Io2zT5CJR2OUB4K4uF7jsw==
X-CSE-MsgGUID: pvRtK+OlRnmTZ0Y9Lr83jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202047225"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa010.jf.intel.com with ESMTP; 06 Jan 2026 21:24:08 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH 0/4] xe_pat: add compression subtests
Date: Wed,  7 Jan 2026 05:24:02 +0000
Message-ID: <20260107052406.21678-1-x.wang@intel.com>
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

This series extends IGT xe_pat coverage for PAT compression
behavior.

It adds three new subtests covering:
 - userptr-comp: verify PAT compression works with userptr
 objects
 - prime-external-import-comp: verify compression with dma-bufs
 import
 - bo-wb-comp-1way-bind: verify compression behavior with WB BO
 in 1-way coherent bind flow

The new subtests are also added to intel-ci xe.fast-feedback.testlist to
provide continuous regression coverage.

Xin Wang (4):
  tests/xe_pat: add userptr-comp PAT test
  tests/xe_pat: add prime-external-import-comp PAT test
  tests/xe_pat: add bo-wb-comp-1way-bind PAT test
  intel-ci: add xe_pat compression subtests

 tests/intel-ci/xe.fast-feedback.testlist |   3 +
 tests/intel/xe_pat.c                     | 211 +++++++++++++++++++++++
 2 files changed, 214 insertions(+)

-- 
2.43.0

