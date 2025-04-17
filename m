Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3DCC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 14:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691FD10EB20;
	Thu, 17 Apr 2025 14:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxACZGPK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E78610EB20
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744898683; x=1776434683;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZDiSOXfJahuuERmp6CGoWAvpjW7YoImFCavg5HaZr0s=;
 b=LxACZGPKJVu7ui8Yaf1xph7DlQw5b2Y2ri+HozVxlePYqQ+rxQAASXDF
 AlxcapMV/dyhRRrAyfQnJicp/fU01JOidJPQKCbg5P5R3FXVll4/r85Yf
 ofgbqoYnKTqnce8kHMobFW+to4Eiy8AhL20bH1bvsE9ueL6wRb9I+OpCM
 Jap6KNaQqYl33yHEOFWBk782jbobOLNN8LDrr74R6Dh6BtZ8Zpy1GlW8B
 Sf4D6DLWnq0admiMXwN8jjevdNTU6ur4Omd6+MUchQV4nmxpmn7uPc1XP
 XCvKcB9nrvwzPTWE85ZF6QfYTQWFbm7lNRPqfYGWFCKgpJERwK2bV/lrx w==;
X-CSE-ConnectionGUID: c7YJX2dRQtOUTLIJogb6jA==
X-CSE-MsgGUID: LUvfqf3dTrq+vNS0rfqg+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45723064"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="45723064"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 07:03:46 -0700
X-CSE-ConnectionGUID: rQ8CmUHESpm6hUzr58+mpQ==
X-CSE-MsgGUID: 4CAvRLnuSpmLjIEQOJsPAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="153996275"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 07:03:42 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v8 0/5] Add per-device engine activity stats in GPUTOP
Date: Thu, 17 Apr 2025 19:29:36 +0530
Message-Id: <20250417135941.2083761-1-soham.purkait@intel.com>
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
 lib/igt_device_scan.h       |   2 +
 tools/{ => gputop}/gputop.c | 253 +++++++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 +++++
 tools/gputop/utils.h        |  64 +++++++
 tools/gputop/xe_gputop.c    | 368 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  68 +++++++
 tools/meson.build           |   6 +-
 9 files changed, 901 insertions(+), 44 deletions(-)
 rename tools/{ => gputop}/gputop.c (64%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

