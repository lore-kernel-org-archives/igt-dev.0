Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD1CC369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 07:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A4110E021;
	Wed, 30 Apr 2025 07:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mI0wp/JR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA1E10E021
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 07:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745997171; x=1777533171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OXQpsrxtIVMHbhUxJoRZnG0XUcksjvbpM+eFWrML43o=;
 b=mI0wp/JR7G73/1a8da5a6HzQSGA6dgj16CpRGR9k79CRcfb8A6a49nyy
 k6qFLCd3AY7su69w2kn2skYE9Qy8yV48mAb7RcqYBNxj6T0GYcHaE7MHC
 dnf6+qxTgYfdk9XbkAXW4Pn/G98MYpx/FS4KPk3G0JSU7IGpVEkEV/hby
 jABer9BYMjSlUMoJ6tExlAGzRxS1i0/UrBUKvsFfSqpHWVxxknKs18tp1
 zFY+fPYfiM8NSn6jt3HXUZvYVqXOIOnklHoFcyEiqNcTXSGmtzrf9AF30
 tkkVlrwSlBHuDqMFAEWMFmcvEJhSkEuGfQR5INzbndK8y7vfFg6/Ct7qT g==;
X-CSE-ConnectionGUID: nQBuNiF5Rb+OupjQEqHo3w==
X-CSE-MsgGUID: Wmq6dpUaQcidIQrvyoa+EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73030106"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="73030106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 00:12:50 -0700
X-CSE-ConnectionGUID: tS6uqHlxRxGjBBntsxnGFA==
X-CSE-MsgGUID: hRQSvxlFTZGXLJayp1f0UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="133965891"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 00:12:47 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v10 0/5] Add per-device engine activity stats in GPUTOP
Date: Wed, 30 Apr 2025 12:38:19 +0530
Message-Id: <20250430070824.3012927-1-soham.purkait@intel.com>
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

 lib/igt_device_scan.c       | 127 +++++++++++++
 lib/igt_device_scan.h       |   1 +
 tools/{ => gputop}/gputop.c | 230 ++++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 +++++
 tools/gputop/utils.h        |  64 +++++++
 tools/gputop/xe_gputop.c    | 368 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  68 +++++++
 tools/meson.build           |   6 +-
 9 files changed, 877 insertions(+), 44 deletions(-)
 rename tools/{ => gputop}/gputop.c (66%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

