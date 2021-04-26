Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3C76E5CF
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Apr 2021 10:31:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 26 Apr 2021 23:51:22 +0530
Message-Id: <20210426182136.2815-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v3 i-g-t 00/14] Fix mode selection for 2x tests
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

For 1x tests, cleanup the state before exiting the test.

Follow-up:
As modeset will happen one by one, we can't apply this approach on
tests/kms_flip.c & tests/kms_setmode.c


Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (14):
  lib/igt_kms: helper to override the mode on all connectors
  tests/kms_frontbuffer_tracking: Fix mode selection for 2x tests
  tests/kms_cursor_legacy: Fix mode selection for 2x tests
  tests/debugfs_test: Fix mode selection for MST
  tests/kms_content_protection: Fix mode selection for 2x tests
  tests/kms_plane_scaling: Fix mode selection for 2x tests
  tests/kms_atomic_transition: Fix mode selection for 2x tests
  tests/kms_plane: Reset the state before exiting the test
  tests/kms_plane_alpha_blend: Reset the state before exiting the test
  tests/kms_cursor_edge_walk: Reset the state before exiting the test
  tests/kms_plane_lowres: Reset the state before exiting the test
  tests/kms_plane_cursor: Reset the state before exiting the test
  tests/kms_flip_scaled_crc: Reset the state before exiting the test
  tests/kms_vblank: Reset the state before exiting the test

 lib/igt_kms.c                    | 55 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h                    |  1 +
 tests/debugfs_test.c             | 10 ++++++
 tests/kms_atomic_transition.c    | 10 ++++++
 tests/kms_content_protection.c   | 41 ++++++++++--------------
 tests/kms_cursor_edge_walk.c     |  3 ++
 tests/kms_cursor_legacy.c        | 47 +++++++++++++++++++++++++--
 tests/kms_flip_scaled_crc.c      |  5 +++
 tests/kms_frontbuffer_tracking.c | 33 +++++++++++++++++++
 tests/kms_plane.c                | 19 +++++++----
 tests/kms_plane_alpha_blend.c    |  5 +--
 tests/kms_plane_cursor.c         |  4 +++
 tests/kms_plane_lowres.c         |  9 ++----
 tests/kms_plane_scaling.c        | 15 +++++++--
 tests/kms_vblank.c               |  2 ++
 15 files changed, 214 insertions(+), 45 deletions(-)

--
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
