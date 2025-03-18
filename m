Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDF7C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 09:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043EA10E0A4;
	Tue, 18 Mar 2025 09:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDQIXPlL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8942F10E0A4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742291671; x=1773827671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z0OK0MnSuc6TyfcUEwaB/iid9kmOAtynz6V3pySrUDE=;
 b=mDQIXPlLLeuMEjORYGkJEJn/XfIEqq9Xm/gV8woTqD7payoSljyGU68+
 B3RsK98jenobCcbNrBmOr7Q1MW+CAiqpqQ597eV3MV/r3Af5nA3wyMiZc
 qo7+0RhPr4Qh+uYsx98/HbT+UCAXFg6szjZ+bpPj3kSwIj1Q+lQjzLBQW
 o/OWghRpjOohmJ48OSUp1MqMZwyx43b11+0ekuojvId1z8R00DFr0G16h
 GixjoddTBgpq5wdSMnqZOEnt/4MJwNGqdcfdhmW2PjhJ2eOsFyNZ2abIG
 9DpfjEnPADg+zwoDgQCLHnrMVfrkU5wyXbKJApTLACWWqT5kEn/uVxw0K A==;
X-CSE-ConnectionGUID: LlPTLfuPSE6IaI7laBZ/tQ==
X-CSE-MsgGUID: 7dYV4wy1R2mNYeszl+lCbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42671269"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="42671269"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 02:54:30 -0700
X-CSE-ConnectionGUID: etGkZc9bTY6j1L2pO+4JhA==
X-CSE-MsgGUID: qiAg3VzKQ0qcQclGgqYKAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="121944391"
Received: from unknown (HELO friendship7-home.clients.intel.com)
 ([10.245.252.104])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 02:54:28 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>, rodrigo.vivi@intel.com,
 katarzyna.piecielska@intel.com
Subject: [PATCH i-g-t 0/1] Close sysfs and debugfs test gap between i915 and Xe
Date: Tue, 18 Mar 2025 10:53:49 +0100
Message-Id: <20250318095350.57133-1-peter.senna@linux.intel.com>
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

The existing tests/intel/debugfs_test.c scans and reads all relevant
files from sysfs and debugfs, but it is specific to i915, leaving a gap
for Xe.

A similar test exists for Xe in tests/intel/xe_debugfs.c, but it has two
gaps compared to the i915 counterpart:
 - It lacks sysfs file testing.
 - It does not attempt to read all debugfs files.

This commit addresses these gaps by adding two new tests to
tests/intel/xe_debugfs.c:
 - sysfs_read_all_entries
 - debugfs_read_all_entries

Both tests use the function read_and_discard_sysfs_entries(), which was
copied from tests/intel/debugfs_test.c.


Follow-up improvements

Once this patch is merged, I will submit a follow-up series to address
the following improvements:
 - Rename tests/intel/debugfs_test -> i915_debugfs_sysfs: The current
   name is misleading because it is i915-specific and covers both
   debugfs and sysfs.

 - Rename tests/intel/xe_debugfs -> xe_debugfs_sysfs

 - Remove redundant hwmon-basic from debugfs_test: The existing hwmon
   test is redundant since tests/intel/intel_hwmon.c already provides
   dedicated coverage for both i915 and Xe.

 - Move read_and_discard_sysfs_entries() to lib/: This function is used
   by both debugfs_test.c and xe_debugfs.c, so it should be placed in a
   shared location.


Why I am sending this patch first

The priority is to close the sysfs and debugfs testing gap between i915
and Xe now, so we have more time to upstream these changes. While the
follow-up improvements are relatively simple, they carry short-term
risks because:
 - The hwmon test removal could impact existing test lists.
 - The current test names (debugfs_test.c and xe_debugfs.c) are
   referenced in documentation and test configurations.

By addressing the test gap first, we can ensure proper coverage while
minimizing disruption. The follow-up series will refine the structure
and naming to improve long-term maintainability.

Cc: rodrigo.vivi@intel.com
Cc: katarzyna.piecielska@intel.com

Peter Senna Tschudin (1):
  tests/intel/xe_debugfs: Add tests to read all debugfs and sysfs files

 tests/intel/xe_debugfs.c | 88 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

-- 
2.34.1

