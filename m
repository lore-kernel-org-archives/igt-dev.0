Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3457C3ABB2
	for <igt-dev@archiver.kernel.org>; Mon, 16 Sep 2024 20:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A142610E3DD;
	Mon, 16 Sep 2024 20:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jl4v0qTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B6510E3DD
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Sep 2024 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726517924; x=1758053924;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OHcoATmQztszKMHP2MnNc5jCmasuGeUfis7a1ncPWsk=;
 b=Jl4v0qTPB/u1BJA+MBVrNWGA720IldfrQFGgPo6HlJDz9o7ctWsWHs2v
 ENgjVH9B10T+4Ee1tjso/ioXoHyBARNcXjdosgYC/sROjg8zwen7hooLk
 f3/RSK8klZ4QKEloGXIoIrkuWbhaMdGfMdk392tz1myt1LTN1ikob3Fdo
 vU2ZxyDoquoDxu6RICjxMxVDJ0LshEgk1C8CM1PbjYLyDvVFl53daTejB
 hLhPGdb7WBzaIkL3bj/qlR1DFHffF63oIhD6pNgOnCtI0bn63yzaAB8qb
 mhiqTnKwBlHjRee1DwFbtnzMUBm9p0Ne7ZYmr8m6gWT8OnS83FngMsHD3 w==;
X-CSE-ConnectionGUID: MS0bBt+4Q+6me1lOwpah1Q==
X-CSE-MsgGUID: znCDDnz/SRKa394U+yqy4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36499465"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36499465"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 13:18:44 -0700
X-CSE-ConnectionGUID: Zg/FPHuxT/GQySvVZlBSnw==
X-CSE-MsgGUID: q9CHgwBYQb+PlOiCaZAbFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="69070726"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Sep 2024 13:18:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 23:18:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/5] Power/energy and display memory bandwidth
 measurement tools
Date: Mon, 16 Sep 2024 23:18:36 +0300
Message-ID: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a couple of small tools for measuring energy/power consumption
and display memory bandwidth utlization (on Intel hw). Might be
helpful for other people as well, and having them in igt will allow
me to mostly forget aboyt my local copies of these.

Ville Syrjälä (5):
  lib/power: Allow use of rapl by specifying fd=-1
  igt: Use is_intel_dgfx()
  lib/igt_power: Add power_supply/BAT based measurement
  tools/power: Introduce a small power/energy measurement tool
  tools/intel_display_bandwidth: Tool for measuring display memory
    bandwidth utilization

 lib/igt_power.c                 |  66 +++++++++++-
 lib/igt_power.h                 |   5 +-
 lib/intel_reg.h                 |   5 +
 tests/intel/kms_pm_dc.c         |   6 +-
 tests/intel/kms_pm_rpm.c        |   6 +-
 tests/kms_addfb_basic.c         |   9 +-
 tools/intel_display_bandwidth.c | 171 ++++++++++++++++++++++++++++++
 tools/meson.build               |   2 +
 tools/power.c                   | 179 ++++++++++++++++++++++++++++++++
 9 files changed, 431 insertions(+), 18 deletions(-)
 create mode 100644 tools/intel_display_bandwidth.c
 create mode 100644 tools/power.c

-- 
2.44.2

