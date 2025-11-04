Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EC4CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 06:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394C810E51E;
	Tue,  4 Nov 2025 06:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOFVLLAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75E210E51E
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 06:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762236103; x=1793772103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ttlenSFIV/oqp/Y5ocf4NAdtKGEBwPHaNy4SAbaEsPQ=;
 b=dOFVLLAvwJZKtixAd6fggYqHxLFxUrBfzlgkc6G2Q9+lTfE4TZw3n6TM
 vD9Ab+Vo4wf8GhDHNYgxaoerB7k1+qLXwCSJtAn0fPS/wqx2oO79Ugn7x
 oj8yq8XCIGdbU5DIyURiP3Ub2hrWEnE/S/k6kKgrTEo7e5l9VBuiEb7kh
 T2sC0Tnzr8dkuzKI42nr6gOF78H2d9rOxG4ohsw0z+d/XL9LX3VDtbXFp
 Rkf5ugip40kbooLZ3NGd5N/IZHWiZyfpYWhMOmPyDA6wb5F80G/VDVTS+
 fFT95f3xCz9rRgZaAN461vpUOcsbD+SZWD3H6bTxQ/4X959SKHzDvUWRB Q==;
X-CSE-ConnectionGUID: llluvpZUS0SNabatHW0ypQ==
X-CSE-MsgGUID: 0SkoUNWVS8CCtNEzc8dUbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81728715"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="81728715"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 22:01:43 -0800
X-CSE-ConnectionGUID: RJiU00qJTe6m9j2SZ4gqmg==
X-CSE-MsgGUID: OSzyXIt2T8e3oiTP90I7Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="217709578"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 22:01:40 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t 0/3] Improve engine activity accuracy test with spinner
 reuse
Date: Tue,  4 Nov 2025 11:21:26 +0530
Message-Id: <20251104055129.3826274-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series improves engine activity accuracy test by creating the spinner only
once and reusing it across iterations through a new helper, xe_spin_reset,
which resets the spinner state without reallocation. Additionally,
xe_spin_sync_wait has been made non-static and exported to support this
reuse mechanism.

Soham Purkait (3):
  lib/xe/xe_spin: Introduce xe_spin_reset
  lib/xe/xe_spin: Export xe_spin_sync_wait
  tests/intel/xe_pmu: Refine engine activity accuracy test

 lib/xe/xe_spin.c     | 30 +++++++++++++++++++++++++++++-
 lib/xe/xe_spin.h     |  2 ++
 tests/intel/xe_pmu.c | 11 ++++++++---
 3 files changed, 39 insertions(+), 4 deletions(-)

-- 
2.34.1

