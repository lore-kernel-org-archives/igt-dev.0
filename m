Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53700CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 04:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092D010E0E0;
	Wed,  6 May 2026 04:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8awZCYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F4710E0E0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 04:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778040279; x=1809576279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EYYTbNmC6vOT13ZWi98MDjQYmA7VBcFvmVr3MSwqexw=;
 b=m8awZCYStr8Jxcl61tPQ0hL06Wz5BaM8roc07Fw5U98YAecI4PQZc1Th
 IARoKLhjWui6Gqom0FnmS+eX9bloqWFTkhq14Nkg38pzXlYE7mwI5tqjQ
 NxsH0ZEKkEjXwkZGVi3nUQixGQVVSND//tK9OmcuKa7XbHJSNCuDGCqEt
 XWGMWReaGkOfbtlRN6QjJ0uy+APK4NoKD4EjaqvtlsRuMKKk4ns3x5HA/
 lV62lRQP5ChIEJGaFWvvlho5e9BnMLBoVnrOIOzgOQa9OLPsGsBsMieQ3
 VcFl/jybtA4QQ/RYhYcr2BLdygpg6lBYNkaL2F8hrKF5CfBok7PImNIbL A==;
X-CSE-ConnectionGUID: eW5TcufZTRSPOmX8yWB6JQ==
X-CSE-MsgGUID: rO1CsCxnRrKNxXGns/t1ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104381081"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="104381081"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 21:04:37 -0700
X-CSE-ConnectionGUID: xU8W/vvfSkCtK4E6GhsVCA==
X-CSE-MsgGUID: eac0nKCOTzO7dgszD5lI5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="235010131"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa006.jf.intel.com with ESMTP; 05 May 2026 21:04:36 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/3] Fix incorrect skips and improve cleanup
Date: Wed,  6 May 2026 09:45:24 +0530
Message-Id: <20260506041527.56862-1-pranay.samala@intel.com>
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

This series fixes issues where tests were being skipped 
incorrectly and cleanup was not always happening.

Capability checks were earlier done outside dynamic subtests, 
which could cause valid cases to be skipped if a later output 
checks fails. Move these checks inside igt_dynamic_f() to ensure 
each case runs independently.

Cleanup is also improved by centralizing framebuffer handling 
and calling test_fini() after each dynamic subtest, so resources 
are always released even on early exits.

Pranay Samala (3):
  tests/kms_hdr: Move framebuffer into data_t for centralized cleanup
  tests/kms_hdr: Move test_fini() for proper cleanup
  tests/kms_hdr: Move capability checks inside dynamic subtests

 tests/kms_hdr.c | 212 +++++++++++++++++++++---------------------------
 1 file changed, 91 insertions(+), 121 deletions(-)

-- 
2.34.1

