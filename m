Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4F46EE46
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Feb 2021 14:54:00 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Thu, 11 Feb 2021 14:53:56 +0000
Message-ID: <SN6PR11MB3327BB1AB03BFA04201D54F48D8C9@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20210129043037.14665-1-nidhi1.gupta@intel.com>
In-Reply-To: <20210129043037.14665-1-nidhi1.gupta@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: added test
 description
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
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Nidhi Gupta <nidhi1.gupta@intel.com>
> Sent: Friday, January 29, 2021 10:01 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Subject: [PATCH i-g-t] tests/kms_cursor_legacy: added test description
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 6034ad04..95491229 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1365,6 +1365,8 @@ igt_main
>  		igt_display_require(&display, display.drm_fd);
>  	}
> 
> +	igt_describe("Test checks how many cursor updates we can fit between
> vblanks"
> +		     "on single pipe with different modes, priority and number
> of processes");
>  	igt_subtest_group {
>  		enum pipe n;
>  		for_each_pipe_static(n) {
> @@ -1391,6 +1393,10 @@ igt_main
>  		}
>  	}
> 
> +	/*Test description for all-pipes-* tests*/
> +	igt_describe("Test checks how many cursor updates we can fit between
> vblanks"
> +		     "on all pipes with different modes, priority and number of
> processes");
> +
Shall we group all-pipe tests? so that same describe will apply to every
all-pipe test.

>  	igt_subtest("all-pipes-single-bo")
>  		stress(&display, -1, 1, DRM_MODE_CURSOR_BO, 20);
>  	igt_subtest("all-pipes-single-move")
> @@ -1412,6 +1418,10 @@ igt_main
>  	igt_subtest("long-nonblocking-modeset-vs-cursor-atomic")
>  		nonblocking_modeset_vs_cursor(&display, 16);
> 
> +	/*Test Description for 2x-* tests*/
> +	igt_describe("This test executes flips on both CRTCs"
> +		     "while running cursor updates in parallel");
> +
Please check above comment

>  	igt_subtest("2x-flip-vs-cursor-legacy")
>  		two_screens_flip_vs_cursor(&display, 8, false, false);
> 
> @@ -1485,11 +1495,14 @@ igt_main
>  			}
>  		}
> 
> +		igt_describe("Each iteration tries to squeeze target number of
> cursor"
> +                             "updates in half a second worth of flips");
Please check above comment

Also, describe is missing for few subtests. Please ignore this comment if
not applicable.
>  		igt_subtest_f("%sflip-after-cursor-%s", prefix, modes[i])
>  			basic_flip_cursor(&display, i, FLIP_AFTER_CURSOR, 0);
> 
>  		igt_subtest_f("flip-vs-cursor-%s", modes[i])
>  			flip_vs_cursor(&display, i, 150);
> +
>  		igt_subtest_f("cursor-vs-flip-%s", modes[i])
>  			cursor_vs_flip(&display, i, 50);
> 
> --
> 2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
