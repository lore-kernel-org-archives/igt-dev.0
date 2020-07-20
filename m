Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44CD89A57
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 15:20:49 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Mon, 20 Jul 2020 20:50:34 +0530
Message-Id: <20200720152045.10787-1-mohammed.khajapasha@intel.com>
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

With non-contiguous pipes display, pipe mapping is always not same as
crtc mapping, For i915 pipe is enum id of i915's crtc object and
it is not equal to crtc offset of a pipe in mode config list.
Hence allocating upper bound array for igt_pipe and reading
pipe id using GET_PIPE_FROM_CRTC_ID ioctl.
Using crtc offset for a pipe to do ordering pipe with crtc list.

Example:
With a non-contiguous pipe display, with PIPE_A & PIPE_D
are enabled, PIPE_C & PIPE_B disabled configuration,
the pipe for PIPE_A & D will be '0' and '3' and crtc offsets
are '0' & '1' in mode config list using crtc offset to ordering
enabled pipes with crtc list in mode config.

v10:
Resolved build reviewed by <Hiler, Arkadiusz>

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

 lib/igt_kms.c                   | 140 +++++++++++++++++++++++++-------
 lib/igt_kms.h                   |  43 ++++++++--
 tests/i915/gem_eio.c            |   2 +
 tests/i915/perf_pmu.c           |   3 +-
 tests/kms_atomic_transition.c   |  15 +++-
 tests/kms_available_modes_crc.c |   4 +-
 tests/kms_color.c               |  37 ++++++---
 tests/kms_color_chamelium.c     |   2 +-
 tests/kms_concurrent.c          |   2 +-
 tests/kms_cursor_crc.c          |  18 ++--
 tests/kms_cursor_edge_walk.c    |   4 +-
 tests/kms_cursor_legacy.c       |  13 +--
 tests/kms_lease.c               |  28 +++++--
 tests/kms_pipe_crc_basic.c      |   9 +-
 tests/kms_plane.c               |  10 ++-
 tests/kms_plane_lowres.c        |   2 +-
 tests/kms_plane_multiple.c      |   2 +-
 tests/kms_sequence.c            |   3 +-
 tests/kms_universal_plane.c     |  12 +--
 tests/kms_vblank.c              |   3 +-
 20 files changed, 260 insertions(+), 92 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
