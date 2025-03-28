Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C58C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 10:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BE610E9CB;
	Fri, 28 Mar 2025 10:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtrHrzdA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9EA10E9CE
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743157206; x=1774693206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qDjuFBbBzUuj4jxCGJ1jJgIoexL5Hd41I8BC60+ez0E=;
 b=AtrHrzdAiPn9bFtXxsBWbO8MBrbfA+UVaZ0mKmYGEvulWbxopo1FmPXh
 cTcq719C7kjgxcgDu2uCDjQiNmQN4pizFAp+MVnTsWbotliYOb17Rx9tq
 JMEhuRGWvA8vir5MvesQa41ju3vpZNCOZhUexgtwtdx7x1qs6AKQMGm6h
 5Y3Bfe38K2ady7p9IUcoih7pVyr1Ra3HC2jB+mAH59Rj6sbvPXNz9vPQj
 7Srtaslp/Q2Fyb6dJeO2S4bPBTNz3R2Ht7Yy9+2UGzI4sINB+zqlcMWXc
 BV3WLiAzsHc4CI6SPyWv/QnvAQHENRO5MkZY1u8Px6CiibwwV3KVt/Uc/ w==;
X-CSE-ConnectionGUID: y0+HVLhkTuWRdI3j1VRoKA==
X-CSE-MsgGUID: m1wZPkOqSp+CZF47sOJxKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44644370"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44644370"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:20:04 -0700
X-CSE-ConnectionGUID: 5YN5NRYSTga1lKAuiiMKbQ==
X-CSE-MsgGUID: DRVho189QXOOmZrsi5ERiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130515579"
Received: from saswiest-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.80.210])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:20:01 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 himanshu.girotra@intel.com, aditya.chauhan@intel.com,
 pravalika.gurram@intel.com, sai.gowtham.ch@intel.com,
 ramadevi.gandi@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com
Subject: [PATCH v3 i-g-t 0/1] tests/intel/intel_sysfs_debugfs: Unify sysfs and
 debugfs testing
Date: Fri, 28 Mar 2025 11:19:29 +0100
Message-Id: <20250328101930.231985-1-peter.senna@linux.intel.com>
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

This patch introduces intel_sysfs_debugfs, unifying both tests into a single
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

v3:
 - rename test to intel_sysfs_debugfs
 - fix copy paste error on commit message
 - expand Cc list

v2:
 - renamed xe-specific functions with the xe_ prefix
 - created two igt_subtest_groups: one for i915 and another for Xe
 - prefixed each test with either i915 or xe

Cc: himanshu.girotra@intel.com
Cc: aditya.chauhan@intel.com
Cc: pravalika.gurram@intel.com
Cc: sai.gowtham.ch@intel.com
Cc: ramadevi.gandi@intel.com
Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com

Peter Senna Tschudin (1):
  tests/intel/intel_sysfs_debugfs Unify sysfs and debugfs testing

 tests/intel/intel_sysfs_debugfs.c | 500 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 2 files changed, 501 insertions(+)
 create mode 100644 tests/intel/intel_sysfs_debugfs.c

-- 
2.34.1

