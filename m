Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0369089E35
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 03:39:10 +0000 (UTC)
Date: Tue, 10 Aug 2021 05:39:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210810033904.GG3738@zkempczy-mobl2>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
 <20210809130533.27759-50-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210809130533.27759-50-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 49/65] tests/kms_vblank: Adopt to use
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

On Mon, Aug 09, 2021 at 03:05:17PM +0200, Zbigniew Kempczyński wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> For newer gens kernel will reject relocations returning -EINVAL
> so we should just provide the allocator handle to inject the hang.
> 
> V2:
> * Drop is_i915_device() check
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/kms_vblank.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 885b2e2c4..f3a9875e3 100644
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
> @@ -128,8 +129,10 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
>  		 igt_subtest_name(), kmstest_pipe_name(data->pipe),
>  		 igt_output_name(output));
>  
> -	if (!(data->flags & NOHANG))
> -		hang = igt_hang_ring(fd, I915_EXEC_DEFAULT);
> +	if (!(data->flags & NOHANG)) {
> +		ahnd = get_reloc_ahnd(fd, 0);
> +		hang = igt_hang_ring_with_ahnd(fd, I915_EXEC_DEFAULT, ahnd);
> +	}
>  
>  	if (data->flags & BUSY) {
>  		union drm_wait_vblank vbl;
> @@ -166,6 +169,8 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
>  	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
>  		 igt_subtest_name(), kmstest_pipe_name(data->pipe), igt_output_name(output));
>  
> +	put_ahnd(ahnd);
> +
>  	/* cleanup what prepare_crtc() has done */
>  	cleanup_crtc(data, fd, output);
>  }
> -- 
> 2.26.0
>

Looks good,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
