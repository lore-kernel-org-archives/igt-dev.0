Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B485F10E594
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 08:27:10 +0000 (UTC)
Date: Tue, 12 Dec 2023 09:27:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] xe/tests: Remove tile_sysfs test for now
Message-ID: <20231212082706.tlj43t5q2jbgnwhp@kamilkon-desk.igk.intel.com>
References: <20231212002115.1105927-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212002115.1105927-1-rodrigo.vivi@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rodrigo,
On 2023-12-11 at 19:21:14 -0500, Rodrigo Vivi wrote:

Small nit about subject:
[PATCH i-g-t] xe/tests: Remove tile_sysfs test for now

should be:
[PATCH i-g-t] tests/xe: Remove tile_sysfs test for now

or better:
[PATCH i-g-t] tests/intel/xe_tile_sysfs: Remove it for now

With this fixed:
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> The only case in this test was for the physical_memsize_attr
> that is getting removed from kernel. So, let's entirely remove
> this test case for now and re-add it when we have another reason.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel/xe_sysfs_tile.c | 59 -------------------------------------
>  tests/meson.build           |  1 -
>  2 files changed, 60 deletions(-)
>  delete mode 100644 tests/intel/xe_sysfs_tile.c
> 
> diff --git a/tests/intel/xe_sysfs_tile.c b/tests/intel/xe_sysfs_tile.c
> deleted file mode 100644
> index ba970cda8..000000000
> --- a/tests/intel/xe_sysfs_tile.c
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2023 Intel Corporation
> - */
> -
> -/**
> - * TEST: Verify physical_vram_size_bytes of each tiles
> - * Category: Software building block
> - * SUBTEST: physical_vram_size_bytes
> - * Functionality: Vram
> - * Sub-category: Total vram per tile
> - * Test category: functionality test
> - * Description:
> - *             Read sysfs entry for physical_vram_size_bytes and compare with
> - *             vram size. physical_vram_size_bytes should be more than vram size.
> - */
> -
> -#include <string.h>
> -#include <sys/time.h>
> -
> -#include "igt.h"
> -#include "igt_sysfs.h"
> -
> -#include "xe_drm.h"
> -#include "xe/xe_ioctl.h"
> -#include "xe/xe_query.h"
> -
> -static void test_vram_physical_vram_size_bytes(int tile_fd, int tile_num, u64 vram_size)
> -{
> -	u64 physical_vram_size_bytes;
> -
> -	igt_assert(igt_sysfs_scanf(tile_fd, "physical_vram_size_bytes",
> -				   "%lx", &physical_vram_size_bytes) > 0);
> -	igt_assert_lt_u64(vram_size, physical_vram_size_bytes);
> -}
> -
> -igt_main
> -{
> -	int fd, tilefd, tile;
> -	u64 vram_size;
> -
> -	igt_fixture {
> -		fd = drm_open_driver(DRIVER_XE);
> -		xe_device_get(fd);
> -	}
> -
> -	igt_subtest("physical_vram_size_bytes") {
> -		igt_require(xe_has_vram(fd));
> -		for_each_sysfs_tile_dirfd(fd, tilefd, tile) {
> -			vram_size = xe_vram_size(fd, tile);
> -			test_vram_physical_vram_size_bytes(tilefd, tile, vram_size);
> -		}
> -	}
> -
> -	igt_fixture {
> -		xe_device_put(fd);
> -		close(fd);
> -	}
> -}
> diff --git a/tests/meson.build b/tests/meson.build
> index f6cfbcf5e..4591ca256 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -307,7 +307,6 @@ intel_xe_progs = [
>  	'xe_prime_self_import',
>  	'xe_perf_pmu',
>  	'xe_query',
> -	'xe_sysfs_tile',
>  	'xe_uevent',
>  	'xe_vm',
>  	'xe_waitfence',
> -- 
> 2.43.0
> 
