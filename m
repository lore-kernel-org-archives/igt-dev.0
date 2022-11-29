Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9DD10E0BC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 17:27:26 +0000 (UTC)
From: Zack Rusin <zack@kde.org>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 12:27:15 -0500
Message-Id: <20221129172718.151773-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add vmwgfx support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Introduce explicit support for vmwgfx. The general support is largely
self contained, the two extra patches in the core are changing a warning
to info due to it being always dumped for DRIVER_ANY tests that are
not running on Intel and increasing number of available crtcs which is
needed by vmwgfx but doesn't affect other drivers.

Maaz Mombasawala (1):
  igt/vmwgfx: Add support for testing vmwgfx

Zack Rusin (2):
  lib/igt_kms: vmwgfx returns 8 crtc
  igt: Switch warning to an info when not using i915

 lib/drmtest.c                   |    3 +
 lib/drmtest.h                   |    1 +
 lib/igt_kmod.c                  |    2 +-
 lib/igt_kms.c                   |    2 +-
 lib/igt_kms.h                   |    2 +
 lib/igt_vmwgfx.c                | 1354 ++++++++++++++++++++++++
 lib/igt_vmwgfx.h                |  275 +++++
 lib/meson.build                 |    1 +
 lib/svga/svga3d_cmd.h           | 1511 +++++++++++++++++++++++++++
 lib/svga/svga3d_devcaps.h       |  369 +++++++
 lib/svga/svga3d_dx.h            | 1722 +++++++++++++++++++++++++++++++
 lib/svga/svga3d_limits.h        |   83 ++
 lib/svga/svga3d_reg.h           |   44 +
 lib/svga/svga3d_surfacedefs.h   | 1559 ++++++++++++++++++++++++++++
 lib/svga/svga3d_types.h         | 1554 ++++++++++++++++++++++++++++
 lib/svga/svga_escape.h          |   54 +
 lib/svga/svga_overlay.h         |  115 +++
 lib/svga/svga_reg.h             |  897 ++++++++++++++++
 lib/svga/vm_basic_types.h       |  161 +++
 meson.build                     |    8 +
 tests/meson.build               |    2 +
 tests/vmwgfx/execution_buffer.c |  306 ++++++
 tests/vmwgfx/meson.build        |   18 +
 tests/vmwgfx/mob_stress.c       |   99 ++
 tests/vmwgfx/ref_count.c        |  311 ++++++
 tests/vmwgfx/surface_copy.c     |  337 ++++++
 tests/vmwgfx/tri.c              |  208 ++++
 27 files changed, 10996 insertions(+), 2 deletions(-)
 create mode 100644 lib/igt_vmwgfx.c
 create mode 100644 lib/igt_vmwgfx.h
 create mode 100644 lib/svga/svga3d_cmd.h
 create mode 100644 lib/svga/svga3d_devcaps.h
 create mode 100644 lib/svga/svga3d_dx.h
 create mode 100644 lib/svga/svga3d_limits.h
 create mode 100644 lib/svga/svga3d_reg.h
 create mode 100644 lib/svga/svga3d_surfacedefs.h
 create mode 100644 lib/svga/svga3d_types.h
 create mode 100644 lib/svga/svga_escape.h
 create mode 100644 lib/svga/svga_overlay.h
 create mode 100644 lib/svga/svga_reg.h
 create mode 100644 lib/svga/vm_basic_types.h
 create mode 100644 tests/vmwgfx/execution_buffer.c
 create mode 100644 tests/vmwgfx/meson.build
 create mode 100644 tests/vmwgfx/mob_stress.c
 create mode 100644 tests/vmwgfx/ref_count.c
 create mode 100644 tests/vmwgfx/surface_copy.c
 create mode 100644 tests/vmwgfx/tri.c

-- 
2.37.2
