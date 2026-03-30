Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4AC1061B15
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 16:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F298F10E44C;
	Mon, 30 Mar 2026 16:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/JkgWhc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8477910E44C
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774887902; x=1806423902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jXlKy0c2aAsNiys7BANbWQ+WA/4Oz15rnJZvpf+o2vs=;
 b=V/JkgWhccExqOF44ffnXCHlhenq02XJZ/89O9ZpAKETUC/uaQpNrnDGZ
 VgDDPNuW4r8oAYqDZkY+HQG2N1iuh5FD892JxH+Ey/uGYQtUNoCpIpuU1
 IUCz6Dz/wx1/3J8YiI/xukvZdnSTS2IWWyoZ1kpUcj//ErvTDaf0JTW+M
 dxSHAUoYCLLuInpWdUHN3bbf6PlbgBbz3JtbJxqwucc7Bfiol1hC8u+mC
 7HbwBs5Nxs1G0T28TNj5yX8p7hO4gMDZzes3Wffky4bOM/zQ5HAWKV/KI
 pUjNF9EwpRTOas7ovmytTlUDYQ/3evtsH8FhgbYGmfLnH5vZS9e9wANAG Q==;
X-CSE-ConnectionGUID: 8ltSKAK8Tw2JE30YVCS3Kg==
X-CSE-MsgGUID: QqVtx9UfSLu26fqjslbROQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63437297"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="63437297"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 09:25:02 -0700
X-CSE-ConnectionGUID: 5LcMk5EkRKKB5FEBu6HrEQ==
X-CSE-MsgGUID: u5+ACnd+ROOEeo+gB+4efw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="230576021"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 09:25:00 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 0/3] Guard idle residency tests against busy DRM clients
Date: Mon, 30 Mar 2026 21:48:05 +0530
Message-Id: <20260330161808.2474476-1-soham.purkait@intel.com>
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

The  idle residency subtests are sensitive to unrelated DRM clients
on the same card. When other processes keep the device busy,
the measured idle residency can be lower than expected and trigger
false failures.

This series improves the robustness of the subtest by first introducing
a helper to enumerate DRM client processes associated with a given card
fd, and subsequently using it in idle residency tests to detect competing
DRM clients triggering a warning, and skipping the test.

Soham Purkait (3):
  lib/igt_drm_clients: Add helper to list and count the DRM client
    processes
  tests/intel/xe_pm_residency: Check for other DRM device users
  HAX: Add idle-residency tests to xe-fast-feedback.testlist

 lib/igt_drm_clients.c                    | 93 ++++++++++++++++++++++++
 lib/igt_drm_clients.h                    | 10 +++
 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_pm_residency.c            | 25 +++++++
 tests/meson.build                        |  1 +
 5 files changed, 130 insertions(+)

-- 
2.43.0

