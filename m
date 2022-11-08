Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773D910E540
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 23:57:53 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 20:57:18 -0300
Message-Id: <20221108235724.126287-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] V3D IGT Tests Updates
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

This series aims to update the V3D IGT tests. The first four patches contain
some janitorial duties related to the existing tests: updating the uAPI header,
creating a folder for the V3D tests, removing some unused includes, and adding
a macro with the default PAGE_SIZE. The last two patches include new tests for
the V3D driver.

Best Regards,
- Maíra Canal

Maíra Canal (6):
  include/drm-uapi: Update to the latest v3d_drm.h
  tests/v3d: Move V3D tests to their own folder
  tests/v3d: Remove unused or redundant includes
  lib/igt_v3d: Add PAGE_SIZE macro to V3D
  tests/v3d_create_bo: Create test for V3D's Create BO IOCTL
  tests/v3d_perfmon: Create test for V3D's Perfmon IOCTLs

 include/drm-uapi/v3d_drm.h          |  78 ++++++++++++++
 lib/igt_v3d.c                       |  39 ++++++-
 lib/igt_v3d.h                       |   6 ++
 tests/meson.build                   |  20 +++-
 tests/v3d/v3d_create_bo.c           |  79 ++++++++++++++
 tests/{ => v3d}/v3d_get_bo_offset.c |  16 +--
 tests/{ => v3d}/v3d_get_param.c     |  12 ---
 tests/{ => v3d}/v3d_mmap.c          |  12 ---
 tests/v3d/v3d_perfmon.c             | 153 ++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist           |  14 +++
 10 files changed, 385 insertions(+), 44 deletions(-)
 create mode 100644 tests/v3d/v3d_create_bo.c
 rename tests/{ => v3d}/v3d_get_bo_offset.c (86%)
 rename tests/{ => v3d}/v3d_get_param.c (89%)
 rename tests/{ => v3d}/v3d_mmap.c (85%)
 create mode 100644 tests/v3d/v3d_perfmon.c

-- 
2.38.1
