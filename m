Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15176E3FC
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 09:59:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id n10so2426676wmq.0
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 01:59:18 -0800 (PST)
Date: Thu, 18 Feb 2021 10:59:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YC46c4iXrTUOzP1G@phenom.ffwll.local>
References: <cover.1612441942.git.sylphrenadin@gmail.com>
 <9f27d3cbd7baede98a665474325b3765fdc1174e.1612441942.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f27d3cbd7baede98a665474325b3765fdc1174e.1612441942.git.sylphrenadin@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms: Decouple ioctl call
 logic for vblank wait
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
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc: igt-dev@lists.freedesktop.org, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 06:14:36PM +0530, Sumera Priyadarsini wrote:
> Extract the ioctl call logic in igt_wait_for_vblank_count() into
> a helper function, __igt_vblank_wait(). Adjust igt_assert() test
> in igt_wait_for_vblank_count() and igt_wait_for_vblank() accordingly.
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

Maybe a bit more context for why I think we'll need this: For virtual hw
emulation in vkms (i.e. simulating an uapi like vmwgfx or virtio-gpu have
it) there's not going to be much vblank, but we still want crc.

And atm our crc code is littered with calls to igt_wait_for_vblank(), and
I think we could just auto-skip those if vblanks dont exist. While the calls to
igt_wait_for_vblank_count is generally relevant for test logic, so maybe
those should result in an igt_skip if vblanks don't exist.

Anyway, thanks for your patch, applied.
-Daniel

> ---
>  lib/igt_kms.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0dc2fda4..08d429a8 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4190,6 +4190,20 @@ void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb)
>  					  (ptrdiff_t)&output->writeback_out_fence_fd);
>  }
>  
> +static int __igt_vblank_wait(int drm_fd, int crtc_offset, int count)
> +{
> +	drmVBlank wait_vbl;
> +	uint32_t pipe_id_flag;
> +
> +	memset(&wait_vbl, 0, sizeof(wait_vbl));
> +	pipe_id_flag = kmstest_get_vbl_flag(crtc_offset);
> +
> +	wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
> +	wait_vbl.request.sequence = count;
> +
> +	return drmWaitVBlank(drm_fd, &wait_vbl);
> +}
> +
>  /**
>   * igt_wait_for_vblank_count:
>   * @drm_fd: A drm file descriptor
> @@ -4209,17 +4223,7 @@ void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb)
>   */
>  void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
>  {
> -	drmVBlank wait_vbl;
> -	uint32_t pipe_id_flag;
> -
> -	memset(&wait_vbl, 0, sizeof(wait_vbl));
> -	pipe_id_flag = kmstest_get_vbl_flag(crtc_offset);
> -
> -	wait_vbl.request.type = DRM_VBLANK_RELATIVE;
> -	wait_vbl.request.type |= pipe_id_flag;
> -	wait_vbl.request.sequence = count;
> -
> -	igt_assert(drmWaitVBlank(drm_fd, &wait_vbl) == 0);
> +	igt_assert(__igt_vblank_wait(drm_fd, crtc_offset, count) == 0);
>  }
>  
>  /**
> @@ -4233,7 +4237,7 @@ void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
>   */
>  void igt_wait_for_vblank(int drm_fd, int crtc_offset)
>  {
> -	igt_wait_for_vblank_count(drm_fd, crtc_offset, 1);
> +	igt_assert(__igt_vblank_wait(drm_fd, crtc_offset, 1) == 0);
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
