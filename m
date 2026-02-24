Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9DEEFB7F9
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 05:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F262110E067;
	Tue, 24 Feb 2026 05:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdX4FdkY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81C310E067
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 05:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771911206; x=1803447206;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cYhvQaSzur15f9UpivZ/3WyW/22CtCfXKA0QGOtPEbE=;
 b=FdX4FdkYstmhX54hsbmTxlv3qWUJ02EdiXL7UA7vb9UMB+TpSrHv0hbp
 GflI+aQsXyeO1OzH4mzw+G7ni5ahKl6N0EG9yaBTPr5LkJIYJZx0cjuip
 Vv8b/Ef5PM3dyGMGz4xpBWWIL42wzg/KiJzbgEG6Mm4IbumQLxHhILUxG
 F3Kh5TCVKAmKNXRP4VC91FJPdDkJyxQEcLQuPONq0SQ8sU57QZqxT3OWd
 JaYW/SAeHA1u0jgp9ewPt1PW3MlfSESG4xr0RfqNPvoULWQO7Es2Xz5wR
 Z69is5GPYw6KK8J5m7UP+e0P+IeOrqUp1cMJgK91GW39VzE5rTDaeWwzT Q==;
X-CSE-ConnectionGUID: oK4By6FfRK28XFUtsQw4OQ==
X-CSE-MsgGUID: VdQAIC/2RMqn1CxvfLMTeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83541467"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83541467"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 21:33:26 -0800
X-CSE-ConnectionGUID: Obrz7UfvR1CYycCXpT0lzg==
X-CSE-MsgGUID: 78GmhGxgS1Kq3Wx4/l9ayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220354331"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.6])
 by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2026 21:33:25 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/2] Add memory write ordering verification
Date: Tue, 24 Feb 2026 05:33:22 +0000
Message-Id: <20260224053324.2354159-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

The patch series introduce a new gynamic subtest which verifies memory
relax ordering using copy and write operations across different memory
regions and buffer sizes (1M, 2M, 8M). For each memory region, the test
checks both copy and write transaction ordering to ensure correct memory
behavior on Intel GPUs.

ver2:
- Incorporated review comments (Priyanka)
- Created single patch using two commits
- Nits incorporated

Nishit Sharma (2):
  tests/intel/xe_exec_store: Validate PCIe6 relax ordering
  tests/intel/xe_exec_store: Extend test coverage to all memory regions

 tests/intel/xe_exec_store.c | 230 ++++++++++++++++++++++++++++++------
 1 file changed, 197 insertions(+), 33 deletions(-)

-- 
2.34.1

