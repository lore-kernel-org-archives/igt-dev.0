Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F59CA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 16:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB7510E63B;
	Tue, 19 Aug 2025 16:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nApd1uAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696DA10E63B
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755622310; x=1787158310;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hzblfJRfWWjve+sqznLZ/hKhwDWKxUaNRLvnGBQWlxA=;
 b=nApd1uADRLSWhIJp6czGFQuCEyCb9+gWR2qZma8cJbiyk79+zTzMLXk0
 MVo0V+WKybwvsJqlv0dw61XXSF9LcDNRnOgU9tPIhTVH9QfGeD1m9MSb2
 TB+lRRfZQjiOXWAz+xdLI9jTWeR4Ayu+GsilcCe+eeDTFvqRM3m3VSwEV
 cD44KwRr0Wng6FRdFYwIF6LqWsgIaY98QZ5ypbUL6abt0H6P8n+JAi7xK
 0mi3H9AlGYFS7wLrG8U2k4BTAVf6O8yhC/siY0Tx3W00GWHpGUsGd8g7L
 Fybs192YIqI27txRR3bxfK2KPsxEULXQLsEeKFprFXlHYhgTkBvVtQb6U g==;
X-CSE-ConnectionGUID: ZFCd93H9QiesUPRfnqlR5Q==
X-CSE-MsgGUID: lpLGTRkDQL+AD3xsG9mt/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57732291"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57732291"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:51:50 -0700
X-CSE-ConnectionGUID: RjJfhnz5R5SGesX+xjfCAA==
X-CSE-MsgGUID: XRSElOfMScirM4DWFstdxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172146349"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.113.129])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:51:46 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 i-g-t 0/3] tests/intel/xe_sriov_scheduling: Refactor
 submission/measurement
Date: Tue, 19 Aug 2025 18:50:42 +0200
Message-Id: <20250819165045.467613-1-marcin.bernatowicz@linux.intel.com>
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

 tests/intel/xe_sriov_scheduling.c | 234 +++++++++++++++++++++---------
 1 file changed, 166 insertions(+), 68 deletions(-)

-- 
2.31.1

