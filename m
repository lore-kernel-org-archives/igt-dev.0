Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EDE6EA8C
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2020 20:21:10 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 2 Apr 2020 20:21:08 +0000
Message-ID: <ea1f8e6fc6056256f46d9cf1f0beb0b0bb3d53dc.camel@intel.com>
References: <20200402122943.6583-1-imre.deak@intel.com>
In-Reply-To: <20200402122943.6583-1-imre.deak@intel.com>
Content-Language: en-US
Content-ID: <1484BDEE0F03C444B13CE59DDFF47344@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Skip detiler fences
 subtest on platforms w/o aperture
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 2020-04-02 at 15:29 +0300, Imre Deak wrote:
> On platforms w/o an aperture subtests using fences are not relevant,
> so
> skip them. This also fixes a use-after-free error happening as a
> side-effect of running the test on such platforms.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  tests/kms_flip.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 9ce83c53d..506c9c142 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -216,6 +216,7 @@ static void emit_fence_stress(struct test_output
> *o)
>  
>  	igt_require(bufmgr);
>  
> +	igt_assert(num_fences);
>  	bo = calloc(sizeof(*bo), num_fences);
>  	exec = calloc(sizeof(*exec), num_fences+1);
>  	for (i = 0; i < num_fences - 1; i++) {
> @@ -1234,8 +1235,10 @@ static void run_test_on_crtc_set(struct
> test_output *o, int *crtc_idxs,
>  		o->fb_width *= 2;
>  
>  	tiling = LOCAL_DRM_FORMAT_MOD_NONE;
> -	if (o->flags & TEST_FENCE_STRESS)
> +	if (o->flags & TEST_FENCE_STRESS) {
> +		igt_require(gem_available_fences(drm_fd));

Would be better to skip on the begining of run_test() so less CI time
is wasted in those tests, right after:
igt_require((flags & TEST_HANG) == 0 || !is_wedged(drm_fd));

>  		tiling = LOCAL_I915_FORMAT_MOD_X_TILED;
> +	}
>  
>  	/* 256 MB is usually the maximum mappable aperture,
>  	 * (make it 4x times that to ensure failure) */
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
