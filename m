Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD411C54736
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90C510E222;
	Tue, 27 Aug 2024 05:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iav6HnSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD5F10E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737374; x=1756273374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=br11E65DMshbMnfFxzfe2pyHnyjP+HhHoMTq0NwezXo=;
 b=iav6HnScfpc2cvUGL7ZqGbH04pbqilEC2xn0DzaJLV+yfE0jg7uH+hol
 zuK4aOtISuS18354VMiYZTRZe9TWGYgOyTm8k+XzpHkakDAAfCTqGaAB2
 NF7ykUZN7v9s5rgZ/w7203LOKwsnrPQMtleAbh8gcMhAue0rFhMw9ubep
 O5egtVMS6M2tjuxEplhQj5MNiLjkN7dkvvc51A+1Gf8GIpinD5I3ytt/4
 apB381wmY0UzX0GqXRk9lZgYBxE/jaD/Y+35gjAyZUBeiiVbTdKBFAvh/
 cEbibzRPfzLALx5p7vduB/cxR2bqP2T5g39GxdeBvHkd+/XDS47K9+MJR g==;
X-CSE-ConnectionGUID: 8mhjNVNtRz6LC5PTY0esJw==
X-CSE-MsgGUID: h45zcz+ORv+D1npmfM7Kgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23372147"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23372147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
X-CSE-ConnectionGUID: BHh3Tnw/TFOPoKNO5OYDsA==
X-CSE-MsgGUID: IvKm/WT6RXa+9fPDuj9msQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67556970"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 00/10] tests/intel/xe_drm_fdinfo: Fix noise and improve
Date: Mon, 26 Aug 2024 22:42:12 -0700
Message-ID: <20240827054223.1671414-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

2 patch series together:
1) https://patchwork.freedesktop.org/series/137750/
2) https://patchwork.freedesktop.org/series/137742/

The first one was a single patch fixing a bug. It's the same fix here,
but now with a proper justification in the commit message.  I found a
(LNL) machine reproducing the failures every 2 or 3 runs and executed 50
times successfully with patch 1.

Patch 3 was a suggestion from Matt Roper, but for that to work we need
patch 2, as we don't have the relevant assert in igt. Patch 4 comes
as a bonus.

Other patches are the same as the second patch series.

With all patches applied I executed 100 times in that machine and
didn't have any failure.

Lucas De Marchi (10):
  tests/intel/xe_drm_fdinfo: Extend mercy to the upper end
  tests/intel/xe_drm_fdinfo: Print timestamp for debug
  lib/igt_core: Add igt_assert_lt_double()
  tests/intel/xe_drm_fdinfo: Use igt_assert_lt_double()
  tests/intel/xe_drm_fdinfo: Be strict on == 0 comparison
  tests/intel/xe_drm_fdinfo: Use usec for batch duration
  tests/intel/xe_drm_fdinfo: Half the execution time
  tests/intel/xe_drm_fdinfo: Remove unused flags
  tests/intel/xe_drm_fdinfo: Use enum with expected load
  tests/intel/xe_drm_fdinfo: Rename and reorder tests

 lib/igt_core.h              |  12 ++
 tests/intel/xe_drm_fdinfo.c | 255 +++++++++++++++++++-----------------
 2 files changed, 150 insertions(+), 117 deletions(-)

-- 
2.43.0

