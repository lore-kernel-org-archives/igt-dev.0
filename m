Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A3DC47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 20:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ABD10E87B;
	Tue, 23 Jan 2024 20:15:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB2E10E87B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 20:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706040946; x=1737576946;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2iTFGKsjdd8SyyQsk7aiyH6hNyRBHhXCg1Tep0832DA=;
 b=ZgDPUDpWHoYBA7LzfKOGaVirLxnd1Bz5gvDHQ5uuw4Ryyvqt4VWnLgMd
 SXu6JwpPOyuRrrdvGV6H6D0zHcZGOJqp3c7OuLDiyeel23VESP0kwPb8V
 zO/46e8yhs/gO+jq4W7AtI0o+X251hIKD8+CZf/TsyqrS69ln95TQ1YHt
 WWhNvvtGQTDafyUCxtcKbuA0gDKQOnqfR9TnEAS0ObwbHGUSY+Y9kr664
 fgHEPOab4N7Vu6HIfmsYw2+np6vI/80TQemWWt7dGexYVIb7qm0SYoWA2
 KOOZUWQ+EIUCMbYZeVQ0wbNJdm8DELGJAVWdjQrDbmNwyGPiNU2vTS+qw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1485618"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1485618"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:15:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820218744"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="820218744"
Received: from unknown (HELO localhost) ([10.246.3.60])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:15:43 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v1 0/8] introduce Xe multigpu and other multi-GPU helpers
Date: Tue, 23 Jan 2024 21:15:27 +0100
Message-ID: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
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
header from lib/i915/igt_multigpu.h to lib/intel_multigu.h
as I do not know of any non Intel developer using igt for such tests.

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
 lib/intel_multigpu.h        |  35 ++++++++++
 lib/meson.build             |   1 +
 tests/intel/gem_mmap.c      |  77 ++++++++++++++--------
 tests/intel/xe_exec_basic.c |  36 +++++++++++
 9 files changed, 373 insertions(+), 44 deletions(-)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

-- 
2.42.0

