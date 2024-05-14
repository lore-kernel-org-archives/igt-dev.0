Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3E3C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE7810E3BE;
	Tue, 14 May 2024 07:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciMmgHxc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4892B10E232
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670599; x=1747206599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fK6IBwmce14rYRaBRuLMkKR77G9r2EhfOQaHMgOvfcU=;
 b=ciMmgHxcfym3e+rsaomdWb9wjijPqoY9frtv1c0e65Gy0uESdeLIFRAT
 bFasNKDek24J6XCUGuopX896VDuNVAJEN5FIPUJg1XRVdKM7/lZ62e/eG
 KJ4SlJVbokM0srCrux8FNXEZ7Sj4C9BWub+VYkC4NB8UFAlAqj48LTuQt
 x7XQWDhPmIBaoSmSe/Tzx2aL6dzeXwKQTv5Qdtjt4b1IvMjQs1NbnbG6v
 1mK3GWY1OhYwcKR9WU6IG+NLyYpNBg3GquPqOYCVRb5lxh7FL3rH3ReWB
 oKi5fj36ReiS8ueJvZe32zmbKo0fWpgvHhEkVnbiBWAdGQbIvHllHI2Yi Q==;
X-CSE-ConnectionGUID: PbSkqdbASdalVqF0w2y/1A==
X-CSE-MsgGUID: /KjfYcGgRx6IrE2DpH1wtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15472996"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15472996"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:09:58 -0700
X-CSE-ConnectionGUID: y6Yre4OLSje2fXiYThdAtA==
X-CSE-MsgGUID: NUmzpqCeSimJ2EE8Cckj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30427631"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:09:58 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH i-g-t v2 00/10] helper function
Date: Tue, 14 May 2024 12:40:16 +0530
Message-Id: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

Introduce helper functions for object creation, binding, submission,
and destruction, applicable for SVM and other tests

xe-basic test is validating the helper function introduced in 'lib/xe/xe_util: helper function'

svm test cases:
svm-basic-malloc
svm-basic-mmap
svm-random-access
svm-huge-page
svm-atomic-access
svm-atomic-access
svm_invalid_va
svm-mprotect
svm-benchmark
svm-sparse-access

svm kernel implimentation:
https://gitlab.freedesktop.org/oak/xe-kernel-driver-svm.git
branch: origin/drm-xe-next-svm-unify-userptr


Bommu Krishnaiah (10):
  lib/xe/xe_util: Introduce helper functions for buffer creation and
    command submission etc
  tests/intel/xe_svm: basic xe_svm test
  tests/xe_svm: basic svm test
  tests/intel/xe_svm: svm_random_access
  tests/intel/xe_svm: svm-huge-page
  tests/intel/xe_svm: svm_atomic_access
  tests/intel/xe_svm: svm-invalid-va
  tests/intel/xe_svm: svm_benchmark
  tests/intel/xe_svm: svm_mprotect
  tests/intel/xe_svm: svm-sparse-access

 include/drm-uapi/xe_drm.h |   2 +
 lib/xe/xe_util.c          | 186 +++++++++++++++++
 lib/xe/xe_util.h          |  40 ++++
 tests/intel/xe_svm.c      | 427 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 656 insertions(+)
 create mode 100644 tests/intel/xe_svm.c

-- 
2.25.1

