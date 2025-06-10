Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E914C677C4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 17:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411B710E134;
	Tue, 10 Jun 2025 17:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeQU6ScK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C3A10E134
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749577139; x=1781113139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8b1DVvHu/h+dkwYhfnI1R8cy36Fli5YT7cfptO5Exec=;
 b=WeQU6ScKivne9hGpO7XzlFw+9eB/utmo0Jd9RXXjA/SrISVoh22NPrAD
 kOy8aRpBpbkVkcToL4Q0jtqRLe4msdNEriJlOgzcYn+9L1YLyyYmkquvm
 CwC3L5WArilZX59YghGxptOC37iS0xxrpI8ma9Z2Hv8Ggeg9kz1T70ZqD
 e2aWwPw+3vHw+4BGAfkvpxdb5bbKj6oxfDSHzwzj+atu3nCEWRaZcvBc3
 QmbZXQAxoTK/jKSyo/3s6P/wFMcyolF/05xPtbKt8WVpOlGJEZ7jwISbA
 Mcw6NGQPVfGsLH8ibSXJlOvW41bRkHU3ZJaikweNoMi4Qs89GgnIP+qCg g==;
X-CSE-ConnectionGUID: b5ll6cpEQSeLjm4edIEqiQ==
X-CSE-MsgGUID: SUOsoPTUTD+S4Z4+YkBcsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55505938"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="55505938"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 10:38:59 -0700
X-CSE-ConnectionGUID: A8H3TK5QQhGts3Er7Gn1Rw==
X-CSE-MsgGUID: 4ND/cSclQLaNNN6KuiHkpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147854427"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2025 10:38:58 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v5 0/7] Refine FBC test conditions
Date: Tue, 10 Jun 2025 23:12:37 +0530
Message-Id: <20250610174244.1292-1-mohammed.thasleem@intel.com>
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
  lib/igt_debugfs: Add specific checks for WA in GTs
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

 lib/i915/intel_fbc.c                   | 21 ++++++++++++++
 lib/i915/intel_fbc.h                   |  1 +
 lib/igt_debugfs.c                      | 39 ++++++++++++++++++++++++++
 lib/igt_debugfs.h                      |  1 +
 tests/intel/kms_dirtyfb.c              |  6 ++--
 tests/intel/kms_fbcon_fbt.c            |  6 ++--
 tests/intel/kms_frontbuffer_tracking.c | 13 +++++----
 tests/intel/kms_psr.c                  |  8 ++++++
 tests/intel/kms_psr2_sf.c              |  7 +++++
 9 files changed, 92 insertions(+), 10 deletions(-)

-- 
2.34.1

