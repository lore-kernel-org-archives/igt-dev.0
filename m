Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE02C7EE31
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 06:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB25F10E96E;
	Fri, 27 Jun 2025 06:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boNGSne/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F9E10E96B
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 06:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751004042; x=1782540042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aA5TaN3te7RPWHdGLtIckqAvHmCvhzlSWrvKcNaICTc=;
 b=boNGSne/PBRei649mlNM9gIIEe9XUH/V8VuTMLNVio4OjCyhgPptyqUY
 dFDQEmQo/wS7l5qYiuhOFKiqs4X1aqrKbwLSEOKfU5uMnU3V0gA5FjCqK
 Z0+BkoCA35lCaMSTLgTdR9g5O1uotnfHPRJvGzluFWsOAt8z5W7qrf/qE
 DzSQktZNpG7crR7GfK7iB6oxxYCwJJZOH1SL27m4QmHX8b/gBmT38At3U
 1s/jDqX5um9ZwDfObU4xtfZQVmWpebjNnkWCiHZ+nLtssdYCIJNv+cTDs
 nlqiRVC7YS6YRoRLNfi7v2s4LhVoV1s7ph67vcybCuVCZ1lTdDqVk7PS3 g==;
X-CSE-ConnectionGUID: RkfwfSeUSuGoACFGR8MaAg==
X-CSE-MsgGUID: bXJcCux0Sd2ldtMU1I/mWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53278500"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="53278500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:00:41 -0700
X-CSE-ConnectionGUID: c2cOqKNBQJyrgBlB8GPN6A==
X-CSE-MsgGUID: 5Dmnd1FPQyq9MKPupuEAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152809414"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 23:00:39 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v8 0/7] Refine FBC test conditions
Date: Fri, 27 Jun 2025 11:34:39 +0530
Message-Id: <20250627060446.29615-1-mohammed.thasleem@intel.com>
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

 lib/i915/intel_fbc.c                   | 25 ++++++++++++++
 lib/i915/intel_fbc.h                   |  1 +
 lib/intel_wa.c                         | 48 ++++++++++++++++++++++++++
 lib/intel_wa.h                         | 11 ++++++
 lib/meson.build                        |  1 +
 tests/intel/kms_dirtyfb.c              |  5 +--
 tests/intel/kms_fbcon_fbt.c            |  5 +--
 tests/intel/kms_frontbuffer_tracking.c | 12 +++----
 tests/intel/kms_psr.c                  |  6 ++++
 tests/intel/kms_psr2_sf.c              |  5 +++
 10 files changed, 109 insertions(+), 10 deletions(-)
 create mode 100644 lib/intel_wa.c
 create mode 100644 lib/intel_wa.h

-- 
2.34.1

