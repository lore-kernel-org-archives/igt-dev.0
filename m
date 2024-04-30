Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F5BC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 18:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D707112E0F;
	Tue, 30 Apr 2024 18:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJdwsMHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60C2112E0F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714501649; x=1746037649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5yDPehfZe6R8FzwqTtDmjEV9hKKZcbtXHfNKFFS9aT0=;
 b=EJdwsMHa8ywHaXbLdr2ZHa4r8E/m/aGFm9PU7wCoasXVrxSYLfP8wDjC
 pBIDlGZlwdWuQkV3rm897OKVUbqcDOgNuNvpXAWNiPU/toD60gZMiHBEw
 1R0JXwKpoW5ByFzyK0eqNZabWnh2Ld6U3y61YOjFHUdVdQQprs8ekd2i0
 Wd3ol0hCgYdm60Uj7+WbTfpKv61u1Ne3PqWvRMhsU4nD4MscoDJr4jE8l
 s4R4qhJHrR0HlT3W5sDDv+odLi4Y706/wfA35ELyADxDLirnvkBdjagBJ
 KOIKUNcD3wP2K2BcHGo5UhRMKgvHYc/QdPwtdeUKVZfhPDUfsLh0rngGe g==;
X-CSE-ConnectionGUID: YrNJtDc2RbWWC6numTClVA==
X-CSE-MsgGUID: w8q5hFOrTEa84P2UH2h82g==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14052091"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="14052091"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 11:27:28 -0700
X-CSE-ConnectionGUID: oLwPL9IKRwK0TVEWlEGnWA==
X-CSE-MsgGUID: mbc7QW/AQaKc/frGzXSm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="57726915"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa001.fm.intel.com with ESMTP; 30 Apr 2024 11:27:26 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH RFC i-g-t 0/2] helper function
Date: Tue, 30 Apr 2024 23:57:45 +0530
Message-Id: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

Introduce helper functions for object creation, binding, submission,
and destruction, applicable for SVM and other tests

xe_svm test is validating the helper function introduced in 'lib/xe/xe_util: helper function'

In this test I haven’t included the svm functionality, next patch I will include svm functionality

Test results
root@DUT7032PVCMella:/home/gta/xe/new/igt-gpu-tools# ./build/tests/xe_svm
IGT-Version: 1.28-g365f81646 (x86_64) (Linux: 6.8.0-rc5-xedrmtip+ x86_64)
Using IGT_SRANDOM=1714498247 for randomisation
Opened device: /dev/dri/card1
Starting subtest: svm-basic-malloc
Subtest svm-basic-malloc: SUCCESS (0.022s)

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Bommu Krishnaiah (2):
  lib/xe/xe_util: helper function
  tests/intel/xe_svm: basic xe_svm test

 lib/xe/xe_util.c     | 113 +++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h     |  32 ++++++++++++
 tests/intel/xe_svm.c |  99 +++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 4 files changed, 245 insertions(+)
 create mode 100644 tests/intel/xe_svm.c

-- 
2.25.1

