Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30266E5C3
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 06:25:21 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Mon, 26 Jul 2021 06:25:14 +0000
Message-ID: <BY5PR11MB4372438526C2676718A00C3589E89@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210723093844.22352-1-vidya.srinivas@intel.com>
In-Reply-To: <20210723093844.22352-1-vidya.srinivas@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Fix hw stride length
 tests
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello Karthik, Bhanu,

Kindly check if this fix is right and approve. Thank you.

Regards
Vidya

> -----Original Message-----
> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Friday, July 23, 2021 3:09 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar,
> Uma <uma.shankar@intel.com>; Almahallawy, Khaled
> <khaled.almahallawy@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>;
> Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>; Lin, Charlton
> <charlton.lin@intel.com>; Latvala, Petri <petri.latvala@intel.com>; Srinivas,
> Vidya <vidya.srinivas@intel.com>; Lin, Charlton <charlton.lin@intel.com>
> Subject: [PATCH i-g-t] tests/kms_big_fb: Fix hw stride length tests
> 
> We see the HW stride length tests are crashing when run in sequence.
> Individually, they PASS.
> This is happening due to missing data.ibb creation before the test_scanout.
> Patch fixes the same.
> 
> Signed-off-by: Lin Charlton <charlton.lin@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_big_fb.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c index
> c6f374bdd073..91439ceb34b6 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -978,7 +978,9 @@ igt_main
>  						igt_require(data.format ==
> DRM_FORMAT_C8 ||
> 
> 	igt_fb_supported_format(data.format));
> 
> 	igt_require(igt_display_has_format_mod(&data.display,
> data.format, data.modifier));
> +						data.ibb =
> intel_bb_create(data.drm_fd, 4096);
>  						test_scanout(&data);
> +						intel_bb_destroy(data.ibb);
>  					}
> 
>  					// async flip doesn't support linear
> fbs.
> @@ -994,7 +996,9 @@ igt_main
> 
> 	igt_require(igt_display_has_format_mod(&data.display,
> data.format, data.modifier));
> 
> 	igt_require_f(data.async_flip_support, "Async Flip is not
> supported\n");
> 
> 	data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >>
> 3), data.max_fb_width);
> +							data.ibb =
> intel_bb_create(data.drm_fd, 4096);
>  							test_scanout(&data);
> +
> 	intel_bb_destroy(data.ibb);
>  					}
>  					data.async_flip_test = false;
>  				}
> --
> 2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
