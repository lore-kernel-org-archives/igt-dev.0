Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478DDC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 10:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2C010E9DF;
	Fri, 28 Mar 2025 10:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AieeMR8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F0A10E9DF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 10:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743159586; x=1774695586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8+6kDIy/VQjQ9rMdouJw8yL74Su5KQRQ9+xTAPQPkoo=;
 b=AieeMR8rF/r9iomw5CA21ozeO0AIRxldA5VLlK+MImb9tE54Yp03s5/X
 3r9uigOL/PtXfu/FxBFc2+HC9GHHzqt7q/IeMElpr2QJPe2wZv2EoPb5g
 J8eJ2G5IboMCAAcZjqsTV4cnhYbl2hLiqHfZoKSnEvmeyxul0RHS3NwiZ
 zo4pPgZ/jSZ3bKRDYOyjtpNhePEzm2AyKZCQWu/Mozbyin/0eI5BAKZx6
 6K57ePSlXMturu8xleadjgtdqi1GS4adZtU0EYSe3SDQ6X95Sp8ygVkIM
 f2jPtRDvdlxytCU/uFZx5AQqm6XiXNTO1dpqalEZVMyJH5QPRT4yGBJGP w==;
X-CSE-ConnectionGUID: aIK+RWW9QZq5DNDbsIizXw==
X-CSE-MsgGUID: i248sTHDTAmV5K559UTqlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55886299"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55886299"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:59:46 -0700
X-CSE-ConnectionGUID: udDa6iTUSwGG9ixC2+omwQ==
X-CSE-MsgGUID: glCbYlSdSwOP3SvfAKtmDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130271398"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 28 Mar 2025 03:59:45 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t v4 0/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv() xe_guc_mmio_send_recv()
Date: Fri, 28 Mar 2025 16:45:29 +0530
Message-Id: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
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

Satyanarayana K V P (3):
  tests/intel/xe_fault_injection: Make setup_injection_fault()
    programmable.
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
  tests/intel/xe_fault_injection: Do not assert for probe_guc_fail_*
    functions.

 tests/intel/xe_fault_injection.c | 117 ++++++++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 9 deletions(-)

-- 
2.35.3

