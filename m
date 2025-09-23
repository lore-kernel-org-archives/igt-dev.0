Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD110CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 13:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E8689F35;
	Tue, 23 Sep 2025 13:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbdoXiky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B0F89F35
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758632621; x=1790168621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZLSeUbBs3O/CpxZZ1Bb/+LGkYQyGvBQ9s1ypUl/IMi8=;
 b=BbdoXikyrEPztiHJgQ6Pvdmp2mSSKUJDY8Mn8yJuqISBKZbXU2qKE04L
 +mnfog6XITPOcYkml5oUMtRNjlaS8t7FF+SLMLYZbsfveBkWQP4/6hcza
 h1ZnugGc2lIWstjRrjrwv+8Krwbw0MUNnqoaK9/3AuTViqUkpGyLoK9Ia
 qGH5IQuDKiuLzEJjetBZgOcoxgwTUCAFT9R4joRceVBT+nzWanUBHGRXh
 QWkVL/uywPKGqSZzALTxUYqifFf5k7ZFI1P4E5Z2EOfbgNCmuL1W0Ul7f
 XOLQbD0c3R5q3iPAP0ab1OklnqG4qzIo8tu4SlX0vltd/XkPtuUw+gN5a w==;
X-CSE-ConnectionGUID: WIR4Fb76SgysMQC4f4t/Eg==
X-CSE-MsgGUID: KxV+Zt8NRFmSRunzSGGNRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60964915"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="60964915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:03:40 -0700
X-CSE-ConnectionGUID: TorHHosOS/SlSANtF9KWgQ==
X-CSE-MsgGUID: VDfZ5DYfS1SyrrPa2ZgI6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="181925946"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:03:40 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v7 i-g-t 0/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Tue, 23 Sep 2025 13:03:26 +0000
Message-Id: <20250923130327.336449-1-sobin.thomas@intel.com>
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

On platforms (like PVC) that do not support walker mid-thread
preemption, running tests in forked threads can lead to inconsistent
states due to igt_skip being called mid-execution. Made changes to
perform kernel preemption check at the beginning of each subtests.
If the GPU version does not support the required features, the
test is skipped gracefully, ensuring consistent behavior across
different platforms.

v2: Fixed review comments to move the compatibility check
    into the igt_fixture. [Priyanka]

v3: Added check for thread group preemption and WMTP.
    Added enum flags for preemption type as per review . [Zbigniew]

v4: Added check for preempt inside __run_intel_compute_kernel_preempt
    Refactored the code.  [priyanka]

v5: Refactor for finding the kernel and out of bound check. [Zbigniew]

v6: Added NULL Check for kernel. [Zbigniew]

v7: Moved TODO inside the code. [kamil]
    Modified the check condition for kernel [Priyanka]

Sobin Thomas (1):
  tests/intel/xe_compute_preempt: Compute preemption check

 lib/intel_compute.c              | 106 ++++++++++++++++++++++++-------
 lib/intel_compute.h              |   7 ++
 tests/intel/xe_compute_preempt.c |   6 ++
 3 files changed, 96 insertions(+), 23 deletions(-)

-- 
2.34.1

