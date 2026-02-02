Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65725E73140
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D9310E2DD;
	Mon,  2 Feb 2026 08:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aB03U44V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A9A10E2DD
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770020662; x=1801556662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gcQYVN8c2FGXRPEIV9SvgyZ4ERJJmMIkRP/WhpQBcck=;
 b=aB03U44V1w4WcwOPITSmQgE20zwBQQuZQpV3zdHCPnrzjBSvW0djM846
 HPaAoMNNRvsAqMTVwDmrewRSTQok7vF3Idfm3iulvbM681Stx3exRY0Uf
 pvSvpZYs46rKvJ+cwILDK6JyiPC3VXyAGYtAonrh8e9NzShFxgx5SFtdH
 WgZSYOPGW5BkF36uo+4Q95rbyAMZUQshp0tN6DzfX6EKWfCY1vpa21qca
 3FOg3STDkSgMX2UdLGeJeewFYw6YDiwjVGb9WaOkqYta94JW8bGa44GAP
 gaGe1ex//g7tvMFR1owLOoMOon421J7Ph7/CzRYKwKGaS32LwyY7CdHVN A==;
X-CSE-ConnectionGUID: Ed2ssFK+Ro+JN29alhgmTQ==
X-CSE-MsgGUID: SqrQerjhQ/WXH68IDYi/1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58756432"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58756432"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:24:21 -0800
X-CSE-ConnectionGUID: h8MujaWeToiB6cnqOVBucg==
X-CSE-MsgGUID: 7amiSA9xTDaFk4z0zMZVzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209455067"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 00:24:21 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/6] tests/kms_pipe_crc_basic: add mst suspend-resume
 test
Date: Mon,  2 Feb 2026 14:15:33 +0530
Message-Id: <20260202084539.2524306-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

This patch series introduces MST suspend-resume test to kms_pipe_crc_basic.


While at it add framework for general resource cleanup infrastructure.
The cleanup framework addresses the problem of leaked resources (framebuffers,
pipe CRCs, file descriptors) when tests exit early via igt_require(), igt_skip(),
or igt_assert() failures. By registering resources with the cleanup framework,
tests can ensure proper cleanup on all exit paths without manual handling.

The MST test validates that CRC values remain stable across suspend/resume cycles
for all possible subsets of MST outputs connected to a single MST hub.

Kunal Joshi (6):
  tests/intel/kms_mst_helper: Add helper to check for MST outputs
  lib/igt_cleanup: Add general resource cleanup infrastructure
  tests/kms_pipe_crc_basic: Use cleanup framework for framebuffers
  tests/kms_pipe_crc_basic: Use cleanup framework for pipe CRC
  tests/kms_pipe_crc_basic: Use cleanup framework for drm_fd
  tests/kms_pipe_crc_basic: Add MST suspend-resume test

 lib/igt.h                    |   1 +
 lib/igt_cleanup.c            | 492 +++++++++++++++++++++++++++++++++++
 lib/igt_cleanup.h            |  63 +++++
 lib/meson.build              |   1 +
 tests/intel/kms_mst_helper.c |  19 ++
 tests/intel/kms_mst_helper.h |   1 +
 tests/kms_pipe_crc_basic.c   | 262 ++++++++++++++++++-
 tests/meson.build            |   3 +
 8 files changed, 835 insertions(+), 7 deletions(-)
 create mode 100644 lib/igt_cleanup.c
 create mode 100644 lib/igt_cleanup.h

-- 
2.43.0

