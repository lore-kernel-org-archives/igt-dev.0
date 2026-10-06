Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494E9CA5FFD
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 03:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C4110E08B;
	Tue,  6 Oct 2026 03:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWAa2wUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B26D10E08B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 03:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791256240; x=1822792240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UoH+O/TKqmvM6WpIFw359sP6OtQ277NimL+fEasyO1M=;
 b=TWAa2wUv3cutg8OB8HDW0Zp1EVhQmewmfNkdTsQ0/AVJBLxnXcbCNUrC
 4qX9tDr+KWyDzWtUXm5IdbEkq/cpl8YP8ISV1PbSO5LMBzVx9xsyZXoh8
 dvIeAS7IRHXoeGr15Y7AyYToxX9X1Rea4dYIfUX5JZdTSe12v/r8nSrJi
 swGr/gYYagOX0031Ief0X3t97qbDlVpa+Oqrft5kWPosqWU8zcbAdy8ac
 kPvhILd/aagTZz/zX04Mvy/ydWfB7cJFfhkUjlidy+KbzzqzHX6e8myER
 Hb5Cb8cZZgYm/hJHqEl28K2PGv4mwnXlBfl9GwFImeMhlXBW470aMJJm7 Q==;
X-CSE-ConnectionGUID: vWjeMJMxT7OmIRC5oGMkdA==
X-CSE-MsgGUID: MdUL2kr9TkSxIEEQI5xiQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91147988"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="91147988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:10:38 -0700
X-CSE-ConnectionGUID: XkARlNmMTZKyzaYFw35jng==
X-CSE-MsgGUID: v8QU810CTS2ZlMo7hp8CRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="306504893"
Received: from gkmtlh2654.igk.intel.com ([10.211.179.188])
 by orviesa002.jf.intel.com with ESMTP; 05 Oct 2026 20:10:37 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v1 0/2] add coverage for xe_pxp_debugfs
Date: Tue,  6 Oct 2026 03:10:29 +0000
Message-ID: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

This series adds test coverage for xe_pxp_debugfs reporting
and updates xe.fast-feedback.testlist accordingly.

Patch 1 adds a new xe_pxp_debugfs subtest that exercises
the pxp_status_to_str() and pxp_info() code paths and
verifies the expected debugfs output.

Patch 2 adds the new subtest to xe.fast-feedback.testlist.

Shivtej Patil (2):
  tests/xe_pxp:add coverage for xe_pxp_debugfs
  intel-ci: add xe_pxp coverage subtest

 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_pxp.c                     | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

-- 
2.43.0

