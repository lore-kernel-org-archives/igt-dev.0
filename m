Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C596EA05
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 09:56:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id f7so1064382wrt.12
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 01:56:44 -0800 (PST)
Date: Thu, 18 Feb 2021 10:56:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YC452IdXNK0yk//9@phenom.ffwll.local>
References: <20210204122834.ropd7h3rgcog3dux@adolin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204122834.ropd7h3rgcog3dux@adolin>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_lease: use
 igt_wait_for_vblank()
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

On Thu, Feb 04, 2021 at 05:58:34PM +0530, Sumera Priyadarsini wrote:
> Use igt_wait_for_vblank() instead of igt_wait_for_vblank_count()
> for callers requiring a single vblank interval.
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

Patch applied, thanks a lot.
-Daniel

> ---
>  tests/kms_lease.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index ca8fa5b7..e9a47767 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -356,8 +356,8 @@ static void page_flip_implicit_plane(data_t *data)
>  	display = &data->master.display;
>  	pipe = crtc_id_to_pipe(display, data->crtc_id);
>  
> -	igt_wait_for_vblank_count(data->master.fd,
> -			display->pipes[pipe].crtc_offset, 1);
> +	igt_wait_for_vblank(data->master.fd,
> +			display->pipes[pipe].crtc_offset);
>  
>  	do_or_die(drmModePageFlip(mcl.fd, data->crtc_id,
>  			      data->master.primary_fb.fb_id,
> @@ -369,8 +369,8 @@ static void page_flip_implicit_plane(data_t *data)
>  
>  	pipe = crtc_id_to_pipe(display, data->crtc_id);
>  
> -	igt_wait_for_vblank_count(data->master.fd,
> -			display->pipes[pipe].crtc_offset, 1);
> +	igt_wait_for_vblank(data->master.fd,
> +			display->pipes[pipe].crtc_offset);
>  
>  	igt_assert_eq(drmModePageFlip(mcl.fd, data->crtc_id,
>  				      data->master.primary_fb.fb_id,
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
