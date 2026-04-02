Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED19D3941E
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 13:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B192C10E40B;
	Thu,  2 Apr 2026 13:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ct+L5YsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C8B10E40B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 13:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775135258; x=1806671258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xfAXup0yMdEpLNOnBrjN6jyEGPFQgrXuB5m8PVZyNt4=;
 b=Ct+L5YsVJs+6uOWAnY7L2oYcprKhUvhSBKc5BYJR5bHWvWa5Fy5t0/cz
 m+GLKg+scDtebYeI2SnfUWlUf1hrpvqM1OKSTzOQfy4GE9xXYHyDlPS4X
 u5bs+Y45pu55PebMZ2b1GyKPUvM1OifOqyo9lMqkZeXpHr5Oc+m35W/i+
 d7zzbLZq1VTOMDu5Xg3cGnHDNYepYZMPy/MLzJ8ao5F0FJPLNy4YHUtqa
 A7lD7VDqFBp8HwtrLoihxnEE2i6SZCFC3SQhbVXGdCzqbMDn5ZobrS7z/
 xVe8pJHBUCHaIAmdCCVFDLtky3NWYgSoC6hzVaBlph2UNI8ByuD85Z+/8 A==;
X-CSE-ConnectionGUID: CVGfXyRrSCiytmDDYyLsbw==
X-CSE-MsgGUID: EsgKiY48QUCVRxJ9dHV4lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93584978"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="93584978"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:07:37 -0700
X-CSE-ConnectionGUID: EjVxTUEKShS/+ed6+SHcLg==
X-CSE-MsgGUID: JL8m9YHbR3y5Wpfz2wNdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222119710"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:07:35 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 0/3] Guard gt-c6-idle test against busy DRM clients
Date: Thu,  2 Apr 2026 18:30:23 +0530
Message-Id: <20260402130026.2687520-1-soham.purkait@intel.com>
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

      The gt-c6-idle subtests are sensitive to unrelated
DRM clients on the same card. When other processes keep the device busy,
the measured engine activity can be higher than expected and trigger
false failures.

This series improves the robustness of the subtest by first introducing
a helper to enumerate DRM client processes associated with a given card
fd, and subsequently using it in gt-c6-idle test to detect competing
clients triggering a warning, and skipping the test.

Soham Purkait (3):
  lib/igt_drm_clients: Add helper to list and count the DRM client
    processes
  tests/intel/xe_pmu: Add check for the other drm clients using the
    device
  HAX: Add gt-c6-idle test to xe-fast-feedback.testlist

 lib/igt_drm_clients.c                    | 93 ++++++++++++++++++++++++
 lib/igt_drm_clients.h                    | 10 +++
 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_pmu.c                     | 27 ++++++-
 tests/meson.build                        |  1 +
 5 files changed, 130 insertions(+), 2 deletions(-)

-- 
2.34.1

