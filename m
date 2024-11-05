Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DF4D1CA37
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E615F10E520;
	Tue,  5 Nov 2024 06:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFWz0end";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502D210E51C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787556; x=1762323556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=abHE2kkce92glSeOadVuNcF/Trfav7l5ue29VALqkhU=;
 b=KFWz0endUujPFfSUX5ZNuRsmdDn76ZS5Bdi2U8xYHMqhXicsjYZtmwxB
 2JmxHVq+cIIwYUE2deEj2iK+YYiirD0RIC176jBgD63pHQygQxHveRm9e
 hA5wdN2DRm+94rl24zawsMQ8i80rXteSWE43Q9NwKC17VAZi9JQ/9yLbd
 yHWdBrnJiUnvvW+JFbqQLxtIlADG109ccGaRO/ueR886PgL6QAfF+Ilo5
 aNyXEg+dls8HKQCIlYt2q4WFbRdwh5qz63ZqwiGbvNAxoHykMrS+gX7TH
 NqOTae8gf41eUCD0vIw4opKZJNRU9AbvyItTfNBjo22GaBoFBqJsT8PW1 w==;
X-CSE-ConnectionGUID: +SXaANQ9Q+a9vPm36BGNCA==
X-CSE-MsgGUID: WtOSlriSTq6iwH/BzK8dug==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133563"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133563"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: /H6fsmlXTfqC6yoD5SK/tg==
X-CSE-MsgGUID: U/b44IYTTRuVsBR8RvgIag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781718"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/9] i915: unload refactors
Date: Mon,  4 Nov 2024 22:18:36 -0800
Message-ID: <20241105061845.2486557-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

While reworking the unbind logic for perf_pmu, I noticed we were doing
way too much to handle audio - I was surprised since I've been using
unbind with xe and i915 for a long time.  This potentially fixes CI
issues in this area - it definitely fixes lots of warnings for me when
running on a non-CI environemnt.

The patch to tests/intel/perf_pmu.c to unbind before closing events that
I shared earlier needs to be postponed until perf_pmu_unregister() is
fixed, so it's not included here.

I gave this a quick try on DG2 and ADL-s and didn't spot regressions.
Hopefully this is also true in CI, because I like this diffstat :)

Lucas De Marchi (9):
  lib/igt_kmod: Remove unused module_ref
  tests/intel/perf_pmu: Remove trial unload
  lib/igt_kmod: Share xe's unload logic with i915
  lib/igt_kmod: Remove unused low level __igt_intel_driver_unload()
  tests/core_hotunplug: Stop unloading audio
  tests/device_reset: Stop unloading audio
  lib: Remove unused audio-related helpers
  i915_module_load: Stop caring about snd
  xe_module_load: Stop caring about snd

 lib/igt_aux.c                  | 284 ---------------------------------
 lib/igt_aux.h                  |   3 -
 lib/igt_kmod.c                 | 210 +-----------------------
 lib/igt_kmod.h                 |  14 +-
 tests/core_hotunplug.c         |  46 ------
 tests/device_reset.c           |   7 -
 tests/intel/i915_module_load.c |  32 ----
 tests/intel/perf_pmu.c         |  15 +-
 tests/intel/xe_module_load.c   |  40 -----
 9 files changed, 12 insertions(+), 639 deletions(-)

-- 
2.47.0

