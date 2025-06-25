Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44371C77B7C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 07:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE86E10E0C3;
	Wed, 25 Jun 2025 07:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aS/i8wz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B3F10E0C3
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 07:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750836893; x=1782372893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=McuoBe5aYMIzPSGCzUbjWC0BNVR2fuBmt5Go4CjSipU=;
 b=aS/i8wz8oAZzJtuwtVHWXcygkKbKnIOARxJ17KpymLWSVr4ZuCWH19zR
 TPDKcoF+C9IMg+wFosPXbiKJgSDjlqx2BhMujmicD49IZlb5EmISHXPYh
 1M57Q+amL5u6I4c9zacF1L8VYEfMfWhRSNGQvuRYCxIIrfJC0+Yhx2yQh
 fBZSTzHQJpn49QrudVoAlQaXSRHPI2ACPSJS0cf3ymtyB5MPuDOc7sLDa
 SnqnfRXPzZqjqWaEzII4AzFiY1cNsZU1XNCUYj77TliGxh5R2HIPQ6165
 zs1qDlGj3uHQ+pUYE9g5NuDxmfvauUHnOu5crCEPJSGkEOai84bzOcL1c g==;
X-CSE-ConnectionGUID: Yxk4CRGqS7yGMZB9nx0Cqg==
X-CSE-MsgGUID: cr9DzUcHTJmncxpXmsu6QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75633329"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="75633329"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 00:34:53 -0700
X-CSE-ConnectionGUID: r9Ymyuo8SM+vRaA/SI6DrA==
X-CSE-MsgGUID: EhNl+1W3QGy9BQ+eh+HbAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151892216"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 00:34:49 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v15 0/5] Add per-device engine activity stats in GPUTOP
Date: Wed, 25 Jun 2025 12:58:43 +0530
Message-Id: <20250625072848.3479396-1-soham.purkait@intel.com>
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

    This patch refactors GPUTOP to be vendor-agnostic, laying
the groundwork for future support of multiple GPU vendors.

    Currently, GPUTOP supports GPUs with Xe driver only
and can monitor the engine activities of multiple GPU
devices simultaneously through abstracting vendor 
specific code into a common interface and implementing 
vendor-neutral APIs for monitoring.

DRIVER: xe || BDF: 0000:03:00.0
   GT:0 Render/3D/0| 99.1% ███████████████████████████████████████████████████|
     GT:0 Blitter/0| 59.2% ██████████████████████████████                     |
     GT:0 Compute/0| 49.2% █████████████████████████                          |
       GT:1 Video/0| 89.3% ██████████████████████████████████████████████     |
       GT:1 Video/1|  0.0%                                                    |
GT:1 VideoEnhance/0| 98.5% ██████████████████████████████████████████████████ |
GT:1 VideoEnhance/1|  0.0%                                                    |

Soham Purkait (5):
  lib/igt_device_scan: Add support for the device filter
  lib/igt_device_scan: Enable finding all matched IGT devices
  tools/gputop/utils: Add gputop utility functions common to all drivers
  tools/gputop/xe_gputop: Add gputop support for xe specific devices
  tools/gputop/gputop: Enable support for multiple GPUs and instances

 lib/igt_device_scan.c       | 128 +++++++++++++
 lib/igt_device_scan.h       |   1 +
 tools/{ => gputop}/gputop.c | 237 +++++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 +++++
 tools/gputop/utils.h        |  63 +++++++
 tools/gputop/xe_gputop.c    | 361 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  59 ++++++
 tools/meson.build           |   6 +-
 9 files changed, 868 insertions(+), 44 deletions(-)
 rename tools/{ => gputop}/gputop.c (64%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

