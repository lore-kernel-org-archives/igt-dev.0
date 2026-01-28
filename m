Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D517D3F07A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 15:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A1210E6E0;
	Wed, 28 Jan 2026 15:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WH73Se9A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A98810E6E0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 15:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769613121; x=1801149121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zqGXm+AlAvvJWmGxLtxJppKcmVelHOfjUzzOHs2CiSg=;
 b=WH73Se9AkcYMQhErCxe0kJjN+zlS/MWe0PCi+3Jq6BZB/YN4MwTR5eJo
 iauwaQ2yxzmSDyyu43YPytaBKqm/WXwbh8exEymdugLYcooytXtgld94V
 khPlZbHv2QwWLYXKmMWHrWEULA8+h7H4fJrVPkz3+gzLpjnpzumFff7Uk
 f38FMm4Rx10tptJVnC+8CNY7ISGMWMwV0JW4qnby2VqaNn/DKZm4Bb4ML
 6Idv9xX0VeCRadoGdvICV8CslesDMOrnHvBdkejvnCdjgZ/XJ38PIP0Tw
 lOavLthQIkVZfUvAY0g8zYX48ot/S7rza7PEtgSo/+L7pZrz30BpxLaXw Q==;
X-CSE-ConnectionGUID: ZOK9T9QYTCmBJF811wq1pg==
X-CSE-MsgGUID: 3Dq1HhZNQtWSBxoq/ZwEVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81555457"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81555457"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:12:01 -0800
X-CSE-ConnectionGUID: 4k/+hUq2T3Geq56JjH3RBA==
X-CSE-MsgGUID: BDsvHn2qRha9tzuADiNMjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208533266"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:11:59 -0800
Date: Wed, 28 Jan 2026 17:11:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/8] lib/igt_kms: Drop the ioctl fallback for CRTC
 id to pipe mapping
Message-ID: <aXonPYqtubeQ_sNa@intel.com>
References: <cover.1769514879.git.jani.nikula@intel.com>
 <00f072a6eabf9d74ef80dc683e9d024344a3d399.1769514879.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00f072a6eabf9d74ef80dc683e9d024344a3d399.1769514879.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Jan 27, 2026 at 01:55:58PM +0200, Jani Nikula wrote:
> The kernel support for i915_pipe debugfs has been around for 2½ years in
> both i915 and xe. Drop the ioctl fallback for simplicity. Rename the
> function __intel_get_pipe_from_crtc_index() as it's now purely about
> CRTC index and not id.

I was actaully pondering about using the ioctl as a hint to the
kernel whether userspace is using MI_WAIT_SCANLINE, and if not
I could start using the scanline window wait stuff for the
vblank evasion in the driver (which might be nice for some pfit
shenanigans). I gave up on that after realizing that igt was also
using the ioctl. So getting rid of the ioctl use here migth
actually be a good thing for me, and it means we just have one
codepath to deal with for both kernel drivers.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/igt_kms.c | 47 ++++++++++-------------------------------------
>  1 file changed, 10 insertions(+), 37 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index bd02148d1d3f..a236597ac152 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1316,51 +1316,27 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
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
> +static int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
>  {
>  	char buf[2];
>  	int debugfs_fd, res = 0;
> +	char pipe_char;
>  
> -	/*
> -	 * No GET_PIPE_FROM_CRTC_ID ioctl support for XE. Instead read
> -	 * from the debugfs "i915_pipe".
> -	 *
> -	 * This debugfs is applicable for both i915 & XE. For i915, still
> -	 * we can fallback to ioctl method to support older kernels.
> -	 */
> -	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_idx, O_RDONLY);
> +	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_index, O_RDONLY);
>  
>  	if (debugfs_fd >= 0) {
>  		res = igt_debugfs_simple_read(debugfs_fd, "i915_pipe", buf, sizeof(buf));
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
> +	igt_assert_eq(sscanf(buf, "%c", &pipe_char), 1);
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
> +	return kmstest_pipe_to_index(pipe_char);
>  }
>  
>  /**
> @@ -1395,8 +1371,7 @@ int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id)
>  
>  	drmModeFreeResources(res);
>  
> -	return is_intel_device(fd) ?
> -		__intel_get_pipe_from_crtc_id(fd, crtc_id, i) : i;
> +	return is_intel_device(fd) ? __intel_get_pipe_from_crtc_index(fd, i) : i;
>  }
>  
>  /**
> @@ -3231,9 +3206,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  
>  	for (i = 0; i < resources->count_crtcs; i++) {
>  		igt_crtc_t *crtc;
> -		int pipe_enum = (is_intel_dev)?
> -			__intel_get_pipe_from_crtc_id(drm_fd,
> -						      resources->crtcs[i], i) : i;
> +		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, i) : i;
>  
>  		crtc = igt_crtc_for_pipe(display, pipe_enum);
>  		crtc->pipe = pipe_enum;
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
