Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DE5C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 04:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5E810E0AA;
	Mon, 12 Aug 2024 04:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFirly1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22DC10E0B1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 04:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723438169; x=1754974169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5D60YXc16Tx2bJTj7OMZAsuA/g8piSvJXG791q/mceQ=;
 b=HFirly1ubhKP9D1c8XxYvH/Wg4IEmCTn3oSCCG+DW8mdeNN691KvdI2q
 ANfVxhz7PhgkODoxnG46kYCldv9gXcXq8xG9WHv9tQ09BjKa3/byksqi4
 kaS6lZy7+ls6LgKFbPiupK1dV3j67o5H6LMJSChLMnGWv0OdB6z26vP1l
 2Tc9I+kV1K+Cpkim9qcd3Sxhi2zdvkX78ZANt/tDZjVqK+KoduF4IgzS/
 hc0/qsK1bltqD4sjF0/JgEY2kp6FuMmt/k5LJ/JjB+sNssxOn1pG+aGRV
 QWoht9y7JJqTBMG1BRtODV3u2HRXTP/ek3dCuCMlWKo04/Bv6wr5KG8gj A==;
X-CSE-ConnectionGUID: K47xsTL9QQqA9YNN5mmYpg==
X-CSE-MsgGUID: H94jIpucSw2dns+mB0FsBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="38980942"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="38980942"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 21:49:28 -0700
X-CSE-ConnectionGUID: he24/nH9Qdiw9s2QzQhAJA==
X-CSE-MsgGUID: +gQfMPjqSJu/r068U7H33A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="88782532"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 21:49:26 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 0/2] Add tests for ultrajoiner validation
Date: Mon, 12 Aug 2024 10:17:37 +0530
Message-Id: <20240812044739.5630-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
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

This series adds subtests to validate basic ultrajoiner modeset and 
negative tests to validate invalid pipe configs on both ultrajoiner
capable display and on non ultrajoiner capable display using the force
joiner debugfs option.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (2):
  tests/kms_joiner: Add tests for Ultrajoiner validation
  tests/kms_joiner: Add subtests for force ultra joiner validation

 lib/igt_kms.c                                 |  60 ++++-
 lib/igt_kms.h                                 |   5 +-
 .../intel/{kms_big_joiner.c => kms_joiner.c}  | 239 ++++++++++++++++--
 tests/meson.build                             |   2 +-
 4 files changed, 273 insertions(+), 33 deletions(-)
 rename tests/intel/{kms_big_joiner.c => kms_joiner.c} (63%)

-- 
2.39.1

