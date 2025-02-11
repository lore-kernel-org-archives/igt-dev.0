Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C81C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 16:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C87110E703;
	Tue, 11 Feb 2025 16:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIYoaY2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E16110E703
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739291366; x=1770827366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wqfSsilf9AXfVffnRMveRYe5izzlJvjpGLqD8sMt8Uw=;
 b=HIYoaY2SIqRo4GyAjoBS1j/7gMZD6j5tyBLz+JIwkyZz4cUax0iPvj8K
 YDcfqjtWvj3ZF6diSEdaEFTohl2XHgebsSAwyryYzoHkLpnjVGOD3BYmd
 F20Bz01kU3vp0QVceLiqICH4ZpIg6572N+Ye7PB9TrldVygKuiYYOcIHD
 Fo3iXI3ymu0Oa7LfvoB5KuH86swoBHRx8CGevb7K7/aWB+jA+5O+ezxFO
 aYyUGLosD3pxP8oJmohg5sZN+qkilBrz8pl4C+jM5+RKyBUpJkNVimC70
 tGCyJblgkbK3b5C1c+9SrQlN4hmWjbt8xRS+mpN0wLhOVTVV8cn2e7klx A==;
X-CSE-ConnectionGUID: 9SYAHSPhR8y0UtZn3N270g==
X-CSE-MsgGUID: NEK2qh9pTJu7lb+0QOVu8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39113938"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39113938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:25 -0800
X-CSE-ConnectionGUID: bWS11v+lTYqY+/Omt/Nb5Q==
X-CSE-MsgGUID: +a3EdC0iQxq4hL/xYVeN/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116643047"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:23 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v3 0/4] Verify VF configuration data against provisioned
 values
Date: Tue, 11 Feb 2025 17:29:15 +0100
Message-Id: <20250211162919.15076-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Series introduces subtests to validate that the configuration data
received by VF from GuC during probe matches the provisioned values.

Additionally, it includes the following helpers added for the subtests
purpose:
- helper to read VF's configuration data,
- helper to read VF's provisioned quota,
- helper to iterate over VFs within the specified range.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Lukasz Laguna (4):
  lib/xe/xe_sriov_debugfs: Add helper to read VF's configuration data
  lib/xe/xe_sriov_provisioning: Add helper to get VF's provisioned quota
  lib/igt_sriov_device: Add helper to iterate over VFs in specified
    range
  tests/xe_sriov_auto_provisioning: Add subtest to verify VF's
    configuration

 lib/igt_sriov_device.h                   |  19 ++++
 lib/xe/xe_sriov_debugfs.c                |  78 ++++++++++++++
 lib/xe/xe_sriov_debugfs.h                |   5 +
 lib/xe/xe_sriov_provisioning.c           |  59 +++++++++++
 lib/xe/xe_sriov_provisioning.h           |   6 ++
 tests/intel/xe_sriov_auto_provisioning.c | 123 ++++++++++++++++++++++-
 6 files changed, 288 insertions(+), 2 deletions(-)

-- 
2.40.0

