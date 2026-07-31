Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10377C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 14:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61E510E20D;
	Fri, 31 Jul 2026 14:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jl1GKofZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA6D10E20D
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785507502; x=1817043502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3B3M9kibcbJ8zLdSXT++49hmHBEmzuazmP8/DIUqjCo=;
 b=jl1GKofZJazD+wl5XyNovbLA17beud7z3ECkN1Tx+bT01WegC5QTW66Z
 vH/lUVkrPQdwvRRGHz8nPf6k8eeKcJ+TqtehtKaJOsq+G5DoAe/yqJ3bL
 f1Jbe/1BQ+j5yXJf6Io8g1xD0/laArJu1UIXlLIssQ58rfvtwTBFKn//b
 HTw5QQtC9zEvaKjt3egaJ811St/tp+dlY1+K2SF/u1NjxjYtUYYKEY4k+
 Zh/yLGt4L8OS95QPEy9HLIM+N523yd6X0l9AeyeQVqqljde/v103PR9b3
 x7D8+/S9CO2gIFqJ1cghSvpRX8PA0hZB/MXIsBLkXKKyluVz7EL2Bmu2M Q==;
X-CSE-ConnectionGUID: LdPI7/KySbCKYJttF7jOrg==
X-CSE-MsgGUID: 194BxKY9TP2KwFPBNCI39Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="89945039"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="89945039"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:18:22 -0700
X-CSE-ConnectionGUID: 3cwnIlMyQx29SLKyjrU6cQ==
X-CSE-MsgGUID: 3iMWTOIGQl6CJzWJqOsP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="262550898"
Received: from unknown (HELO localhost) ([10.94.249.102])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:18:20 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com, zbigniew.kempczynski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/3] gem_wsim: fix batch premature completion
Date: Fri, 31 Jul 2026 16:18:03 +0200
Message-ID: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Fixes observed verification failure under looped runs:

gem_wsim -w "1.RCS.5000.0.0,1.BCS.5000.0.0,1.CCS.5000.0.1,1.VCS.5000.0.0"
  -V -r 4000

CRITICAL: Failed assertion:
  w->duration.requested_ticks <= ~w->xe.data->spin.ticks_delta
CRITICAL: error: 96000 > 2

V1 attempted to fix the issue by initializing ticks_delta to ~0u in
xe_spin and resetting it from the host before each fixed-duration
submission in gem_wsim.

V2 fix (suggested by Zbigniew): write sentinel 0 to ticks_delta and use
MI_SEMAPHORE_WAIT to confirm it's in memory before entering the loop.
This is a self-contained GPU-side fix - no host-side reset per submission
needed. Also switches from inverted ticks_delta (STOREINV + ~ctx_ticks)
to direct elapsed (STORE + MAD_LT_IDD + ctx_ticks) for readability.

V1 -> V2:
- Replace host-side ticks_delta reset with GPU-side SDW+SEMAPHORE_WAIT
- Switch from inverted to direct elapsed ticks logic
- Remove ineffective pad loop between SRM and COND_BBE
- Add xe_sriov_scheduling.c fix for the same ticks_delta check

Marcin Bernatowicz (3):
  lib/xe/xe_spin: fix premature batch exit on BO resubmission
  benchmarks/gem_wsim: fix ticks_delta assertion for non-inverted logic
  tests/xe_sriov_scheduling: fix ticks_delta check for non-inverted
    logic

 benchmarks/gem_wsim.c             |  2 +-
 lib/xe/xe_spin.c                  | 31 +++++++++++++++++--------------
 tests/intel/xe_sriov_scheduling.c |  2 +-
 3 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.43.0

