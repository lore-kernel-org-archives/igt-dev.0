Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51971C3DA59
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 05:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAA310E360;
	Mon, 22 Jul 2024 05:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaHDFib+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7110C10E363
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 05:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721627864; x=1753163864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3CjNBtZE5g3OmS8N7+5gsJbIbBkQtfhUiUjZPd8I8OQ=;
 b=HaHDFib+aaDRxfg5MCEHd4adc9/ayqOTMmft+OsYFM7CvFEZzsPtsm7t
 kByXm9iftEOO8SmoOpM3FdIDjLjZRLTbY8b37HWnggSmhiyKkDHCY0zpP
 naGbOo4K3jCwcLdUkDP5+tgt5RLrCE5V2Jf4yQtNc0/CzmhShqDYOGSi1
 pL4XiAOrGQh/HFAFq1W0nx8/66Jy6WCLRXJ5NXMdQQ+gcG9Tu9pLpgpdl
 knffoVgBy4dbxs2hM5Sn+LsRIDm+JkzBiEbdCfEaE2xdse64NpqZOpbt4
 LKdNM8OU071hvg6LFPuhCY9OxPco2+eT31h5lWx1wPfysSPyQnpxGAk57 g==;
X-CSE-ConnectionGUID: faYLi6AeSvOWmyrZfRNBeA==
X-CSE-MsgGUID: 8Holrn7+SHWa484l2sLU0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19138522"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="19138522"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2024 22:57:43 -0700
X-CSE-ConnectionGUID: HNsVaPKpTFO4sinusMlp9w==
X-CSE-MsgGUID: ihT8vS5LTXGWwS6PLJtnKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="82790009"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2024 22:57:41 -0700
Date: Mon, 22 Jul 2024 07:57:38 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_vm: Add test for 64k page corners
Message-ID: <20240722055738.wndtosfozamza3fd@zkempczy-mobl2>
References: <20240719191126.1535811-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719191126.1535811-1-matthew.brost@intel.com>
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

On Fri, Jul 19, 2024 at 12:11:26PM -0700, Matthew Brost wrote:
> Add sections which split compact 64k pages in 4k pages.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_vm.c | 128 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index a4f6c7a0b4..d507e7cb16 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -366,6 +366,128 @@ static void userptr_invalid(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +/**
> + * SUBTEST: compact-64k-pages
> + * Description:
> + *	Take corner cases related to compact and 64k pages
> + * Functionality: bind
> + * Test category: functionality test
> + */
> +static void compact_64k_pages(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	size_t page_size = xe_get_default_alignment(fd);
> +	uint64_t addr0 = 0x10000000ull, addr1;
> +	uint32_t vm;
> +	uint32_t bo0, bo1;
> +	uint32_t exec_queue;
> +	void *ptr0, *ptr1;
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data = NULL;
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	int i, b;
> +
> +#define EIGHT_MB	0x800000
> +#define SIXTY_FOUR_KB	0x10000

You may use SZ_8M and SZ_64K.

> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	bo0 = xe_bo_create(fd, vm, EIGHT_MB,
> +			   vram_if_possible(fd, eci->gt_id),
> +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	ptr0 = xe_bo_map(fd, bo0, EIGHT_MB);
> +
> +	bo1 = xe_bo_create(fd, vm, EIGHT_MB / 2,
> +			   vram_if_possible(fd, eci->gt_id),
> +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	ptr1 = xe_bo_map(fd, bo1, EIGHT_MB / 2);
> +
> +	sync[0].handle = syncobj_create(fd, 0);
> +	if (page_size == 0x1000) {
> +		/* Setup mapping to split a 64k PTE in cache */
> +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SIXTY_FOUR_KB, 0, 0);
> +
> +		addr1 = addr0 + (SIXTY_FOUR_KB / 2);
> +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SIXTY_FOUR_KB / 2,
> +				 sync, 1);

Won't this bind assert as it's overlaps first addr0 (+SZ_64K)?


> +	} else if (page_size == SIXTY_FOUR_KB) {
> +		addr0 += page_size;
> +
> +		/* Setup mapping to split compact 64k pages */
> +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, EIGHT_MB, 0, 0);
> +
> +		addr1 = addr0 + (EIGHT_MB / 4);
> +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, EIGHT_MB / 2,
> +				 sync, 1);

Similar to the above.

> +	}
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	/* Verify 1st mapping working */
> +	i = 0;
> +	{
> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr = addr0 + batch_offset;
> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr = addr0 + sdi_offset;
> +		data = ptr0;
> +
> +		b = 0;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +		data[i].batch[b++] = sdi_addr;
> +		data[i].batch[b++] = sdi_addr >> 32;
> +		data[i].batch[b++] = 0xc0ffee;
> +
> +		sdi_addr = addr1 + sdi_offset;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +		data[i].batch[b++] = sdi_addr;
> +		data[i].batch[b++] = sdi_addr >> 32;
> +		data[i].batch[b++] = 0xc0ffee;
> +
> +		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +
> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].handle = syncobj_create(fd, 0);
> +		exec.exec_queue_id = exec_queue;
> +		exec.address = batch_addr;
> +		xe_exec(fd, &exec);
> +
> +		igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0,
> +					NULL));
> +		igt_assert_eq(data[i].data, 0xc0ffee);
> +		data = ptr1;
> +		igt_assert_eq(data[i].data, 0xc0ffee);
> +	}

May you introduce a function instead of adding block here?

--
Zbigniew

> +
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	syncobj_reset(fd, &sync[0].handle, 1);
> +	xe_vm_unbind_all_async(fd, vm, 0, bo0, 0, 0);
> +	xe_vm_unbind_all_async(fd, vm, 0, bo1, sync, 1);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, sync[1].handle);
> +	munmap(ptr0, EIGHT_MB);
> +	munmap(ptr1, EIGHT_MB / 2);
> +	gem_close(fd, bo0);
> +	gem_close(fd, bo1);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: shared-%s-page
>   * Description: Test shared arg[1] page
> @@ -1973,6 +2095,12 @@ igt_main
>  	igt_subtest("bind-flag-invalid")
>  		bind_flag_invalid(fd);
>  
> +	igt_subtest("compact-64k-pages")
> +		xe_for_each_engine(fd, hwe) {
> +			compact_64k_pages(fd, hwe);
> +			break;
> +		}
> +
>  	igt_subtest("shared-pte-page")
>  		xe_for_each_engine(fd, hwe)
>  			shared_pte_page(fd, hwe, 4,
> -- 
> 2.34.1
> 
