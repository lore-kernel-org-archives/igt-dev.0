Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B3EC3DA4A
	for <igt-dev@archiver.kernel.org>; Sun, 11 Aug 2024 20:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A0610E01F;
	Sun, 11 Aug 2024 20:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIJzcBeo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F6810E01F
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Aug 2024 20:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723406674; x=1754942674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RDd9/7DjxknHFl0lH2aL1eFIwxUmbF8zN/khjIacyRQ=;
 b=iIJzcBeohOmsy6ve2w1/8HN7oT4t6Lbi8blMslPaEuj7NeReEoQ24WYK
 bCcaJaTMlaNYD7EowHg3gwZPmdFlb9lvCUkmTG6IcLNp4d6kCWM2fMyuI
 p8tLgJAFv6BontN6znvUqsZai/lN9rd7EVG1uaSau4aQN+hk8KZ/q3kXP
 wJZiAa50f51M9I7FaRbZSKTqGFmErCLJ1daXYwrA2C95Hgc/SiEmOioYn
 Pw3fusGkWIFE8T8BEt93agArUbgD8d1Frr4IJUcMPrSxau/QCaQsbHE2v
 5GfIDiSa2UX86auZXZEdAs+AzGhfUQBvjBR/PedFfH5JDO9IywqtYmvsm Q==;
X-CSE-ConnectionGUID: BO+0fhSWQH2yFn1fF/NAZA==
X-CSE-MsgGUID: O9wtjungSh+MVQyn88355g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21364027"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; d="scan'208";a="21364027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 13:04:33 -0700
X-CSE-ConnectionGUID: g3AAkdZ7QiyrTxM0R7Lklw==
X-CSE-MsgGUID: SQbopdtiS3KgFKBz776tvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; d="scan'208";a="88712432"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 13:04:31 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 0/4] Improvise-the-deep-pkgc
Date: Mon, 12 Aug 2024 01:33:55 +0530
Message-ID: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
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

Naladala Ramanaidu (4):
  tests/intel/kms_pm_dc: Update VRR handling and eDP output check
  tests/intel/kms_pm_dc: Update test duration to 4 seconds
  tests/intel/kms_pm_dc: Add polling for deep-pkgc
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 164 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 269 +----------------------
 tests/intel/kms_pm_dc.c                  |  49 +++--
 3 files changed, 37 insertions(+), 445 deletions(-)

-- 
2.43.0

