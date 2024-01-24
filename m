Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3935C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 20:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C70110EA85;
	Wed, 24 Jan 2024 20:41:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B8010EA85
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 20:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706128901; x=1737664901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PHdZ3WScyFjw+UE4l/HG4D9FQrQtbZqnJN/C5b6f274=;
 b=Mo8MWiS3BxGan+yjGZa1ggf9qRnDk243DC8IVH7HV57Y0xgT9DTUlWJV
 H1H64q2MGYmIX5q0GUI2tI6xP7RLFNAFcV6rNOwSiP8N+b7FU7GRImWrl
 3PB+gJd4NkLjmlWJEFqZ/ZTXVbdJdRlQ2KyPR5fKGvyEjUIaAyilC0nH3
 cUaylze3ETqdJDMv0RpQrGGUn6hxhvhGRkWIEiVyYdQlHCUi403SC8qkz
 CZGvbRZ6o9C1iv/1xH9El90S84kpzkQEonfzLXOeHu7ZKCT/2Zx+CUxxP
 m/E/4MYyXWcSC3X3Qgc7cTou0peBlgfl+7FrmSNNkgsgHwPt3seb4szlZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399121782"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="399121782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 12:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28250859"
Received: from unknown (HELO localhost) ([10.245.100.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 12:41:41 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/8] introduce Xe multigpu and other multi-GPU helpers
Date: Wed, 24 Jan 2024 21:41:26 +0100
Message-ID: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

Introduce some multi-gpu function helpers and macros. Change in drmtest
base opening function allows it to use __drm_open_driver_another(N, ...)
out of order, for example on board with three discrete GPUs:
__drm_open_driver_another(2, DRIVER_INTEL);
__drm_open_driver_another(0, DRIVER_INTEL);

Second solution for Xe is based on filtered views. Both allows to
quickly write tests. There is still drawback of not printing in
children logs <g:gpu-number> for first opened device. I renamed
lib from lib/i915/igt_multigpu.* to lib/intel_multigu.* as I do not
know of any non Intel developer using igt for such tests.

v2: corrected two patches which introduced multigpu lib (Dominik)
  rebased patch intoducing Xe multigpu macro, corrected description

Dominik Karol Piątkowski (4):
  lib/igt_device_scan: Introduce filtering out non-PCI devices
  lib/drmtest: Introduced drm_open_driver_another
  lib/intel_multigpu: Introduce library for multi-GPU scenarios
  lib/intel_multigpu: Introduced gem_multigpu_count_class and
    igt_multi_fork_foreach_gpu

Kamil Konieczny (4):
  lib/drmtest: allow opening cards out of order
  lib/intel_multigpu: Add xe_multi_fork_foreach_gpu
  tests/intel/xe_exec_basic: add multigpu subtests
  tests/intel/gem_mmap: add basic multi-GPU subtest

 lib/drmtest.c               | 119 +++++++++++++++++++++++++++++-----
 lib/drmtest.h               |   1 +
 lib/igt_device_scan.c       |  21 ++++++
 lib/igt_device_scan.h       |   2 +
 lib/intel_multigpu.c        | 125 ++++++++++++++++++++++++++++++++++++
 lib/intel_multigpu.h        |  36 +++++++++++
 lib/meson.build             |   1 +
 tests/intel/gem_mmap.c      |  77 ++++++++++++++--------
 tests/intel/xe_exec_basic.c |  36 +++++++++++
 9 files changed, 374 insertions(+), 44 deletions(-)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

-- 
2.42.0

