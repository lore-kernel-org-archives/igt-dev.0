Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FD1D2ED14
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 12:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB93A10E0C1;
	Thu, 22 Jan 2026 12:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhDtms/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7929510E0C1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 12:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086481; x=1800622481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=48JeVrtXgeFVY52HAEPpAi7PPXMjj88/0aHcTrnaFNg=;
 b=fhDtms/xgxVf/blQKbYtJQk7IcqI6Coq93MRnuOzUSotX0XLpbjEp84a
 kfID7BDGOwVUhExzxjVrm/mMD29UOoe9G08aCnSS9N451ZfECnlWYMlBO
 1HvSaxgzBRDpr1J6pU1kti2YkVLB/GvQdvfBGSXKxErkIInGNIJwmENTp
 Pcn3HIzzl+2WCVRGHRzMDEle4K/SqC6FW9kL5XXg6+9rHUJvJ6ebZJa2O
 uDGz1fuwyoIbder7Sod40pLKWLYeeBHPqZ7XfPyxA8fgfcyHOQrCc4a4j
 stPSDTjZkmswrglM82hVUfAxVLGqX0Uc14RdVL0H5Qnm/qLhU/72sloJb A==;
X-CSE-ConnectionGUID: OQbf5vJ7Ree241JtLf17nw==
X-CSE-MsgGUID: OqjHe021QEaiuXwWawfcWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69521470"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="69521470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:54:41 -0800
X-CSE-ConnectionGUID: PsnRZxiCTfy8jlojeSNu7A==
X-CSE-MsgGUID: P1Vyg5gkQqKlYH7lqTRYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211582018"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:54:40 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
Date: Thu, 22 Jan 2026 12:54:05 +0000
Message-ID: <20260122125424.45139-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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

The existing tests in xe_evict focus on system-wide memory allocation
across multiple processes. However, enhanced coverage for VRAM
overcommit handling in different VM modes was not there.

This change adds three new tests to verify VM overcommit handling.

 test_evict_oom(): Allocates BOs aggressively in a loop until
 VRAM overcommit occurs testing LR mode error handling.

 test_vm_nonfault_mode_overcommit() verifies that non-fault mode VMs
 properly reject overcommit attempts.

 test_vm_fault_mode_overcommit() validates that fault-mode VMs can
 handle memory pressure gracefully by touching pages to trigger page
 faults.

Sobin Thomas (1):
  tests/intel/xe_evict: overcommit tests for fault-mode and
    non-fault-mode VMs

 tests/intel/xe_evict.c | 310 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 310 insertions(+)

-- 
2.51.0

