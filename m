Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C946E260
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Mar 2020 21:19:25 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Sun,  8 Mar 2020 02:47:48 +0530
Message-Id: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] test/kms: Add support for display with
 non-contiguous pipes
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

add support for display with non-contiguous pipes.

Mohammed Khajapasha (3):
  lib/igt_kms: Set pipe enum name to a pipe from drm pipe
  test/kms: Loop for enable pipes only in static iteration
  kms/test: Pass correct pipe value to print pipe name

 lib/igt_kms.c                   |  8 ++++++-
 lib/igt_kms.h                   |  7 ++++--
 tests/kms_atomic_transition.c   |  2 +-
 tests/kms_available_modes_crc.c |  8 +++++--
 tests/kms_busy.c                | 20 ++++++++--------
 tests/kms_ccs.c                 |  5 ++--
 tests/kms_color.c               | 30 ++++++++++++-----------
 tests/kms_color_chamelium.c     | 26 ++++++++++----------
 tests/kms_concurrent.c          |  8 ++++---
 tests/kms_cursor_crc.c          | 35 +++++++++++++++------------
 tests/kms_cursor_edge_walk.c    | 20 +++++++++-------
 tests/kms_cursor_legacy.c       | 23 +++++++++++-------
 tests/kms_dp_dsc.c              |  5 +++-
 tests/kms_lease.c               |  9 ++++---
 tests/kms_pipe_crc_basic.c      | 19 ++++++++-------
 tests/kms_plane.c               | 42 +++++++++++++++++++--------------
 tests/kms_plane_alpha_blend.c   | 25 +++++++++++---------
 tests/kms_plane_cursor.c        | 16 +++++++------
 tests/kms_plane_lowres.c        | 16 ++++++++-----
 tests/kms_plane_multiple.c      | 16 ++++++++-----
 tests/kms_plane_scaling.c       | 19 +++++++++------
 tests/kms_prime.c               |  2 +-
 tests/kms_properties.c          |  9 ++++---
 tests/kms_rotation_crc.c        |  3 ++-
 tests/kms_sequence.c            |  4 ++--
 tests/kms_universal_plane.c     | 21 +++++++----------
 tests/kms_vblank.c              | 13 ++++++----
 27 files changed, 241 insertions(+), 170 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
