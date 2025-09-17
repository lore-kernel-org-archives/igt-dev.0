Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA378CAC5A0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 17:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8179C10E03F;
	Wed, 17 Sep 2025 17:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfdxDURp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39A610E03F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 17:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758129586; x=1789665586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BEGKyRkvi733naP0flBU04MRwM/6cAvjWzWHR2BmjQQ=;
 b=TfdxDURpw8ZaaesYX2UZJyw97NUL+gFdXiFLy73vf8bkOl6jFPHx0Ddj
 5bl8bZ3X4dip2+OZyx4GmeqaWAf9ttBzmeu8DUNmH7AoAEhi5i9TkeJoj
 6p+DydrKkp4muZCiAiJPhT5O/KNAguxqe/NDghZ8l5WoQtDvNjCjYOjAS
 yng6FaTRfw9fkCOQqY/vMuiNkBWl2GaQfzKvbbl8RbtPNbbIz1CeJoA7B
 z3SV/AQQJ3oHrDPUvdmqeU8BU9ERvY2iVcyfkIvsCynPJGxs7qmd2d65m
 SNwMe5TMZob8bvTH8tKITZRRl2uWyxHfvkA1Ka4TwGl64A4/gPK4QW+lv A==;
X-CSE-ConnectionGUID: PJ8xXllFQeCORcRAf96PUw==
X-CSE-MsgGUID: Dr5+I73kRi66j+pJaekrJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59487704"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="59487704"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 10:19:45 -0700
X-CSE-ConnectionGUID: EgBWl9ruTdymeEC7OgtMsw==
X-CSE-MsgGUID: lFCpL2HLS2a7ElM4vdW/nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175745555"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 10:19:43 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 nishit.sharma@intel.com
Cc: ashutosh.dixit@intel.com, himal.prasad.ghimiray@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH v8 0/1] Add pat-index-madvise
Date: Wed, 17 Sep 2025 17:19:40 +0000
Message-ID: <20250917171941.3025392-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Revision 1
      From: Pravalika Gurram <pravalika.gurram@intel.com>

Add pat-index-madvise test to verify setting different
pat_index values for multiple VMAs. This test uses
madvise to set various pat_index values and
verifies that different PAT values can be assigned
to multiple VMAs as expected.

v8:
- Fixed indentation, nits (Kamil)
- added igt_skip for igpu
- used igt_info instead printf()

Pravalika Gurram (1):
  tests/intel/xe_exec_system_allocator: Add pat-index-madvise

 lib/xe/xe_ioctl.c                      |  29 ++--
 lib/xe/xe_ioctl.h                      |   4 +-
 tests/intel/xe_exec_system_allocator.c | 186 +++++++++++++++++++++----
 3 files changed, 178 insertions(+), 41 deletions(-)

-- 
2.43.0

