Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9D1CD37A7
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 22:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C0B10E120;
	Thu,  7 May 2026 22:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyx2h9HQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817CD10E120
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 22:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778194229; x=1809730229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+l+fKUvFI+CgbFqscOcei7faMuh2ZW1guBVKZMlISOY=;
 b=kyx2h9HQ/TPkjj8WOBdswcYLlEgpVgzpo2BKf+UPYMMwMEe4gbvH3Elm
 iDBYd/rdaTV+DDfKPUYOgk7WFExq0JugzC0fM9m7nLPBIPgrPg3odsJ5f
 R58ClNqVhH9SXy4dQgDEOpmM8fbP9cBnN67KCMk5iaXUhu30J3PfaB0Qg
 mQYNVLSi3dBTkCV7CA2SD15a2daeDlRNnNgMYEAtjzoqIdpnaDqpwEvPg
 A1/C2ZpVrm0J4/8hr2reisVCBh6MQJuGd7z3ii8/MI2NadF1H7P6AUAE0
 ptAG62BH3+fW2QI8bG2PfjOzWBEmRQGUvXEpPlOBc45T2qJRcRw2wcrxf Q==;
X-CSE-ConnectionGUID: zThJqnv+S9+5EQhyCgAKJg==
X-CSE-MsgGUID: Cs+bh0SXQnuqFq9l12ZjXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79098809"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="79098809"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 15:50:29 -0700
X-CSE-ConnectionGUID: Q9677PE7RmWEqRe7gQvHFw==
X-CSE-MsgGUID: rb3/LNTeRgqhasqe/B3rXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="233542644"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 15:50:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: stuart.summers@intel.com, x.wang@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v2 0/3] tests/intel/xe_exec_reset: Validate multi-queue
 timestamping
Date: Thu,  7 May 2026 15:50:23 -0700
Message-ID: <20260507225024.4544-5-niranjana.vishwanathapura@intel.com>
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

Multi-queue exec queues should use QUEUE_TIMESTAMP instead of CTX_TIMESTAMP
for the run ticks. Add the required support and the tests to validate this.

This patch series is dependent on XeKMD patch series
https://patchwork.freedesktop.org/series/164654/

v2: Change test name and add documentation (Stuart)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  lib/xe/xe_spin: Enhance multi-queue switch option
  lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
  tests/intel/xe_exec_reset: Add multi-queue long spin tests

 lib/xe/xe_legacy.c                |  2 ++
 lib/xe/xe_spin.c                  | 22 ++++++++++++----------
 lib/xe/xe_spin.h                  |  8 +++++++-
 tests/intel/xe_exec_multi_queue.c |  2 +-
 tests/intel/xe_exec_reset.c       | 23 +++++++++++++++++++++++
 5 files changed, 45 insertions(+), 12 deletions(-)

-- 
2.43.0

