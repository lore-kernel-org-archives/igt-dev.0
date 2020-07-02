Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5BC6E1F6
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2020 04:52:46 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu,  2 Jul 2020 10:22:58 +0530
Message-Id: <20200702045307.19202-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/9] lib/igt_kms: Add support for display
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

v4:
	Resolved compilation issues found in CI build.

Mohammed Khajapasha (9):
  lib/igt_kms: Add support for display with non-contiguous pipes
  lib/igt_kms: Add igt_require_pipe() function
  tests/kms_cursor_legacy: Read crtc id for enable pipes
  tests/kms_lease: Get pipe from crtc for enable pipes
  tests/kms_lease: Read crtc id for a valid pipe
  lib/kms: Skip igt test cases for disabled display pipes
  tests/kms: Skip kms test cases for disabled pipes
  tests/kms_atomic_transition: Set modeset for enable pipes only
  i915/gem_eio: Set modeset for enable pipes

 lib/igt_kms.c                 | 87 +++++++++++++++++++++++++++++++----
 lib/igt_kms.h                 | 26 +++++++++--
 tests/i915/gem_eio.c          |  2 +
 tests/kms_atomic_transition.c |  9 +++-
 tests/kms_color.c             |  2 +-
 tests/kms_color_chamelium.c   |  2 +-
 tests/kms_concurrent.c        |  2 +-
 tests/kms_cursor_legacy.c     | 13 ++++--
 tests/kms_lease.c             |  8 +++-
 tests/kms_pipe_crc_basic.c    |  4 +-
 tests/kms_plane.c             |  2 +-
 tests/kms_plane_lowres.c      |  2 +-
 tests/kms_plane_multiple.c    |  2 +-
 tests/kms_universal_plane.c   | 12 ++---
 14 files changed, 135 insertions(+), 38 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
