Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D2489D57
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 13:24:41 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 30 Dec 2019 13:24:37 +0000
Message-ID: <0e2e00c4fa97ae279b0f9aaab4015e391a38d78c.camel@intel.com>
References: <20191230034040.21943-1-imre.deak@intel.com>
 <20191230034040.21943-6-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-6-imre.deak@intel.com>
Content-Language: en-US
Content-ID: <2BE78FC649692E4CB1F0C929E5673B6D@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 05/10] Revert "tests/kms_plane: Disable
 GEN12 media compression YUV tests"
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

On Mon, 2019-12-30 at 05:40 +0200, Imre Deak wrote:
> This reverts commit 0586d205f651674e575351c2d5a7d0760716c9f1.
> 
> Now that support for YUV engine copy was added, we can re-enable the
> YUV tests.
> 
> Cc: Mika Kahola <mika.kahola@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  tests/kms_plane.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 6ad7bacc..9ef3a7f3 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -596,13 +596,6 @@ static bool test_format_plane_yuv(data_t *data,
> enum pipe pipe,
>  	if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
>  		return true;
>  
> -	/*
> -	 * The Vebox blitter backend needed for this can't handle YUV
> formats
> -	 * yet, so skip it for now.
> -	 */
> -	if (modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS)
> -		return true;
> -
>  	for (enum igt_color_encoding e = 0; e <
> IGT_NUM_COLOR_ENCODINGS; e++) {
>  		if (!igt_plane_try_prop_enum(plane,
>  					     IGT_PLANE_COLOR_ENCODING,
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
