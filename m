Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8497C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 18:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493B910E0E6;
	Thu, 10 Apr 2025 18:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6QrTrhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EF510E0E6
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 18:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744309192; x=1775845192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VsxN1kPIgdZEnmbWPxowkXI5uK6fBHn5sWNj5GLotZE=;
 b=R6QrTrhERJHNkglgrCUSSg7Z0q6rXNY/xrQmdxwR9oQJyXK3iBbGU+3B
 1g5gLCtIOz7JWQ7AMZXa/xsLG4V+a45rY4boQnnFKSf1ugZtMxdIKu5k2
 FwmDN0ilvw9hLMPztWlNV0UtEFVD6OXLXOqPI6AKZfmFkX6yK9SaWg3I+
 ZQZKaScQ0+VBnoMS9SzsJoFY0ZsAnIB626vC1La4T4He2sVFEem2BwDp7
 ExhJxGQVZy/SSiVbH7F3/SEglINmd2l6RWpj3JPZClFGV8rNWiTb5bKQS
 aAfFEIoSgUMex6Ja2hDASlesctJYNOk2HA3Q4X0Tpvedt1ZKygLZIE6YC A==;
X-CSE-ConnectionGUID: 1DbpNTZOTnqfpSxJYSR39w==
X-CSE-MsgGUID: 51tAMteERTWm37tLRPJ1og==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45746024"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45746024"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 11:19:51 -0700
X-CSE-ConnectionGUID: rXqRZ4LcTxCqmqLBOFwryg==
X-CSE-MsgGUID: gaQZLb9ITsKBcB+QTQtx4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="152157899"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 11:19:49 -0700
Date: Thu, 10 Apr 2025 20:19:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t 2/4] benchmark: Measure allocation time for objects
Message-ID: <20250410181946.dj6yo7sgtvdpgqmr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
References: <20250402164051.671184-1-pravalika.gurram@intel.com>
 <20250402164051.671184-3-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402164051.671184-3-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2025-04-02 at 22:10:49 +0530, Pravalika Gurram wrote:
> A basic measurement, how fast can we create and populate an object with
> backing storage

I have few nits, see below.

> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  benchmarks/meson.build |   1 +
>  benchmarks/xe_create.c | 233 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 234 insertions(+)
>  create mode 100644 benchmarks/xe_create.c
> 
> diff --git a/benchmarks/meson.build b/benchmarks/meson.build
> index 4421ede86..00203c62e 100644
> --- a/benchmarks/meson.build
> +++ b/benchmarks/meson.build
> @@ -22,6 +22,7 @@ benchmark_progs = [
>  	'prime_lookup',
>  	'vgem_mmap',
>          'xe_blt',
> +        'xe_create',
>  ]
>  
>  benchmarksdir = join_paths(libexecdir, 'benchmarks')
> diff --git a/benchmarks/xe_create.c b/benchmarks/xe_create.c
> new file mode 100644
> index 000000000..cd97d6920
> --- /dev/null
> +++ b/benchmarks/xe_create.c
> @@ -0,0 +1,233 @@
> +/*

Use SPDX here.

> + * Copyright © 2025 Intel Corporation
> + *

Remove 'Permission...' - there is SPDX for it.

> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:

'Author:'

> + *    Pravalika Gurram <pravalika.gurram@intel.com>
> + *
> + */
> +
> +#include <unistd.h>

unistd.h could stay here

> +#include <stdlib.h>

Please sort rest of standard headers, first here should be
fcntl.h

> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <errno.h>
> +#include <sys/stat.h>
> +#include <sys/ioctl.h>
> +#include <sys/time.h>
> +#include <time.h>
> +
> +#include "drm.h"
> +#include "drmtest.h"
> +#include "i915/gem_create.h"
> +#include "igt_aux.h"
> +#include "igt_stats.h"
> +#include "intel_reg.h"
> +#include "ioctl_wrappers.h"
> +

Remove this blank line, also sort igt headers.

> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_syncobj.h"
> +#include "intel_reg.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +
> +#define OBJECT_SIZE (1<<23)
> +
> +struct data {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint32_t data;
> +	uint64_t addr;
> +};
> +
> +static double elapsed(const struct timespec *start,
> +				const struct timespec *end)
> +{
> +	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec - start->tv_nsec);
> +}
> +
> +static void store_dword_batch(struct data *data, uint64_t addr, int value)
> +{
> +	int b;
> +	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr = addr + batch_offset;
> +	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr = addr + sdi_offset;
> +
> +	b = 0;
> +
> +	data->batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(data->batch));
> +
> +	data->addr = batch_addr;
> +}
> +static void test_exec(int fd, int busy)
> +{
> +	uint32_t vm;
> +	size_t bo_size;
> +	uint32_t bo = 0;
> +	struct data *data;
> +	uint32_t exec_queue;
> +	uint32_t syncobj;
> +	int value = 0x123456;
> +	uint64_t addr = 0x100000;
> +
> +	struct drm_xe_sync sync = {
> +		.flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +
> +	struct drm_xe_engine_class_instance inst = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +	};
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = sizeof(*data);
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			vram_if_possible(fd, 0),
> +			DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	if (busy) {
> +		syncobj = syncobj_create(fd, 0);
> +		sync.handle = syncobj;
> +
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
> +		data = xe_bo_map(fd, bo, bo_size);
> +		store_dword_batch(data, addr, value);
> +
> +		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +		syncobj_reset(fd, &syncobj, 1);
> +
> +		exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
> +		exec.exec_queue_id = exec_queue;
> +		exec.address = data->addr;
> +		sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> +		xe_exec(fd, &exec);
> +
> +		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +
> +		syncobj_destroy(fd, syncobj);
> +
> +		xe_exec_queue_destroy(fd, exec_queue);
> +	}
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +int main(int argc, char **argv)
> +{
> +	int fd = drm_open_driver(DRIVER_XE);
> +	int size = 0;
> +	int busy = 0;
> +	int reps = 13;
> +	int ncpus = 1;
> +	int c, n, s;
> +
> +	while ((c = getopt (argc, argv, "bs:r:f")) != -1) {
> +		switch (c) {
> +		case 's':
> +			size = atoi(optarg);
> +			break;
> +
> +		case 'r':
> +			reps = atoi(optarg);
> +			if (reps < 1)
> +				reps = 1;
> +			break;
> +
> +		case 'f':
> +			ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +			break;
> +
> +		case 'b':
> +			busy = true;
> +			break;
> +
> +		default:
> +			break;
> +		}
> +	}
> +
> +	if (size == 0) {
> +		for (s = 4096; s <=  OBJECT_SIZE; s <<= 1) {
> +			igt_stats_t stats;
> +
> +			igt_stats_init_with_size(&stats, reps);
> +			for (n = 0; n < reps; n++) {
> +				struct timespec start, end;
> +				uint64_t count = 0;
> +
> +				clock_gettime(CLOCK_MONOTONIC, &start);
> +				do {
> +					for (c = 0; c < 1000; c++)
> +						test_exec(fd, busy);
> +					count += c;
> +					clock_gettime(CLOCK_MONOTONIC, &end);
> +				} while (end.tv_sec - start.tv_sec < 2);
> +
> +				igt_stats_push_float(&stats, count / elapsed(&start, &end));
> +			}
> +			printf("%f\n", igt_stats_get_trimean(&stats));
> +			igt_stats_fini(&stats);
> +		}
> +	} else {

Maybe split this into two functions?

Regards,
Kamil

> +		double *shared;
> +
> +		shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +		for (n = 0; n < reps; n++) {
> +			memset(shared, 0, 4096);
> +
> +			igt_fork(child, ncpus) {
> +				struct timespec start, end;
> +				uint64_t count = 0;
> +
> +				clock_gettime(CLOCK_MONOTONIC, &start);
> +				do {
> +					for (c = 0; c < 1000; c++)
> +						test_exec(fd, busy);
> +					count += c;
> +					clock_gettime(CLOCK_MONOTONIC, &end);
> +				} while (end.tv_sec - start.tv_sec < 2);
> +
> +				shared[child] = count / elapsed(&start, &end);
> +			}
> +			igt_waitchildren();
> +
> +			for (int child = 0; child < ncpus; child++)
> +				shared[ncpus] += shared[child];
> +
> +			printf("%7.3f\n", shared[ncpus]);
> +		}
> +	}
> +
> +	return 0;
> +}
> -- 
> 2.34.1
> 
