Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0F96E054
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 07:46:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu, 22 Apr 2021 21:07:22 +0530
Message-Id: <20210422153727.11323-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v2 i-g-t 0/5] Fix mode selection for 2x tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

When two monitors connected through MST, the second monitor also
tries to use the same mode. So two such modes may not fit into the
link bandwidth.

This series will find a combination of modes that fit into the BW.

IGT core helper would override the mode on all connectors that will
be modeset by the next igt_display_commit() call in the test. These
are all the connectors in igt_display_t that have a pending_pipe set
by the test up to the point of calling this helper.

TODO: Sort the mode combinations in decending ordered.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (5):
  lib/igt_kms: helper to override the mode on all connectors
  tests/kms_frontbuffer_tracking: Fix mode selection for 2x tests
  tests/kms_cursor_legacy: Fix mode selection for 2x tests
  tests/debugfs_test: Fix mode selection for MST
  tests/kms_content_protection: Fix mode selection for 2x tests

 lib/igt_kms.c                    | 40 +++++++++++++++++++++++++++
 lib/igt_kms.h                    |  1 +
 tests/debugfs_test.c             | 10 +++++++
 tests/kms_content_protection.c   | 41 +++++++++++-----------------
 tests/kms_cursor_legacy.c        | 47 ++++++++++++++++++++++++++++++--
 tests/kms_frontbuffer_tracking.c | 33 ++++++++++++++++++++++
 6 files changed, 144 insertions(+), 28 deletions(-)

--
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
