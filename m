Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70CBC54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 15:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A6810E563;
	Mon,  2 Jun 2025 15:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApvgibJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F42910E558
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748879405; x=1780415405;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4ZnO2hfR8nCq8MhVbpsGUGpdmT7dxcvJse26ggZqjYk=;
 b=ApvgibJPnPJUEUAdnCprAdK29WjvDFYu9MSxdTrEiOLDJ/zabLtLHkPp
 pBqBy1oNscOyKqPhzhvEnic/9+WcOaCJHc3/KJN+Rnm77AORnqcP7IFvj
 1wkeDLZCT1vdJQHKr5Ju+p77xlhiZHXQ7sacQ8AMHygtdNYsLbupGBVSE
 fOo4/fE2HotvsiluD5dqjn6VYAn19nDixVVBiLPozDvbssP9Q2TuEld8+
 Az6xWEBEGhAYdHTYSx4drAtyzR70VFWIwoaWfJ69lMRmyayRIlfwswsZO
 fHa7VH/OaOUr+HBSdqOIqx3TdnOu0ZETHA6Ve40rImhzwaguXVbPUtn1k Q==;
X-CSE-ConnectionGUID: l+pa8gUJRpazOGiIJ3rC9w==
X-CSE-MsgGUID: 2ON8iO0eRj6iUjK2o5JG3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68441791"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="68441791"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:50:05 -0700
X-CSE-ConnectionGUID: I7b5KeczSL+1ITzC4N+XIQ==
X-CSE-MsgGUID: fkxcu8I1TeOMW0bnKPLqKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="148430073"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:50:04 -0700
Date: Mon, 2 Jun 2025 17:50:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org, Alex Zuo <alex.zuo@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: Re: [PATCH] tests/intel/xe_vm: Fix assertion of batch buffer size
Message-ID: <20250602155001.pc7j4tzbkxanrn3p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org, Alex Zuo <alex.zuo@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
References: <20250530001844.703844-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530001844.703844-1-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2025-05-30 at 00:18:44 +0000, Shuicheng Lin wrote:
> The batch buffer pointer is data not data[i]. Correct it in the assertion.
> Fix a word typo error.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Alex Zuo <alex.zuo@intel.com>
> Cc: Zongyao Bai <zongyao.bai@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

One more nit, please reply to CI failures with Cc given in it's mails:
I915-ci-infra@lists.freedesktop.org

You could look into few other series about how to do it,
for example series 'Update "force_reset" code'
(or check mailing list and search ones with reply from failure)

https://lore.kernel.org/igt-dev/870db824-04d1-4246-bcab-dfe2bbd023ee@intel.com/

https://lore.kernel.org/igt-dev/5fbb0f13-ee0b-4dff-a42d-c575375fc64e@intel.com/

Note also that reply cuts main text to keep only relevant part.

Regards,
Kamil

> ---
>  tests/intel/xe_vm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index b5bba7b7e..94cca13ba 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1719,7 +1719,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  	addr = base_addr;
>  
>  	/*
> -	 * Kick a thread to write the first page continously to ensure we can't
> +	 * Kick a thread to write the first page continuously to ensure we can't
>  	 * cause a fault if a rebind occurs during munmap style VM unbind
>  	 * (partial VMAs unbound).
>  	 */
> @@ -1750,7 +1750,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  		data->batch[b++] = sdi_addr >> 32;
>  		data->batch[b++] = 0xc0ffee;
>  		data->batch[b++] = MI_BATCH_BUFFER_END;
> -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +		igt_assert(b <= ARRAY_SIZE(data->batch));
>  
>  		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>  		if (i)
> @@ -1807,7 +1807,7 @@ try_again_after_invalidate:
>  			data->batch[b++] = sdi_addr >> 32;
>  			data->batch[b++] = 0xc0ffee;
>  			data->batch[b++] = MI_BATCH_BUFFER_END;
> -			igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +			igt_assert(b <= ARRAY_SIZE(data->batch));
>  
>  			sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>  			syncobj_reset(fd, &sync[1].handle, 1);
> @@ -1878,7 +1878,7 @@ try_again_after_invalidate:
>  		data->batch[b++] = sdi_addr >> 32;
>  		data->batch[b++] = 0xc0ffee;
>  		data->batch[b++] = MI_BATCH_BUFFER_END;
> -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +		igt_assert(b <= ARRAY_SIZE(data->batch));
>  
>  		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>  		syncobj_reset(fd, &sync[1].handle, 1);
> @@ -2056,7 +2056,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>  		data->batch[b++] = sdi_addr >> 32;
>  		data->batch[b++] = 0xc0ffee;
>  		data->batch[b++] = MI_BATCH_BUFFER_END;
> -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +		igt_assert(b <= ARRAY_SIZE(data->batch));
>  
>  		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>  		if (i)
> @@ -2115,7 +2115,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>  		data->batch[b++] = sdi_addr >> 32;
>  		data->batch[b++] = 0xc0ffee;
>  		data->batch[b++] = MI_BATCH_BUFFER_END;
> -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +		igt_assert(b <= ARRAY_SIZE(data->batch));
>  
>  		data = map1 + i * page_size;
>  		b = 0;
> @@ -2124,7 +2124,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>  		data->batch[b++] = sdi_addr >> 32;
>  		data->batch[b++] = 0xc0ffee;
>  		data->batch[b++] = MI_BATCH_BUFFER_END;
> -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +		igt_assert(b <= ARRAY_SIZE(data->batch));
>  
>  		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>  		if (i)
> -- 
> 2.25.1
> 
