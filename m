Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3C3CCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 16:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAB710E2B0;
	Mon, 20 Oct 2025 16:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DHNUNbkJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C0910E47E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760977134; x=1792513134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mHimfZ6X4D1gGYJyYv5p8TfChIKndKvT76HREkmrzqA=;
 b=DHNUNbkJhRH2fPhCspyjsAiQ4aDgzH9IntZud9iOBDcAeqoPliIMpz/L
 cqSXOdT0wndzGY/mIAWO3vhPsgkOOpUhPYNtR0Vq0pCnt/ztADvbJHOQA
 H+B8VZgrc+s/AgsqAU9L6l2lLZ8eT6rdVZCNLCU38o9/rgKi1d29lm6Sq
 xMekrIa3wCSZsBAqsm447C5P/UGVIghklwQAZUQyBCCkpDIo9AS+Y1/E4
 eS84xsnOZltr5FDIZB/3Dl6PoPA8L5GP0Vl3hBihGLteaVShTf6EQiq6z
 pLJdTOalwcNWNeum5Io18TkIb+NUk+PqGOB7+0Tp6Qesz2Lj/7p8gEsB8 Q==;
X-CSE-ConnectionGUID: 1iaDRjSxRMWZbpX0w1CDyg==
X-CSE-MsgGUID: ivtL0sDHSMCjOz2PZw2yLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62989623"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62989623"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:18:53 -0700
X-CSE-ConnectionGUID: xvGfEYKcRVCkRm+WB8ueLQ==
X-CSE-MsgGUID: jIHPuvoLQ4Khg7Er0yTndg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183209605"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:18:52 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/3] Add renders testing in core_getversion
Date: Mon, 20 Oct 2025 18:18:43 +0200
Message-ID: <20251020161846.156952-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

Add a new subtests all-renders similar for all-cards. While at
it make all-* subtests to not load any drivers, only checks for
already exiting ones. Refactor also basic subtest so it will
have old behaviour and only this one will use DRIVER_ANY and
it will try to load DRM driver from known list.


Kamil Konieczny (3):
  lib/drmtest: Add raw card|render opening
  tests/core_getversion: refactor all-cards subtest
  tests/core_getversion: Add new all-renders subtest

 lib/drmtest.c           | 74 +++++++++++++++++++++++++++++++++++++++++
 lib/drmtest.h           |  2 ++
 tests/core_getversion.c | 34 ++++++++++++-------
 3 files changed, 98 insertions(+), 12 deletions(-)

-- 
2.51.1

