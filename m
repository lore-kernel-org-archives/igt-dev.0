Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D638CCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 11:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D286E10E25A;
	Tue,  4 Nov 2025 11:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="npcS+My9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E57A10E25A
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762254025; x=1793790025;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XRp/Z3DWYN+uy4emK4XQg6ys9ByQnIXzCQD6V9Ts0kI=;
 b=npcS+My9QaZfbEdfMyg44aGrHQ0EH+4iOF+sqaWcE0OXfTo2+aXEELx6
 yicRjRcap/GU7cvrc5IKftEK5pPuKW7MNwhbgh4WEDayhOfs3yC3UwDVg
 hUangl9dy48QOR/erCn42nG0U1sRGiOghFWBCwcjgZop1dOnY4SY11xto
 7seqKGfhCz6GaoLC1m7TbaEued6dOPelMJ86o28HRr1vwt2l4IH0TE53G
 Z39I01cg9A6GNqBisjK0yVEGioa5zw0TcWBupoNTVMveZbs7sEIEqCvbv
 6RecXOjaKnqg8+hBHrurmI4EtFjU50ouVlD1vhCnE0EBySYW4Pw7C1oBk g==;
X-CSE-ConnectionGUID: QWCrff5FQOCes2p+tFrZdA==
X-CSE-MsgGUID: wVvzBLh+SdiRUlSTfRCvjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68204432"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="68204432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:00:25 -0800
X-CSE-ConnectionGUID: lu/80iccTi2Cq+h8C6JWOQ==
X-CSE-MsgGUID: ijaLp+E6Qy2d89NdlAmPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="187436849"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 03:00:23 -0800
Date: Tue, 4 Nov 2025 12:00:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] lib/ioct_wrappers: add __prime_fd_to_handle()
Message-ID: <20251104110006.vpj5io2rqsots4ed@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 igt-dev@lists.freedesktop.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
References: <20251103131244.28703-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251103131244.28703-3-matthew.auld@intel.com>
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

Hi Matthew,
On 2025-11-03 at 13:12:45 +0000, Matthew Auld wrote:
> We want to be able to intercept the error, if there is one, instead of
> always asserting a non-zero error. Add a version of prime_fd_to_handle()
> which allows to caller to handle the error.

s/to caller/the caller/

> 
> v2:
>   - Ensure we use errno.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  lib/ioctl_wrappers.c | 27 +++++++++++++++++++++++++++
>  lib/ioctl_wrappers.h |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 176cbdacc..e5b60951e 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -1139,6 +1139,33 @@ int prime_handle_to_fd_for_mmap(int fd, uint32_t handle)
>  	return args.fd;
>  }
>  
> +/**
> + * __prime_fd_to_handle:
> + * @fd: open i915 drm file descriptor

s/i915// as this is not only for i915

Rest looks ok.

Regards,
Kamil

> + * @dma_buf_fd: dma-buf fd handle
> + * @handle: output handle
> + *
> + * This wraps the PRIME_FD_TO_HANDLE ioctl, which is used to import a dma-buf
> + * file-descriptor into a gem buffer object.
> + *
> + * Returns: Zero one succeess, error code otherwise
> + */
> +int __prime_fd_to_handle(int fd, int dma_buf_fd, uint32_t *handle)
> +{
> +	struct drm_prime_handle args;
> +
> +	memset(&args, 0, sizeof(args));
> +	args.fd = dma_buf_fd;
> +	args.flags = 0;
> +	args.handle = 0;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &args))
> +		return -errno;
> +
> +	*handle = args.handle;
> +	return 0;
> +}
> +
>  /**
>   * prime_fd_to_handle:
>   * @fd: open i915 drm file descriptor
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index 7cf05e626..5a899f052 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -138,6 +138,7 @@ int prime_handle_to_fd(int fd, uint32_t handle);
>  #endif
>  int prime_handle_to_fd_for_mmap(int fd, uint32_t handle);
>  uint32_t prime_fd_to_handle(int fd, int dma_buf_fd);
> +int __prime_fd_to_handle(int fd, int dma_buf_fd, uint32_t *handle);
>  off_t prime_get_size(int dma_buf_fd);
>  void prime_sync_start(int dma_buf_fd, bool write);
>  void prime_sync_end(int dma_buf_fd, bool write);
> -- 
> 2.51.1
> 
