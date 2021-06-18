Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Fri, 18 Jun 2021 06:24:32 +0000
Message-ID: <BY5PR11MB4372A68B06BFFF1D3C11B294890D9@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
 <1622556485-9375-1-git-send-email-vidya.srinivas@intel.com>
 <CO6PR11MB556976C4EC81D88FC86D1C768D349@CO6PR11MB5569.namprd11.prod.outlook.com>
 <BY5PR11MB437213735019658A601D098D89349@BY5PR11MB4372.namprd11.prod.outlook.com>
 <BY5PR11MB4372B0A65DA52560451EAA5289349@BY5PR11MB4372.namprd11.prod.outlook.com>
 <BY5PR11MB437250EA6AD698B6D28D9D1089309@BY5PR11MB4372.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB437250EA6AD698B6D28D9D1089309@BY5PR11MB4372.namprd11.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] [RFC]
 tests/kms_plane_alpha_blend: Don't set primary fb color in
 coverage-vs-premult-vs-constant
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
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello,

Humble request for review of this please https://patchwork.freedesktop.org/series/90828/
Can anyone kindly help review this so we can request for merge?

Thank you so much.

Regards
Vidya

-----Original Message-----
From: Srinivas, Vidya 
Sent: Tuesday, June 15, 2021 1:55 PM
To: Modem, Bhanuprakash <Bhanuprakash.Modem@intel.com>; intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
Cc: Shankar, Uma <uma.shankar@intel.com>
Subject: RE: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_plane_alpha_blend: Don't set primary fb color in coverage-vs-premult-vs-constant

Hello Bhanu,

Sorry for the trouble. Kindly can you check if rev 3 is okay? Thanks a lot.

Regards
Vidya

-----Original Message-----
From: Srinivas, Vidya
Sent: Friday, June 11, 2021 6:28 PM
To: Modem, Bhanuprakash <Bhanuprakash.Modem@intel.com>; intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
Subject: RE: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_plane_alpha_blend: Don't set primary fb color in coverage-vs-premult-vs-constant

Hello Bhanu,

I have uploaded version 3 where I have not removed primary plane.
Instead I have added a commit of the primary plane and I have changed alpha.
This passes on Gen11 systems.

Kindly check https://patchwork.freedesktop.org/patch/438831/?series=90828&rev=3 and suggest.

Thank you so much.

Regards
Vidya

-----Original Message-----
From: Srinivas, Vidya
Sent: Friday, June 11, 2021 1:00 PM
To: Modem, Bhanuprakash <Bhanuprakash.Modem@intel.com>; intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
Subject: RE: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_plane_alpha_blend: Don't set primary fb color in coverage-vs-premult-vs-constant

Thank you Bhanu. This test is failing on all planes > 0. Only plane 0 passes.
If I skip plane 1, it fails on 2 and so on.
Changing the way CRC is being collected also is not helping. Adding vblank is also not helping.

Regards
Vidya

-----Original Message-----
From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
Sent: Friday, June 11, 2021 9:11 AM
To: Srinivas, Vidya <vidya.srinivas@intel.com>; intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
Subject: RE: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_plane_alpha_blend: Don't set primary fb color in coverage-vs-premult-vs-constant

> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of 
> Vidya Srinivas
> Sent: Tuesday, June 1, 2021 7:38 PM
> To: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_plane_alpha_blend: 
> Don't set primary fb color in coverage-vs-premult-vs-constant
> 
> Patch removes setting primary fb color in 
> coverage-vs-premult-vs-constant as this is causing CRC mismatch on few Gen11 systems.

I am not sure how Primary plane's bg color causing CRC mismatch.
Also, as this test runs on all planes (those are having the props "alpha" and "pixel blend mode"), is this test failing on a particular plane?

- Bhanu

> Similar change has already been done in tests constant_alpha_min and 
> basic_alpha where the test runs on all planes but dont set the primary 
> fb color.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c 
> b/tests/kms_plane_alpha_blend.c index a37cb27c7d62..224d79bd1749
> 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -447,10 +447,6 @@ static void coverage_premult_constant(data_t 
> *data, enum pipe pipe, igt_plane_t
>  	igt_display_t *display = &data->display;
>  	igt_crc_t ref_crc = {}, crc = {};
> 
> -	/* Set a background color on the primary fb for testing */
> -	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> -		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe],
> DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
> -
>  	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
>  	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> --
> 2.7.4
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
