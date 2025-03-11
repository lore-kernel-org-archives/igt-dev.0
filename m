Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D71C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 17:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17DC10E643;
	Tue, 11 Mar 2025 17:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaujDhBl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E1310E643
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741713094; x=1773249094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vXZkoM2SvVTAbG7BSIYjOHYcudBXTQ2Mo/5Q7UHvMSk=;
 b=DaujDhBlxlvQc8ZrPO42CIYWnS3QUBZYzcOfhC2FSng1Rep2YyZS9MQZ
 7DR0PwLR5DbcHOHAaAOxX7IzdnAj8al+w0sS7zUN4PZLFe+3QRClZddGR
 cI9PzAK/PffV6kAAGTzSexAK27YMZ5ib4mg7MZKcMnvJy+0mVtAPkP1wo
 wmX8Xbp7W5CUSJLx24LYHgi9HdgERbPfao8TBKaTjjT5diLs4265OuL1Z
 5H/ea9eX5ICHxhYC6C7ogufNMKu0G7meyJL4fB1tu/gt9tk8nnx8L9Bc9
 WFTAMVdJv9hichN+99/V84uzCl3SH0JP34+VMv+fSubTO/kV8/upPWZAN Q==;
X-CSE-ConnectionGUID: soXPGuFeTeSirp4bfcJMEw==
X-CSE-MsgGUID: KSEnMyJdTM24hpwNdSicyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60312103"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="60312103"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:11:26 -0700
X-CSE-ConnectionGUID: L1aGWNs5SwS+f7HEuzXXwg==
X-CSE-MsgGUID: KAcWk4+JQ46gYxkmHVOxvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120325534"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:11:24 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/2] Add a check for power management PCI capability
Date: Tue, 11 Mar 2025 17:01:42 +0000
Message-Id: <20250311170144.602535-1-jakub1.kolakowski@intel.com>
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

This patch series is introducing a helper for checking the presence of
power management PCI capability and it utilizes this new helper in
xe_pm tests that are related to D-states.

Add power management capability checking helper. With this helper one
can make sure the capability is present on device under test before
proceeding with any actions related to PM. This is mainly aimed to check
for availability of D-states but overall it checks for the PCI
capability in general.

Add a check for power management capability of device tested in tests
related to D-states. Currently if test is started on configuration
that does not support the PM capability it doesn't skip, instead
depending on test it may fail, abort or timeout.
With this change test will skip with a clear message why it did.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

Jakub Kolakowski (2):
  lib/igt_pm: Introduce helper to check for PM capability
  tests/intel/xe_pm: Add a check for power management capability

 lib/igt_pm.c        | 20 ++++++++++++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 16 ++++++++++++++++
 3 files changed, 37 insertions(+)

-- 
2.34.1

