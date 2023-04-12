Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E34210E8B4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 16:32:28 +0000 (UTC)
Date: Wed, 12 Apr 2023 18:32:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230412163221.l4fibuq5tpplwd5t@kamilkon-desk1>
References: <20230412023329.465551-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230412023329.465551-1-zack@kde.org>
Subject: Re: [igt-dev] [PATCH i-g-t v3 0/8] Add vmwgfx support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: banackm@vmware.com, krastevm@vmware.com, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zack,

On 2023-04-11 at 22:33:21 -0400, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> v2: Split up tests into individual changes and fix various reported
> warnings
> v3: Rename vmw tests and commits, regenerate headers and fix the order
> of driver names in drmtest
>                               
> Introduce explicit support for vmwgfx. The general support is largely
> self contained, the only additionl change is to increase number of
> available crtcs which is needed by vmwgfx but doesn't affect other
> drivers.
>                                                                            
> Besides the core support add a number of vmwgfx specific tests which
> use and test various vmwgfx specific ioctl's.
> 
> Maaz Mombasawala (7):
>   lib/svga: Add generated headers for the svga device
>   lib: Add vmwgfx support
>   tests/vmwgfx: Add triangle test
>   tests/vmwgfx: Add execution buffer test
>   tests/vmwgfx: Add surface copy test
>   tests/vmwgfx: Add mob stress test
>   tests/vmwgfx: Add reference counting tests

This looks almost ok, in file from first patch:
lib/svga/svga3d_surfacedefs.h

SPDX should be placed on first line.
btw checkpatch.pl has many warnings and found two misspelled
words in 
lib/svga/vm_basic_types.h

Is this file also part of ones copied from linux driver ?
While all that ints and other stuff looks basic, that MKS...
looks like some performance counting data structure (so it
don't looks like "basic").

Regards,
Kamil

> 
> Zack Rusin (1):
>   lib: Fix igt_kms for drivers with 8 crtc's
> 
>  lib/drmtest.c                       |    3 +
>  lib/drmtest.h                       |    1 +
>  lib/igt_kms.c                       |    2 +-
>  lib/igt_kms.h                       |    2 +
>  lib/igt_vmwgfx.c                    | 1366 +++++++++++++++++++++
>  lib/igt_vmwgfx.h                    |  275 +++++
>  lib/meson.build                     |    1 +
>  lib/svga/svga3d_cmd.h               | 1513 +++++++++++++++++++++++
>  lib/svga/svga3d_devcaps.h           |  375 ++++++
>  lib/svga/svga3d_dx.h                | 1737 +++++++++++++++++++++++++++
>  lib/svga/svga3d_limits.h            |   81 ++
>  lib/svga/svga3d_reg.h               |   46 +
>  lib/svga/svga3d_surfacedefs.h       | 1559 ++++++++++++++++++++++++
>  lib/svga/svga3d_types.h             | 1560 ++++++++++++++++++++++++
>  lib/svga/svga_escape.h              |   56 +
>  lib/svga/svga_overlay.h             |  117 ++
>  lib/svga/svga_reg.h                 |  905 ++++++++++++++
>  lib/svga/vm_basic_types.h           |  161 +++
>  meson.build                         |    7 +
>  tests/meson.build                   |    2 +
>  tests/vmwgfx/meson.build            |   18 +
>  tests/vmwgfx/vmw_execution_buffer.c |  313 +++++
>  tests/vmwgfx/vmw_mob_stress.c       |  102 ++
>  tests/vmwgfx/vmw_ref_count.c        |  320 +++++
>  tests/vmwgfx/vmw_surface_copy.c     |  341 ++++++
>  tests/vmwgfx/vmw_tri.c              |  214 ++++
>  26 files changed, 11076 insertions(+), 1 deletion(-)
>  create mode 100644 lib/igt_vmwgfx.c
>  create mode 100644 lib/igt_vmwgfx.h
>  create mode 100644 lib/svga/svga3d_cmd.h
>  create mode 100644 lib/svga/svga3d_devcaps.h
>  create mode 100644 lib/svga/svga3d_dx.h
>  create mode 100644 lib/svga/svga3d_limits.h
>  create mode 100644 lib/svga/svga3d_reg.h
>  create mode 100644 lib/svga/svga3d_surfacedefs.h
>  create mode 100644 lib/svga/svga3d_types.h
>  create mode 100644 lib/svga/svga_escape.h
>  create mode 100644 lib/svga/svga_overlay.h
>  create mode 100644 lib/svga/svga_reg.h
>  create mode 100644 lib/svga/vm_basic_types.h
>  create mode 100644 tests/vmwgfx/meson.build
>  create mode 100644 tests/vmwgfx/vmw_execution_buffer.c
>  create mode 100644 tests/vmwgfx/vmw_mob_stress.c
>  create mode 100644 tests/vmwgfx/vmw_ref_count.c
>  create mode 100644 tests/vmwgfx/vmw_surface_copy.c
>  create mode 100644 tests/vmwgfx/vmw_tri.c
> 
> -- 
> 2.39.2
> 
