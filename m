Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF353CEF152
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 11:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C4710E1DD;
	Tue,  8 Oct 2024 11:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzWvR2n+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB9110E1DD
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 11:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728387699; x=1759923699;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YJsgX44IT1lk+BTKHzygw20FJDIfpqYzl0NC4JzcA7E=;
 b=RzWvR2n+E2zWTqOZzQo2+4DUZkEHCit5QAyElNSpzhIIe9Ok9IMR2+ey
 851Nk+y7ssFAXeG1MBJSelJtDNJqd0oVSzugpzIlnT46BPCEd/Job682i
 QMvGD1UFMM1beOPJ/exriXP9rtNtnIEuJ+yPNm8n12mD6Ka1D1nUQXgUN
 vPeuc05s9zIXc4jQYtYdiYYaXFpOX2IB+wZbknSWV/7EgmIqslotNjIsq
 ual08osffEy+nwtnTPtSutcLkd0TUkjdunuJgGNRh+oUFtCf/Yci6Wihw
 axdOxoxwQtTJ1l7fQVNQWbk/V2BaC/MNN2zCMbjK3BxoyLaUnhc/kImpo A==;
X-CSE-ConnectionGUID: lkG81h7gQROa/JLmuZ7uBg==
X-CSE-MsgGUID: dqOI2NK1TquWwsOjzNC4Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31272154"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31272154"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 04:41:39 -0700
X-CSE-ConnectionGUID: 7h82nvTYQpuymMuq6DUoGg==
X-CSE-MsgGUID: O8rD2mWaSSqbT9xxBkoAmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="76070134"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.62])
 ([10.245.245.62])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 04:41:38 -0700
Message-ID: <4bc85abc-163b-40fb-bed0-f93875c4ba6a@intel.com>
Date: Tue, 8 Oct 2024 12:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tests/intel/xe_dma_buf_sync: Update dma-buf sync to
 use import read / write deps
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
References: <20240912223110.1054974-1-matthew.brost@intel.com>
 <20240912223110.1054974-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240912223110.1054974-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/09/2024 23:31, Matthew Brost wrote:
