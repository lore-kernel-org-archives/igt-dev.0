Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD94C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAED8920D;
	Tue, 11 Mar 2025 15:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3of2ScF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423A38920D
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706616; x=1773242616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cCIZT+Py9XHQUSxBsCH0jYLJ+8lS+RAF+3OrYpgKi9A=;
 b=f3of2ScFh/IOM7C3co+kqi+BldgkjI7CZ69TdOhdQ7ZzOCcSDeAZ7huh
 +e997hJbIUOu8ZhG/yPERUvqIaCY8Fk7RWNgztAr6gtdJbxfk1meNX25L
 u/E2/8cYTvnxgyRb/ZVbP9X7gxTf0aEEVu6tPNV6ngP35BWDzq7D1+Oix
 hWr1QVuwbw/JrFG7w00KkUUgBsSf5e70yUntdCRHKeSN4V/dH28a6+qAJ
 /PJZBh3KnalHPSchfEZQiMy4RmLGDmdZPuOAhS0EfVuEHwh2Se1gHCCzE
 WGPO/tEGcJdYfgZbtPsgOw1Zh+wGAGJ+096A6CkXzFOq8Urm26eBHJ0sC g==;
X-CSE-ConnectionGUID: 3hG55ZmCQ7W5frY6qjn/og==
X-CSE-MsgGUID: 68Gv81IpR7WpXlm5ZB+vjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377111"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377111"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:35 -0700
X-CSE-ConnectionGUID: TBgKLcg0TZGq7gHUYD6C7Q==
X-CSE-MsgGUID: JpPrgGd5RISkiKc1tj5HAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066276"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:35 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 00/11] Prepare lib/intel_compute for SVM/system
 allocator, part 2
Date: Tue, 11 Mar 2025 16:21:20 +0100
Message-ID: <20250311152321.16497-1-francois.dugast@intel.com>
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

This series contains more preparation work to test SVM/system allocator,
which has now been merge into XeKMD. It is a follow-up of [1].

The first 6 patches should not introduce functional changes. Some small
changes are intentionally not squashed in order to make review easier.

[1] https://patchwork.freedesktop.org/series/144360/

*** BLURB HERE ***

Francois Dugast (11):
  lib/intel_compute: Use common constant for surface state size
  lib/intel_compute: Use common constant for dynamic state size
  lib/intel_compute: Use common constant for indirect object size
  lib/intel_compute: Use common constant for binding table size
  lib/intel_compute: Use common constant for general state size
  lib/intel_compute: Use constant for binding table address
  lib/intel_compute: Compact memory map
  lib/intel_compute: Relocate input and output objects
  lib/intel_compute: Fix enqueued local size in xehp
  lib/intel_compute: Use constants for thread groups and local work size
  lib/intel_compute: Make array size a dynamic parameter

 lib/intel_compute.c | 261 +++++++++++++++++++++++++++-----------------
 lib/intel_compute.h |   2 +
 2 files changed, 160 insertions(+), 103 deletions(-)

-- 
2.43.0

