Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C17AC77B7C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 20:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2994210E00D;
	Wed, 25 Jun 2025 20:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUuP4roy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD52F10E00D
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 20:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750882110; x=1782418110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YLoEexq8hiKEO8j13mQvRnIq5UPtJ2G1aLIVtxV8T+E=;
 b=jUuP4royIVVN/Ar9lnWzSX9x++3ax/KemCiiyQRIQSeCGUKIG+WhTqjh
 lk4jRSDGWMsM9WnQCl9XCKUBknEuocJLFKbV7qVnoNY5BqrF4Zx+6uK5R
 Kbth11iE6b6nu+y+GXMCOZV9TEyE2DzG7Br7wi8f4ief/NI3LoWYzMK1S
 elBE44H6X0BObBa6ttpSbSuNu8gFb92J/pddkgJwwj7QximP6n1vjADWH
 IlkRB6n4sNuuaPYOKeR3Yk+tgWo/dkWiQlLiKm7b/PNqK7maLsENr7pWR
 0fEi3TMTtSX4CNkO+NpPaiWY1+m4ySzMPQhYk12Pb3eZwJNWuOZ9IJ3S5 g==;
X-CSE-ConnectionGUID: MI+mhacJQ3CMHg+hiGnlIw==
X-CSE-MsgGUID: +svF3JjSQs2OqJZpMYew0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63766175"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63766175"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:08:29 -0700
X-CSE-ConnectionGUID: nTZ8KrHzTE2VjPWbtc6NwA==
X-CSE-MsgGUID: SPV0J8FOTmqInXTSOgLO5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="153033355"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa010.fm.intel.com with ESMTP; 25 Jun 2025 13:08:28 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v7 0/7] Refine FBC test conditions
Date: Thu, 26 Jun 2025 01:37:31 +0530
Message-Id: <20250625200738.34381-1-mohammed.thasleem@intel.com>
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
  lib/intel_wa: Add specific checks for WA in GTs
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

 lib/i915/intel_fbc.c                   | 25 ++++++++++++++
 lib/i915/intel_fbc.h                   |  1 +
 lib/intel_wa.c                         | 46 ++++++++++++++++++++++++++
 lib/intel_wa.h                         | 14 ++++++++
 lib/meson.build                        |  1 +
 tests/intel/kms_dirtyfb.c              |  6 ++--
 tests/intel/kms_fbcon_fbt.c            |  6 ++--
 tests/intel/kms_frontbuffer_tracking.c | 13 ++++----
 tests/intel/kms_psr.c                  |  8 +++++
 tests/intel/kms_psr2_sf.c              |  7 ++++
 10 files changed, 117 insertions(+), 10 deletions(-)
 create mode 100644 lib/intel_wa.c
 create mode 100644 lib/intel_wa.h

-- 
2.34.1

