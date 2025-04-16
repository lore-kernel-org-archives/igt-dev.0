Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294FFC369C2
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 11:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DCA10E8C8;
	Wed, 16 Apr 2025 11:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ub5EimQo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3CC10E8C8
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744801384; x=1776337384;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eozLoXT3cj6L+rVUdd/mG0Rnt8NB596I9Kycge5fAF0=;
 b=Ub5EimQoN8Tsd+aqs9rDstkmoSZ30PE4Kxc7W15yiKfKskU0l2h707a1
 +0mFTO6lhkP0/jnpfgW+/6rL4KpKUAh42lBlBbzckEy9UQNkeJzuz/9Tp
 /j1F9Ay021F6hohrhXUzB01FkIiJuhBwyuF+rR9A0IDT17SHz9Qv2Bw8A
 6XBgRlmhreDrsAPjStqH3Iqdt0Iw49wRcrIWSikOaTYQpimwVBLDTbO1y
 JfV3V5ivpks7Nn0QKc/sCs+nzicncuyo8GwCbBCEP7xr+Vgz3uE/KVcRS
 JYdKjZy4m6nbx0bY+oLsDQMOzWf1b0QHvUy+2lohbSrphgOQeWBqEW3aM Q==;
X-CSE-ConnectionGUID: U3CqEqm5ScCjeKhtKX3vVg==
X-CSE-MsgGUID: azPeJ/5HT++wv7LGmR7BaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33958736"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="33958736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 04:03:04 -0700
X-CSE-ConnectionGUID: 8tgjz7psRfWYpwyTxVP7pA==
X-CSE-MsgGUID: lNWJbdxJSuOjKILQhZ0wCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135233834"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 04:02:55 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v7 0/5] Add per-device engine activity stats in GPUTOP
Date: Wed, 16 Apr 2025 16:28:46 +0530
Message-Id: <20250416105851.2048787-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

     Add per-device engine activity stat support in GPUTOP.
This leverages the PMU interface to display the activity of
engine instances for the array of requested or all devices.
    This patch refactors GPUTOP to be vendor-agnostic, 
laying the groundwork for future support of multiple 
GPU vendors.
    Currently, GPUTOP supports GPUs with Xe driver only
and can monitor the engine activities of multiple GPU
devices simultaneously through abstracting vendor 
specific code into a common interface and implementing 
vendor-neutral APIs for monitoring.

DRIVER: xe || BDF: 0000:00:02.0
ENGINES         BUSY
Render/3D/0   | 96.5% ███████████████████████████████████████ |
Blitter/0     | 91.6% █████████████████████████████████████   |
Video/0       | 56.2% ███████████████████████████             |
VideoEnhance/0| 97.7% ████████████████████████████████████████|
Compute/0     | 48.5% ███████████████████████                 |

Soham Purkait (5):
  lib/igt_device_scan: Add support for the device filter
  lib/igt_device_scan: Enable finding all matched IGT devices
  tools/gputop/utils: Add gputop utility functions common to all drivers
  tools/gputop/xe_gputop: Add gputop support for xe specific devices
  tools/gputop/gputop: Enable support for multiple GPUs and instances

 lib/igt_device_scan.c       | 131 +++++++++++++
 lib/igt_device_scan.h       |   2 +
 tools/{ => gputop}/gputop.c | 249 ++++++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 +++++
 tools/gputop/utils.h        |  64 +++++++
 tools/gputop/xe_gputop.c    | 368 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  68 +++++++
 tools/meson.build           |   6 +-
 9 files changed, 898 insertions(+), 47 deletions(-)
 rename tools/{ => gputop}/gputop.c (65%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

