Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AEBECE564
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 07:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B316310E6A0;
	Tue, 10 Sep 2024 07:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQRQt5oB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCB810E6A0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 07:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725953981; x=1757489981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cAufSYOI1LMNdVmokaGwksWr+8FJBJ1RXAI4HafLj0U=;
 b=eQRQt5oBaAfueBdgK7ulo14LAYs9BtCH86NNRNcstYBpRqb8aGuAXQFz
 FlfBwgqM/1akVCcv8GLstteNmQNjgSmZ60FbOt+rHDPGJy14SFf3K0B37
 81AbME9iBT5zB7UV9le5KqC/r9GvI37teCtqGQP5TZ/je7RnzxEfjUCTh
 Go1T/cRD9xdBl2Zx+gOFiKbQPrYDxjEMk7oXDsSfoi6OdP95qww1Zyn06
 02gHlESAPOkqmsikYUiYQAusoc1Z0hP8a/if/+ypdM5ThqUPtqakxQO6W
 paVlKPYFdMMplHYDO5DggHu5WAfHsgtqj8yQT4mEN+BvrR77yh7lFkKtU Q==;
X-CSE-ConnectionGUID: hiZXbsbETAieSYnNEfbPqg==
X-CSE-MsgGUID: Jkg7umbMSSKXE+nBpogvqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24843752"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24843752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:39:40 -0700
X-CSE-ConnectionGUID: LFVzC5TWQ/SOJIxZwgzORQ==
X-CSE-MsgGUID: Le/KK0+gQBiWgPvX2W7y7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="90233640"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 00:39:39 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v2 0/2] tests/intel/kms_psr: DP2.1 PR IGT Fixes
Date: Tue, 10 Sep 2024 13:09:06 +0530
Message-ID: <20240910073908.1608661-1-ramanaidu.naladala@intel.com>
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

This patch set contains fixes for DP2.1 Panel Replay issues we have
found while debugging the code. These issues are related to DP2.1
monitor always being MST. Also wrong usage of SRD_STATUS and
PSR2_STATUS registers are fixed.

Naladala Ramanaidu (2):
  lib/igt_psr: Remove SRD status change check for DP2.1 Panel Replay
  lib/igt_psr: Fix PR state check for DisplayPort connectors

 lib/igt_psr.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

-- 
2.43.0

