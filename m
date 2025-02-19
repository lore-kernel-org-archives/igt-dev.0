Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D42C021AB
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 07:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8762B10E46F;
	Wed, 19 Feb 2025 07:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lR6WgZgV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA61E10E46F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 07:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739949555; x=1771485555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qP208rZEqeaqlQBg0EYiJ1uUp+pr/iszrBOLA1Fg024=;
 b=lR6WgZgVSQfisOfOdbyhVtWPykKOENLAg92lNVlE0TO3OtW+GInhCkzF
 eCzRXzs2BxACBciEqf7xOQos2qYhpuQdnb0lnBQIm/aGNreTYkQ9yhV8z
 hrnx1frYSoZtQOwKt+pSVUjEzYVlu+VEUvH74Dir2h+KJ89MABNvl7rIn
 oieUMF/13oRrEJO7TOGcssKsB6z3JccG+Nq6yWuOnG4kq/cK0Di2b5YQZ
 KxAtADeGD7v72/Uy9BeKgJOCEJPIigVrT+NCJPgFppi5pT/kcPDVPnluA
 VjkufKN+UKX3Myz/3ggXjxCoHweonQM0+SsVYVeIyY/geEjyQeg5bHmsA A==;
X-CSE-ConnectionGUID: 7sbakU5gSni5lq5SAUzARg==
X-CSE-MsgGUID: XmCqlPrJRdCJFvFeqt8NOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40885356"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40885356"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 23:19:15 -0800
X-CSE-ConnectionGUID: 4QBt9W87QCyMu33oH/iNIQ==
X-CSE-MsgGUID: PB0ORIOGSX+4hhpt8+CcSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="114611790"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2025 23:19:14 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t v2 0/5] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv() xe_guc_mmio_send_recv()
Date: Wed, 19 Feb 2025 13:04:40 +0530
Message-Id: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
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

Introduce an environment variable IGT_FAULT_INJECT_ITERATION using which,
an error can be injected at specific function call. If the environment is
not exported, an error will be injected in every possible function call
starting from first up to the max number of iteration defined by
INJECT_ITERATIONS, currently hardcoded as 100.

Error will be injected only once for all init functions. This envronment
variable takes effect only for xe_guc_mmio_send_recv() & xe_guc_ct_send_recv()
functions as of now (can be expanded to other functions in future).

Satyanarayana K V P (5):
  lib/igt_sysfs: Add support for device unbinding
  tests/intel/xe_fault_injection: Make setup_injection_fault()
    programmable.
  tests/intel/xe_fault_injection: Add helper functions to inject fault
    with specific budget parameter.
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
  tests/intel/xe_fault_injection: Do not assert if the captured error is
    not same as injected error.

 lib/igt_sysfs.c                  |   4 ++
 lib/igt_sysfs.h                  |   1 +
 tests/intel/xe_fault_injection.c | 101 ++++++++++++++++++++++++++++---
 3 files changed, 99 insertions(+), 7 deletions(-)

-- 
2.35.3

