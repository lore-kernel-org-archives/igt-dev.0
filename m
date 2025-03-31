Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3639BC3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 18:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA78A10E167;
	Mon, 31 Mar 2025 18:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXsUelZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF76A10E167
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743444375; x=1774980375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l9WzhnO54nvxXZXhg567fU85wQKFgyCdcsJiuxR0yEU=;
 b=UXsUelZAp8YVJmM/NW5PTkRChjqkFxyr6EesIZyr1+Q2YjZvxcb6Y/ND
 IhX5bF2jm/Z2mEkEOLHkW462PciJYvbJJKU9TqKraC0fT5eRaSP7KXu9U
 iruDx6SPtCKHiNWQr8eFEaI6SP7SWZz78FGeEka+ykCgcigmJWA0YKYb4
 rHLTY4tky/paGxgCa4aYbDZquzdkRtP5CBTzsahKGx7gY1UVYaedQfbBf
 I2ojl2qlk67d3xETWohvQl220j975x4eq8UY1wJVEO6MsofQKd4Xsf6WW
 12dKkB01L7ynykyA4ucS0XTnvah/hu9hn1Jg8AMRviNNJ0mptrwxKMtxT g==;
X-CSE-ConnectionGUID: iU1kK+5eQw2zvjEFx3EYrQ==
X-CSE-MsgGUID: yvCvBDw5Q9iib607KSby4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="56112779"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="56112779"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 11:06:15 -0700
X-CSE-ConnectionGUID: /19PCcfQQ9iwPMZDob0P8g==
X-CSE-MsgGUID: QrqvkfMDSy6k6fMll4WFQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="131376243"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 11:06:11 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 himanshu.girotra@intel.com, aditya.chauhan@intel.com,
 pravalika.gurram@intel.com, sai.gowtham.ch@intel.com,
 ramadevi.gandi@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com
Subject: [PATCH v4 i-g-t 0/1] tests/intel/intel_sysfs_debugfs: Unify sysfs and
 debugfs testing
Date: Mon, 31 Mar 2025 20:05:35 +0200
Message-ID: <20250331180538.57393-1-peter.senna@linux.intel.com>
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

v4:
 - remove the 5 seconds timeout to read each sysfs and debugfs file

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

 tests/intel/intel_sysfs_debugfs.c | 498 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 2 files changed, 499 insertions(+)
 create mode 100644 tests/intel/intel_sysfs_debugfs.c

-- 
2.43.0

