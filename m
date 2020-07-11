Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF076E1B3
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Jul 2020 18:05:05 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Sat, 11 Jul 2020 23:34:46 +0530
Message-Id: <20200711180457.1824-1-mohammed.khajapasha@intel.com>
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

With non-contiguous pipes display, pipe mapping is always not same as
crtc mapping, pipe is enum id of i915 crtc object and it is not
equal to crtc offset of a pipe in mode config list. Hence allocating
upper bound array for igt_pipes and reading pipe id using CRTC_ID_TO_PIPE
ioctl. Using crtc offset for a pipe from mode config list to
read vblank events.

V6:
	Updated documentation for using crtc offset for a pipe

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

 lib/igt_kms.c                   | 136 ++++++++++++++++++++++++++------
 lib/igt_kms.h                   |  41 ++++++++--
 tests/i915/gem_eio.c            |   2 +
 tests/i915/perf_pmu.c           |   3 +-
 tests/kms_atomic_transition.c   |  15 +++-
 tests/kms_available_modes_crc.c |   4 +-
 tests/kms_color.c               |  37 ++++++---
 tests/kms_color_chamelium.c     |   2 +-
 tests/kms_concurrent.c          |   2 +-
 tests/kms_cursor_crc.c          |  18 +++--
 tests/kms_cursor_edge_walk.c    |   4 +-
 tests/kms_cursor_legacy.c       |  13 +--
 tests/kms_lease.c               |  26 ++++--
 tests/kms_pipe_crc_basic.c      |   9 ++-
 tests/kms_plane.c               |  10 ++-
 tests/kms_plane_lowres.c        |   2 +-
 tests/kms_plane_multiple.c      |   2 +-
 tests/kms_sequence.c            |   3 +-
 tests/kms_universal_plane.c     |  12 +--
 tests/kms_vblank.c              |   3 +-
 20 files changed, 255 insertions(+), 89 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
