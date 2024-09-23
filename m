Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC528CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEEA10E493;
	Mon, 23 Sep 2024 20:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeP7c9sY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D5F10E493
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124361; x=1758660361;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QiGYZPlxAKvd6t72r4G9jX4BxL/luwA5sdp1SFngMRc=;
 b=JeP7c9sYoX0Cp045TOrRGmT7nD5BlQnnUf2/REQ54XFpPAQxQhG79YvG
 Wbb+/WnTLtb01wujm2cvM2UAS+Ex0o+FC8RPG3mYF0WTvP2HtX0q6n5+y
 FV8xu2LQY8roUgLjHdQQJxhRiCuMs3u53tywvqZyZgx4IwHud/WXze9Gx
 xE+rCOiNJ8I/pXp40AysdWGcvB4i3/HELVUOcZ0hBvAUZWlPSn5Yzwg8y
 bmQbFbqcXT3oEfHxOWJTnoT1NTfdjgM1PYxTHOF/fbml4sJcHHc5myNeS
 Zggz5mQnzN3n4oH0pHb2fOuYrIjpjjbY6/2sCjoZ1rpbAX2F/xvhQpm4y A==;
X-CSE-ConnectionGUID: qkh+6GEcSyagUgB2uMpFAA==
X-CSE-MsgGUID: smYF2ZFHRYyZwmydG8pbMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25955974"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25955974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:46:00 -0700
X-CSE-ConnectionGUID: wZ3ThEaBQeyjlyPriytdDg==
X-CSE-MsgGUID: Sp9xTIXBQIKnB97rtkcLcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71326648"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:45:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:45:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/6] igt: Clean up some Intel platform checks
Date: Mon, 23 Sep 2024 23:45:51 +0300
Message-ID: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
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

I got annoyed by the AT_LEAST_*() stuff. They don't seem
to add anything of value, so just get rid of them.

Side note: intel_display_ver() vs. intel_graphics_ver() seems
like a decent footgun: one gives you the major version only
while the other gives you 'major << 8 | minor'...

Ville Syrjälä (6):
  tests/gem_ctx_engines: Fix gen6+ check
  tests/kms_frontbuffer_tracking: Simplify tiling vs. platform tests
  tests/kms_ccs: Use logical && instead of bitwise &
  tests/xe_ccs: Use logical && instead of bitwise &
  igt: Get rid of AT_LEAST_DISPLAY()
  igt: Get rid of AT_LEAST_GEN()

 lib/gpu_cmds.c                         |  2 +-
 lib/i915/intel_decode.c                |  2 +-
 lib/intel_batchbuffer.c                |  2 +-
 lib/intel_blt.c                        |  4 ++--
 lib/intel_blt.h                        |  2 +-
 lib/intel_bufops.c                     |  8 ++++----
 lib/intel_chipset.h                    | 10 ++++------
 lib/intel_common.c                     |  2 +-
 lib/intel_mocs.c                       |  2 +-
 lib/intel_pat.c                        |  2 +-
 lib/rendercopy_gen9.c                  | 18 +++++++++---------
 tests/intel/gem_ctx_engines.c          |  2 +-
 tests/intel/kms_ccs.c                  | 10 +++++-----
 tests/intel/kms_fbcon_fbt.c            |  2 +-
 tests/intel/kms_frontbuffer_tracking.c | 12 ++++--------
 tests/intel/kms_pm_dc.c                |  2 +-
 tests/intel/perf.c                     |  2 +-
 tests/intel/xe_ccs.c                   | 20 ++++++++++----------
 tests/intel/xe_debugfs.c               |  2 +-
 tests/intel/xe_query.c                 |  2 +-
 20 files changed, 51 insertions(+), 57 deletions(-)

-- 
2.44.2

