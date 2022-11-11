Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B7810E8C4
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 20:42:36 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Nov 2022 16:58:06 -0300
Message-Id: <20221111195813.277822-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/7] V3D IGT Tests Updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series aims to update the V3D IGT tests. The first five patches contain
some janitorial duties related to the existing tests: updating the uAPI header,
creating a folder for the V3D tests, removing some unused includes, adding 
descriptions to the existing tests and adding a macro with the default PAGE_SIZE.
The last two patches include new tests for the V3D driver.

Best Regards,
- Maíra Canal

v1 -> v2: https://patchwork.freedesktop.org/series/110681/
- Use SPDX licence (Kamil Konieczny).
- Add descriptions to each new added test with igt_describe (Kamil Konieczny).
- Add descriptions to existing V3D tests.

Maíra Canal (7):
  include/drm-uapi: Update to the latest v3d_drm.h
  tests/v3d: Move V3D tests to their own folder
  tests/v3d: Remove unused or redundant includes
  tests/v3d: Add igt_describe() to all V3D subtests
  lib/igt_v3d: Add PAGE_SIZE macro to V3D
  tests/v3d_create_bo: Create test for V3D's Create BO IOCTL
  tests/v3d_perfmon: Create test for V3D's Perfmon IOCTLs

 include/drm-uapi/v3d_drm.h          |  78 +++++++++++++++
 lib/igt_v3d.c                       |  39 +++++++-
 lib/igt_v3d.h                       |   6 ++
 tests/meson.build                   |  20 +++-
 tests/v3d/v3d_create_bo.c           |  63 ++++++++++++
 tests/{ => v3d}/v3d_get_bo_offset.c |  21 ++--
 tests/{ => v3d}/v3d_get_param.c     |  17 +---
 tests/{ => v3d}/v3d_mmap.c          |  15 +--
 tests/v3d/v3d_perfmon.c             | 144 ++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist           |  14 +++
 10 files changed, 373 insertions(+), 44 deletions(-)
 create mode 100644 tests/v3d/v3d_create_bo.c
 rename tests/{ => v3d}/v3d_get_bo_offset.c (85%)
 rename tests/{ => v3d}/v3d_get_param.c (88%)
 rename tests/{ => v3d}/v3d_mmap.c (85%)
 create mode 100644 tests/v3d/v3d_perfmon.c

-- 
2.38.1
