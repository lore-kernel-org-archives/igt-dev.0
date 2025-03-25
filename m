Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4C2C36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAA310E5DF;
	Tue, 25 Mar 2025 19:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoqOQl7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5E710E5DF
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742930161; x=1774466161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cxA7X+TL+c0tIMqUX+B5N8ifRokcco0x5P0r5R5iuhI=;
 b=MoqOQl7/HZvut5YRqFcvK966z2nZswqxtliEHwguF03qZwxTf0mvzIGN
 1CUhIsNkYgUyEfX19ZB31qU1uCk2FjI4EgygWC1AUgj/pVwINMIJrwljz
 qbQlLaTs4GCDRCyoqL0z+EFgtzHakodS7HdLAf87XVrBlxHQ7hBp99odE
 HLbIe6Qlz6HSxsNsVu3/jwhXT13xNzHWQ3UugkXbdps1nUaog50iW4XgE
 c8sB3k10O9YUCTL9UCYTDvbDUpiGjld87/YA5djVY8VUpejVaZDkDTU5K
 Tf4F6enpwm9fYB0ERWe4U8SA3wn6zH/FOZ0iVuMXyEDL91oxL/Ajwuxu1 g==;
X-CSE-ConnectionGUID: KydoT0z2QUmaJHJ3GD40Qg==
X-CSE-MsgGUID: DNEaqoftQ06pQnkBOm53fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69558659"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="69558659"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:16:00 -0700
X-CSE-ConnectionGUID: Mc3MZR3YRxuCNf50jveY/Q==
X-CSE-MsgGUID: P0fNDHOTThit/0kZjJyotA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="147657217"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:15:58 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH <i-g-t> v5 0/4] Add per-device engine activity stats in GPUTOP
Date: Wed, 26 Mar 2025 00:42:26 +0530
Message-Id: <20250325191230.1822979-1-soham.purkait@intel.com>
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

Soham Purkait (4):
  lib/igt_device_scan: Enable finding all IGT devices for a specific driver
  tools/gputop/utils: Add gputop utility functions common to all drivers
  tools/gputop/xe_gputop: Add gputop support for xe specific devices
  tools/gputop/gputop: Enable support for multiple GPUs and instances

 lib/igt_device_scan.c       | 177 ++++++++++++++++-
 lib/igt_device_scan.h       |  12 ++
 tools/{ => gputop}/gputop.c | 235 +++++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 +++++
 tools/gputop/utils.h        |  62 ++++++
 tools/gputop/xe_gputop.c    | 368 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  68 +++++++
 tools/meson.build           |   6 +-
 9 files changed, 934 insertions(+), 51 deletions(-)
 rename tools/{ => gputop}/gputop.c (66%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

