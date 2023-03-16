Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CE210EBA9
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 02:27:02 +0000 (UTC)
From: Zack Rusin <zack@kde.org>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 22:26:51 -0400
Message-Id: <20230316022659.73202-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/8] Add vmwgfx support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: petri.latvala@intel.com, banackm@vmware.com, krastevm@vmware.com,
 mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

v2: Split up tests into individual changes and fix various reported
warnings
                              
Introduce explicit support for vmwgfx. The general support is largely
self contained, the only additionl change is to increase number of
available crtcs which is needed by vmwgfx but doesn't affect other
drivers.
                                                                           
Besides the core support add a number of vmwgfx specific tests which
use and test various vmwgfx specific ioctl's.

Maaz Mombasawala (7):
  igt/vmwgfx: Add generated headers for svga device
  igt/vmwgfx: Add vmwgfx support
  igt/vmwgfx: Add triangle test
  igt/vmwgfx: Add execution buffer test
  igt/vmwgfx: Add surface copy test
  igt/vmwgfx: Add mob stress test
  igt/vmwgfx: Add reference counting tests

Zack Rusin (1):
  lib/igt_kms: vmwgfx returns 8 crtc

 lib/drmtest.c                   |    3 +
 lib/drmtest.h                   |    1 +
 lib/igt_kms.c                   |    2 +-
 lib/igt_kms.h                   |    2 +
 lib/igt_vmwgfx.c                | 1366 ++++++++++++++++++++++++
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
 meson.build                     |    7 +
 tests/meson.build               |    2 +
 tests/vmwgfx/execution_buffer.c |  307 ++++++
 tests/vmwgfx/meson.build        |   18 +
 tests/vmwgfx/mob_stress.c       |   99 ++
 tests/vmwgfx/ref_count.c        |  312 ++++++
 tests/vmwgfx/surface_copy.c     |  337 ++++++
 tests/vmwgfx/tri.c              |  210 ++++
 26 files changed, 11010 insertions(+), 1 deletion(-)
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
2.38.1
