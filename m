Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A3FCA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 14:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E25E10E8C7;
	Thu,  8 Oct 2026 14:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFHOht7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0949C10E8CD;
 Thu,  8 Oct 2026 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791468512; x=1823004512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PRszrO44DPB2yknyVqFG+ilG8GPefAcy1VDdayjCsUw=;
 b=jFHOht7CV7/Qd8Mx6CsJukem3SS3LWiz3LeO9s0Rz0rlTgH6trJPIgQ8
 gmIuQmTYjDtjwfOr3GYt7ypOQFTH+D6tSo7bG6/17iwqM/4lkcxjc2+45
 YdWuWZXz/akEySL4cLKydVI7j2T1GFxMxag6HBw8ljnGJBuMPSY75zOIR
 6ZdxIkQ4t3S6H3RNQstgtl+4Hk4+Zn/RlNMeJbmOohzmTpe4bdfmsVLvE
 y5x91hT55HvVArrli1EHOVcBMptJVrzN8izGyt1fgz68k6MeQrH8Fs35l
 CHmXsb6ntjJd2YS/VbvpopoKnhGHgD8dctZaH+JGkdEFDRigS5Sphv+r3 A==;
X-CSE-ConnectionGUID: XLAIQoaESAmAtTP7Sdr0dA==
X-CSE-MsgGUID: KrVLDXm5RsGGexymkpE5SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="259622"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="259622"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:08:32 -0700
X-CSE-ConnectionGUID: Vq4b0re2RUOaOWyr2w5Ljw==
X-CSE-MsgGUID: hZxAHzHFQcu5Os+E+ABnHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="59625"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:08:29 -0700
Date: Thu, 8 Oct 2026 16:08:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gyeyoung Baek <gye976@gmail.com>
Cc: igt-dev@lists.freedesktop.org, imagination@lists.freedesktop.org,
 alessio.belle@imgtec.com, luigi.santivetti@imgtec.com,
 robert.mazur@imgtec.com, matt.coster@imgtec.com,
 sarah.walker@imgtec.com, frank.binns@imgtec.com,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>
Subject: Re: [PATCH i-g-t v2] tests/imagination: Add VM map and remap tests
Message-ID: <20261008140810.gcu2dddq4e5uihxs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gyeyoung Baek <gye976@gmail.com>, igt-dev@lists.freedesktop.org,
 imagination@lists.freedesktop.org, alessio.belle@imgtec.com,
 luigi.santivetti@imgtec.com, robert.mazur@imgtec.com,
 matt.coster@imgtec.com, sarah.walker@imgtec.com,
 frank.binns@imgtec.com, Brajesh Gupta <Brajesh.Gupta@imgtec.com>
References: <20260930125057.1837788-1-gye976@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930125057.1837788-1-gye976@gmail.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Gyeyoung,
On 2026-09-30 at 21:50:57 +0900, Gyeyoung Baek wrote:
> Add pvr_vm_map, which tests DRM_IOCTL_PVR_VM_MAP and
> DRM_IOCTL_PVR_VM_UNMAP directly.
> 
> For each of the following three cases, test five scenarios and check
> that the memory of the buffer objects is returned in each of them:
> 1. Inside one 2MiB region
> 2. Across a 2MiB boundary
> 3. Across a 1GiB boundary
> 
> - map-*: map a range and unmap it.
> - replace-*: map a range that completely covers a smaller existing
>   mapping.
> - remap-next-*: map over the left part of a mapping, which splits it.
> - remap-prev-*: map over the right part of a mapping, which splits it.
> - remap-both-*: map over the middle of a mapping, which splits it.
> 
> See the following document for the overlap cases:
> https://docs.kernel.org/gpu/drm-mm.html#drm-gpuvm
> 
> Signed-off-by: Gyeyoung Baek <gye976@gmail.com>

Applied, thanks!


Regards,
Kamil

