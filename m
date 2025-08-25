Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328B4CA0FE1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 08:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8326F10E22F;
	Mon, 25 Aug 2025 08:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZwQ3W4G7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F54210E22F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756110184; x=1787646184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IKAy+Nits9n5A0fk4KVDbVZ2VDcDs+upMH4lg0y7W8c=;
 b=ZwQ3W4G7nIqFpt3hxy4Wi2SUxXL+wZRFCF4gh6dbZQq5f/xdB7J+8Zj/
 qjpdhnoF0nXOTzoQhd8TB9XL/gWcnrPM6FEoAhrrQZqCnIeXs2PktYS24
 Q/AcYVHqACPYrItdk/ma4M/LbLemjLu5Kh4PPXA5Jp2k1/yiEmoTpRli1
 Km1yHdY+HmG9LVQDRzaqa6dC+dg5ZOe1aMnT2aXk/VR5Tu1l3x0FivNyj
 8ypY041LGx6KmboNiS80z422AjhGeJYzLPUvaqQryrLu9sN95AWjidbja
 ywHhyftD5p/WkhfynyvSrHcUJq0u13mZPq+XFRpaeFRqkruXcqi/HGHUy w==;
X-CSE-ConnectionGUID: tkLy8CCgTWGfktfSYoKQNw==
X-CSE-MsgGUID: Kqa1Dr/QQYG9b0HU/XuV7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58375328"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58375328"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 01:23:03 -0700
X-CSE-ConnectionGUID: jjrNtCtFT06R5jXLLb+Ucw==
X-CSE-MsgGUID: G3dpr33vSu2c/Wi5K65YfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="170060392"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.101.99])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 01:23:00 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 i-g-t 0/3] tests/intel/xe_sriov_scheduling: Refactor
 submission/measurement
Date: Mon, 25 Aug 2025 10:22:51 +0200
Message-Id: <20250825082254.444880-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Refactor submission/measurement to better saturate HW and make
throughput comparisons more robust, especially with short jobs.
Add the --inflight option.

- Drive a K-in-flight pipeline per VF using per-slot BO/addr/spin and
  binary out-fences; add subm_exec_slot()/subm_wait_slot() (prefill +
  refill).
- Record complete_ts[] and per-slot submit_ts[]; build the common
  window from completions [max(first), min(last)] and compute
  throughput as count/window.
- Push durations as submit-to-completion (complete_ts - submit_ts) and
  print "mean submit->signal latency".
- Add --inflight (0=auto; non-preempt defaults to 1; short jobs pick
  higher K); print chosen K in the banner.

v2: - drop redundant num_syncs init; simplify subm_exec_slot (Lukasz)
    - free complete_ts (Lukasz)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Marcin Bernatowicz (3):
  tests/intel/xe_sriov_scheduling: Keep K submissions in flight
  tests/intel/xe_sriov_scheduling: Compute throughput from completion
    timestamps
  tests/intel/xe_sriov_scheduling: Make in-flight submissions
    configurable

 tests/intel/xe_sriov_scheduling.c | 237 +++++++++++++++++++++---------
 1 file changed, 167 insertions(+), 70 deletions(-)

-- 
2.31.1

