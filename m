Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716E36E432
 for <igt-dev@lists.freedesktop.org>; Mon, 31 May 2021 18:57:37 +0000 (UTC)
References: <20210520193402.2297833-1-markyacoub@chromium.org>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Message-ID: <8ce2d8e7-b2fc-4ed9-524c-6621776de3da@amd.com>
Date: Mon, 31 May 2021 14:57:31 -0400
In-Reply-To: <20210520193402.2297833-1-markyacoub@chromium.org>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_vblank: Turn on hardware before
 testing invalid vblank.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>, igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com, chris@chris-wilson.co.uk, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mark,

See my comments inline.

On 2021-05-20 3:34 p.m., Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Before any hardware is on, the vblank is off and its ref counter is in
> an initialized state as each driver handles toggling it differently.
> Ioctl DRM_IOCTL_WAIT_VBLANK could return 0 or invalid depending on the
> hardware, without necessarily meaning anything.

Maybe you can add some hardware examples here.

> [How]
> For invalid_subtest(), active the CRTCs to turn the hardware on so
> DRM_IOCTL_WAIT_VBLANK returns something meaningful.

You forgot the `Signed-off-by`.

> ---
>   tests/kms_vblank.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 93b01eba..cb68a2f8 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -475,8 +475,14 @@ static void invalid_subtest(data_t *data, int fd)
>   {
>   	union drm_wait_vblank vbl;
>   	unsigned long valid_flags;
> +	igt_display_t* display = &data->display;

Why add this variable instead of just use `&data->display`?

> +	enum pipe p = 0;

Why did you add this variable? Improve the readability? If so, I'm not 
sure that p is better than have 0 here. Or did I miss something?

> +	igt_output_t* output;
>   
> -	igt_display_require_output_on_pipe(&data->display, 0);
> +	igt_display_require_output_on_pipe(display, p);
> +	data->pipe = p;
> +	for_each_valid_output_on_pipe(display, p, output)
> +		prepare_crtc(data, fd, output);
>   
>   	/* First check all is well with a simple query */
>   	memset(&vbl, 0, sizeof(vbl));
> @@ -511,6 +517,9 @@ static void invalid_subtest(data_t *data, int fd)
>   	vbl.request.type |= _DRM_VBLANK_SECONDARY;
>   	vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
>   	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
> +
> +	for_each_valid_output_on_pipe(display, p, output)
> +		cleanup_crtc(data, fd, output);
>   }

This patch makes sense to me. I tested it in a Raven system (DCN1.0), 
and everything looks fine to me; however, even without your patch, I see 
the same result.

Btw, thanks a lot for your patch.

>   igt_main
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
