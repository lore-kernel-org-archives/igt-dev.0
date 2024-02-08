Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CACC4828F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 13:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AB910E770;
	Thu,  8 Feb 2024 13:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2216Tbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E1B10E770
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707400360; x=1738936360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aSAGg0q3hLylhGtj2Axn73swDQOc/EsfKXpbnpC0bjg=;
 b=U2216TbebHx+UQfRxBdJBOfoe7cLtBWuK3XoPtHheHLAJEPjApoBJpxA
 XPEEmcbkcwBurslR2fWx/hdHs2Nk3m80Fs5NA9q2AQ89vIaBG2XNqy6+2
 No6afFlWF23r6GCDFDms5J3L6IzuaAHIcwBG4Kndfi6z061mxZaUa0pMZ
 4ngdp6l+4HTHNmCOg9qH/KnfMqQ0cIRMyBC9Q+YDPmy474gOvGDa7tNXm
 Qx2Pk7t9lwHSdMEoMP/Ewdzcd1mkIEz6W6Llvs6bK26zUO/wt3WcSdjCZ
 azYHI7Us3V9DpIVMs3nBtlGQJyCo1V5ar3301PgQIQgimP8lLvqts68Pg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1106889"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1106889"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 05:52:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="2023542"
Received: from unknown (HELO localhost) ([10.245.101.174])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 05:52:37 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v8 0/8] introduce Xe multigpu and other multi-GPU helpers
Date: Thu,  8 Feb 2024 14:52:24 +0100
Message-ID: <20240208135232.54382-1-kamil.konieczny@linux.intel.com>
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
v3: corrected include in first multigpu patch (Dominik)
  fixed typo (Dominik), refactoring code with Xe and gem macro (Kamil)
v4: corrected typo in macro (Dominik)
v5: removed cached names and relaxing checks for filtered devices
  in 3/8 patch, added Janusz to cc in 1/8...5/8 (Kamil)
v6: extended description of patches 1 and 2, fixed bug in 3/8 (Janusz)
  improved usage of _is_already_opened() (Kamil)
v7: restored prohibition of opening the same card at other index (Janusz)
v8: limit checks for N-th card to 0...N-1 range (Janusz)
 simplify if-else in __search_and_open() (Kamil)


Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

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

 lib/drmtest.c               |  92 +++++++++++++++++++-----
 lib/drmtest.h               |   1 +
 lib/igt_device_scan.c       |  21 ++++++
 lib/igt_device_scan.h       |   2 +
 lib/intel_multigpu.c        | 135 ++++++++++++++++++++++++++++++++++++
 lib/intel_multigpu.h        |  36 ++++++++++
 lib/meson.build             |   1 +
 tests/intel/gem_mmap.c      |  77 ++++++++++++--------
 tests/intel/xe_exec_basic.c |  36 ++++++++++
 9 files changed, 357 insertions(+), 44 deletions(-)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

-- 
2.42.0

