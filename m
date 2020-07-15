Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC246EB75
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 14:50:31 +0000 (UTC)
Date: Wed, 15 Jul 2020 17:50:26 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200715145026.zvanrvlbamlalkbs@ahiler-desk1.fi.intel.com>
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
> 
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
>   * @count: Number of vblanks to wait on
>   *
> + * With non-contiguous pipe display, pipe mapping always
> + * not same with crtc mapping, for i915 pipe is enum id of i915's crtc object
> + * and pipe id not equal to crtc offset in mode config list hence passing
> + * crtc offset to read vblank count for a pipe.
> + *

Hey,

In KMS & i915 there are two thing that are called pipe:

1. offset of the crtc in the mode resources array, it's used by drm_wait_vblank_ioctl
   https://elixir.bootlin.com/linux/v5.7.8/source/drivers/gpu/drm/drm_vblank.c#L1658

2. intel concept of a pipe with its separate numbering:
   https://elixir.bootlin.com/linux/v5.7.8/source/drivers/gpu/drm/i915/display/intel_display.c#L16722

Those two concepts are incompatible. We can see this in the kms_lease
tests - if we lease PIPE_C only it becomes PIPE_A for (1) and stays
PIPE_C in the sense of (2).

Why is it so important that in IGT we use the (2) meaning? How are you
planning on using it? Why the kernel can't hide the missing pipe from
our sight just as it does when leasing?

I see few options with non-continuous pipes:

a. keep pipe as it is now (so it actually is "crtc offset") as this is
   what most of the IOCTLs expect. If you ever need to use the (2)
   meaning of pipe you can use intel_get_pipe_from_crtc_id_ioctl there

b. same as above but rename PIPE_ prefix to CRTC_, so we end up with
   CRTC_A, CRTC_B, CRTC_C, etc.

c. this patch series - we use the second meaning of pipe (2) and
   introduce some complications for the sake of places where we need the
   first meaning (1)

I think this series lacks justification why this option has been chosen
- it may be me not understating something that you find obvious.

Is there any practical reason besides people wanting to have test
results for pipe-c corresponding to Intel's hardware understanding of
what pipe-c is?

You may need to ELI5 that to me. I have very rudimentary understanding
of this area and only learned about the multiple meanings of "pipe"
while doing the review here :-)

The code looks good otherwise.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
