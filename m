Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FF9C25B5C
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB62A112AD8;
	Sat,  4 May 2024 06:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQCYULjP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA17112AD5
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805158; x=1746341158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/1t2wrFMWata3wpFwADWFlRFPnzqShhSqiVpaaoA8zU=;
 b=FQCYULjPfZUcfSpcva8QfJiNWvse7QqWd6WPM/XLcDbdEeakIc5foocN
 7E5jyFbAuQPE7yPHwvjOdTS9zh/tKi3MAo9YfBquKmyb+cqb9CtYkakpC
 VJgBGCcKo7iRpKvh2asUHFGl8YSwhV804p3VWdl6XzKiKVEzAsyY7RE3c
 5o+t+K/AtasEZqONGKUE7mq7r55WFgSqdji4SLlQn0eVHJC5MBwj/d6M3
 3Kx6xL1LQgirX0md7zkUc+W6vFLwy0HDUaDe05hv8W1BG4kYjwT8BR5C5
 YLfE11jP8EQZY2LZhiQG5tROX3TYO2BMSZRxhaNFLJRKnQ7KOCocpE4VE Q==;
X-CSE-ConnectionGUID: fBxsiYXdSIafm0gy9rkt7A==
X-CSE-MsgGUID: i4umVgtvTOmGT2m4dUUHqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545743"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545743"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
X-CSE-ConnectionGUID: cOCC5q9kSO6aSzno3Y1o6w==
X-CSE-MsgGUID: uyz+x1gdTFa6ajSmY17/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169791"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 00/12] gputop: Add support for xe
Date: Fri,  3 May 2024 23:46:30 -0700
Message-ID: <20240504064643.25863-1-lucas.demarchi@intel.com>
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

v3 of https://lore.kernel.org/all/20240423234431.1959354-1-lucas.demarchi@intel.com

I moved some gputop eye candy to a separate series:
https://lore.kernel.org/all/20240501173303.115737-1-lucas.demarchi@intel.com

This now also moves all the refactors to come as prep patches. The
drm-total-cycles addition is  in the last 3 patches.

As requested fdinfo and drm-clients libraries now don't take any
decision: they only read the fdinfo and calculate the deltas
respectively. The decision about what aproach to use to calculate the
client utilization is left to gputop.

Lucas De Marchi (13):
  lib/igt_drm_fdinfo: Extract ignore_space()
  lib/igt_drm_fdinfo: Allow any number of spaces before unit
  fixup! lib/igt_drm_fdinfo: Allow any number of spaces before unit
  lib/igt_drm_fdinfo: Stop passing key twice
  lib/igt_drm_fdinfo: Remove prefix arg from parse functions
  lib/igt_drm_fdinfo: Parse drm-cycles
  lib/igt_drm_fdinfo: Start tracking available engine keys
  treewide: Rename engine busyness variables
  lib/igt_drm_clients: Move engine fields to substruct
  lib/igt_drm_clients: Record drm-cycles
  lib/igt_drm_fdinfo: Parse drm-total-cycles
  lib/igt_drm_clients: Record total cycles
  gputop: Add support to drm-cycles/drm-total-cycles

 lib/igt_drm_clients.c    |  55 ++++++++++----
 lib/igt_drm_clients.h    |  27 ++++++-
 lib/igt_drm_fdinfo.c     | 154 +++++++++++++++++++++------------------
 lib/igt_drm_fdinfo.h     |  17 ++++-
 tests/intel/drm_fdinfo.c |  44 +++++------
 tools/gputop.c           |  45 ++++++++++--
 tools/intel_gpu_top.c    |  24 +++---
 7 files changed, 235 insertions(+), 131 deletions(-)

-- 
2.43.0

