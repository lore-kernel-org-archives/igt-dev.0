Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AD8CAC59F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 09:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACAB10E12A;
	Thu, 18 Sep 2025 09:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcbuI3zu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD56510E12A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 09:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758186071; x=1789722071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u2C1VOgmKX9ju3Rsje0TNJ6SmNy9DpaY9Py8VrlRAWA=;
 b=KcbuI3zumj6CowuPUjuqhcrmzlnoZniRN6SmC9aWq4btOrld5o78g5CI
 R6rFgR39axnsdlb0mGrXjT4tJZdg2XwgrGSh/r6ot4vObYDAwsLLKM7/8
 KQ1Wj/iEWYyjgG5/8Qt+gXaHmORw8/WKgcv+QtynceCTd/LHNVy72CvPt
 EuOA6ozmUeQZbzXiGUq7TZjrICH+KuCtb+RM4YhkXmdwnRGikF3C/vP/z
 NU9WeTX2vgkq5Ncl605NhEzWpzKboFpGKl/WmbyZqEFGUs2pGlvxi1ed5
 d0RLlpQWxZqa4DEcqFRiWR6haFBsKMsEVjnwTfuwbOyl7Pv6I2ssWCAkw w==;
X-CSE-ConnectionGUID: DzBvI0B5QFeR+aypsZKx9g==
X-CSE-MsgGUID: /z3xIZx9SOWDV1xVvsahgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64313244"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64313244"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:01:11 -0700
X-CSE-ConnectionGUID: V0URrIKKTDyVivjnntmzqA==
X-CSE-MsgGUID: PmVUxtdaTPug39eZ3GPv2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206281469"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 02:01:10 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] extend lobf test for supported connectors
Date: Thu, 18 Sep 2025 14:46:59 +0530
Message-Id: <20250918091702.2339227-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Extend lobf test for all connectors that
exposes i915_edp_lobf_status debugfs

Kunal Joshi (3):
  lib/igt_kms: add helper to check presence of lobf debugfs
  tests/kms_vrr: extend lobf test for supported connectors
  tests/kms_vrr: remove check for PR support in sink

 lib/igt_kms.c   | 20 ++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c |  8 ++++----
 3 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.25.1

