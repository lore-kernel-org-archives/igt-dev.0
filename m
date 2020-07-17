Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868FB6EDA1
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2020 13:02:38 +0000 (UTC)
Date: Fri, 17 Jul 2020 16:02:33 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200717130233.ootl4edkexetvu2e@ahiler-desk1.fi.intel.com>
References: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
 <20200711200602.3217-11-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711200602.3217-11-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 10/11] lib/kms: Convert pipe id flags
 for a vblank using crtc offset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Jul 12, 2020 at 01:36:01AM +0530, Mohammed Khajapasha wrote:
> In i915 with non-contiguous pipes display, pipes always not same
> as crtc index in display pipes array. Hence reading pipe id flags
> for a vblank event using crtc offset.

Mention in the commit message that crtc_offset was chosen because
crtc_index is too close to crtc_id which can cause confusion.

> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  lib/igt_kms.c | 51 +++++++++++++++++++++++++++++++++++----------------
>  lib/igt_kms.h | 14 +++++++++++---
>  2 files changed, 46 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d56f2e56..5b9f2175 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1983,6 +1983,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  		/* pipe is enabled/disabled */
>  		pipe->enabled = true;
>  		pipe->crtc_id = resources->crtcs[i];
> +		/* offset of a pipe in crtcs list */
> +		pipe->crtc_offset = i;
>  	}
>  
>  	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> @@ -4131,18 +4133,23 @@ void igt_pipe_request_out_fence(igt_pipe_t *pipe)
>  /**
>   * igt_wait_for_vblank_count:
>   * @drm_fd: A drm file descriptor
> - * @pipe: Pipe to wait_for_vblank on
> + * @crtc_offset: offset of a Pipe to wait_for_vblank on

I would change that to:

@crtc_offset: offset of the crtc in drmModeRes.crtcs


>   * @count: Number of vblanks to wait on
>   *
> + * With non-contiguous pipe display, pipe mapping always
> + * not same with crtc mapping, for i915 pipe is enum id of i915's crtc object
> + * and pipe id not equal to crtc offset in mode config list hence passing
> + * crtc offset to read vblank count for a pipe.
> + *

I would change that to:

What kernel addressed internally as a "pipe" for DRM_IOCTL_WAIT_VBLANK
is actually a crtc_offset of a given crtc in drmModeRes.crtcs. It may
not correspond to HW concept of a pipe (e.g. with DRM lease or
non-contiguous pipes).


>   * Waits for a given number of vertical blank intervals
>   */
> -void igt_wait_for_vblank_count(int drm_fd, enum pipe pipe, int count)
> +void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
>  {
>  	drmVBlank wait_vbl;
>  	uint32_t pipe_id_flag;
>  
>  	memset(&wait_vbl, 0, sizeof(wait_vbl));
> -	pipe_id_flag = kmstest_get_vbl_flag(pipe);
> +	pipe_id_flag = kmstest_get_vbl_flag(crtc_offset);
>  
>  	wait_vbl.request.type = DRM_VBLANK_RELATIVE;
>  	wait_vbl.request.type |= pipe_id_flag;
> @@ -4154,13 +4161,18 @@ void igt_wait_for_vblank_count(int drm_fd, enum pipe pipe, int count)
>  /**
>   * igt_wait_for_vblank:
>   * @drm_fd: A drm file descriptor
> - * @pipe: Pipe to wait_for_vblank on
> + * @crtc_offset: offset of a Pipe to wait_for_vblank on

use the same description as above

> + *
> + * With non-contiguous pipe display, pipe mapping always
> + * not same with crtc mapping, for i915 pipe is enum id of i915's crtc object
> + * and pipe id not equal to crtc offset in mode config list hence passing
> + * crtc offset to read vblank count for a pipe.

Instead of duplicating the comment here I would just refer the reader to
igt_wait_for_vblank_count()'s documentation. e.g.:

Wait for a single vblank. See #igt_wait_for_vblank_count for more
details.

>   *
>   * Waits for 1 vertical blank intervals
>   */
> -void igt_wait_for_vblank(int drm_fd, enum pipe pipe)
> +void igt_wait_for_vblank(int drm_fd, int crtc_offset)
>  {
> -	igt_wait_for_vblank_count(drm_fd, pipe, 1);
> +	igt_wait_for_vblank_count(drm_fd, crtc_offset, 1);
>  }
>  
>  /**
> @@ -4383,22 +4395,29 @@ void igt_cleanup_uevents(struct udev_monitor *mon)
>  
>  /**
>   * kmstest_get_vbl_flag:
> - * @pipe_id: Pipe to convert to flag representation.
> + * @crtc_offset: CRTC offset to convert into pipe flag representation.
>   *
> - * Convert a pipe id into the flag representation
> - * expected in DRM while processing DRM_IOCTL_WAIT_VBLANK.
> + * With non-contiguous pipe display, pipe mapping always
> + * not same with crtc mapping, for i915 pipe is enum id of i915's crtc object
> + * and pipe id not equal to crtc offset in mode config list hence passing
> + * crtc offset of a pipe to convert into the pipe flag representation
> + * which expected in DRM while processing DRM_IOCTL_WAIT_VBLANK.

Same here. I would avoid referring to i915 and instead explain that in
the terms of vocabulary. E.g.:

Convert an offset of an crtc in drmModeRes.crtcs into the flag
representation expected by DRM_IOCTL_WAIT_VBLANK. See
#igt_wait_for_vblank_count for details.

>   */
> -uint32_t kmstest_get_vbl_flag(uint32_t pipe_id)
> +uint32_t kmstest_get_vbl_flag(int crtc_offset)
>  {
> -	if (pipe_id == 0)
> -		return 0;
> -	else if (pipe_id == 1)
> -		return _DRM_VBLANK_SECONDARY;
> +	uint32_t pipe_id;
> +
> +	if (crtc_offset == 0)
> +		pipe_id = 0;
> +	else if (crtc_offset == 1)
> +		pipe_id = _DRM_VBLANK_SECONDARY;
>  	else {
> -		uint32_t pipe_flag = pipe_id << 1;
> +		uint32_t pipe_flag = crtc_offset << 1;
>  		igt_assert(!(pipe_flag & ~DRM_VBLANK_HIGH_CRTC_MASK));
> -		return pipe_flag;
> +		pipe_id = pipe_flag;
>  	}
> +
> +	return pipe_id;
>  }
>  
>  static inline const uint32_t *
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 7109c9a5..162c4850 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -338,8 +338,14 @@ typedef struct igt_plane {
>  	int format_mod_count;
>  } igt_plane_t;
>  
> +/*
> + * In i915, with non-contiguous pipe display, a pipe is not always
> + * same as a crtc mapping in display, pipe is enum id of a i915's crtc object
> + * using crtc offset to get the offset of a pipe from mode config list
> + */
>  struct igt_pipe {
>  	igt_display_t *display;
> +	/* Id of a pipe object */

/* ID of a hardware pipe */

>  	enum pipe pipe;
>  	/* pipe is enabled or not */
>  	bool enabled;
> @@ -354,6 +360,8 @@ struct igt_pipe {
>  	uint64_t values[IGT_NUM_CRTC_PROPS];
>  

/* ID of KMS CRTC object */
>  	uint32_t crtc_id;


> +	/* crtc offset of a pipe in mode config list */

/*
 * Offset of crtc in drmModeRes.crtc used by some IOCTLs and sometimes
 * confusingly called pipe_index or pipe in the kernel.
 *
 * It may correspond to hardware pipes but doesn't have to in case of
 * e.g.: DRM lease or non-contiguous pipes.
 *
 * See #igt_wait_for_vblank_count
 */

> +	uint32_t crtc_offset;

Sorry if my expectations weren't clear to you - they were not clear to
me either, as I was figuring those things along the way.

My main gripe was with the comments and explanations. They focus too
much on i915 and our non-contiguous pipes instead of trying to
straighten the vocabulary and make sure that we draw a hard distinction
of what's a pipe and what's a crtc_offset. Some of the function
documentation was still using those interchangeably.

You can find suggestion on how to fix that above. Please make sure that
they make sense :-)

Also keep in mind that everything you contained in the cover letter
doesn't get preserved after the series get merged, so everything
important from there should get spread around in form of comments and
commit messages.

-- 
Cheers,
Arek

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
