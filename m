Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4A7CD5BD2
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 06:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58AA10F955;
	Fri, 29 May 2026 06:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LO+4Vx3x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9465F10F952
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 06:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780035695; x=1811571695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0POR1uGvaVoIBypTv7ol9/Kb+O7YPz9Cr6btfnQ5gk4=;
 b=LO+4Vx3xUoKXFSMbHcn7ZjQ7o1JUpMhpeH4RARKkimVbuVz7W3wF4pKt
 U5nrKwqPu9UeWbyIKSvb1rmkytuTk7wp7MN0t6YmGcV9A+01Uj+Q+regs
 BExXrib/c+XiP6gnI6Bt32SRuvYW+PGvcGU9CtXwyb3eup2JiS3jVt1ll
 fFWpQnhFCzNGJ2VDJRhH08wBwl4nlgY/YAe9/YY4cQ7Gqo3QJudMhZJRH
 vx6SnEBbID60ERvSKLC6SeV/jmiqvNfKETKu8b7NbrG8H1C1s6f1ggU43
 FSvROO0+SGFZl9TqUPlLPKi4gMndQ816SIK6LMORmEu7XRlhxvRHs5dDv w==;
X-CSE-ConnectionGUID: bo4tNBu7TAiRP+A/hucJqw==
X-CSE-MsgGUID: oRWHYUKHRDKccVcyzarhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98300229"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="98300229"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 23:21:35 -0700
X-CSE-ConnectionGUID: 0bTj4z8gSgm2hPwKom2i4w==
X-CSE-MsgGUID: Q5OCOnXARISXg3zWi/cUWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="238576459"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa010.fm.intel.com with ESMTP; 28 May 2026 23:21:33 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/2] Improve max-bpc query error handling
Date: Fri, 29 May 2026 12:02:28 +0530
Message-Id: <20260529063230.754253-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series moves max-bpc failure handling to the helper/API level.

The previous change modified kms_hdr dynamic-subtest flow to handle
max-bpc read failures, but the real issue was that
igt_get_output_max_bpc() handled read/parse failures internally.

Restore the original kms_hdr flow and update
igt_get_output_max_bpc() to return status so callers can explicitly
handle failures with clearer skip/continue decisions and logging.

Pranay Samala (2):
  Revert "tests/kms_hdr: Move capability checks inside dynamic subtests"
  lib/tests: make igt_get_output_max_bpc() return status and handle
    failures in callers

 lib/igt_kms.c                          |  41 ++++--
 lib/igt_kms.h                          |   2 +-
 tests/amdgpu/amd_bypass.c              |   6 +-
 tests/amdgpu/amd_dp_dsc.c              |  10 +-
 tests/intel/kms_dsc.c                  |  13 +-
 tests/intel/kms_frontbuffer_tracking.c |  10 +-
 tests/kms_color_helper.c               |   5 +-
 tests/kms_dither.c                     |   9 +-
 tests/kms_hdr.c                        | 187 +++++++++++++++----------
 9 files changed, 187 insertions(+), 96 deletions(-)

-- 
2.34.1

