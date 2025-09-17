Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A86CA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 10:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639F010E193;
	Wed, 17 Sep 2025 10:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BONb+y6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F7010E193
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758103874; x=1789639874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V+sEQsk9kIm1pPJT/HvQSZ1v7UmosDsNbewakpMM20c=;
 b=BONb+y6WNcl4cLOWx6iFHtHyNZbHndaqY+KAAtofBDxh0P1xgIBnsRHn
 /bMs5CV1gMtAJGrR8mht0O7YB+f9VBt1f70asWRCFEbnz+X0m571MNtNE
 T0x1jlqZ1gqDtqB+UnKMUE1PHwPhvkw1aKGQapTFGSgjKODp9M1oU7RgR
 quUGs5NFhQxg6dqlRt4vUgSU6UZrBX70Hol1g7NI7+x9ojmzw33tOCfZq
 fxwL6NIS/epG/NycNKzPENjWIUt1+F9+0QDNEfnQWiGWDD9wVCN0A6UWc
 JCn0lujhz5VtLkrof08sZ+lhYpuribWT88mhrzpxcpyPaM8Rg+RbbNqrQ Q==;
X-CSE-ConnectionGUID: Wk/s80Q3Q8iM/pomecPoVQ==
X-CSE-MsgGUID: T2UiHfOuREOJ/iAby9iWUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64037594"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="64037594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:11:13 -0700
X-CSE-ConnectionGUID: xg5lxvzoQMiJ2s9sP6JQRw==
X-CSE-MsgGUID: 9/Lc/w0cQH+vCUcb0inPng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="175126197"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:11:13 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v6 i-g-t 0/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Wed, 17 Sep 2025 10:11:04 +0000
Message-Id: <20250917101105.236457-1-sobin.thomas@intel.com>
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

TODO: Add the kernel for PVC

v2: Fixed review comments to move the compatibility check
    into the igt_fixture. [Priyanka]

v3: Added check for thread group preemption and WMTP.
    Added enum flags for preemption type as per review . [Zbigniew]

v4: Added check for preempt inside __run_intel_compute_kernel_preempt
    Refactored the code.  [priyanka]

v5: Refactor for finding the kernel and out of bound check. [Zbigniew]

v6: Added NULL Check for kernel. [Zbigniew]

Sobin Thomas (1):
  tests/intel/xe_compute_preempt: Compute preemption check

 lib/intel_compute.c              | 104 ++++++++++++++++++++++++-------
 lib/intel_compute.h              |   7 +++
 tests/intel/xe_compute_preempt.c |   6 ++
 3 files changed, 95 insertions(+), 22 deletions(-)

-- 
2.34.1

