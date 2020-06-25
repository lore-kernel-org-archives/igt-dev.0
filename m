Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C674A6E25B
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 06:37:08 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 25 Jun 2020 12:05:44 +0530
Message-Id: <20200625063551.26622-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/7] lib/igt_kms: Add support for display
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

Add support for display with non-contiguous pipes.

v3:
	Handled kms atomic transition test failure case.

Mohammed Khajapasha (7):
  lib/igt_kms: Add support for display with non-contiguous pipes
  tests/kms_cursor_legacy: Read crtc id for enable pipes
  tests/kms_lease: Get pipe from crtc for enable pipes
  tests/kms_lease: Read crtc id for a valid pipe
  lib/kms: Skip igt test cases for disabled display pipes
  tests/kms: Skip kms test cases for disabled pipes
  tests/kms_atomic_transition: Set modeset for enable pipes only

 lib/igt_kms.c                 | 66 +++++++++++++++++++++++++++++------
 lib/igt_kms.h                 | 13 ++++---
 tests/kms_atomic_transition.c |  9 +++--
 tests/kms_color.c             |  3 +-
 tests/kms_color_chamelium.c   |  3 +-
 tests/kms_concurrent.c        |  3 +-
 tests/kms_cursor_legacy.c     | 14 +++++---
 tests/kms_lease.c             |  8 +++--
 tests/kms_pipe_crc_basic.c    |  6 ++--
 tests/kms_plane.c             |  3 +-
 tests/kms_plane_lowres.c      |  3 +-
 tests/kms_plane_multiple.c    |  3 +-
 tests/kms_universal_plane.c   | 18 ++++++----
 13 files changed, 113 insertions(+), 39 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
