Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD61C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 08:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF61510E680;
	Tue, 15 Apr 2025 08:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfKxklCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FD110E680
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744704707; x=1776240707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eW9L45nERGeovamqSytXM9VKZfzRdXPQvGHaSBk+tNw=;
 b=mfKxklCuFKxqqgtLqceeLbuJzkAE0acZpjcfXOK8ieDP3ApB5ssqfJre
 BXAjvSlL23grjk4PxhN/3ZehHZB7VHsYMVuqB7FVVGXgCSzM8w3mgx0qX
 Rv7PUpIeUpdPxGXsXOU8iAgLN49PTWkbu/+rNE8JSw4HATLhi87V0kGdh
 ZHvJv+Wk+4T0jvIkJCaTgwPe0rvUm2ssF+nDqC+OzfEc92u1NKoFaWbb8
 aRWSY8B+W7A2x3x4GEV0FSiRc1wgBEE4wd+lYFPq+qJbGDD9dTBHh4Qka
 PgA/fBOBMzXpqyDlj57INcMILUxERjHccPpCXLla3LyQu5mvZcscTfGbF Q==;
X-CSE-ConnectionGUID: WT4/l0HlRTWecKt+Yo/9CA==
X-CSE-MsgGUID: smuhDj3QS0Kk5Z6dn66YsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46334651"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46334651"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:11:07 -0700
X-CSE-ConnectionGUID: 08fW0gylSxeqBeXCJe8aiw==
X-CSE-MsgGUID: G3a08008R9uyvqrK95wxHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129820806"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa009.jf.intel.com with ESMTP; 15 Apr 2025 01:11:06 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t v6 0/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv() xe_guc_mmio_send_recv()
Date: Tue, 15 Apr 2025 13:57:08 +0530
Message-ID: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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
  tests/intel/xe_fault_injection: Inject errors in xe_guc_* calls
  tests/intel/xe_fault_injection: Do not assert for probe_guc_fail_*
    functions.

 tests/intel/xe_fault_injection.c | 132 ++++++++++++++++++++++++++++---
 1 file changed, 122 insertions(+), 10 deletions(-)

-- 
2.43.0

