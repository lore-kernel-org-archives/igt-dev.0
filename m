Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851D4C369A1
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9A310E2CF;
	Tue,  8 Apr 2025 18:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6GtWMSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F10810E29E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744135945; x=1775671945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FpjEUeG3bjaHiObh8MXHDVJ5cKThac7N+Fnfpt/jizE=;
 b=Q6GtWMSdH3GTRRCBtB3avAgag4CWgt6TEmr7fQJyHQMW13waJS/Nsm/8
 rTcX0pI5jyNCsrG3Ma0dUUxqJhchJvOqrf6VdAatmk4lxj3Y7kKu9DPIk
 rHosdy650pWDFuffC4oqkh2T90kvRXei7L8OIXmhb2v4zOWotb2jFS9yv
 BJDdfk0x3rbdFwp8zGht9jbQT6qj0CFuuPt4Z21m6hcQNE16bJpzTOE29
 3MmG3g0FDOLQLTtkoiWA1PTmadPItcX+FsKHiJB6DF5KEuA5VBlUXlpa8
 j9UbLvGxmZgrJ5QcWnFAJEHVvmjPGyJ+PAht9Tqwsle+idtsvMKXGldDz w==;
X-CSE-ConnectionGUID: q5hoZQb2QnazgRxp52JIOQ==
X-CSE-MsgGUID: EKH4gNn4SPOYODTkVCdzxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45479353"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45479353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:24 -0700
X-CSE-ConnectionGUID: U97CmTZ/Rp6uWGhLGN4hAQ==
X-CSE-MsgGUID: xqHaWk1kS6Ws3FIrZHNJFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128683599"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/6] Sanity check Xe2 PEC OA reports
Date: Tue,  8 Apr 2025 11:12:04 -0700
Message-ID: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Ashutosh Dixit (6):
  tests/intel/xe_oa: Rename check_reports to mmap_check_reports
  tests/intel/xe_oa: Fix oa_tick_delta
  tests/intel/xe_oa: Sanity check PEC report data for TestOa metric set
  tests/intel/xe_oa: Only sanity check timer PEC reports
  tests/intel/xe_oa: Reduce test_non_zero_reason execution time
  tests/intel/xe_oa: Use TestOa metric set also for OAM

 tests/intel/xe_oa.c | 152 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 143 insertions(+), 9 deletions(-)

-- 
2.48.1

