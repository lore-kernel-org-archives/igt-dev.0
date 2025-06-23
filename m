Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B0CC7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 10:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEC510E342;
	Mon, 23 Jun 2025 10:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XInuH0au";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F87E10E342
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750673560; x=1782209560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LV8Ih/4kKXZ8/jQj1RZLFI+QrmP8EHAPtkf4b/FkzyY=;
 b=XInuH0auol3/Sgmd1rN+NlI+jzJsCpMy8iwKtaL1kcT3c+JYQUSdd+HO
 aYX5E/Vbwylc7LrklscH0CEGyyR1K+ObkXWXk2BlUbo6YUrrNms6z3FsO
 CbkYczI9lvT7T4g+gfwgI7ebk/1MJE+1cCEhuRm6Yw8bYC7XQLFpjbchY
 CORO3aznvPCn8M9nq6Y932xog7/YUCLCji1wedJpzH252T3Cg+JkZtoWi
 NWMiv7MoqU2cjIkjdCTjgY4U4MSIXJMwccf3RfUOh4W7Or5Sr7wQrNNdw
 e/1cV6aRF4ktSqPRdWKgF10ud6fIqkY8lwtSedTNw0h7JFpZ6MS2ypJmA g==;
X-CSE-ConnectionGUID: 3LnS6jF0RgyAB3i8s+CC2A==
X-CSE-MsgGUID: hA7AivuKRHGhdysWLhG18w==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64229275"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="64229275"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:12:40 -0700
X-CSE-ConnectionGUID: SOHDqfiGSj2gnrDL86u+Rw==
X-CSE-MsgGUID: NV7Q2s9ZRyWneZb06pxakw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151844178"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:12:37 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v14 0/5] Add per-device engine activity stats in GPUTOP
Date: Mon, 23 Jun 2025 15:36:36 +0530
Message-Id: <20250623100641.3359635-1-soham.purkait@intel.com>
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

 lib/igt_device_scan.c       | 128 +++++++++++++
 lib/igt_device_scan.h       |   1 +
 tools/{ => gputop}/gputop.c | 229 +++++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 ++++++
 tools/gputop/utils.h        |  62 +++++++
 tools/gputop/xe_gputop.c    | 354 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  59 ++++++
 tools/meson.build           |   6 +-
 9 files changed, 852 insertions(+), 44 deletions(-)
 rename tools/{ => gputop}/gputop.c (65%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

