Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21657CA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 03:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF0010E649;
	Wed, 17 Sep 2025 03:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMqbTEaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FCC10E649
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 03:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758081413; x=1789617413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hre7/fhN52FV+y5fY2oW82vzH989lbUdzVy2blYXSqE=;
 b=YMqbTEaR6YOo5X7hktm2crl09V5fUBdfaLBcXUQeOfWT29UELlsWcbWS
 q/NCPrwyz1+P4fxHKbEDiv/7au0vCl6mGWXNln37Ewn/R0tlWPuG2c+xa
 X6qFYYIwfhQH0CsQFpb2MkFvDPqxRlXaqo+eb1A+gcRJVDcIi1qYzuhxw
 X7EoAmytk3pfYFPBXdABkCvtlbeUJoB+ty6QUyJx+iBJuBiMRTdsbiKmD
 V3IgIfjMUxn+p4qcNELZNc9U3uPb6HuwlYaUFORVgiabRhOjoUTrNzAQ8
 81ls9F+2ckf4C0sBACrIg3eMy22iKD6NdlEDEd42D3aJV94Yzvfa5zFzt w==;
X-CSE-ConnectionGUID: cqVm8FUhT9KVqBaXWFom0A==
X-CSE-MsgGUID: 1WbCn2RXSP2OlwGt+tog0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70626418"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="70626418"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:56:53 -0700
X-CSE-ConnectionGUID: WU0aZ7ViTuefq/Y3JRvKLA==
X-CSE-MsgGUID: lrjBNrPSR56tcCkS635VBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="174738797"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:56:52 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v5 i-g-t 0/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Wed, 17 Sep 2025 03:56:38 +0000
Message-Id: <20250917035639.187462-1-sobin.thomas@intel.com>
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
    into the igt_fixture.

v3: Added check for thread group preemption and WMTP.
    Added enum flags for preemption type as per review . [Zbigniew]

v4: Added check for preempt inside __run_intel_compute_kernel_preempt
    Refactored the code.  [priyanka]

v5: Refactor for finding the kernel and out of bound check. [Zbigniew]

Sobin Thomas (1):
  tests/intel/xe_compute_preempt: Compute preemption check

 lib/intel_compute.c              | 87 +++++++++++++++++++++++++-------
 lib/intel_compute.h              |  7 +++
 tests/intel/xe_compute_preempt.c |  6 +++
 3 files changed, 81 insertions(+), 19 deletions(-)

-- 
2.34.1

