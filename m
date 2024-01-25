Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4B4C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 18:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4148510F223;
	Thu, 25 Jan 2024 18:36:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C702A10EEBA
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706207798; x=1737743798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UHFMZtSnkDTRJ3xGfzJrZqXbuGXFaSBJHZ0yISDpknw=;
 b=NX+cO47AS9+bTqUYqE5o2HUZ0FB+hor1gzxSrDqyrQKR5yzAmIJuNwxL
 4giaaaRv9hq4rBw7SHGVu6R2bfO1TteLcM5fCItM6fIKfMIcDvqrkVXUJ
 EC3gkPXtGMTMui5TaxcCdNFc8WzN/dX/s9HWxgLfevyxnzuExtsRHE0r+
 8fqics+ca/ITM/n2smpj91QowDpZETtRa04+rehqrIMvXRwgZM7bSTm+a
 IZ+3hfByfk13E9dXC1eYf3hzNQM9WYUAN/rT12QRvpMaaF1jYoftuzPO2
 z4Bd+8+V8xzk9EKnt2mZdrFUs8XPMJpmdMvMkk6PYJtis2kaevTbYsbJf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="20800767"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20800767"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2340187"
Received: from unknown (HELO localhost) ([10.245.100.131])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:36:37 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 0/8] introduce Xe multigpu and other multi-GPU helpers
Date: Thu, 25 Jan 2024 19:36:23 +0100
Message-ID: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
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

 lib/drmtest.c               | 119 ++++++++++++++++++++++++++-----
 lib/drmtest.h               |   1 +
 lib/igt_device_scan.c       |  21 ++++++
 lib/igt_device_scan.h       |   2 +
 lib/intel_multigpu.c        | 135 ++++++++++++++++++++++++++++++++++++
 lib/intel_multigpu.h        |  36 ++++++++++
 lib/meson.build             |   1 +
 tests/intel/gem_mmap.c      |  77 ++++++++++++--------
 tests/intel/xe_exec_basic.c |  36 ++++++++++
 9 files changed, 384 insertions(+), 44 deletions(-)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

-- 
2.42.0

