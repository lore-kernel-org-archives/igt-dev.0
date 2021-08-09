Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4355898F5
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 08:26:11 +0000 (UTC)
Date: Mon, 9 Aug 2021 10:26:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210809082604.GD5318@zkempczy-mobl2>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
 <20210806134145.24634-53-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210806134145.24634-53-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 52/56] tests/kms_vblank: Adopt to use
 allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 06, 2021 at 03:41:41PM +0200, Zbigniew Kempczyński wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> For newer gens kernel will reject relocations returning -EINVAL
> so we should just provide the allocator handle to inject the hang.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/kms_vblank.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 885b2e2c4..7b7e1372e 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -118,6 +118,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
>  	igt_output_t *output = data->output;
>  	int fd = display->drm_fd;
>  	igt_hang_t hang;
> +	uint64_t ahnd = 0;
>  
>  	prepare_crtc(data, fd, output);
>  
> @@ -128,8 +129,11 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
>  		 igt_subtest_name(), kmstest_pipe_name(data->pipe),
>  		 igt_output_name(output));
>  
> -	if (!(data->flags & NOHANG))
> -		hang = igt_hang_ring(fd, I915_EXEC_DEFAULT);
> +	if (!(data->flags & NOHANG)) {
> +		if (is_i915_device(fd))
> +			ahnd = get_reloc_ahnd(fd, 0);
> +		hang = igt_hang_ring_with_ahnd(fd, I915_EXEC_DEFAULT, ahnd);
> +	}

What for is_i915_device(fd) check is introduced here? igt_hang_ring() is currently
valid only for i915 so ahnd = get_reloc_ahnd(fd, 0) can be called unconditionally
here. Am I missed something here?

>  
>  	if (data->flags & BUSY) {
>  		union drm_wait_vblank vbl;
> @@ -166,6 +170,9 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
>  	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
>  		 igt_subtest_name(), kmstest_pipe_name(data->pipe), igt_output_name(output));
>  
> +	if (is_i915_device(fd))
> +		put_ahnd(ahnd);
> +

For non-i915 machines ahnd will be equal to 0, so put_ahnd() will just return
and no i915 dependand code will be called. I would rather expect: 

if (!(data->flags & NOHANG))
	put_ahnd(ahnd);

But as I said put_ahnd() with ahnd == 0 does nothing.

--
Zbigniew 


>  	/* cleanup what prepare_crtc() has done */
>  	cleanup_crtc(data, fd, output);
>  }
> -- 
> 2.26.0
> 
