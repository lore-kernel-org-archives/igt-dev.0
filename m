Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AB0C369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 14:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D64210E5E1;
	Mon, 14 Apr 2025 14:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyCvnI4Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07BD10E5E1
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744640212; x=1776176212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cemiMI1iSi+3k+upmaRi3gZudCRdumDABEUgTZGsBJg=;
 b=QyCvnI4Z9k+jWRjTqsloGbCqauFg0ZAdXOPkKYcerOIXMFCrylQxL+27
 kvFUHNroNM4tYsEct/QQD/vOS+LS6uT47DAloGCmd38Ue4fVUkxEtaHrD
 /caDk8V1ngqFVjWaB0N9stt+RX4bhMrrZkLpuTt08aC8ZF4QN7Ka+dqd5
 7gm5cHv1q1cqX6aX1mIk6SFnqDMrflJycUbtradkDooL2MLOj9v/IUMCz
 Eq3FBEvkBAOMI7NENXl0f7SitVXMFPZCnSyOt3OpMN6G+s6/7mzXh+jKu
 wDaTt14gx85YMNp9HoLSkogFU+80TvxaDZJ0mJRvJaRNdQpl/LSCClF5j Q==;
X-CSE-ConnectionGUID: DT+/wzxKQZenzIhGI/9Dfg==
X-CSE-MsgGUID: 7jbJKILjSq+KSsVZMAV3cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45248165"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45248165"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 07:16:51 -0700
X-CSE-ConnectionGUID: z4Y5MOAVRwWIjXXr1oeLtg==
X-CSE-MsgGUID: 6RpcAn4PTT6ksrPRoDIbUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130811832"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 14 Apr 2025 07:16:50 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t v5 0/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv() xe_guc_mmio_send_recv()
Date: Mon, 14 Apr 2025 20:02:55 +0530
Message-ID: <20250414143258.12869-1-satyanarayana.k.v.p@intel.com>
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
  tests/intel/xe_fault_injection: Inject errors in Inject errors in
    xe_guc_*calls
  tests/intel/xe_fault_injection: Do not assert for probe_guc_fail_*
    functions.

 tests/intel/xe_fault_injection.c | 132 ++++++++++++++++++++++++++++---
 1 file changed, 122 insertions(+), 10 deletions(-)

-- 
2.43.0

