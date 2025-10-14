Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F58CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 11:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA5810E5AE;
	Tue, 14 Oct 2025 11:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oA+Dlzrz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F4E10E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760442231; x=1791978231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9KVy3qms1Bb9UUjMluF/lOq0d9QQcfHBcLYkKgbMIao=;
 b=oA+DlzrznM0rFhN4kDejf34zOm1LPSi6sTWsi39BFU8NE5CV7L6TG2Bc
 ToduDd/7B3iUco00Q3Dv7j+uyjD3OiY+E0e/WCocG5LKH4bEAezURWggn
 t8XBnooTq8NIZNE3rV4YmQmW2u6pc7peM8NPuyQYOOi8bGNY/OZeYkSXg
 5Xcs9qzCBQUn3C8HYAaeMvDx7ynDu64pYKLdahon5Xkdcd1Hz1+JfSo5G
 hl44KUCzBPFITBbEx1bTkVkv+Ya02U52BpQsMZaMkrJ+LJINdiHg5CXOR
 nCsT4o2a/4odWhKxGIVnnLVbgOxOO3IsH95aIGbBs6gPJJJoc/AyJg9wh Q==;
X-CSE-ConnectionGUID: xGGU7oApTdS1EQ1R/Ct4SQ==
X-CSE-MsgGUID: JhAAiMWzRpWOASMx9/Cawg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62509217"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62509217"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:43:51 -0700
X-CSE-ConnectionGUID: agk5LMR8QlW6TAM+efJXDg==
X-CSE-MsgGUID: tQVTxhuGRM2txnlZGoM/1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="205569293"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:43:49 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, zbigniew.kempczynski@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/4] tests/intel/xe_eudebug_online: Introduce pagefault stress
 tests
Date: Tue, 14 Oct 2025 11:43:32 +0000
Message-Id: <20251014114336.1712360-1-jan.maslak@intel.com>
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

This patch series introduces stress variants of already existing
pagefault-(read|write) tests in the `xe_eudebug_online` test suite.
These tests use the maximum number of threads in thread group and
maximum number of threads in the shader.

v2: Compute `maximum number of threads in shader` and
`maximum number of threads per thread group` values based on
hardware capabilities instead of using hardcoded values.
v3: Added `num_threads_in_tg` to gpgpu_shader struct, as opposed
to passing it through function arguments. Add xe_query helper
function for retrieving u32 hwconfig values.
v4: Addressed review comments for computing max number of threads
per tg.
v5: Computing max threads per tg warns instead of asserting on
unsupported configurations.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Jan Maslak (4):
  lib/gpgpu_shader: Add num_threads_in_tg to shader struct
  lib/gpgpu_shader: add function for computing max number of threads per
    tg
  lib/xe/xe_query: add function to retrieve uint32_t value from hwconfig
  tests/intel/xe_eudebug_online: add pagefault stress tests

 lib/gpgpu_shader.c              | 136 ++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h              |  12 +++
 lib/xe/xe_query.c               |  17 ++++
 lib/xe/xe_query.h               |   1 +
 tests/intel/xe_eudebug_online.c |  61 +++++++++++---
 5 files changed, 217 insertions(+), 10 deletions(-)

-- 
2.34.1

