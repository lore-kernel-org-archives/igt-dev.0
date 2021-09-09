Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D397F6E890
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Sep 2021 15:31:05 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  9 Sep 2021 18:30:36 +0300
Message-Id: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/11] kms: Clean up the supported
 rotations mess
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Full repost due to Ci getting confused by bogus patch numbering :/

Reposting of igt_plane_has_rotation() + a few other remaining
bits and bobs from the previous series. The main idea here is
to remove most of the hardcoded platform checks for supported
rotations. Sadly not quite 100% due to a few exceptional cases.

I left out the kms_big_fb fliptab[] nukage for the moment so that
the CI results will be less noisy.

v2: keep some gen9+ checks in kms_rotation_crc

Ville Syrjälä (11):
  lib/kms: Add igt_plane_has_rotation()
  tests/kms_rotation_crc: Use igt_plane_has_rotation()
  tests/kms_plane_scaling: Use igt_plane_has_rotation()
  tests/kms_big_fb: Use igt_plane_has_rotation()
  tests/kms_big_fb: Use igt_has_drm_cap()
  tests/kms_big_fb: Move batch creation into lower level functions
  tests/kms_big_fb: Move format/modifier checks lower
  tests/kms_big_fb: Nuke the stride/format overrides
  tests/kms_big_fb: Check whether the rotation is supposed in the async
    flip test
  tests/kms_plane: Abstract single vs. multiple crsc better
  tests/kms_plane: Use single colors during extended test

 lib/igt_kms.c             | 41 ++++++++++++++++++++++++
 lib/igt_kms.h             | 16 ++++++++++
 tests/kms_big_fb.c        | 67 +++++++++++----------------------------
 tests/kms_plane.c         | 61 +++++++++++++++++++----------------
 tests/kms_plane_scaling.c |  5 +--
 tests/kms_rotation_crc.c  | 32 +++++++------------
 6 files changed, 123 insertions(+), 99 deletions(-)

-- 
2.31.1
