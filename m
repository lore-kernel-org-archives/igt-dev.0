Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F954C369CB
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 10:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C9010E1C3;
	Tue, 22 Apr 2025 10:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdQfXkC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCCD10E1BB
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745316812; x=1776852812;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rypxnY3lWaMAd/z7AauLg67D1T7hyVqrXMVDQxtYUxs=;
 b=OdQfXkC1ytBt3v7+IRPkKf1ZJcBvC/BrVKK6drmOkXbSgakoKeSWxfg2
 FFp5FvxoANrFxQgfZyO1DoDOuNWiiGzsn2oXeCoWMAggOarBUtg82eH2f
 ZW6wl4f6cYaN+sb0ICfu6hTrKVm1bZmHyD/ulzQ6ViuhofkMOuC/Oiobj
 ZvNFeKU5i2SNXpW/hBgpGa7cvBc1yHwMRkrT8Gb3GROMjlH4/VSwoAOWM
 K94PB6ytA90D46H3yKQ4PkcI2bFRNtVOGUrnSP/Ntl4LvA5aCCv1AzA6u
 q2kzLvsvqzOqUqhitXdzHUXQ3MEotfdBtDxEPhVO/LlGkd6DdPrrz1z8G A==;
X-CSE-ConnectionGUID: Zxz4uOyqQc6Ca5cdFrz5kA==
X-CSE-MsgGUID: Vkq8K7QDTdO5JQZip93zZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="47050102"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="47050102"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:13:31 -0700
X-CSE-ConnectionGUID: hgviId9qQqOin50HpO70EQ==
X-CSE-MsgGUID: QnrhcPH1TAe3ZWEMFjIkIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132508585"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa007.jf.intel.com with ESMTP; 22 Apr 2025 03:13:30 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t v8 0/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv() xe_guc_mmio_send_recv()
Date: Tue, 22 Apr 2025 15:59:38 +0530
Message-ID: <20250422102941.1678-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use the kernel fault injection infrastructure to test error handling of xe
at probe time when error is injected for functions xe_guc_mmio_send_recv()
and xe_guc_ct_send_recv().

Error can be injected using:
igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv

All xe_init() kind of functions are called just once during driver probe,
so it is sufficient to fail first/all calls to them. Driver communicates
with the GuC multiple times, and the real failure can happen at different
call, hence the need to inject failure in GuC communication functions,
like guc_mmio_send() or guc_ct_send(), but it can't be just first call or
all calls, but we need to be able to select specific iteration to fail.

To address this problem, an optional input argument is introduced. If the
argument is not set, an error will be injected in every possible function
call starting from first up to the max number of iteration defined by
INJECT_ITERATIONS, currently hardcoded as 100. If the input argument is
set, an error can be injected at specific function call.

Satyanarayana K V P (3):
  tests/intel/xe_fault_injection: Make setup_injection_fault()
    programmable.
  tests/intel/xe_fault_injection: Inject errors in xe_guc_* calls
  tests/intel/xe_fault_injection: Return result from
    inject_fault_probe()

 tests/intel/xe_fault_injection.c | 132 ++++++++++++++++++++++++++++---
 1 file changed, 122 insertions(+), 10 deletions(-)

-- 
2.43.0

