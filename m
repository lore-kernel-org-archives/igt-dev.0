Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67624C83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 13:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2013110E226;
	Mon, 30 Jun 2025 13:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtyvzwJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA61810E226
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751290650; x=1782826650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gstsgH3BoGoTmrpEa8pHXXbS+hsjH6yqX0wRRGnD5Uo=;
 b=GtyvzwJxyqviqrEfIa4SZxMFwmm93OLK3nVa86E/ryxPsfCMssCt09I9
 cly5RoQ+QLWsO+GXfhnmee3GUVvlTFILfN8XClnS1V6JH+CjDoCjvdKoh
 oFe6YYoy6RJF8FbyRa1nf8/I0s5Dkna8iY8uA8l5Vp/38E0Ab9LAWDbH7
 GwU7uiICb3usqKZMI+mQnjCOlPbid0yuC3EJy3V5/SKCGp925Cn1fdoRn
 xMIc0ThyaEiOI5N474vtFsvWIgny73CHbeRgRZcH41BnardLDQU6HpZkY
 IBZmnX9BX8tyoBF2OGmrYXxZ/ASvmCkJ9m4ftlvWy64/zhVXXD/Y/L+Pm Q==;
X-CSE-ConnectionGUID: zEgx4o4sReSwRAaK60stRA==
X-CSE-MsgGUID: VMBtr5DASaCkExNDlblu4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57322530"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="57322530"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:37:29 -0700
X-CSE-ConnectionGUID: M9byJ4SKSra2dlXRScUwRg==
X-CSE-MsgGUID: Y04/iDcjQqm6Ek4QoArOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="159188288"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.227.88.71])
 by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 06:37:28 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v9 0/7] Refine FBC test conditions
Date: Mon, 30 Jun 2025 19:11:38 +0530
Message-Id: <20250630134145.836-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Refine FBC test conditions.

Mohammed Thasleem (7):
  lib/intel_wa: Add check for workaround in GTs
  lib/i915/intel_fbc: Add fbc supported check based on wa
  tests/intel/kms_frontbuffer_tracking: Enable the tests support
    variations based on the WAs
  tests/intel/kms_dirtyfb: Enable the tests support variations based on
    the WAs
  tests/intel/kms_fbcon_fbt: Enable the tests support variations based
    on the WAs
  tests/intel/kms_psr: Enable the tests support variations based on the
    WAs
  tests/intel/kms_psr2_sf: Enable the tests support variations based on
    the WAs

 lib/i915/intel_fbc.c                   | 27 +++++++++++++
 lib/i915/intel_fbc.h                   |  1 +
 lib/intel_wa.c                         | 54 ++++++++++++++++++++++++++
 lib/intel_wa.h                         | 11 ++++++
 lib/meson.build                        |  1 +
 tests/intel/kms_dirtyfb.c              |  5 ++-
 tests/intel/kms_fbcon_fbt.c            |  5 ++-
 tests/intel/kms_frontbuffer_tracking.c | 12 +++---
 tests/intel/kms_psr.c                  |  6 +++
 tests/intel/kms_psr2_sf.c              |  5 +++
 10 files changed, 117 insertions(+), 10 deletions(-)
 create mode 100644 lib/intel_wa.c
 create mode 100644 lib/intel_wa.h

-- 
2.25.1

