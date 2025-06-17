Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C38FC71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 19:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9EB10E138;
	Tue, 17 Jun 2025 19:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxwG3rch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C76510E18C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 19:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750188408; x=1781724408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Iv+wHCkv4LuMKtsDff65SG1scam0JV0e6fWRFgFhKcI=;
 b=lxwG3rchNIVcfw1zDC8Bh6uW2mjsKhlpXGfcpfSt98w61hzkGYiQg9JT
 VPYN0meAvrXxsFC28LlazGsycIr12Z36ki0Yp2ULI81OcVSmdEvNTXlEg
 pYMRXsRa1Ya4cALOUcWzBDyQmAJoKAfW8wpf2pVTouWp0DdZX7F0tCeIM
 7CkGkdkvPBPHZLGsCDL7Lpvtf4c7POhxebFkIPPdtWwfHGGvG8xztAlv+
 djMihtAqt57GB0vKiSLWb8t0eFDeNho9PzPp2uwkQtxujwgFHwbZwQfNF
 pg+Ar54enkIblHupGyn8G1bOkLl0LPocM5d6Qiow1E56wgLGqDDfuLLYu A==;
X-CSE-ConnectionGUID: UP1JZRUrTTejIi/9BF8aFA==
X-CSE-MsgGUID: i3BhbwpMShK0lufHJFxVOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52523987"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52523987"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 12:26:47 -0700
X-CSE-ConnectionGUID: Pj4OrqAjRm+GYzMVhvGv7A==
X-CSE-MsgGUID: iC6cyNmBQe+SBKLM3Ii4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148807820"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 12:26:47 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v6 0/7] Refine FBC test conditions
Date: Wed, 18 Jun 2025 01:00:21 +0530
Message-Id: <20250617193028.107483-1-mohammed.thasleem@intel.com>
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

 lib/i915/intel_fbc.c                   | 22 +++++++++++
 lib/i915/intel_fbc.h                   |  1 +
 lib/intel_wa.c                         | 51 ++++++++++++++++++++++++++
 lib/intel_wa.h                         | 14 +++++++
 lib/meson.build                        |  1 +
 tests/intel/kms_dirtyfb.c              |  6 ++-
 tests/intel/kms_fbcon_fbt.c            |  6 ++-
 tests/intel/kms_frontbuffer_tracking.c | 13 ++++---
 tests/intel/kms_psr.c                  |  8 ++++
 tests/intel/kms_psr2_sf.c              |  7 ++++
 10 files changed, 119 insertions(+), 10 deletions(-)
 create mode 100644 lib/intel_wa.c
 create mode 100644 lib/intel_wa.h

-- 
2.34.1

