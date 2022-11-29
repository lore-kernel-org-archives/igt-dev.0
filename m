Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B0510E172
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 18:41:08 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 15:40:31 -0300
Message-Id: <20221129184038.72946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/7] V3D IGT Tests Updates
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

v1 -> v2:
- Use SPDX licence (Kamil Konieczny).
- Add descriptions to each new added test with igt_describe (Kamil Konieczny).
- Add descriptions to existing V3D tests.

v2 -> v3:
- Install V3D tests on build/tests/v3d/ instead of build/tests/ (Melissa Wen).
- Include a subtest for no-flags validation on v3d_create_bo (Melissa Wen).

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
 meson.build                         |   8 ++
 tests/meson.build                   |   5 +-
 tests/v3d/meson.build               |  16 ++++
 tests/v3d/v3d_create_bo.c           |  71 ++++++++++++++
 tests/{ => v3d}/v3d_get_bo_offset.c |  21 ++--
 tests/{ => v3d}/v3d_get_param.c     |  17 +---
 tests/{ => v3d}/v3d_mmap.c          |  15 +--
 tests/v3d/v3d_perfmon.c             | 144 ++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist           |  27 ++++--
 12 files changed, 397 insertions(+), 50 deletions(-)
 create mode 100644 tests/v3d/meson.build
 create mode 100644 tests/v3d/v3d_create_bo.c
 rename tests/{ => v3d}/v3d_get_bo_offset.c (85%)
 rename tests/{ => v3d}/v3d_get_param.c (88%)
 rename tests/{ => v3d}/v3d_mmap.c (85%)
 create mode 100644 tests/v3d/v3d_perfmon.c

-- 
2.38.1
