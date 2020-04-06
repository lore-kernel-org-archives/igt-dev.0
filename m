Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8545B89C07
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 09:12:16 +0000 (UTC)
Date: Mon, 6 Apr 2020 12:11:35 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200406091135.GB29716@ideak-desk.fi.intel.com>
References: <20200403130306.1272436-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403130306.1272436-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] tests/kms_vblank: Make sure that we
 have a mode set
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 04:03:01PM +0300, Arkadiusz Hiler wrote:
> Subtest 'invalid' was depending on a "leftover" mode set by something
> external (usually fbcon) in order to work.
> 
> Let's make the test more robust by setting the mode explicitly.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  tests/kms_vblank.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index a895ab80..edf8581e 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -472,9 +472,22 @@ static void invalid_subtest(data_t *data, int fd)
>  {
>  	union drm_wait_vblank vbl;
>  	unsigned long valid_flags;
> +	enum pipe pipe;
> +	igt_output_t* output;
> +	bool found = false;
>  
>  	igt_display_require_output_on_pipe(&data->display, 0);

Is the above needed still?

>  
> +	/* we need to have a mode set, otherwise we will get EINVAL no matter what */
> +	for_each_pipe_with_single_output(&data->display, pipe, output) {
> +		data->pipe = pipe;
> +		found = true;
> +		break;
> +	}

So far pipe A was assumed. I guess it's better to make it more flexible,
but then you have to add kmstest_get_vbl_flag() to the request flags
too.

> +
> +	igt_require_f(found, "No outputs connected = no vblanks\n");
> +	prepare_crtc(data, fd, output);
> +
>  	/* First check all is well with a simple query */
>  	memset(&vbl, 0, sizeof(vbl));
>  	vbl.request.type = DRM_VBLANK_RELATIVE;
> @@ -508,6 +521,7 @@ static void invalid_subtest(data_t *data, int fd)
>  	vbl.request.type |= _DRM_VBLANK_SECONDARY;
>  	vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
>  	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
> +	cleanup_crtc(data, fd, output);
>  }
>  
>  igt_main
> -- 
> 2.24.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
