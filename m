Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E6FF01832
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABFA10ED39;
	Fri,  6 Mar 2026 13:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtBIvbVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BE510ED39
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803878; x=1804339878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=soJ/XPU7upS/31XlvKeeAQF7JZ+1m75zB2b8/4tXPg0=;
 b=DtBIvbVjrturvz/Brn7Kr6Pa9CMfz9mbzg0OTfYxoFrVHCHTHue7PtPo
 hSQiHvZGtC+mDOS/b8EDP/w8s75cUvUFK0SAHk9Syf2pHYFxJfMNKkC5x
 +9whzOvZCzqBDDQY7KALauK5q5vkJflqhuscDnlls6SYcSPkZanfjWpMM
 4I+xRrx+XPkJaNDBD600fHsvDFTsU0500bNWZgY/Q0vDJkiFoX7nTxLOw
 Ru+wa1pHBTuK/elwIObnBAZnjQMFVdIdYD88zTWjeAg3XMcf2jtpgWk2p
 sW+hlJvOYQCppmYrNPQe2WGfKO7VHY6oR3c+KHKFW/7oGtzlXggm5KRC9 w==;
X-CSE-ConnectionGUID: ubwJuYT9SQqIsxmjtD1uaw==
X-CSE-MsgGUID: Gfum2kQFQv23PYi8iqVCwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84236846"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84236846"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:17 -0800
X-CSE-ConnectionGUID: 0KW7x82eTsyQk4RytNLm2Q==
X-CSE-MsgGUID: oaIFx/n9Tca4GpAtF19qhA==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.208])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:15 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t, v2 0/4] Extend xe_exec_system_allocator compute tests
Date: Fri,  6 Mar 2026 14:29:08 +0100
Message-ID: <20260306133059.859625-1-francois.dugast@intel.com>
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

Single GPU page fault handling duration is an important metric used for KMD
performance optimizations. Extend SVM's compute test variants to allow fine
control over GPU page faults triggered from EU context with a simple compute
kernel, assert expected counters from KMD and print average duration. Please
see example below:

    $ IGT_SVM_COMPUTE_LOOPS=1000 sudo -E xe_exec_system_allocator --r eu-fault-2m-once-device
    IGT-Version: 2.3-ge596586fe (x86_64) (Linux: 6.19.0-rc7-perf x86_64)
    Using IGT_SRANDOM=1769621444 for randomisation
    Opened device: /dev/dri/card0
    Starting subtest: eu-fault-2m-once-device
      svm_2M_pagefault_us=747
    Subtest eu-fault-2m-once-device: SUCCESS (5.525s)

v2:
- Drop patch #4
- Use rand() % 255 + 1 in input array (Zbigniew Kempczyński)

Francois Dugast (4):
  tests/intel/xe_exec_system_allocator: Fix compute array migration size
  tests/intel/xe_exec_system_allocator: Allow looping in compute
  tests/intel/xe_exec_system_allocator: Add hw engine argument for
    compute
  tests/intel/xe_exec_system_allocator: Print page fault duration in
    compute

 tests/intel/xe_exec_system_allocator.c | 86 +++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 15 deletions(-)

-- 
2.43.0

