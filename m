Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7DECDB466
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 08:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2007010E545;
	Mon, 22 Jun 2026 08:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0acRHcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094BF10E545
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782118413; x=1813654413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XZoQSd+U6LkzIJyL745tOONvqvKr0Bpq0M58EYjdRuE=;
 b=N0acRHcHfjqniz6YShtVRT2qLwjCXJ79PbmFMAG7iK4bJ+EwrPVrVyXq
 vjvYqghiKSlI51ZuPxcvp7AX21ow3Nua20ZaDpSY3TdTIyzvLGkhMJ6ln
 naTMDICUEmi5O4g0uG6zPtDjGqv9NtA21jMVkJ3pW+nXUiAoWKNi4E6kC
 DR055YsKE6rvteSStdlVB5D47e/pDAKYwgaKwrYqFg4bJRd1bXHkEfNeZ
 VE2LIAitaGEEzPEi7H2H/o1eeHj13Psi6lEfDSedGYml1yb/Y/d5MkguL
 DzgejsXGVUHRfLGoDR/CLbf5r5wlFBz4mHuSqv5jfTJ+QAxrNmII3xtPS A==;
X-CSE-ConnectionGUID: F5mB46D0R3KNXHTNxEz0Fg==
X-CSE-MsgGUID: q2u6sBBxSD2YdxUvUgcRFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="85396579"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="85396579"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 01:53:33 -0700
X-CSE-ConnectionGUID: uxxyEAELRq2QA/wN2P5A6Q==
X-CSE-MsgGUID: w62COHnVTUm84yknJU5L1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="253505528"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 01:53:31 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/2] tests/intel: Add Xe timeline syncobj coverage
Date: Mon, 22 Jun 2026 10:51:57 +0200
Message-ID: <20260622085159.3318909-1-jan.maslak@intel.com>
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

This series adds Xe-specific timeline syncobj coverage for both
xe_exec and xe_vm_bind.

The main motivation is the xe_exec input case: waiting on an older
completed timeline point after the same syncobj has already advanced to
a later point. That is the shape that exposed the historical xe_exec
NULL-fence regression.

The series is split by interface:

 - patch 1 adds the exec coverage, including the regression-oriented
   completed-point input case and a timeline output case
 - patch 2 adds matching vm_bind coverage for the same timeline syncobj
   behavior

Validation summary:

 - on a fixed kernel, all four subtests pass
 - on an intentionally faulty kernel matching the old behavior, both
   vm_bind subtests pass, xe_exec output passes, and only the xe_exec
   completed-point input subtest fails

Jan Maslak (2):
  tests/intel/xe_exec_basic: Add timeline syncobj exec tests
  tests/intel/xe_vm: Add timeline syncobj vm_bind tests

 tests/intel/xe_exec_basic.c | 233 ++++++++++++++++++++++++++++++++++++
 tests/intel/xe_vm.c         | 152 +++++++++++++++++++++++
 2 files changed, 385 insertions(+)

-- 
2.43.0

