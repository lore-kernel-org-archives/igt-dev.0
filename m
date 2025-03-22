Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7760C36005
	for <igt-dev@archiver.kernel.org>; Sat, 22 Mar 2025 13:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF7C10E0C4;
	Sat, 22 Mar 2025 13:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPy/nxkO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AB010E0C4
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Mar 2025 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742648604; x=1774184604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fnRVaVKrHqAT9u/EuB4GfOlRAZjhOt6Cqe8gtlCjpww=;
 b=WPy/nxkOp4WyoNVvrMHSVni/JfujfOlymv0q3SbWdkZOhvu6BqR8h/BO
 y3ReNn+ANfTci+XgJBm5Z2GXmhv6/uVHNaFkCmOM9564FBMEZwvjGgm5q
 K7AGX0rR12uHLQStsTHk0ozuNrQGgF/c+tm6cgZwz6O72YGeZH+eKvpWL
 ZknTDodUIinFXAflrn1BkqF19+tgfEeCu0CRTEvNFmLQuBr/SK18nL6Mb
 T6N2K08aSpCmo0qII/2FYFW+OO/W2moi0t3jkh+9r3VPIvw18apvQSt37
 5+ybo8uCVR8RCF8csgtBm+aAhZg+hD7MoLMZppq3sP6Mi2lXuYJZMCiU9 Q==;
X-CSE-ConnectionGUID: YhY6SQMbTtmIAikZWBs8bg==
X-CSE-MsgGUID: aAsgY1VdSaeCQooPebei6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="54118739"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; d="scan'208";a="54118739"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2025 06:03:23 -0700
X-CSE-ConnectionGUID: MJBqQMIcRl2qgGkced3C+A==
X-CSE-MsgGUID: xE4gRWgKSe2ZHOkA8dJ9bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; d="scan'208";a="123651330"
Received: from sneaga-mobl3.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.96.173])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2025 06:03:22 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 kamil.konieczny@linux.intel.com, rodrigo.vivi@intel.com,
 katarzyna.piecielska@intel.com
Subject: [PATCH v2 i-g-t 0/1] tests/intel/intel_kernelfs: Unify sysfs and
 debugfs testing
Date: Sat, 22 Mar 2025 14:03:15 +0100
Message-Id: <20250322130316.272087-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318213755.366638-1-peter.senna@linux.intel.com>
References: <20250318213755.366638-1-peter.senna@linux.intel.com>
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

The existing debugfs_test scans and reads relevant sysfs and debugfs
files, but it is limited to i915. Meanwhile, xe_debugfs.c provides
similar functionality for Xe but has two key gaps:
 - It lacks sysfs file testing.
 - It does not attempt to read all debugfs files.

This patch introduces intel_kernelfs, unifying both tests into a single
framework that ensures comprehensive coverage for both i915 and Xe.

Follow-up improvements

Once this patch is merged, I will submit a follow-up to:
 - Remove the redundant hwmon-basic test from debugfs_test, as
   intel_hwmon already provides full coverage for i915 and Xe.
 - Remove both debugfs_test and xe_debugfs.

The removal of existing tests impacts external test lists, requiring
updates that take time. By first addressing the test gap, we ensure
complete coverage while minimizing disruption. The follow-up series will
then focus on cleanup for improving long-term maintainability.

v2:
 - renamed xe-specific functions with the xe_ prefix
 - created two igt_subtest_groups: one for i915 and another for Xe
 - prefixed each test with either i915 or xe

Cc: kamil.konieczny@linux.intel.com
Cc: rodrigo.vivi@intel.com
Cc: katarzyna.piecielska@intel.com

Peter Senna Tschudin (1):
  tests/intel/intel_kernelfs: Unify sysfs and debugfs testing

 tests/intel/intel_kernelfs.c | 500 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 2 files changed, 501 insertions(+)
 create mode 100644 tests/intel/intel_kernelfs.c

-- 
2.34.1