> The KMD was incorrectly setting write dependencies on all external BOs
> when the read / write dependencies should be set via import IOCTLs in
> user space. Update xe_dma_buf_sync to reflect this behavior.
> 
> While we are here, test all read / write dependency combinations and
> update test documentation.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I assume the job timeout reported by CI is expected and is just because 
we are not testing with the fix from the KMD side?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_dma_buf_sync.c | 137 +++++++++++++++++++---------------
>   1 file changed, 76 insertions(+), 61 deletions(-)
> 
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index 7af80dd2f2..3e8d89e950 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -21,69 +21,48 @@
>   #include "xe/xe_spin.h"
>   #include <string.h>
>   #include <linux/dma-buf.h>
> +#include <lib/dmabuf_sync_file.h>
>   #include <poll.h>
>   
>   #define MAX_N_BO	16
>   #define N_FD		2
>   
> -#define READ_SYNC	(0x1 << 0)
> -
> -struct igt_dma_buf_sync_file {
> -	__u32 flags;
> -	__s32 fd;
> -};
> -
> -#define IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE \
> -	_IOWR(DMA_BUF_BASE, 2, struct igt_dma_buf_sync_file)
> -
> -static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
> -{
> -	struct igt_dma_buf_sync_file arg;
> -
> -	arg.flags = flags;
> -	arg.fd = -1;
> -	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
> -
> -	return arg.fd;
> -}
> -
> -static bool dmabuf_busy(int dmabuf, uint32_t flags)
> -{
> -	struct pollfd pfd = { .fd = dmabuf };
> -
> -	/* If DMA_BUF_SYNC_WRITE is set, we don't want to set POLLIN or
> -	 * else poll() may return a non-zero value if there are only read
> -	 * fences because POLLIN is ready even if POLLOUT isn't.
> -	 */
> -	if (flags & DMA_BUF_SYNC_WRITE)
> -		pfd.events |= POLLOUT;
> -	else if (flags & DMA_BUF_SYNC_READ)
> -		pfd.events |= POLLIN;
> -
> -	return poll(&pfd, 1, 0) == 0;
> -}
> -
> -static bool sync_file_busy(int sync_file)
> -{
> -	struct pollfd pfd = { .fd = sync_file, .events = POLLIN };
> -	return poll(&pfd, 1, 0) == 0;
> -}
> +#define WRITE_SYNC	(0x1 << 0)
> +#define READ_SYNC	(0x1 << 1)
> +#define READ_WRITE_SYNC	(0x1 << 2)
> +#define WRITE_READ_SYNC	(0x1 << 3)
>   
>   /**
> - * SUBTEST: export-dma-buf-once
> - * Description: Test exporting a sync file from a dma-buf
> + * SUBTEST: export-dma-buf-once-write-sync
> + * Description: Test exporting a sync file from a dma-buf with write deps once
>    * Functionality: export
>    *
>    * SUBTEST: export-dma-buf-once-read-sync
> - * Description: Test export prime BO as sync file and verify business
> + * Description: Test exporting a sync file from a dma-buf with read deps once
> + * Functionality: export
> + *
> + * SUBTEST: export-dma-buf-once-read-write-sync
> + * Description: Test exporting a sync file from a dma-buf with read followed by write deps once
>    * Functionality: export
>    *
> - * SUBTEST: export-dma-buf-many
> - * Description: Test exporting many sync files from a dma-buf
> + * SUBTEST: export-dma-buf-once-write-read-sync
> + * Description: Test exporting a sync file from a dma-buf with write followed by read deps once
> + * Functionality: export
> + *
> + * SUBTEST: export-dma-buf-many-write-sync
> + * Description: Test exporting a sync file from a dma-buf with write deps many times
>    * Functionality: export
>    *
>    * SUBTEST: export-dma-buf-many-read-sync
> - * Description: Test export many prime BO as sync file and verify business
> + * Description: Test exporting a sync file from a dma-buf with read deps many times
> + * Functionality: export
> + *
> + * SUBTEST: export-dma-buf-many-read-write-sync
> + * Description: Test exporting a sync file from a dma-buf with read followed by write deps many times
> + * Functionality: export
> + *
> + * SUBTEST: export-dma-buf-many-write-read-sync
> + * Description: Test exporting a sync file from a dma-buf with write followed by read deps many times
>    * Functionality: export
>    */
>   
> @@ -145,7 +124,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>   		uint64_t sdi_addr = addr + sdi_offset;
>   		uint64_t spin_offset = (char *)&data[i]->spin - (char *)data[i];
>   		struct drm_xe_sync sync[2] = {
> -			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, },
> +			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>   			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>   		};
>   		struct drm_xe_exec exec = {
> @@ -153,26 +132,41 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>   			.syncs = to_user_pointer(sync),
>   		};
>   		struct xe_spin_opts spin_opts = { .addr = addr + spin_offset, .preempt = true };
> -		uint32_t syncobj;
> +		uint32_t syncobj, syncobj_signal;
>   		int b = 0;
> -		int sync_fd;
> +		int sync_fd, syncobj_fd;
>   
>   		/* Write spinner on FD[0] */
>   		xe_spin_init(&data[i]->spin, &spin_opts);
> +		syncobj_signal = syncobj_create(fd[0], 0);
>   		exec.exec_queue_id = exec_queue[0];
>   		exec.address = spin_opts.addr;
> +		exec.num_syncs = 1;
> +		sync[0].handle = syncobj_signal;
>   		xe_exec(fd[0], &exec);
>   
> +
> +		syncobj_fd = syncobj_handle_to_fd(fd[0], syncobj_signal,
> +						  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE);
> +
> +		/* Set read / write deps */
> +		if (flags & (READ_SYNC | READ_WRITE_SYNC))
> +			dmabuf_import_sync_file(dma_buf_fd[i],
> +						DMA_BUF_SYNC_READ, syncobj_fd);
> +		else
> +			dmabuf_import_sync_file(dma_buf_fd[i],
> +						DMA_BUF_SYNC_WRITE, syncobj_fd);
> +
>   		/* Export prime BO as sync file and veify business */
> -		if (flags & READ_SYNC)
> +		if (flags & (READ_SYNC | WRITE_READ_SYNC))
>   			sync_fd = dmabuf_export_sync_file(dma_buf_fd[i],
>   							  DMA_BUF_SYNC_READ);
>   		else
>   			sync_fd = dmabuf_export_sync_file(dma_buf_fd[i],
>   							  DMA_BUF_SYNC_WRITE);
>   		xe_spin_wait_started(&data[i]->spin);
> -		igt_assert(sync_file_busy(sync_fd));
> -		igt_assert(dmabuf_busy(dma_buf_fd[i], DMA_BUF_SYNC_READ));
> +		if (!(flags & READ_SYNC))
> +			igt_assert(sync_file_busy(sync_fd));
>   
>   		/* Convert sync file to syncobj */
>   		syncobj = syncobj_create(fd[1], 0);
> @@ -185,6 +179,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>   		data[i]->batch[b++] = 0xc0ffee;
>   		data[i]->batch[b++] = MI_BATCH_BUFFER_END;
>   		igt_assert(b <= ARRAY_SIZE(data[i]->batch));
> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>   		sync[0].handle = syncobj;
>   		sync[1].handle = syncobj_create(fd[1], 0);
>   		exec.exec_queue_id = exec_queue[1];
> @@ -194,9 +189,15 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>   
>   		/* Verify exec blocked on spinner / prime BO */
>   		usleep(5000);
> -		igt_assert(!syncobj_wait(fd[1], &sync[1].handle, 1, 1, 0,
> -					 NULL));
> -		igt_assert_eq(data[i]->data, 0x0);
> +		if (flags & READ_SYNC) {
> +			igt_assert(syncobj_wait(fd[1], &sync[1].handle, 1, INT64_MAX,
> +						0, NULL));
> +			igt_assert_eq(data[i]->data, 0xc0ffee);
> +		} else {
> +			igt_assert(!syncobj_wait(fd[1], &sync[1].handle, 1, 1, 0,
> +						 NULL));
> +			igt_assert_eq(data[i]->data, 0x0);
> +		}
>   
>   		/* End spinner and verify exec complete */
>   		xe_spin_end(&data[i]->spin);
> @@ -205,9 +206,11 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>   		igt_assert_eq(data[i]->data, 0xc0ffee);
>   
>   		/* Clean up */
> +		syncobj_destroy(fd[0], syncobj_signal);
>   		syncobj_destroy(fd[1], sync[0].handle);
>   		syncobj_destroy(fd[1], sync[1].handle);
>   		close(sync_fd);
> +		close(syncobj_fd);
>   		addr += bo_size;
>   	}
>   
> @@ -238,11 +241,11 @@ igt_main
>   			}
>   	}
>   
> -	igt_subtest("export-dma-buf-once")
> -		test_export_dma_buf(hwe0, hwe1, 1, 0);
> +	igt_subtest("export-dma-buf-once-write-sync")
> +		test_export_dma_buf(hwe0, hwe1, 1, WRITE_SYNC);
>   
> -	igt_subtest("export-dma-buf-many")
> -		test_export_dma_buf(hwe0, hwe1, 16, 0);
> +	igt_subtest("export-dma-buf-many-write-sync")
> +		test_export_dma_buf(hwe0, hwe1, 16, WRITE_SYNC);
>   
>   	igt_subtest("export-dma-buf-once-read-sync")
>   		test_export_dma_buf(hwe0, hwe1, 1, READ_SYNC);
> @@ -250,6 +253,18 @@ igt_main
>   	igt_subtest("export-dma-buf-many-read-sync")
>   		test_export_dma_buf(hwe0, hwe1, 16, READ_SYNC);
>   
> +	igt_subtest("export-dma-buf-once-read-write-sync")
> +		test_export_dma_buf(hwe0, hwe1, 1, READ_WRITE_SYNC);
> +
> +	igt_subtest("export-dma-buf-many-read-write-sync")
> +		test_export_dma_buf(hwe0, hwe1, 16, READ_WRITE_SYNC);
> +
> +	igt_subtest("export-dma-buf-once-write-read-sync")
> +		test_export_dma_buf(hwe0, hwe1, 1, WRITE_READ_SYNC);
> +
> +	igt_subtest("export-dma-buf-many-write-read-sync")
> +		test_export_dma_buf(hwe0, hwe1, 16, WRITE_READ_SYNC);
> +
>   	igt_fixture
>   		drm_close_driver(fd);
>   }
