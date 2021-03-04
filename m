Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154726E4BA
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Mar 2021 15:19:50 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Thu, 4 Mar 2021 15:19:42 +0000
Message-ID: <SN6PR11MB3327E49260C0EF0813F4B5E08D979@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20210304114814.1767-1-nidhi1.gupta@intel.com>
In-Reply-To: <20210304114814.1767-1-nidhi1.gupta@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_cursor_legacy: added test
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
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Sent: Thursday, March 4, 2021 5:18 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Gupta, Nidhi1
> <nidhi1.gupta@intel.com>
> Subject: [PATCH i-g-t v4] tests/kms_cursor_legacy: added test description
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>  tests/kms_cursor_legacy.c | 158 +++++++++++++++++++++++---------------
>  1 file changed, 98 insertions(+), 60 deletions(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 6034ad04..d132ec76 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1365,6 +1365,9 @@ igt_main
>  		igt_display_require(&display, display.drm_fd);
>  	}
> 
> +	/*Test description for pipe-* and all-pipe-* tests*/
> +	igt_describe("Test checks how many cursor updates we can fit between
> vblanks "
> +		     "on single pipe with different modes, priority and number
> of processes");
>  	igt_subtest_group {
>  		enum pipe n;
>  		for_each_pipe_static(n) {
> @@ -1391,69 +1394,91 @@ igt_main
>  		}
>  	}
> 
> -	igt_subtest("all-pipes-single-bo")
> -		stress(&display, -1, 1, DRM_MODE_CURSOR_BO, 20);
> -	igt_subtest("all-pipes-single-move")
> -		stress(&display, -1, 1, DRM_MODE_CURSOR_MOVE, 20);
> +       /*Test description for pipe-* and all-pipe-* tests*/
> +       igt_describe("Test checks how many cursor updates we can fit
> between vblanks "
> +                    "on all pipes with different modes, priority and
> number of processes");
> +       igt_subtest_group {
> 
> -	igt_subtest("all-pipes-forked-bo")
> -		stress(&display, -1, ncpus, DRM_MODE_CURSOR_BO, 20);
> -	igt_subtest("all-pipes-forked-move")
> -		stress(&display, -1, ncpus, DRM_MODE_CURSOR_MOVE, 20);
> +		igt_subtest("all-pipes-single-bo")
> +			stress(&display, -1, 1, DRM_MODE_CURSOR_BO, 20);
> +		igt_subtest("all-pipes-single-move")
> +			stress(&display, -1, 1, DRM_MODE_CURSOR_MOVE, 20);
> 
> -	igt_subtest("all-pipes-torture-bo")
> -		stress(&display, -1, -ncpus, DRM_MODE_CURSOR_BO, 20);
> -	igt_subtest("all-pipes-torture-move")
> -		stress(&display, -1, -ncpus, DRM_MODE_CURSOR_MOVE, 20);
> +		igt_subtest("all-pipes-forked-bo")
> +			stress(&display, -1, ncpus, DRM_MODE_CURSOR_BO, 20);
> +		igt_subtest("all-pipes-forked-move")
> +			stress(&display, -1, ncpus, DRM_MODE_CURSOR_MOVE, 20);
> 
> -	igt_subtest("nonblocking-modeset-vs-cursor-atomic")
> -		nonblocking_modeset_vs_cursor(&display, 1);
> +		igt_subtest("all-pipes-torture-bo")
> +			stress(&display, -1, -ncpus, DRM_MODE_CURSOR_BO, 20);
> +		igt_subtest("all-pipes-torture-move")
> +			stress(&display, -1, -ncpus, DRM_MODE_CURSOR_MOVE, 20);
> 
> -	igt_subtest("long-nonblocking-modeset-vs-cursor-atomic")
> -		nonblocking_modeset_vs_cursor(&display, 16);
> +		igt_subtest("nonblocking-modeset-vs-cursor-atomic")
> +			nonblocking_modeset_vs_cursor(&display, 1);
> 
> -	igt_subtest("2x-flip-vs-cursor-legacy")
> -		two_screens_flip_vs_cursor(&display, 8, false, false);
> +		igt_subtest("long-nonblocking-modeset-vs-cursor-atomic")
> +			nonblocking_modeset_vs_cursor(&display, 16);
> +	}
> +
> +	/*Test Description for 2x-* tests*/
> +	igt_describe("This test executes flips on both CRTCs "
> +		     "while running cursor updates in parallel");
> +	igt_subtest_group {
> +
> +		igt_subtest("2x-flip-vs-cursor-legacy")
> +			two_screens_flip_vs_cursor(&display, 8, false, false);
> 
> -	igt_subtest("2x-flip-vs-cursor-atomic")
> -		two_screens_flip_vs_cursor(&display, 8, false, true);
> +		igt_subtest("2x-flip-vs-cursor-atomic")
> +			two_screens_flip_vs_cursor(&display, 8, false, true);
> 
> -	igt_subtest("2x-cursor-vs-flip-legacy")
> -		two_screens_cursor_vs_flip(&display, 8, false);
> +		igt_subtest("2x-cursor-vs-flip-legacy")
> +			two_screens_cursor_vs_flip(&display, 8, false);
> 
> -	igt_subtest("2x-long-flip-vs-cursor-legacy")
> -		two_screens_flip_vs_cursor(&display, 150, false, false);
> +		igt_subtest("2x-long-flip-vs-cursor-legacy")
> +			two_screens_flip_vs_cursor(&display, 150, false, false);
> 
> -	igt_subtest("2x-long-flip-vs-cursor-atomic")
> -		two_screens_flip_vs_cursor(&display, 150, false, true);
> +		igt_subtest("2x-long-flip-vs-cursor-atomic")
> +			two_screens_flip_vs_cursor(&display, 150, false, true);
> 
> -	igt_subtest("2x-long-cursor-vs-flip-legacy")
> -		two_screens_cursor_vs_flip(&display, 50, false);
> +		igt_subtest("2x-long-cursor-vs-flip-legacy")
> +			two_screens_cursor_vs_flip(&display, 50, false);
> 
> -	igt_subtest("2x-nonblocking-modeset-vs-cursor-atomic")
> -		two_screens_flip_vs_cursor(&display, 4, true, true);
> +		igt_subtest("2x-nonblocking-modeset-vs-cursor-atomic")
> +			two_screens_flip_vs_cursor(&display, 4, true, true);
> 
> -	igt_subtest("2x-cursor-vs-flip-atomic")
> -		two_screens_cursor_vs_flip(&display, 8, true);
> +		igt_subtest("2x-cursor-vs-flip-atomic")
> +			two_screens_cursor_vs_flip(&display, 8, true);
> 
> -	igt_subtest("2x-long-nonblocking-modeset-vs-cursor-atomic")
> -		two_screens_flip_vs_cursor(&display, 15, true, true);
> +		igt_subtest("2x-long-nonblocking-modeset-vs-cursor-atomic")
> +			two_screens_flip_vs_cursor(&display, 15, true, true);
> 
> -	igt_subtest("2x-long-cursor-vs-flip-atomic")
> -		two_screens_cursor_vs_flip(&display, 50, true);
> +		igt_subtest("2x-long-cursor-vs-flip-atomic")
> +			two_screens_cursor_vs_flip(&display, 50, true);
> +	}
> +
> +	/*Test description for cursor-crc tests*/
> +	igt_describe("Test will first does a page flip and then cursor
> update");
> +	igt_subtest_group {
> 
> -	igt_subtest("flip-vs-cursor-crc-legacy")
> -		flip_vs_cursor_crc(&display, false);
> +		igt_subtest("flip-vs-cursor-crc-legacy")
> +			flip_vs_cursor_crc(&display, false);
> 
> -	igt_subtest("flip-vs-cursor-crc-atomic")
> -		flip_vs_cursor_crc(&display, true);
> +		igt_subtest("flip-vs-cursor-crc-atomic")
> +			flip_vs_cursor_crc(&display, true);
> +	}
> 
> -	igt_subtest("flip-vs-cursor-busy-crc-legacy")
> -		flip_vs_cursor_busy_crc(&display, false);
> +	/*Test description for busy-crc tests*/
> +	igt_describe("this test perform a busy bo update followed by a
> cursor update");
> +	igt_subtest_group {
> 
> -	igt_subtest("flip-vs-cursor-busy-crc-atomic")
> -		flip_vs_cursor_busy_crc(&display, true);
> +		igt_subtest("flip-vs-cursor-busy-crc-legacy")
> +			flip_vs_cursor_busy_crc(&display, false);
> 
> +		igt_subtest("flip-vs-cursor-busy-crc-atomic")
> +			flip_vs_cursor_busy_crc(&display, true);
> +	}
> +
>  	for (i = 0; i <= flip_test_last; i++) {
>  		const char *modes[flip_test_last+1] = {
>  			"legacy",
> @@ -1473,7 +1498,13 @@ igt_main
>  			break;
>  		default: break;
>  		}
> -
> +
> +	igt_describe("Adds variety of tests: "
> +		     "varying-size: change the size of cursor b/w 64*64 to maxw
> x maxh. "
> +		     "atomic-transition: alternates between a full screen
> sprite plane. "
> +				         "and full screen primary plane. "
> +		     "toggle: which toggles cursor visibility and make sure
> cursor moves between updates.");
> +	igt_subtest_group {
>  		igt_subtest_f("%sflip-before-cursor-%s", prefix, modes[i])
>  			basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR, 0);
> 
> @@ -1484,27 +1515,34 @@ igt_main
>  						  BASIC_BUSY);
>  			}
>  		}
> +	}
> 
> -		igt_subtest_f("%sflip-after-cursor-%s", prefix, modes[i])
> -			basic_flip_cursor(&display, i, FLIP_AFTER_CURSOR, 0);
> +		igt_describe("The essence of the basic test is that neither the
> cursor nor the "
> +			     "nonblocking flip stall the application of the
> next");
> +		igt_subtest_group {
> +
> +			igt_subtest_f("%sflip-after-cursor-%s", prefix, modes[i])
> +				basic_flip_cursor(&display, i, FLIP_AFTER_CURSOR,
> 0);
> 
> -		igt_subtest_f("flip-vs-cursor-%s", modes[i])
> -			flip_vs_cursor(&display, i, 150);
> -		igt_subtest_f("cursor-vs-flip-%s", modes[i])
> -			cursor_vs_flip(&display, i, 50);
> +			igt_subtest_f("flip-vs-cursor-%s", modes[i])
> +				flip_vs_cursor(&display, i, 150);
> 
> -		igt_subtest_f("cursorA-vs-flipA-%s", modes[i])
> -			flip(&display, 0, 0, 10, i);
> +			igt_subtest_f("cursor-vs-flip-%s", modes[i])
> +				cursor_vs_flip(&display, i, 50);
> 
> -		igt_subtest_f("cursorA-vs-flipB-%s", modes[i])
> -			flip(&display, 0, 1, 10, i);
> +			igt_subtest_f("cursorA-vs-flipA-%s", modes[i])
> +				flip(&display, 0, 0, 10, i);
> 
> -		igt_subtest_f("cursorB-vs-flipA-%s", modes[i])
> -			flip(&display, 1, 0, 10, i);
> +			igt_subtest_f("cursorA-vs-flipB-%s", modes[i])
> +				flip(&display, 0, 1, 10, i);
> 
> -		igt_subtest_f("cursorB-vs-flipB-%s", modes[i])
> -			flip(&display, 1, 1, 10, i);
> -	}
> +			igt_subtest_f("cursorB-vs-flipA-%s", modes[i])
> +				flip(&display, 1, 0, 10, i);
> +
> +			igt_subtest_f("cursorB-vs-flipB-%s", modes[i])
> +				flip(&display, 1, 1, 10, i);
> +			}
> +		}
> 
>  	igt_fixture {
>  		igt_display_fini(&display);
> --
> 2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
