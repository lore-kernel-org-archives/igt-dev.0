Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B261C52D7B
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 16:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C51510E4E9;
	Wed, 14 Aug 2024 16:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxLH9t26";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B4E10E4E9
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723654103; x=1755190103;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=s5XwdL4WmGNnG46pURVRBlfesASlPp7E6kkJ46H6vNM=;
 b=YxLH9t260A2SU47FTmpRR3imj3OHSvsbddQn/2+YXBrQ7E6043M1hck/
 YZNOYGFiUe8yt2Uegw0/oxE7NSj/J6FWOV/yTRCREvtz3G8qO+ehPjzvR
 y54vZnhpcQ8HSZXVXMnRPlA06xCZjDwsxkhuzJdO8wbNb3o5aZkAjSo0S
 kXKQkjdbIhkIFVwbEb8cfacN4xDgGifjQdDAXzTRSwoteNS6R9hbrX2vq
 xRrvByfUfllWgQlM8tQCuGS3XEabNNOE/vkpKXTzzH/5ClpUYr4n+G7QN
 i/fekoaZRiN+j80aimOnJ38PYQqVibA2nOY1mPKzDmS6h/CNvfCwnI2SF Q==;
X-CSE-ConnectionGUID: vIM8Z/BCRV2Y9GfJutMrCg==
X-CSE-MsgGUID: PF2rbaxOTzaCrOF1uri1TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33270710"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="33270710"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 09:48:22 -0700
X-CSE-ConnectionGUID: MlKSucj1TKOdFrd+GeH+jA==
X-CSE-MsgGUID: Sp/1jYT0TCCsEVaac27fEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="82296698"
Received: from olympicsflex3.amr.corp.intel.com (HELO [10.245.245.31])
 ([10.245.245.31])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 09:48:21 -0700
Message-ID: <65bdf684-e606-41e1-8744-dafb878c809a@intel.com>
Date: Wed, 14 Aug 2024 17:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_vm: Add BO partial mmap test
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
References: <20240814155854.3846990-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240814155854.3846990-1-matthew.brost@intel.com>
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

On 14/08/2024 16:58, Matthew Brost wrote:
> Ensure BO partial mmap works by setting a BO to 0, partially mmap BO and
> setting to a canned value, and then mmap entire BO ensure data
> integrity.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_vm.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index c3960fedee..57534a2a8c 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -106,6 +106,56 @@ test_scratch(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: bo-mmap-partial
> + * Description: Test partially mmap of a BO
> + * Functionality: BO mmap
> + * Test category: functionality test
> + */
> +
> +static void test_bo_mmap_partial(int fd, size_t bo_size)
> +{
> +#define MMAP_VALUE(idx)	((0xdeadull << 32) | idx)
> +	uint32_t bo;
> +	uint64_t offset;
> +	uint64_t *ptr;
> +	size_t partial_size = bo_size / 2;
> +	void *map;
> +	int i, j;
> +
> +	bo = xe_bo_create(fd, 0, bo_size, vram_if_possible(fd, 0),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	/* Set to zero */
> +	map = xe_bo_map(fd, bo, bo_size);
> +	memset(map, 0, bo_size);
> +	munmap(map, bo_size);
> +
> +	/* Partial map */
> +	offset = xe_bo_mmap_offset(fd, bo);
> +	map = mmap(NULL, partial_size, PROT_WRITE, MAP_SHARED, fd,
> +		   offset + partial_size);

So does this also then fail with:

 > +	map = mmap(NULL, partial_size, PROT_WRITE, MAP_SHARED, fd,
 > +		   offset);

Or it that allowed? From looking at the kernel side it looks like it's 
maybe not rejected?

Also you can get partial mapping with partial munmap, should we also 
test that to make sure nothing blows up?

> +	igt_assert(map != MAP_FAILED);
> +	ptr = map;
> +	for (i = 0, j = partial_size / sizeof(uint64_t);
> +	     j < bo_size / sizeof(uint64_t); ++i, ++j)
> +		ptr[i] = MMAP_VALUE(j);
> +	munmap(map, partial_size);
> +
> +	/* Map entire BO and check */
> +	map = xe_bo_map(fd, bo, bo_size);
> +	ptr = map;
> +	for (i = 0; i < bo_size / sizeof(uint64_t); ++i) {
> +		if (i < partial_size / sizeof(uint64_t))
> +			igt_assert_eq(ptr[i], 0);
> +		else
> +			igt_assert_eq(ptr[i], MMAP_VALUE(i));
> +	}
> +	munmap(map, bo_size);
> +	gem_close(fd, bo);
> +#undef MMAP_VALUE
> +}
> +
>   static void
>   __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
>   {
> @@ -2354,6 +2404,9 @@ igt_main
>   			}
>   	}
>   
> +	igt_subtest("bo-mmap-partial")
> +		test_bo_mmap_partial(fd, SZ_2M);
> +
>   	igt_subtest("bind-once")
>   		test_bind_once(fd);
>   
