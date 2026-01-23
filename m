Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB81D625E5
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 06:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC5510E279;
	Fri, 23 Jan 2026 06:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJB+SYsA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514C810E279
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 06:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769151235; x=1800687235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FPgv/tUCjtGEvCs7IOFuFZok+uTMnUdzwgBSU4Vhj0w=;
 b=LJB+SYsAxDquXcLNnW9oXHt1IvutoYqFM3fdhX9NDh9ZorfhIKrefUhb
 9P+Rv7X47yQXKkczfgI9oiVw/t2m/IIW4P+BB5wQ44VI4j9OAyD3kRNaB
 GdKs2wPR0lvlqiaPKF/Hvu7PvfKJJFj773URLlLEgJxDdDzmYLKNofEjl
 LpraWlU9apdMT2uorzknZHmjQiRcykK18YPz1ICta9QL7QRpZIzzgf60G
 XLS1dHIzWi38mZN/zKuZWah5kExUAP7W6fVlR74fUARoxNawPNKbQ868x
 PiTkC+Mr5qQPGYR3NVURC5YNUveibP0N7v2DyjidgLsihVVz5SmlreyZJ g==;
X-CSE-ConnectionGUID: NTHcw/myRw+1Z5bOZCkTNA==
X-CSE-MsgGUID: jppj2qTZSRWM8jlhBInrSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70453171"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70453171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 22:53:55 -0800
X-CSE-ConnectionGUID: bb9kFVDVSFG3poiM3fJYpg==
X-CSE-MsgGUID: FWrFezL1SbKrSZdrtkSY+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206992903"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 22:53:55 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] RFC tests/intel/xe_exec_reset: Filter expected
 timeout dmesg during reset tests
Date: Fri, 23 Jan 2026 06:52:37 +0000
Message-ID: <20260123065238.48129-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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

During reset testing there are timedout messages with lrc seq no
and seqno coming in CI Dmesg. These logs are causing CI warnings.

Since we are intentionally causing the GPU reset, so timeout messages
are expected behavior rather than actual test failures. These messages
filtered by CI and incorrectly flagged as errors.

This change adds ignore_timeout_dmesg() function that registers a regex
pattern to filter out expected timeout-related dmesg messages:
- "Timedout"
- "timeout"

The function is strategically called before operations that trigger
resets to proactively filter expected messages:
- GT reset operations (xe_force_gt_reset_async/sync)
- Legacy test modes involving resets
- Compute mode tests with GT reset flags
- Thread-based reset testing scenarios

This ensures cleaner test output by suppressing expected noise while
preserving genuine error reporting for actual test failures.

Sobin Thomas (1):
  RFC tests/intel/xe_exec_reset: Filter expected timeout dmesg during
    reset tests

 tests/intel/xe_exec_reset.c | 49 +++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 8 deletions(-)

-- 
2.51.0

