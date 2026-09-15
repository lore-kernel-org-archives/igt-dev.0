Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7E4C88E75
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 05:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E67810F97C;
	Tue, 15 Sep 2026 05:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmIzLQaB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B0510F97C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 05:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789449866; x=1820985866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=raqjBTUoYqQ1iOvEZMoubPebapO/iuT8nf0rPtCb3K0=;
 b=AmIzLQaBQ7XUiTpAlsDmpXk2Ofykpy07qeSP/PUKgL02Yb+QuiDnbClF
 E4UMm4+fowGEl0boUsDVDav6cR3d5Ebp/kHfQLGSQoG/pb7fl7bqmY7TI
 llG1y8wqg3VShdkXu0w9afLSVbi49UWfAfOGtwsdgVwnzMgXR01IH0iJn
 GpQsRNOR35UB6aPQgM9BP4UuH8GnJ8MTllYmyTgUNJtjXQ24o3dP+0Xm0
 C7UezXPd8oNNn9ILc6BAFQwcBFC3dR3zzjXoLmuxEEF+RAblvUZe2+Gdf
 lUZpiwpifg0KqnhwXXJqda7o3JrUpcLDbWfXt5UNAttZs3wVWLmjkZUm9 g==;
X-CSE-ConnectionGUID: Q7HXhGLmQH+1fVsqOUHd1A==
X-CSE-MsgGUID: 7auLrbsUQa2924tEQ45/Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107316154"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107316154"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:24:26 -0700
X-CSE-ConnectionGUID: wHs1Rf7+TPO3C+6/+MiV+Q==
X-CSE-MsgGUID: eHDztevTQCO/8ahmZl6NCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1241414"
Received: from dut1121bmgfrd.igk.intel.com ([10.211.178.40])
 by fmviesa013.fm.intel.com with ESMTP; 14 Sep 2026 22:24:25 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v7 0/3] xe_device_sysfs coverage updates
Date: Tue, 15 Sep 2026 05:24:13 +0000
Message-ID: <20260915052421.23254-1-shivtej.eknath.patil@intel.com>
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

Add coverage for xe_device_sysfs sysfs interfaces by introducing
helpers for vram_d3cold_threshold and extending xe_pm with subtests
that validate the corresponding sysfs attributes.
 
The series covers:
- vram_d3cold_threshold show/store interfaces
- lb_fan_control_version show interface
- lb_voltage_regulator_version show interface
- auto_link_downgrade_capable show interface
- auto_link_downgrade_status show interface

Changes since v6:
- Sort xe.pm.d3cold.testlist entries alphabetically as requested during review.

Shivtej Patil (3):
  lib/igt_sysfs: add vram d3cold threshold helpers
  tests/intel/xe_pm: add coverage for xe_device_sysfs
  tests/intel-ci/xe.pm.d3cold.testlist: add xe_pm sysfs coverage
    subtests

 lib/igt_sysfs.c                      |  50 ++++++++
 lib/igt_sysfs.h                      |   3 +
 tests/intel-ci/xe.pm.d3cold.testlist |  15 ++-
 tests/intel/xe_pm.c                  | 176 ++++++++++++++++++++++-----
 4 files changed, 209 insertions(+), 35 deletions(-)

-- 
2.43.0

