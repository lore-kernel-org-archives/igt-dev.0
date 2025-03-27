Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E45C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 20:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A264310E079;
	Thu, 27 Mar 2025 20:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="El1XYEng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0B910E079
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 20:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743108807; x=1774644807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TcYjB6hapiKUNIXEVq4QLdDmWl6eApXNRDKFfj0wKOg=;
 b=El1XYEngm0h+f4pT2Egp8Rg1tUVbRv0JMe6KrByJ1TQk2WDnjBKNgjgp
 l2yJ9alhnYCWJVT74uQ4aMcBwoA+EfH355DMgKPjJmRZWs5czy/3BwT8U
 jLJIvjC7qwwq6ilG1ngebqUgNw5tR7w6t5Z98nfhVwbw99NJZxiD3kUwN
 dz/aVpj7E654FgwbRVTVJVV7GMDwfjoswrfSApPG4aAMB4FUu6sxHyWxR
 /IUdAiK5Ox3sGs3zRFdoI3Q1pd5KaUUHez78O+sMQq2e08tSMyOcbkrSI
 hwqOiVCRN7J9mpSZloVNKOfmAT79OZtmioPFgnb10M4li0/WmpXJKTnSA Q==;
X-CSE-ConnectionGUID: b7FkTnYWTuylYzIOZtma9w==
X-CSE-MsgGUID: GiZOEBwQQJyH4xdbtbUvRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44478172"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="44478172"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:53:24 -0700
X-CSE-ConnectionGUID: HCcl/LsNRIGAxye5cs8ozQ==
X-CSE-MsgGUID: k5A+EH1TRPaeSMH1vARmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125012284"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:53:22 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/3] Reduce scaling tests log size
Date: Fri, 28 Mar 2025 02:22:58 +0530
Message-ID: <20250327205301.3400440-1-ramanaidu.naladala@intel.com>
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

Reducing scaling tests log size by bypass the unsupported modes.

Naladala Ramanaidu (3):
  lib/igt_kms: Add mode restriction check for Intel scaling
  tests/kms_plane_scaling: Reduce Log Level by Skipping Unsupported
    Modes in Scaling Tests
  HAX patch do not merge

 lib/igt_kms.c                            |  23 ++
 lib/igt_kms.h                            |   1 +
 tests/intel-ci/fast-feedback.testlist    | 213 ++++-----------
 tests/intel-ci/xe-fast-feedback.testlist | 317 ++++-------------------
 tests/kms_plane_scaling.c                |  23 +-
 5 files changed, 135 insertions(+), 442 deletions(-)

-- 
2.43.0

