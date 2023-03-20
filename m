Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FBE10E18E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 12:49:16 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
In-Reply-To: <20230320060034.2788862-1-bhanuprakash.modem@intel.com>
References: <20230320060034.2788862-1-bhanuprakash.modem@intel.com>
Date: Mon, 20 Mar 2023 14:49:07 +0200
Message-ID: <87355za8qk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [igt-dev] [RFC PATCH] lib/kms: Get pipe enum from debugfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 20 Mar 2023, Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> The pipe may not be the same as crtc index if pipes are fused off.
> For testing purposes, IGT needs to know the pipe. There's already
> a I915_GET_PIPE_FROM_CRTC_ID IOCTL for this. However, the upcoming
> Xe driver won't have that IOCTL.
>
> Add IGT support to read the pipe from debugfs. For i915, still
> fallback to ioctl method to support older kernels.
>
> V2: Fix kmstest_get_pipe_from_crtc_id() (Bhanu)
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 80 +++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 56 insertions(+), 24 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 562d60bff..b3135ad7a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1067,6 +1067,53 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
>  		 aspect ? aspect : "", aspect ? ")" : "");
>  }
>  
> +/*
> + * With non-contiguous pipes display, crtc mapping is not always same
> + * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
> + * hence allocating upper bound igt_pipe array to support non-contiguos
> + * pipe display and reading pipe enum for a crtc using GET_PIPE_FROM_CRTC_ID
> + * ioctl for a pipe to do pipe ordering with respect to crtc list.
> + */
> +static int __intel_get_pipe_from_crtc_id(int fd, int crtc_id, int crtc_idx)
> +{
> +	char buf[2];
> +	int debugfs_fd, res;
> +
> +	/*
> +	 * No GET_PIPE_FROM_CRTC_ID ioctl support for XE. Instead read
> +	 * from the debugfs "i915_pipe".
> +	 *
> +	 * This debugfs is applicable for both i915 & XE. For i915, still
> +	 * we can fallback to ioctl method to support older kernels.
> +	 */
> +	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_idx, O_RDONLY);
> +	igt_assert(debugfs_fd >= 0);
> +
> +	res = igt_debugfs_simple_read(debugfs_fd, "i915_pipe", buf, sizeof(buf));
> +	close(debugfs_fd);
> +
> +	if (res <= 0) {
> +		/* Fallback to older ioctl method. */
> +		if (is_i915_device(fd)) {
> +			struct drm_i915_get_pipe_from_crtc_id get_pipe;
> +
> +			get_pipe.pipe = 0;
> +			get_pipe.crtc_id =  crtc_id;
> +
> +			do_ioctl(fd, DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID,
> +				 &get_pipe);
> +
> +			return get_pipe.pipe;
> +		} else
> +			igt_assert_f(false, "XE: Failed to read the debugfs i915_pipe.\n");
> +	} else {
> +		int pipe;
> +
> +		igt_assert_eq(sscanf(buf, "%d", &pipe), 1);

Per Ville's request, the debugfs will have pipe as a letter instead of
number [1].


BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20230320124429.786985-2-jani.nikula@intel.com


> +		return pipe;
> +	}
> +}
> +
>  /**
>   * kmstest_get_pipe_from_crtc_id:
>   * @fd: DRM fd
> @@ -1100,7 +1147,8 @@ int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id)
>  
>  	drmModeFreeResources(res);
>  
> -	return i;
> +	return is_intel_device(fd) ?
> +		__intel_get_pipe_from_crtc_id(fd, crtc_id, i) : i;
>  }
>  
>  /**
> @@ -2558,14 +2606,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	drmModeRes *resources;
>  	drmModePlaneRes *plane_resources;
>  	int i;
> -	bool is_i915_dev;
> +	bool is_intel_dev;
>  
>  	memset(display, 0, sizeof(igt_display_t));
>  
>  	LOG_INDENT(display, "init");
>  
>  	display->drm_fd = drm_fd;
> -	is_i915_dev = is_i915_device(drm_fd);
> +	is_intel_dev = is_intel_device(drm_fd);
>  
>  	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>  
> @@ -2593,34 +2641,18 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	if (is_xe_device(drm_fd))
>  		xe_device_get(drm_fd);
>  
> -	/*
> -	 * With non-contiguous pipes display, crtc mapping is not always same
> -	 * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
> -	 * hence allocating upper bound igt_pipe array to support non-contiguos
> -	 * pipe display and reading pipe enum for a crtc using GET_PIPE_FROM_CRTC_ID ioctl
> -	 * for a pipe to do pipe ordering with respect to crtc list.
> -	 */
>  	display->n_pipes = IGT_MAX_PIPES;
>  	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
>  	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
>  
>  	for (i = 0; i < resources->count_crtcs; i++) {
>  		igt_pipe_t *pipe;
> +		int pipe_enum = (is_intel_dev)?
> +			__intel_get_pipe_from_crtc_id(drm_fd,
> +						      resources->crtcs[i], i) : i;
>  
> -		if (is_i915_dev) {
> -			struct drm_i915_get_pipe_from_crtc_id get_pipe;
> -
> -			get_pipe.pipe = 0;
> -			get_pipe.crtc_id =  resources->crtcs[i];
> -			do_ioctl(display->drm_fd,
> -					DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID, &get_pipe);
> -			pipe = &display->pipes[get_pipe.pipe];
> -			pipe->pipe = get_pipe.pipe;
> -		}
> -		else {
> -			pipe = &display->pipes[i];
> -			pipe->pipe = i;
> -		}
> +		pipe = &display->pipes[pipe_enum];
> +		pipe->pipe = pipe_enum;
>  
>  		/* pipe is enabled/disabled */
>  		pipe->enabled = true;

-- 
Jani Nikula, Intel Open Source Graphics Center
