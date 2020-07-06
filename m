Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB286E2E9
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2020 04:40:19 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Mon,  6 Jul 2020 10:10:27 +0530
Message-Id: <20200706044038.8203-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 00/11] lib/igt_kms: Add support for display
 with
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

V5:
	Modified vblank helper functions parameters for v4 regression
	and included two new patchsets.

Mohammed Khajapasha (11):
  lib/igt_kms: Add support for display with non-contiguous pipes
  lib/igt_kms: Add igt_require_pipe() function
  tests/kms_cursor_legacy: Read crtc id for enable pipes
  tests/kms_lease: Get pipe from crtc for enable pipes
  tests/kms_lease: Read crtc id for a valid pipe
  lib/kms: Skip igt test cases for disabled display pipes
  tests/kms: Skip kms test cases for disabled pipes
  tests/kms_atomic_transition: Set modeset for enable pipes only
  i915/gem_eio: Set modeset for enable pipes
  lib/kms: Convert pipe id flags for a vblank using crtc offset
  tests/kms: Use crtc offset to read vblank event for a pipe

 lib/igt_kms.c                   | 118 +++++++++++++++++++++++++-------
 lib/igt_kms.h                   |  33 ++++++---
 tests/i915/gem_eio.c            |   2 +
 tests/i915/perf_pmu.c           |   3 +-
 tests/kms_atomic_transition.c   |  15 ++--
 tests/kms_available_modes_crc.c |   4 +-
 tests/kms_color.c               |  37 +++++++---
 tests/kms_color_chamelium.c     |   2 +-
 tests/kms_concurrent.c          |   2 +-
 tests/kms_cursor_crc.c          |  18 +++--
 tests/kms_cursor_edge_walk.c    |   4 +-
 tests/kms_cursor_legacy.c       |  13 ++--
 tests/kms_lease.c               |  26 +++++--
 tests/kms_pipe_crc_basic.c      |   9 +--
 tests/kms_plane.c               |  10 ++-
 tests/kms_plane_lowres.c        |   2 +-
 tests/kms_plane_multiple.c      |   2 +-
 tests/kms_sequence.c            |   3 +-
 tests/kms_universal_plane.c     |  12 ++--
 tests/kms_vblank.c              |   3 +-
 20 files changed, 232 insertions(+), 86 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