> ---
> v2:
> - Add (c) line
> - Clean up includes
> - Add IGT_TEST_DESCRIPTION()
> - Link to v1: https://lore.kernel.org/all/20260926152341.783867-1-gye976@gmail.com/
> 
>  tests/imagination/meson.build  |   1 +
>  tests/imagination/pvr_vm_map.c | 193 +++++++++++++++++++++++++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 tests/imagination/pvr_vm_map.c
> 
> diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> index 7ae8ddd0a..80d807c28 100644
> --- a/tests/imagination/meson.build
> +++ b/tests/imagination/meson.build
> @@ -8,6 +8,7 @@ pvr_progs = [ 'pvr_dev_query',
>  	      'pvr_runtime_info',
>  	      'pvr_submit_jobs',
>  	      'pvr_vm_context',
> +	      'pvr_vm_map',
>  	    ]
>  
>  pvr_deps = test_deps
> diff --git a/tests/imagination/pvr_vm_map.c b/tests/imagination/pvr_vm_map.c
> new file mode 100644
> index 000000000..c74cc4f62
> --- /dev/null
> +++ b/tests/imagination/pvr_vm_map.c
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Gyeyoung Baek */
> +
> +#include <inttypes.h>
> +#include <stddef.h>
> +#include <stdint.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_os.h"
> +#include "igt_pvr.h"
> +#include "igt_sizes.h"
> +
> +IGT_TEST_DESCRIPTION("Test that VM map, unmap and remap operations work");
> +
> +/*
> + * vm_map/unmap/remap() are each run on a range of RANGE_PAGES pages (p0..p3),
> + * placed in one of three ways. The drawings are not to scale.
> + *
> + * in-2m       Inside one 2MiB region. No boundary is crossed.
> + *
> + *             |<------------ 2MiB region ----------->|
> + *             |           [p0|p1|p2|p3]              |
> + *
> + * cross-2m    Across a 2MiB boundary.
> + *
> + *             |<--- 2MiB region A --->|<--- 2MiB region B --->|
> + *                            [p0|p1]|[p2|p3]
> + *                                    ^ 2MiB boundary
> + *
> + * cross-1g    Across a 1GiB boundary, which is also a 2MiB boundary.
> + *
> + *             |<--- 1GiB region A --->|<--- 1GiB region B --->|
> + *                            [p0|p1]|[p2|p3]
> + *                                    ^ 1GiB boundary
> + */
> +
> +#define RANGE_PAGES 4
> +#define LEAK_BO_SIZE SZ_32M
> +#define LEAK_THRESHOLD SZ_8M
> +
> +static uint64_t align_up(uint64_t value, uint64_t align)
> +{
> +	return (value + align - 1) & ~(align - 1);
> +}
> +
> +static void assert_shmem_released(uint64_t baseline)
> +{
> +	uint64_t now = 0;
> +
> +	for (int i = 0; i < 20; i++) {
> +		now = igt_get_meminfo("Shmem");
> +		if (now < baseline + LEAK_THRESHOLD)
> +			return;
> +		usleep(100 * 1000);
> +	}
> +
> +	igt_assert_f(false, "%" PRIu64 " bytes of shmem still held after close\n", now - baseline);
> +}
> +
> +static void map_range(int fd, uint64_t addr, uint64_t size)
> +{
> +	const uint64_t baseline = igt_get_meminfo("Shmem");
> +	const uint32_t vm_ctx = igt_pvr_ioctl_create_vm_context(fd, 0);
> +	size_t bo_size = LEAK_BO_SIZE;
> +	const uint32_t handle = igt_pvr_ioctl_create_bo(fd, &bo_size);
> +
> +	igt_pvr_ioctl_vm_map(fd, vm_ctx, handle, addr, 0, size);
> +	igt_pvr_ioctl_vm_unmap(fd, vm_ctx, addr, size);
> +
> +	gem_close(fd, handle);
> +	igt_pvr_ioctl_destroy_vm_context(fd, vm_ctx, 0);
> +
> +	assert_shmem_released(baseline);
> +}
> +
> +/*
> + * A new mapping is mapped over an old one. The overlaps follow "DOC: Split and Merge" in
> + * drivers/gpu/drm/drm_gpuvm.c: replace is case 14, remap-next 5, remap-prev 7, remap-both 11.
> + */
> +static void remap_range(int fd, uint64_t old_addr, uint64_t old_size,
> +			uint64_t new_addr, uint64_t new_size)
> +{
> +	const uint64_t baseline = igt_get_meminfo("Shmem");
> +	const uint32_t vm_ctx = igt_pvr_ioctl_create_vm_context(fd, 0);
> +	const uint64_t old_end = old_addr + old_size;
> +	const uint64_t new_end = new_addr + new_size;
> +	size_t size_a = LEAK_BO_SIZE;
> +	size_t size_b = new_size;
> +	const uint32_t handle_a = igt_pvr_ioctl_create_bo(fd, &size_a);
> +	const uint32_t handle_b = igt_pvr_ioctl_create_bo(fd, &size_b);
> +
> +	igt_pvr_ioctl_vm_map(fd, vm_ctx, handle_a, old_addr, 0, old_size);
> +	igt_pvr_ioctl_vm_map(fd, vm_ctx, handle_b, new_addr, 0, new_size);
> +
> +	if (new_addr > old_addr)
> +		igt_pvr_ioctl_vm_unmap(fd, vm_ctx, old_addr, new_addr - old_addr);
> +	igt_pvr_ioctl_vm_unmap(fd, vm_ctx, new_addr, new_size);
> +	if (new_end < old_end)
> +		igt_pvr_ioctl_vm_unmap(fd, vm_ctx, new_end, old_end - new_end);
> +
> +	gem_close(fd, handle_a);
> +	gem_close(fd, handle_b);
> +	igt_pvr_ioctl_destroy_vm_context(fd, vm_ctx, 0);
> +
> +	assert_shmem_released(baseline);
> +}
> +
> +struct place {
> +	const char *name;
> +	uint64_t addr;
> +};
> +
> +int igt_main()
> +{
> +	struct place places[] = { { "in-2m", 0 }, { "cross-2m", 0 }, { "cross-1g", 0 } };
> +	struct drm_pvr_heap heap;
> +	uint64_t size;
> +	int fd;
> +
> +	igt_fixture()
> +	{
> +		fd = drm_open_driver(DRIVER_POWERVR);
> +		heap = igt_pvr_find_general_heap(fd);
> +
> +		size = RANGE_PAGES * sysconf(_SC_PAGESIZE);
> +		places[0].addr = align_up(heap.base, SZ_2M) + SZ_1M;
> +		places[1].addr = align_up(heap.base + 1, SZ_2M) - size / 2;
> +		places[2].addr = align_up(heap.base + 1, SZ_1G) - size / 2;
> +
> +		igt_require(places[2].addr + size <= heap.base + heap.size);
> +	}
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(places); i++) {
> +		const char *name = places[i].name;
> +		const uint64_t addr = places[i].addr;
> +
> +		igt_describe_f("A range can be mapped and unmapped, and the page tables it needs are available (%s)",
> +			       name);
> +		igt_subtest_f("map-%s", name)
> +		{
> +			/*
> +			 * map         |nnnnnnnn|    a range is mapped, then unmapped
> +			 */
> +			map_range(fd, addr, size);
> +		}
> +
> +		igt_describe_f("A mapping that covers an old one replaces it and leaves nothing of it behind (%s)",
> +			       name);
> +		igt_subtest_f("replace-%s", name)
> +		{
> +			/*
> +			 * replace     |  oooo  |    o = old mapping, n = new mapping
> +			 *             |nnnnnnnn|    nothing is left of the old one
> +			 */
> +			remap_range(fd, addr + size / 4, size / 2, addr, size);
> +		}
> +
> +		igt_describe_f("Mapping over the left part of a mapping leaves its right part, and the original "
> +			       "buffer object is released once everything is closed (%s)", name);
> +		igt_subtest_f("remap-next-%s", name)
> +		{
> +			/*
> +			 * remap-next  |oooooooo|    the right part of the old mapping is left
> +			 *             |nnnn    |
> +			 */
> +			remap_range(fd, addr, size, addr, size / 2);
> +		}
> +
> +		igt_describe_f("Mapping over the right part of a mapping leaves its left part, and the original "
> +			       "buffer object is released once everything is closed (%s)", name);
> +		igt_subtest_f("remap-prev-%s", name)
> +		{
> +			/*
> +			 * remap-prev  |oooooooo|    the left part of the old mapping is left
> +			 *             |    nnnn|
> +			 */
> +			remap_range(fd, addr, size, addr + size / 2, size / 2);
> +		}
> +
> +		igt_describe_f("Mapping over the middle of a mapping leaves its left and right parts, and the "
> +			       "original buffer object is released once everything is closed (%s)",
> +			       name);
> +		igt_subtest_f("remap-both-%s", name)
> +		{
> +			/*
> +			 * remap-both  |oooooooo|    left and right parts of the old one are left
> +			 *             |   nn   |
> +			 */
> +			remap_range(fd, addr, size, addr + size / 2, size / 4);
> +		}
> +	}
> +}
> -- 
> 2.43.0
> 
