Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E19F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20A510E28E;
	Mon, 16 Mar 2026 08:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTUIVZsU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCB410E487
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649164; x=1805185164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ErcCZd7eDoNNBJywdL5FCG8ujy9aTtU2fxacn/s7sr8=;
 b=HTUIVZsUluJawakcdqCbH1dbwxyTVfrYtzzEJyh6aI6+pAqjqeYPU/xL
 ujjiMtvSQvppPsz+ALeyugoQtZCbMQ0/0Za94XxjOkcuGGCxm5GL+kchP
 GIOyB+PlO1qJ5INbPY2NXD+y6N09Bs0plYp3AuLhqe89Q7/qMcJikWWGc
 LvjGI3EoXWVKcURfrErPnlxgovruOgfKuiZ470oKKphQO/ZHLHEUJFh2J
 fnExrfMajRksfcfyluqIm99Td/YVjl33/geNysECJnum0lYpiTY8u5UP3
 D/M8bNJAzwKX2ioBYzwzerCF+rhZA0eU98qWcqytGvnQxH2FLvyIHZ+eW g==;
X-CSE-ConnectionGUID: sWq1udqjTXGIxc3QZQREEw==
X-CSE-MsgGUID: 5BbG7UFQRaWFD3H3Hp6Mzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359355"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359355"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:23 -0700
X-CSE-ConnectionGUID: Pbhefkv6Touole8CEWOgig==
X-CSE-MsgGUID: vuXXVgMmRt2AX6BDeYq7sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300537"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:22 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 00/17] Improve CRC test robustness with stop-on-fail
 and cleanup helpers
Date: Mon, 16 Mar 2026 14:10:04 +0530
Message-ID: <20260316084021.419580-1-sowmiya.s@intel.com>
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

This patch series introduces two new helper functions to improve
the robustness and maintainability of CRC-based tests throughout
the IGT test suite.

CRC-based tests are critical for verifying display functionality,
but improper handling of CRC failures can lead to:
- CRC buffer overflows when CRC collection continues after assertion
  failures
- Resource leaks from incomplete cleanup of pipe_crc objects
- Test hangs when pipe CRC remains active after failures
- Inconsistent cleanup patterns across different tests

Two new helper functions address these issues:

1. igt_assert_crc_equal_stop_on_fail(): Automatically stops CRC
   collection before assertion on mismatch, preventing buffer overflow
   and ensuring clean test termination when CRC values don't match.

2. igt_pipe_crc_cleanup(): Safely cleans up pipe_crc objects by:
   - Checking if CRC collection is active before stopping
   - Properly freeing allocated resources
   - Clearing the caller's pointer to prevent use-after-free bugs
   - Handling NULL/uninitialized pointers gracefully

These functions are designed to be used consistently across all CRC tests
and in fixture teardown paths, ensuring reliable resource management and
preventing cascading failures when CRC mismatches occur.

Sowmiya S (17):
  lib/igt_pipe_crc: Add CRC stop-on-fail assertion and cleanup helper
  tests/intel/kms_big_fb: Use CRC stop-on-fail assertion and cleanup
    helper
  tests/intel/kms_fbc_dirty_rect: Use CRC stop-on-fail assertion and
    cleanup helper
  tests/intel/kms_flip_scaled_crc: Use CRC stop-on-fail assertion and
    cleanup helper
  tests/intel/kms_flip_tiling: Use CRC stop-on-fail assertion and
    cleanup helper
  tests/intel/kms_pipe_stress: Use CRC stop-on-fail assertion and
    cleanup helper
  tests/kms_async_flips: Use CRC stop-on-fail assertion and cleanup
    helper
  tests/kms_atomic: Use CRC stop-on-fail assertion and cleanup helper
  tests/kms_cursor_crc: Use CRC stop-on-fail assertion and cleanup
    helper
  tests/kms_cursor_edge_walk: Use CRC stop-on-fail assertion and cleanup
    helper
  tests/kms_cursor_legacy: Use CRC stop-on-fail assertion and cleanup
    helper
  tests/kms_pipe_crc_basic: Use CRC stop-on-fail assertion and cleanup
    helper
  tests/kms_plane: Use CRC stop-on-fail assertion and cleanup helper
  tests/kms_plane_alpha_blend: Use CRC stop-on-fail assertion and
    cleanup helper
  tests/kms_plane_cursor: Use CRC stop-on-fail assertion and cleanup
    helper
  tests/kms_plane_multiple: Use CRC stop-on-fail assertion and cleanup
    helper
  tests/kms_rotation_crc: Use CRC stop-on-fail assertion and cleanup
    helper

 lib/igt_pipe_crc.c                | 50 +++++++++++++++++++++++++++++++
 lib/igt_pipe_crc.h                |  4 +++
 tests/intel/kms_big_fb.c          |  5 ++--
 tests/intel/kms_fbc_dirty_rect.c  | 16 +++++-----
 tests/intel/kms_flip_scaled_crc.c | 17 +++--------
 tests/intel/kms_flip_tiling.c     | 17 +++--------
 tests/intel/kms_pipe_stress.c     |  8 +++--
 tests/kms_async_flips.c           |  6 ++--
 tests/kms_atomic.c                | 16 +++++-----
 tests/kms_cursor_crc.c            | 30 +++++++++----------
 tests/kms_cursor_edge_walk.c      |  6 ++--
 tests/kms_cursor_legacy.c         | 11 ++++---
 tests/kms_pipe_crc_basic.c        | 15 ++++------
 tests/kms_plane.c                 | 19 +++++-------
 tests/kms_plane_alpha_blend.c     | 31 +++++++++----------
 tests/kms_plane_cursor.c          |  6 ++--
 tests/kms_plane_multiple.c        | 20 +++++--------
 tests/kms_rotation_crc.c          | 25 ++++++++--------
 18 files changed, 165 insertions(+), 137 deletions(-)

-- 
2.43.0

