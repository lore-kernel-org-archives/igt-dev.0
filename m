Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE03C0219B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 07:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E1410EA33;
	Fri,  7 Feb 2025 07:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YknVlsE3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6375B10E261
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738912418; x=1770448418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NgggtKGmK8rFuq9bURCNfoYq1qbSUZ/3XSsLhOeThhg=;
 b=YknVlsE3yIsAE6rT8t3XfB07+R7RmgfVDZ2/VUDfRyXu84StUeVNCP0r
 8GQmyAsrhNhsDjO1sgV39I/9buyGZW2GRxCPCRRfeW5k4xqErZFaKEgeh
 BkxzPqylai7Y0hDyaco2Od6R3uKhZi7PR1kT0Qb4+EJUhcrAv/eN/umx1
 dGJIs0Fi7YwdwjH2YJhTCYglrG7KS9rXaU0EoZmfwrW7oNB8kBFkasFIp
 4Pog1l2KQ0bJML2QOZrsu8mppci6gUCFBWYO/EeQ1JE+lQ6wfyON/ub5O
 fN/ys2/9TZXG9GB4cGFbpBWysDPfz+x7cUANTLQnJa0zVr8Kejr+LLL09 g==;
X-CSE-ConnectionGUID: i0gXoRJYSqqZ3q3ohn81bQ==
X-CSE-MsgGUID: cCavbl73SIWAhVfbcTL1IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50530040"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50530040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 23:13:38 -0800
X-CSE-ConnectionGUID: El/NWfnER5uuqFgGuSkMyw==
X-CSE-MsgGUID: ng9S3dyKT6aJb1mGKQY6Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111373916"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 06 Feb 2025 23:13:37 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 0/4] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv() xe_guc_mmio_send_recv()
Date: Fri,  7 Feb 2025 12:58:58 +0530
Message-Id: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
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

Satyanarayana K V P (4):
  lib/igt_sysfs: Add support for device unbinding
  tests/intel/xe_fault_injection: Make setup_injection_fault()
    programmable.
  tests/intel/xe_fault_injection: Add helper functions to inject fault
    with specific budget parameter.
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_ct_send_recv & xe_guc_mmio_send_recv.

 lib/igt_sysfs.c                  |   4 ++
 lib/igt_sysfs.h                  |   1 +
 tests/intel/xe_fault_injection.c | 101 ++++++++++++++++++++++++++++---
 3 files changed, 99 insertions(+), 7 deletions(-)

-- 
2.35.3

