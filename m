Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC768CF885C
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 14:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A004810E29E;
	Thu, 20 Nov 2025 14:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d98X2Ki3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB07010E29E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763647539; x=1795183539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=a3Pzjnt2C+SCJXUmpcZEYHU6jZRqECJKTh/ykEB3OVQ=;
 b=d98X2Ki3XaPuTllSz/ErPo7QJvLrNe57gFlLLpJ0/+NO9Cxd1Vf6QW2F
 Si/2P+efVNAOggmDhs5DQuI2rAsIxBc4GBBgWy6QZ6AF6OiPIJ4vX7fTc
 W+WE5VN05UbAd48bTxtN2BL2FsFWtQB9jw1iXqvUiFwWqlspxIraVXBXF
 15W8/cpgn6ULortipraDiv2AZnKe9JiGCkEcaALCqD2m/PEHjkcMJo6gY
 f2ParVzry1q3Dipr0ODh3Jq1yHCh5WODu1F+0pTXBKZbDdHqvB3bCF4FN
 f6gcfWLD6MomLnspjSndbPu4WoO+wKmXDabZzDcrmQfZ1/5Qmxn+0CYxP A==;
X-CSE-ConnectionGUID: UEkY1BEvSmSVBRc0+sKdVw==
X-CSE-MsgGUID: abFivSiOQwWfj7moSdfLJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69583749"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="69583749"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:05:39 -0800
X-CSE-ConnectionGUID: tOefOLszQFmFB5SaTBZTQQ==
X-CSE-MsgGUID: astU2GQ3TAuKqgLzGEjG2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191630477"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.92])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:05:32 -0800
Date: Thu, 20 Nov 2025 16:05:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: Drop the ioctl fallback for CRTC
 id to pipe mapping
Message-ID: <aR8gKIbyRdW-sDLU@intel.com>
References: <cover.1763634045.git.jani.nikula@intel.com>
 <4ee248cad827f7c6ccb2b35544a6571822abe87d.1763634045.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ee248cad827f7c6ccb2b35544a6571822abe87d.1763634045.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Nov 20, 2025 at 12:23:14PM +0200, Jani Nikula wrote:
> The kernel support for i915_pipe debugfs has been around for 2½ years in
> both i915 and xe. Drop the ioctl fallback for simplicity.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/igt_kms.c | 42 ++++++++----------------------------------
>  1 file changed, 8 insertions(+), 34 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0ff56653a4a7..714b851e8037 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1193,24 +1193,15 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
>  }
>  
>  /*
> - * With non-contiguous pipes display, crtc mapping is not always same
> - * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
> - * hence allocating upper bound igt_pipe array to support non-contiguos
> - * pipe display and reading pipe enum for a crtc using GET_PIPE_FROM_CRTC_ID
> - * ioctl for a pipe to do pipe ordering with respect to crtc list.
> + * The hardware pipe may be different from the CRTC index. Figure out the CRTC
> + * index to pipe mapping from the debugfs.
>   */
> -static int __intel_get_pipe_from_crtc_id(int fd, int crtc_id, int crtc_idx)
> +static int __intel_get_pipe_from_crtc_index(int fd, int crtc_idx)
>  {
>  	char buf[2];
>  	int debugfs_fd, res = 0;
> +	char pipe;
>  
> -	/*
> -	 * No GET_PIPE_FROM_CRTC_ID ioctl support for XE. Instead read
> -	 * from the debugfs "i915_pipe".
> -	 *
> -	 * This debugfs is applicable for both i915 & XE. For i915, still
> -	 * we can fallback to ioctl method to support older kernels.
> -	 */
>  	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_idx, O_RDONLY);
>  
>  	if (debugfs_fd >= 0) {
> @@ -1218,26 +1209,11 @@ static int __intel_get_pipe_from_crtc_id(int fd, int crtc_id, int crtc_idx)
>  		close(debugfs_fd);
>  	}
>  
> -	if (res <= 0) {
> -		/* Fallback to older ioctl method. */
> -		if (is_i915_device(fd)) {
> -			struct drm_i915_get_pipe_from_crtc_id get_pipe;
> -
> -			get_pipe.pipe = 0;
> -			get_pipe.crtc_id =  crtc_id;
> +	igt_assert_f(res > 0, "Failed to read the debugfs i915_pipe.\n");
>  
> -			do_ioctl(fd, DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID,
> -				 &get_pipe);
> +	igt_assert_eq(sscanf(buf, "%c", &pipe), 1);
>  
> -			return get_pipe.pipe;
> -		} else
> -			igt_assert_f(false, "XE: Failed to read the debugfs i915_pipe.\n");
> -	} else {
> -		char pipe;
> -
> -		igt_assert_eq(sscanf(buf, "%c", &pipe), 1);
> -		return kmstest_pipe_to_index(pipe);
> -	}
> +	return kmstest_pipe_to_index(pipe);
>  }
>  
>  /**
> @@ -2985,9 +2961,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  
>  	for (i = 0; i < resources->count_crtcs; i++) {
>  		igt_pipe_t *pipe;
> -		int pipe_enum = (is_intel_dev)?
> -			__intel_get_pipe_from_crtc_id(drm_fd,
> -						      resources->crtcs[i], i) : i;
> +		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, i) : i;
>  
>  		pipe = &display->pipes[pipe_enum];
>  		pipe->pipe = pipe_enum;

It looked to me like this thing also get directly fed into bunch of
places that expect a crtc index. So I suspect you need to change
this to be the index as well.

-- 
Ville Syrjälä
Intel
