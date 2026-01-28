Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C287D46BE2
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 17:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF6310E2D2;
	Wed, 28 Jan 2026 17:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSLJvTAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A519210E2D2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 17:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769621669; x=1801157669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Em+Szjn1V0H+ByxogiRpjPH3RhdSk5TvvXEbq9y94U=;
 b=JSLJvTACUkiQwjC/LpMaSAVZzHZ5dLNWK+ZuqqbgWi5nI0zkpYYVzc2L
 6M1ujYgcJQdOXuD87L+HvfM74vEOMU6o6MGjND6+kDkV956apF53Bau4e
 ygaDPyUMUrEtNKgntAnbrAsFgze0hPyyzusdNEC/H+gpGAvpRM8LX2lGW
 FPYgcYFyPaZok950eH1j6WGrtrJOHlWWG2+XoSDDNPE712E45W4Ayn+Hv
 90axv/b/OGg96Ge2gndqB6Gk5Zdig/+Kuxli8xenocf4ROZgQQcF5nCOM
 kJ1AR2XxDyn+34mY688I+ty5gX2olnkWfWX5GlUgVdqW7jioAXaf5dlJb A==;
X-CSE-ConnectionGUID: yuev9DhwRYWqzCoG6GBbyA==
X-CSE-MsgGUID: RFy9+Sq1SWGvVaGxjELpcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82213444"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82213444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:29 -0800
X-CSE-ConnectionGUID: Yu8oJJ7BTZe1XRjUvMjFmg==
X-CSE-MsgGUID: UEWG1A8HRC2sgzMNgC4FJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245927179"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:27 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/5] Extend xe_exec_system_allocator compute tests
Date: Wed, 28 Jan 2026 18:29:05 +0100
Message-ID: <20260128173412.1319610-1-francois.dugast@intel.com>
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

Francois Dugast (5):
  tests/intel/xe_exec_system_allocator: Fix compute array migration size
  tests/intel/xe_exec_system_allocator: Allow looping in compute
  tests/intel/xe_exec_system_allocator: Add hw engine argument for
    compute
  tests/intel/xe_exec_system_allocator: Assert page fault count in
    compute
  tests/intel/xe_exec_system_allocator: Print page fault duration in
    compute

 tests/intel/xe_exec_system_allocator.c | 160 ++++++++++++++++++++++---
 1 file changed, 145 insertions(+), 15 deletions(-)

-- 
2.43.0

