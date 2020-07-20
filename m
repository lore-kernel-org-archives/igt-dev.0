Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952436E29E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 09:35:08 +0000 (UTC)
Date: Mon, 20 Jul 2020 12:35:04 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200720093504.cq75r4kzwgwog6sc@ahiler-desk1.fi.intel.com>
References: <20200717154101.8849-1-mohammed.khajapasha@intel.com>
 <20200717154101.8849-11-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717154101.8849-11-mohammed.khajapasha@intel.com>
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
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com, kishore.kunche@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 03:41:00PM +0000, Mohammed Khajapasha wrote:
> In i915 with non-contiguous pipes display, pipes always not same
> as crtc index in display pipes array. Hence reading pipe id flags
> for a vblank event using crtc offset.
> 
> Example:
> With PIPE_A & PIPE_D enabled and PIPE_B & PIPE_C disabled
> configuration, pipe enum ids for pipe A & D are '0' and '3',
> and crtc offsets in mode config list for pipe A & D are '0' and '1'
> hence using crtc offset to read a vblank event for a pipe, as
> DRM vblank ioctl expect crtc offset for a pipe.
> 
> v2:
>     Addressed review comments for commit & documentation <Hiler, Arkadiusz>
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  lib/igt_kms.c | 48 ++++++++++++++++++++++++++++++++----------------
>  lib/igt_kms.h | 15 ++++++++++++---
>  2 files changed, 44 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d56f2e56..823e86c0 100644
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
> @@ -4131,18 +4133,25 @@ void igt_pipe_request_out_fence(igt_pipe_t *pipe)
>  /**
>   * igt_wait_for_vblank_count:
>   * @drm_fd: A drm file descriptor
> - * @pipe: Pipe to wait_for_vblank on
> + * @crtc_offset: offset of the crtc in drmModeRes.crtcs
>   * @count: Number of vblanks to wait on
>   *
> + * With non-contiguous pipes configuration, pipe mapping always
> + * not same with crtc index in mode config list,

I don't understand this sentence.

> + * In DRM, 'pipe' for DRM_IOCTL_WAIT_VBLANK is actually a crtc offset
> + * of a given crtc in drmModeRes.crtcs but not HW concept of a pipe
> + * (e.g. with DRM lease or non-contiguous pipes), hence using crtc_offest
> + * to read a vblank event for a pipe.

This is good, but could be phrased so it parses more easily.

How about:

'Pipe', as understood by DRM_IOCTL_WAIT_VBLANK, is actually an offset of
crtc in drmModeRes.crtcs and it has nothing to do with a hardware
concept of a pipe. They can match but don't have to in case of DRM lease
or non-contiguous pipes.

To make thing clear we are calling DRM_IOCTL_WAIT_VBLANK's 'pipe'
a crtc_offset.

> + *
>   * Waits for a given number of vertical blank intervals

I would put this as the first paragraph.

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
> @@ -4154,13 +4163,15 @@ void igt_wait_for_vblank_count(int drm_fd, enum pipe pipe, int count)
>  /**
>   * igt_wait_for_vblank:
>   * @drm_fd: A drm file descriptor
> - * @pipe: Pipe to wait_for_vblank on
> + * @crtc_offset: offset of a crtc in drmModeRes.crtcs
> + *
> + * See #igt_wait_for_vblank_count for more details
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
> @@ -4383,22 +4394,27 @@ void igt_cleanup_uevents(struct udev_monitor *mon)
>  
>  /**
>   * kmstest_get_vbl_flag:
> - * @pipe_id: Pipe to convert to flag representation.
> + * @crtc_offset: CRTC offset to convert into pipe flag representation.
>   *
> - * Convert a pipe id into the flag representation
> - * expected in DRM while processing DRM_IOCTL_WAIT_VBLANK.
> + * Convert an offset of an crtc in drmModeRes.crtcs into flag representation
> + * expected by DRM_IOCTL_WAIT_VBLANK.
> + * See #igt_wait_for_vblank_count for details
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
> index 7109c9a5..1ea3a72a 100644
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

Again, IGT is not i915-only and you are using it to define things. Think
about the change in terms of DRM / KMS  vocabulary.

I am not sure what this message is trying to convey but I would describe
the following points:

 * this struct represents a hardware pipe

 * DRM_IOCTL_WAIT_VBLANK notion of pipe is confusing and we are using
   crtc_offset instead (refer people to #igt_wait_for_vblank_count)

> + */
>  struct igt_pipe {
>  	igt_display_t *display;
> +	/* ID of a hardware pipe */
>  	enum pipe pipe;
>  	/* pipe is enabled or not */
>  	bool enabled;
> @@ -353,7 +359,10 @@ struct igt_pipe {
>  	uint32_t props[IGT_NUM_CRTC_PROPS];
>  	uint64_t values[IGT_NUM_CRTC_PROPS];
>  
> +	/* ID of KMS CRTC object */
>  	uint32_t crtc_id;
> +	/* crtc offset of a pipe in mode config list */

offset of a pipe in drmModeRes.crtcs would be easier to understand

-- 
Cheers,
Arek

> +	uint32_t crtc_offset;
>  
>  	int32_t out_fence_fd;
>  };
> @@ -448,8 +457,8 @@ void igt_fb_set_position(struct igt_fb *fb, igt_plane_t *plane,
>  void igt_fb_set_size(struct igt_fb *fb, igt_plane_t *plane,
>  	uint32_t w, uint32_t h);
>  
> -void igt_wait_for_vblank(int drm_fd, enum pipe pipe);
> -void igt_wait_for_vblank_count(int drm_fd, enum pipe pipe, int count);
> +void igt_wait_for_vblank(int drm_fd, int crtc_offset);
> +void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count);
>  
>  static inline bool igt_output_is_connected(igt_output_t *output)
>  {
> @@ -769,7 +778,7 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
>  void igt_enable_connectors(int drm_fd);
>  void igt_reset_connectors(void);
>  
> -uint32_t kmstest_get_vbl_flag(uint32_t pipe_id);
> +uint32_t kmstest_get_vbl_flag(int crtc_offset);
>  
>  const struct edid *igt_kms_get_base_edid(void);
>  const struct edid *igt_kms_get_alt_edid(void);
> -- 
> 2.25.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
