Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D94CFC500
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 08:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E6510E3D5;
	Mon, 14 Oct 2024 08:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3BV+wh2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57AF10E3D5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728895650; x=1760431650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DK8tMCD4U7NL7kP7WEvMosyLvLh3TGoAG0RqkFJUY/Q=;
 b=W3BV+wh2HD0HmuC9NutaXBn13z8fKDvV4iUCgQn0es1FS2O8dTOKeQrI
 /rW+zq0U29kztUr6BMDyabMREatd94BMynM1Dz087epJlbMdi+90hhmEr
 4S9TaeWXC3fq7hDtwQpj2XIvQvm35P/ze2HN8WW7j/QcnlhMXtgyePLae
 X7ZFq6M5Re/MwWffRbVQLb7AFREA6q+9QOd7Vc9jOfFspuBjhxH1chU6h
 A/WvA6We6a1p/96xLCNmn1EXWMg1w3NvAXa2CPPI/9huWtHzFb4ejP3Ew
 Ztje2Bq40c1xCumClRdIiITWCV616LyQdC7yqIthWsrsqbYjlgpUNEX4B Q==;
X-CSE-ConnectionGUID: UaDPQ1rZSHmBVFrgPmAnIQ==
X-CSE-MsgGUID: bTlEt81+RYWysaT/3ntA7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50762197"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="50762197"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:47:29 -0700
X-CSE-ConnectionGUID: 8QiRRMgHTU2b02NbZyezQw==
X-CSE-MsgGUID: jAAeEv2VRxGdneA0AGqPcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77958106"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.94])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:47:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe-fast-feedback: fixup xe_dma_buf_sync
Date: Mon, 14 Oct 2024 09:47:10 +0100
Message-ID: <20241014084710.63569-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
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

export-dma-buf-once was split into a few different subtests, but we
missed updating the test list here.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3061
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..d9fb98aab 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -75,8 +75,10 @@ igt@xe_create@create-massive-size
 igt@xe_debugfs@base
 igt@xe_debugfs@gt
 igt@xe_debugfs@forcewake
-igt@xe_dma_buf_sync@export-dma-buf-once
+igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
 igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
+igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync
+igt@xe_dma_buf_sync@export-dma-buf-once-write-read-sync
 igt@xe_evict_ccs@evict-overcommit-simple
 igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
 igt@xe_exec_atomic@basic-dec-all
-- 
2.46.2

