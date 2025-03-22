Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6FDC35FFC
	for <igt-dev@archiver.kernel.org>; Sat, 22 Mar 2025 12:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C810510E0AD;
	Sat, 22 Mar 2025 12:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjAZKO8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDEA10E0AD
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Mar 2025 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742648238; x=1774184238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+sC7LetFUyLQakVJ0KuM9gdGEksB0WH9n5omAO6zw0Y=;
 b=MjAZKO8QHbfgkazzl+mSGtBowLa9267t9Gn//uyAyrVgYFRcIPP2g3gF
 yRqo3zKGb6Lmhu+MHn+10BqzsIAl9HjTzI8hgzk36gZBAoP/0NrRghSjQ
 po4wXlWG8jt/Z4L8uloNNlXQbdS0VAJeW+6F0ftSSXBX63VE4oDNOZsng
 HShiLh8zRvOcHy6FPIfLqiR1xLkKHKremeqR4qZOyBwPDTtsVl7kUMIlq
 JN/qk2IBBuC3IgadlHj4H2YNSLVHsQfsYxrOovl51/kLRn47lP/Mz1Hiy
 Ym+pjWIDGK8PPGZcom2QBUDMyDJOwV8BfrTjvWmhc/aIkic3opDVyg6II g==;
X-CSE-ConnectionGUID: w/RLmOjvRrKl2SRbZrxSrw==
X-CSE-MsgGUID: G5eYlIb8R6uze4CMIlUkIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="47559205"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; d="scan'208";a="47559205"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2025 05:57:17 -0700
X-CSE-ConnectionGUID: 6TdFnrpMTZ+zI2I9V9Notg==
X-CSE-MsgGUID: yqIROnbDQF+HvLZL//R4/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; d="scan'208";a="123439102"
Received: from sneaga-mobl3.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.96.173])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2025 05:57:15 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 kamil.konieczny@linux.intel.com, rodrigo.vivi@intel.com,
 katarzyna.piecielska@intel.com
Subject: [PATCH i-g-t 0/1] tests/intel/intel_kernelfs: Unify sysfs and debugfs
 testing
Date: Sat, 22 Mar 2025 13:56:47 +0100
Message-Id: <20250322125648.270847-1-peter.senna@linux.intel.com>
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

