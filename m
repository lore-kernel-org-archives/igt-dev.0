Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C33D1067021
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 13:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C1910EA0C;
	Thu, 12 Mar 2026 13:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDE+z8+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB1410EA0C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 13:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773323335; x=1804859335;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bxcIs1plYRjCh2NrSsqJ+f6sxhFP9BUGNvbfJd3m7rI=;
 b=KDE+z8+aKwbldUD7hHkD2Sk6Ok+NJpiEUdt//UEJPVp3i5+ql8h8dNUy
 HdvvgiuMXgmfEiQJF8VHfqS0jEqD+hAhQh9KypBBohXGu/oVrixw3H3LG
 0RyeGOkze5HN4VQYXTKqB72h4LHMZ6u2M7DdCAFBuSCMFFX1DJzsOxwHL
 PszYynZwFDUuPCgpqcmN2NV19cHWu7bJllFRViIqqkV2AzXiNqu9X5NlU
 tnX8ZWY+LIl+zbbUm5DZ67c2FFrtJn6H8NSm9Tl0m9VQBq60T9ApPGPP/
 gG4hB1qDA5IQw0zQofOd0J987kZdiTDSViZg26ER5M7TNpCBsd3nlf8Ao g==;
X-CSE-ConnectionGUID: q/LWVJpQS7Sy6bBUhwcjtA==
X-CSE-MsgGUID: ZegRw1AHR/OZHv9pFjaTUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78268091"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="78268091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:48:54 -0700
X-CSE-ConnectionGUID: RcPptlohQnGcGCagh9gIWw==
X-CSE-MsgGUID: lUF2PvJ/ToauOBdwydtFCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220767523"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 06:48:52 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v4 0/2] Unify Batch Buffer Alignment and Introduce
 Aligned Buffer Mapping 
Date: Thu, 12 Mar 2026 13:48:49 +0000
Message-Id: <20260312134851.647568-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch series refactors the SVM userptr copy test and batch buffer
setup in test suite to use a new aligned buffer mapping API.

The first patch introduces an interface for mapping buffer objects with
platform-required alignment, improving cross-platform compatibility and
simplifying batch buffer setup.

The second patch updates the SVM userptr copy test to leverage this API,
unifying batch buffer alignment logic and eliminating platform-specific
address assignment and conditional code paths.

ver2:
- Incorporated review comments (Kamil, Thomas Hellstrom)
ver3:
- Corrected Return format as per kerneldoc
ver4:
- Incorporated review comments (Kamil)

Nishit Sharma (2):
  lib/xe: Introduce aligned buffer mapping
  tests/intel/xe_svm_usrptr_madvise: Unify batch buffer alignment

 lib/xe/xe_ioctl.c                   | 46 +++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h                   |  1 +
 tests/intel/xe_svm_usrptr_madvise.c | 11 +++----
 3 files changed, 53 insertions(+), 5 deletions(-)

-- 
2.34.1

