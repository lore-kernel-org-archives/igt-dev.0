Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0510ACA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 12:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A1B10E1F7;
	Thu,  1 Oct 2026 12:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RM3mjCiG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBDC10E1F7
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790857625; x=1822393625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m6SJcomXKoGsS5B4X8owy9qqf1my5RBlnZlXe373Auc=;
 b=RM3mjCiGKFQqfl7B+p7NI7Hv8tuennuUZJP6tpBBM81vKgarL239/gzC
 u9rB8SLe2Ecs489EHmgPMYT1tBdYQzvVAWqn2GM+VEdrUcvhadpP2R29o
 k0p/fV5j6bUtkvPLuHKBUfGzQcPQ7dhgSDUHyuQDVIBlAKezSMImGNRxR
 AYWx8P5x+VJI2B78oZLUVESftfa4BQVHfEXeyUASwU88PaOtqupqjQ5Qr
 p81rq1HJgO2qtG0bVqvGKkbWStv8z4yQ7cJWFrsV6wChPWqcgKvK8TW/q
 QhxdIzPlywYIr8aOoUnNOpSB8aO2fOUmeK4LEHq2PzjHJZ3Ybpb91s+pw w==;
X-CSE-ConnectionGUID: IX1KJqsTT/6oaxJ2TbhzIA==
X-CSE-MsgGUID: SNYfJFuJTTO5OoCP4PcauQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91710118"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91710118"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:27:05 -0700
X-CSE-ConnectionGUID: McnaSVb2QOeKVM1nzB7K2A==
X-CSE-MsgGUID: V/f42n8nTECjReM7CA5/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="276105614"
Received: from dut1129bmgfrd.igk.intel.com ([10.211.178.46])
 by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2026 05:27:03 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: karthik.poosa@intel.com, ramadevi.gandi@intel.com, badal.nilawar@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v9 0/3] xe_device_sysfs coverage updates
Date: Thu,  1 Oct 2026 12:26:55 +0000
Message-ID: <20261001122658.6980-1-shivtej.eknath.patil@intel.com>
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

Add coverage tests for xe_device_sysfs sysfs attributes.
 
The series introduces helper functions for
vram_d3cold_threshold handling, adds xe_pm subtests to exercise
previously uncovered xe_device_sysfs functionality, and updates the
d3cold BAT testlist to execute the new vram-d3cold-threshold coverage
subtests.
 
Changes since v8:
- Add Reviewed-by from Kamil for patches 1 and 2.
- Remove non-d3cold sysfs coverage subtests from
  xe.pm.d3cold.testlist.
- Keep only vram-d3cold-threshold-show and
  vram-d3cold-threshold-store in the d3cold BAT list.

Shivtej Patil (3):
  lib/igt_sysfs: add vram d3cold threshold helpers
  tests/intel/xe_pm: add coverage for xe_device_sysfs
  tests/intel-ci/xe.pm.d3cold.testlist: add xe_pm sysfs coverage
    subtests

 lib/igt_sysfs.c                      |  50 ++++++++
 lib/igt_sysfs.h                      |   3 +
 tests/intel-ci/xe.pm.d3cold.testlist |  10 +-
 tests/intel/xe_pm.c                  | 176 ++++++++++++++++++++++-----
 4 files changed, 204 insertions(+), 35 deletions(-)

-- 
2.43.0

