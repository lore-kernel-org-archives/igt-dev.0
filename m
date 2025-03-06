Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3725FC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFC410E157;
	Thu,  6 Mar 2025 09:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANk/R82j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC81910E157
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254907; x=1772790907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CtEYp7WjYKswuAZ7xgDbaDUn+Knv6m4TqUvJYLFZDuQ=;
 b=ANk/R82jLWZjBOcqWNcQ8wQj2HP9g13V3Z3gD+4VdUQK272lG12y3PyP
 uqRA7U3Ddlf4jKL6jH4u2zwBTxvi+Q8ERHmYIyqOWLE+8Mu0ccbrBYMVI
 v0PDtT5dRQ9IulYfT8QQXeVoZ/MEPEts5GS9G3YtmxnV0gTt6iHUYIbpr
 ABS1R0Lkuumm+VytI+C9XKIaUAAGskqlghl1WLWy6nameuDJGVhK5tA84
 O1hXwlL7hI3rPUqNguZuF2qS9ynBNwLIpKJT4+kleZI3k3bYZXmYES6Nk
 LYUMgt5jc1RNyNtoN6nCRRcl2eUydQYYtebREWrCYWM6UMmEX149fo6/K Q==;
X-CSE-ConnectionGUID: CPm4+8+rRraxd5CDBAu11w==
X-CSE-MsgGUID: xfZwn2qYSfqdB/6qSV4j2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29839189"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="29839189"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:55:07 -0800
X-CSE-ConnectionGUID: jcBmNJ4BRBC25rB6GSki6Q==
X-CSE-MsgGUID: /L9Ues0hT7yGJGRSSFfQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119160847"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 01:55:06 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t v3 0/6] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv() xe_guc_mmio_send_recv()
Date: Thu,  6 Mar 2025 15:40:35 +0530
Message-Id: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
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


Satyanarayana K V P (6):
  lib/igt_sysfs: Add support for device unbinding
  tests/intel/xe_fault_injection: Make setup_injection_fault()
    programmable.
  tests/intel/xe_fault_injection: Add helper to start injecting fault
    after x iterations
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
  tests/intel/xe_fault_injection: Try to unbind the device after error
    injection
  tests/intel/xe_fault_injection: Do not assert for probe_guc_fail_*
    functions.

 lib/igt_sysfs.c                  |   4 ++
 lib/igt_sysfs.h                  |   1 +
 tests/intel/xe_fault_injection.c | 111 ++++++++++++++++++++++++++++---
 3 files changed, 107 insertions(+), 9 deletions(-)

-- 
2.35.3

