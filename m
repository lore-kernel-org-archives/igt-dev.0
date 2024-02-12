Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9296C48297
	for <igt-dev@archiver.kernel.org>; Mon, 12 Feb 2024 14:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9069E10E7B1;
	Mon, 12 Feb 2024 14:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBeEPYiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCC010E7B1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2024 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707748394; x=1739284394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WKnbJYQzTZVnpUM1T6h9lnfIbp//0gMsH6yQVu8/3+s=;
 b=KBeEPYiVZFyWFekzF46hkdy1/QJ3VnAaBd+hzWk9ze5IRsB4vmciwhN0
 83au9Iy0fr6mtdkb6OSwWC3+/sQGl4ej2YuHValEkUaRA9E+pjQTryOK9
 mIlPaSbXJiqKRC7ua4G3M0qKTdWF84e3GmZ7KWzCfHrOF/YNUMSWbi3hs
 zgIVb8uLFnNLNjeUoYkCP6Ft9AYIjigvx9OZMAutXJcFpjlC5Q7BgE46i
 soVeXUkWJZKFVGLkpLeBwdZtL2mzWSyeeiLwFzQNmEYP4E1vNcqYmDoWc
 GVeEgvJwCqFSnypP9bhKe9sQ3KrooDPjb9rhAImz5Bkdvb1VK0/ug20EE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="27170173"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="27170173"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="2899694"
Received: from unknown (HELO localhost) ([10.245.86.45])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:33:12 -0800
Date: Mon, 12 Feb 2024 15:33:09 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/8] tests/intel: replace
 intel_buf_init_using_handle()
Message-ID: <20240212143309.rhqbvf5bpbokwn75@zkempczy-mobl2>
References: <20240209183433.375099-1-matthew.auld@intel.com>
 <20240209183433.375099-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240209183433.375099-5-matthew.auld@intel.com>
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

On Fri, Feb 09, 2024 at 06:34:30PM +0000, Matthew Auld wrote:
> Require the original object size, if the caller created the object and
> convert all existing users over.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_bufops.c                  | 17 ++++++++++-------
>  lib/intel_bufops.h                  | 17 ++++++++++-------
>  tests/intel/gem_set_tiling_vs_blt.c |  7 ++++---
>  3 files changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 914034af6..7f72f4762 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1011,7 +1011,7 @@ void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf)
>  }
>  
>  /**
> - * intel_buf_init_using_handle
> + * intel_buf_init_using_handle_and_size
>   * @bops: pointer to buf_ops
>   * @handle: BO handle created by the caller
>   * @buf: pointer to intel_buf structure to be filled
> @@ -1021,6 +1021,7 @@ void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf)
>   * @alignment: alignment of the stride for linear surfaces
>   * @tiling: surface tiling
>   * @compression: surface compression type
> + * @size: real bo size
>   *
>   * Function configures BO handle within intel_buf structure passed by the caller
>   * (with all its metadata - width, height, ...). Useful if BO was created
> @@ -1029,14 +1030,16 @@ void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf)
>   * Note: intel_buf_close() can be used because intel_buf is aware it is not
>   * buffer owner so it won't close it underneath.
>   */
> -void intel_buf_init_using_handle(struct buf_ops *bops,
> -				 uint32_t handle,
> -				 struct intel_buf *buf,
> -				 int width, int height, int bpp, int alignment,
> -				 uint32_t req_tiling, uint32_t compression)
> +void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
> +					  uint32_t handle,
> +					  struct intel_buf *buf,
> +					  int width, int height, int bpp, int alignment,
> +					  uint32_t req_tiling, uint32_t compression,
> +					  uint64_t size)
>  {
> +	igt_assert(handle);

I would assert on size either.

>  	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
> -			 req_tiling, compression, 0, 0, -1, DEFAULT_PAT_INDEX);
> +			 req_tiling, compression, size, 0, -1, DEFAULT_PAT_INDEX);
>  }
>  
>  /**
> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> index 54a143c5b..75ddf5d4c 100644
> --- a/lib/intel_bufops.h
> +++ b/lib/intel_bufops.h
> @@ -154,7 +154,8 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
>  				 uint32_t handle,
>  				 struct intel_buf *buf,
>  				 int width, int height, int bpp, int alignment,
> -				 uint32_t req_tiling, uint32_t compression);
> +				 uint32_t req_tiling, uint32_t compression,
> +				 uint64_t size);

Hmm, is this intel_buf_init_using_handle() prototype or it should be
intel_buf_init_using_handle_and_size()? I'm not sure why this diff
looks so.

>  void intel_buf_init_full(struct buf_ops *bops,
>  			 uint32_t handle,
>  			 struct intel_buf *buf,
> @@ -172,12 +173,14 @@ struct intel_buf *intel_buf_create(struct buf_ops *bops,
>  				   int bpp, int alignment,
>  				   uint32_t req_tiling, uint32_t compression);
>  
> -struct intel_buf *intel_buf_create_using_handle(struct buf_ops *bops,
> -						uint32_t handle,
> -						int width, int height,
> -						int bpp, int alignment,
> -						uint32_t req_tiling,
> -						uint32_t compression);
> +void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
> +					  uint32_t handle,
> +					  struct intel_buf *buf,
> +					  int width, int height,
> +					  int bpp, int alignment,
> +					  uint32_t req_tiling,
> +					  uint32_t compression,
> +					  uint64_t size);
>  
>  struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
>  							 uint32_t handle,
> diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
> index e9d5e3c63..9077e0f3f 100644
> --- a/tests/intel/gem_set_tiling_vs_blt.c
> +++ b/tests/intel/gem_set_tiling_vs_blt.c
> @@ -138,9 +138,10 @@ static void do_test(struct buf_ops *bops, uint32_t tiling, unsigned stride,
>  	gem_munmap(ptr, TEST_SIZE);
>  
>  	/* Reuse previously aligned in the gtt object */
> -	intel_buf_init_using_handle(bops, test_buf->handle, test_buf,
> -				    TEST_WIDTH(stride), TEST_HEIGHT(stride), 32,
> -				    0, tiling, I915_COMPRESSION_NONE);
> +	intel_buf_init_using_handle_and_size(bops, test_buf->handle, test_buf,
> +					     TEST_WIDTH(stride), TEST_HEIGHT(stride), 32,
> +					     0, tiling, I915_COMPRESSION_NONE,
> +					     test_buf->bo_size);
>  	igt_assert_eq_u32(intel_buf_size(test_buf), TEST_SIZE);
>  	intel_buf_set_ownership(test_buf, true);
>  	intel_bb_add_intel_buf(ibb, test_buf, false);
> -- 
> 2.43.0
> 

Rest is correct imo:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
