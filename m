Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE78EC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 04:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5820F10E0DF;
	Mon, 26 Aug 2024 04:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOR6WfDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46E410E0DF
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 04:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724648216; x=1756184216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mYiBgnv14uWJbuCbsy6EKgWDzCUmJjMcQF1QDqBz/IY=;
 b=WOR6WfDjwhkoQc0O8cK4Z9y4X8dZpcKvvxtMegWqJ3NPhaec7C0GdKDQ
 eKnRtoicIhqaKIrpQ3dGTjcNrccDpmF8JP9f98+eKjiqRkH6njQxM4XKd
 8Z3jaC2sOmooBF8BSJxoekpWY85r6O9XjxKifJpHb3QI/QbyMqk3jVRJ2
 bg52A2BskdNL8RaHRAHjgY90YvCsHWZkudGeEs9NN27zSyvTGhza6cT5b
 veHCS6khjn8QJflO9CxFDip9TnvyxDocGxhVP+IWY2PxYzFLKXNPO89re
 TX4083FRdneNTGXTsB+pX/jS/58i3hQyMy7sGwQt6no89+tgf+j0j4YXs A==;
X-CSE-ConnectionGUID: Fseejm8VRo+XvN3DDCf0gw==
X-CSE-MsgGUID: SVJoIfIXQBKkkzhjUD+1Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26845190"
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="26845190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 21:56:56 -0700
X-CSE-ConnectionGUID: KOHna45BRcukVmLGKk9QPQ==
X-CSE-MsgGUID: Pmp7kylTQt6TLyq3bGoH6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="99886289"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 21:56:54 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/3] tests/kms_plane_scaling: Update scaling functions
 to retry on valid outputs
Date: Mon, 26 Aug 2024 10:26:27 +0530
Message-ID: <20240826045630.1340226-1-ramanaidu.naladala@intel.com>
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

It will retry scaling operation on next valid output if current output
is unsupported.

Naladala Ramanaidu (3):
  tests/kms_plane_scaling: Update scaling functions to return error
    codes
  tests/kms_plane_scaling: Update Multi-plane scaling functions
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 212 ++++-----------
 tests/intel-ci/xe-fast-feedback.testlist | 319 ++++-------------------
 tests/kms_plane_scaling.c                | 299 ++++++++++++---------
 3 files changed, 268 insertions(+), 562 deletions(-)

-- 
2.43.0

