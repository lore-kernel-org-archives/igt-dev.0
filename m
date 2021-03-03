Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B246E04A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 11:02:42 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Wed, 3 Mar 2021 11:02:30 +0000
Message-ID: <SN6PR11MB332733A9ED339DFB062288EB8D989@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20210302042736.28431-1-nidhi1.gupta@intel.com>
In-Reply-To: <20210302042736.28431-1-nidhi1.gupta@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_legacy: added test
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
> Sent: Tuesday, March 2, 2021 9:58 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Gupta, Nidhi1
> <nidhi1.gupta@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_cursor_legacy: added test description
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 6034ad04..746e1153 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1365,6 +1365,9 @@ igt_main
>  		igt_display_require(&display, display.drm_fd);
>  	}
> 
> +	/*Test description for pipe-* and all-pipe-* tests*/
> +	igt_describe("Test checks how many cursor updates we can fit between
> vblanks"
> +		     "on single pipe with different modes, priority and number
> of processes");
>  	igt_subtest_group {
>  		enum pipe n;
>  		for_each_pipe_static(n) {
> @@ -1412,6 +1415,10 @@ igt_main
>  	igt_subtest("long-nonblocking-modeset-vs-cursor-atomic")
>  		nonblocking_modeset_vs_cursor(&display, 16);
> 
> +	/*Test Description for 2x-* tests*/
> +	igt_describe("This test executes flips on both CRTCs"
> +		     "while running cursor updates in parallel");
> +
>  	igt_subtest("2x-flip-vs-cursor-legacy")
>  		two_screens_flip_vs_cursor(&display, 8, false, false);
> 
> @@ -1442,18 +1449,28 @@ igt_main
>  	igt_subtest("2x-long-cursor-vs-flip-atomic")
>  		two_screens_cursor_vs_flip(&display, 50, true);
> 
> +	/*Test description for cursor-crc tests*/
> +	igt_describe("Test will first does a page flip and then cursor
> update");
>  	igt_subtest("flip-vs-cursor-crc-legacy")
>  		flip_vs_cursor_crc(&display, false);
> 
>  	igt_subtest("flip-vs-cursor-crc-atomic")
>  		flip_vs_cursor_crc(&display, true);
> 
> +	/*Test description for busy-crc tests*/
> +	igt_describe("this test perform a busy bo update followed by a
> cursor update");
>  	igt_subtest("flip-vs-cursor-busy-crc-legacy")
>  		flip_vs_cursor_busy_crc(&display, false);
> 
>  	igt_subtest("flip-vs-cursor-busy-crc-atomic")
>  		flip_vs_cursor_busy_crc(&display, true);
> 
> +	igt_describe("Adds variety of tests:"
> +		     "varying-size: change the size of cursor b/w 64*64 to maxw
> x maxh"
> +		     "atomic-transition: alternates between a full screen
> sprite plane"
> +				         "and full screen primary plane"
> +		     "toggle: which toggles cursor visibility and make sure
> cursor moves"
> +			      "between updates");
>  	for (i = 0; i <= flip_test_last; i++) {
>  		const char *modes[flip_test_last+1] = {
>  			"legacy",
> @@ -1485,11 +1502,14 @@ igt_main
>  			}
>  		}
> 
> +		igt_describe("The essence of the basic test is that neither the
> cursor nor the"
In case of multiline description, please add a space at the end of each line
also, try to group the subtets, so that same description will apply for all
similar tests, how about below git diff on top of this change?

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 746e11532..eb226d90f 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1366,7 +1366,7 @@ igt_main
        }

        /*Test description for pipe-* and all-pipe-* tests*/
-       igt_describe("Test checks how many cursor updates we can fit between vblanks"
+       igt_describe("Test checks how many cursor updates we can fit between vblanks "
                     "on single pipe with different modes, priority and number of processes");
        igt_subtest_group {
                enum pipe n;
@@ -1394,83 +1394,87 @@ igt_main
                }
        }

-       igt_subtest("all-pipes-single-bo")
-               stress(&display, -1, 1, DRM_MODE_CURSOR_BO, 20);
-       igt_subtest("all-pipes-single-move")
-               stress(&display, -1, 1, DRM_MODE_CURSOR_MOVE, 20);
-
-       igt_subtest("all-pipes-forked-bo")
-               stress(&display, -1, ncpus, DRM_MODE_CURSOR_BO, 20);
-       igt_subtest("all-pipes-forked-move")
-               stress(&display, -1, ncpus, DRM_MODE_CURSOR_MOVE, 20);
-
-       igt_subtest("all-pipes-torture-bo")
-               stress(&display, -1, -ncpus, DRM_MODE_CURSOR_BO, 20);
-       igt_subtest("all-pipes-torture-move")
-               stress(&display, -1, -ncpus, DRM_MODE_CURSOR_MOVE, 20);
-
-       igt_subtest("nonblocking-modeset-vs-cursor-atomic")
-               nonblocking_modeset_vs_cursor(&display, 1);
-
-       igt_subtest("long-nonblocking-modeset-vs-cursor-atomic")
-               nonblocking_modeset_vs_cursor(&display, 16);
+       /*Test description for pipe-* and all-pipe-* tests*/
+       igt_describe("Test checks how many cursor updates we can fit between vblanks "
+                    "on all pipes with different modes, priority and number of processes");
+       igt_subtest_group {
+               igt_subtest("all-pipes-single-bo")
+                       stress(&display, -1, 1, DRM_MODE_CURSOR_BO, 20);
+               igt_subtest("all-pipes-single-move")
+                       stress(&display, -1, 1, DRM_MODE_CURSOR_MOVE, 20);
+
+               igt_subtest("all-pipes-forked-bo")
+                       stress(&display, -1, ncpus, DRM_MODE_CURSOR_BO, 20);
+               igt_subtest("all-pipes-forked-move")
+                       stress(&display, -1, ncpus, DRM_MODE_CURSOR_MOVE, 20);
+
+               igt_subtest("all-pipes-torture-bo")
+                       stress(&display, -1, -ncpus, DRM_MODE_CURSOR_BO, 20);
+               igt_subtest("all-pipes-torture-move")
+                       stress(&display, -1, -ncpus, DRM_MODE_CURSOR_MOVE, 20);
+
+               igt_subtest("nonblocking-modeset-vs-cursor-atomic")
+                       nonblocking_modeset_vs_cursor(&display, 1);
+
+               igt_subtest("long-nonblocking-modeset-vs-cursor-atomic")
+                       nonblocking_modeset_vs_cursor(&display, 16);
+       }

        /*Test Description for 2x-* tests*/
-       igt_describe("This test executes flips on both CRTCs"
+       igt_describe("This test executes flips on both CRTCs "
                     "while running cursor updates in parallel");
+       igt_subtest_group {
+               igt_subtest("2x-flip-vs-cursor-legacy")
+                       two_screens_flip_vs_cursor(&display, 8, false, false);

-       igt_subtest("2x-flip-vs-cursor-legacy")
-               two_screens_flip_vs_cursor(&display, 8, false, false);
-
-       igt_subtest("2x-flip-vs-cursor-atomic")
-               two_screens_flip_vs_cursor(&display, 8, false, true);
+               igt_subtest("2x-flip-vs-cursor-atomic")
+                       two_screens_flip_vs_cursor(&display, 8, false, true);

-       igt_subtest("2x-cursor-vs-flip-legacy")
-               two_screens_cursor_vs_flip(&display, 8, false);
+               igt_subtest("2x-cursor-vs-flip-legacy")
+                       two_screens_cursor_vs_flip(&display, 8, false);

-       igt_subtest("2x-long-flip-vs-cursor-legacy")
-               two_screens_flip_vs_cursor(&display, 150, false, false);
+               igt_subtest("2x-long-flip-vs-cursor-legacy")
+                       two_screens_flip_vs_cursor(&display, 150, false, false);

-       igt_subtest("2x-long-flip-vs-cursor-atomic")
-               two_screens_flip_vs_cursor(&display, 150, false, true);
+               igt_subtest("2x-long-flip-vs-cursor-atomic")
+                       two_screens_flip_vs_cursor(&display, 150, false, true);

-       igt_subtest("2x-long-cursor-vs-flip-legacy")
-               two_screens_cursor_vs_flip(&display, 50, false);
+               igt_subtest("2x-long-cursor-vs-flip-legacy")
+                       two_screens_cursor_vs_flip(&display, 50, false);

-       igt_subtest("2x-nonblocking-modeset-vs-cursor-atomic")
-               two_screens_flip_vs_cursor(&display, 4, true, true);
+               igt_subtest("2x-nonblocking-modeset-vs-cursor-atomic")
+                       two_screens_flip_vs_cursor(&display, 4, true, true);

-       igt_subtest("2x-cursor-vs-flip-atomic")
-               two_screens_cursor_vs_flip(&display, 8, true);
+               igt_subtest("2x-cursor-vs-flip-atomic")
+                       two_screens_cursor_vs_flip(&display, 8, true);

-       igt_subtest("2x-long-nonblocking-modeset-vs-cursor-atomic")
-               two_screens_flip_vs_cursor(&display, 15, true, true);
+               igt_subtest("2x-long-nonblocking-modeset-vs-cursor-atomic")
+                       two_screens_flip_vs_cursor(&display, 15, true, true);

-       igt_subtest("2x-long-cursor-vs-flip-atomic")
-               two_screens_cursor_vs_flip(&display, 50, true);
+               igt_subtest("2x-long-cursor-vs-flip-atomic")
+                       two_screens_cursor_vs_flip(&display, 50, true);
+       }

        /*Test description for cursor-crc tests*/
        igt_describe("Test will first does a page flip and then cursor update");
-       igt_subtest("flip-vs-cursor-crc-legacy")
-               flip_vs_cursor_crc(&display, false);
+       igt_subtest_group {
+               igt_subtest("flip-vs-cursor-crc-legacy")
+                       flip_vs_cursor_crc(&display, false);

-       igt_subtest("flip-vs-cursor-crc-atomic")
-               flip_vs_cursor_crc(&display, true);
+               igt_subtest("flip-vs-cursor-crc-atomic")
+                       flip_vs_cursor_crc(&display, true);
+       }

        /*Test description for busy-crc tests*/
        igt_describe("this test perform a busy bo update followed by a cursor update");
-       igt_subtest("flip-vs-cursor-busy-crc-legacy")
-               flip_vs_cursor_busy_crc(&display, false);
-
-       igt_subtest("flip-vs-cursor-busy-crc-atomic")
-               flip_vs_cursor_busy_crc(&display, true);
-
-       igt_describe("Adds variety of tests:"
-                    "varying-size: change the size of cursor b/w 64*64 to maxw x maxh"
-                    "atomic-transition: alternates between a full screen sprite plane"
-                                        "and full screen primary plane"
-                    "toggle: which toggles cursor visibility and make sure cursor moves"
-                             "between updates");
+       igt_subtest_group {
+               igt_subtest("flip-vs-cursor-busy-crc-legacy")
+                       flip_vs_cursor_busy_crc(&display, false);
+
+               igt_subtest("flip-vs-cursor-busy-crc-atomic")
+                       flip_vs_cursor_busy_crc(&display, true);
+       }
+
        for (i = 0; i <= flip_test_last; i++) {
                const char *modes[flip_test_last+1] = {
                        "legacy",
@@ -1491,39 +1495,44 @@ igt_main
                default: break;
                }

-               igt_subtest_f("%sflip-before-cursor-%s", prefix, modes[i])
-                       basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR, 0);
-
-               if (!cursor_slowpath(i)) {
-                       igt_subtest_f("%sbusy-flip-before-cursor-%s", prefix, modes[i]) {
-                               igt_require_gem(display.drm_fd);
-                               basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR,
-                                                 BASIC_BUSY);
+               igt_describe("varying-size: change the size of cursor b/w 64*64 to maxw*maxh. "
+                            "atomic-transition: alternates between a sprite and primary planes. "
+                            "toggle: toggle cursor visibility and make sure cursor moves between updates.");
+               igt_subtest_group {
+                       igt_subtest_f("%sflip-before-cursor-%s", prefix, modes[i])
+                               basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR, 0);
+
+                       if (!cursor_slowpath(i)) {
+                               igt_subtest_f("%sbusy-flip-before-cursor-%s", prefix, modes[i]) {
+                                       igt_require_gem(display.drm_fd);
+                                       basic_flip_cursor(&display, i,
+                                                       FLIP_BEFORE_CURSOR,
+                                                       BASIC_BUSY);
+
+                               }
                        }
-               }

-               igt_describe("The essence of the basic test is that neither the cursor nor the"
-                            "nonblocking flip stall the application of the next");
-               igt_subtest_f("%sflip-after-cursor-%s", prefix, modes[i])
-                       basic_flip_cursor(&display, i, FLIP_AFTER_CURSOR, 0);
+                       igt_subtest_f("%sflip-after-cursor-%s", prefix, modes[i])
+                               basic_flip_cursor(&display, i, FLIP_AFTER_CURSOR, 0);

-               igt_subtest_f("flip-vs-cursor-%s", modes[i])
-                       flip_vs_cursor(&display, i, 150);
+                       igt_subtest_f("flip-vs-cursor-%s", modes[i])
+                               flip_vs_cursor(&display, i, 150);

-               igt_subtest_f("cursor-vs-flip-%s", modes[i])
-                       cursor_vs_flip(&display, i, 50);
+                       igt_subtest_f("cursor-vs-flip-%s", modes[i])
+                               cursor_vs_flip(&display, i, 50);

-               igt_subtest_f("cursorA-vs-flipA-%s", modes[i])
-                       flip(&display, 0, 0, 10, i);
+                       igt_subtest_f("cursorA-vs-flipA-%s", modes[i])
+                               flip(&display, 0, 0, 10, i);

-               igt_subtest_f("cursorA-vs-flipB-%s", modes[i])
-                       flip(&display, 0, 1, 10, i);
+                       igt_subtest_f("cursorA-vs-flipB-%s", modes[i])
+                               flip(&display, 0, 1, 10, i);

-               igt_subtest_f("cursorB-vs-flipA-%s", modes[i])
-                       flip(&display, 1, 0, 10, i);
+                       igt_subtest_f("cursorB-vs-flipA-%s", modes[i])
+                               flip(&display, 1, 0, 10, i);

-               igt_subtest_f("cursorB-vs-flipB-%s", modes[i])
-                       flip(&display, 1, 1, 10, i);
+                       igt_subtest_f("cursorB-vs-flipB-%s", modes[i])
+                               flip(&display, 1, 1, 10, i);
+               }
        }

        igt_fixture { 
> +			     "nonblocking flip stall the application of the
> next");
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
