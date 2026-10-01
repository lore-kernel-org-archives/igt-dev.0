Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE4FCA5FA5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 05:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41C710E03D;
	Thu,  1 Oct 2026 05:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KF6MgAT8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A174010E03D
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 05:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790834354; x=1822370354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5igHAWbUyRdb7V2MyO/zSVlJcbBJzucNvUKIY1F4VWA=;
 b=KF6MgAT84G/0RXAiXBnRvFOv0gdipE+An28fdlqHEyinPwWt0ButNNTc
 subFZkpuoLdAzjreih2THGsQd2ueWQYAO90K+ipNz8VTWyxI4MY580ZSF
 hdQ7G/vKhMWtbXntBKZAne2029K4FJlqw8yrHGIHJh42RP1mWce3vc8n0
 +wWMUurNT/YXCC/b28/thfPwSnZjFGjPVEudTPFTzaYx39ulqucStytbS
 /c+QjxCNdSD7Jplt1jvlb/cIW7R6AMqnKxYkqyl4uLMcvbok7v1smxKw2
 mdnnsCIX6pHxPSISBbpEmAsul6bHZPKJIbyutFba5/UkVioMucNUnvGyK w==;
X-CSE-ConnectionGUID: EfRvB38XRSmIdMR7vtUDOg==
X-CSE-MsgGUID: KiVBvZ5LTK2fXq0hYfQwoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102156726"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102156726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 22:59:13 -0700
X-CSE-ConnectionGUID: YkmqplDQR0WyMOmii26yNQ==
X-CSE-MsgGUID: DlahjPEcSnCxexfkhgiQZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275444688"
Received: from dut1129bmgfrd.igk.intel.com ([10.211.178.46])
 by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 22:59:11 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v8 0/3] Add xe_device_sysfs coverage subtests
Date: Thu,  1 Oct 2026 05:58:59 +0000
Message-ID: <20261001055902.5430-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

This series improves xe_device_sysfs coverage by adding
new xe_pm subtests that exercise several sysfs attributes.

To support reuse across tests, vram_d3cold_threshold
helper functions are moved into igt_sysfs. The new
subtests are added to the CI testlist to ensure regular
execution.

Changes since v7:
- Update patch 1 commit message to describe adding helper functions.
- Update patch 2 commit message and simplify description.
- Set orig_threshold before installing the exit handler in
vram-d3cold-threshold-store.
- Use igt_debug() for regulator version diagnostics.
- Move auto-link-downgrade info prints before value assertions.
- Drop unrelated formatting change in xe_pm.c.
- Update patch 3 commit message to mention alphabetical sorting.
- Remove trailing blank line from xe.pm.d3cold.testlist.

Shivtej Patil (3):
  lib/igt_sysfs: add vram d3cold threshold helpers
  tests/intel/xe_pm: add coverage for xe_device_sysfs
  tests/intel-ci/xe.pm.d3cold.testlist: add xe_pm sysfs coverage
    subtests

 lib/igt_sysfs.c                      |  50 ++++++++
 lib/igt_sysfs.h                      |   3 +
 tests/intel-ci/xe.pm.d3cold.testlist |  14 ++-
 tests/intel/xe_pm.c                  | 176 ++++++++++++++++++++++-----
 4 files changed, 208 insertions(+), 35 deletions(-)

-- 
2.43.0

