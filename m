Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1816E88F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 10:12:52 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Wed, 25 Nov 2020 10:12:50 +0000
Message-ID: <878cfa7af6774e0b9b44f57a2f9e74c7@intel.com>
References: <20201123150312.55544-1-anandx.ram.moon@intel.com>
In-Reply-To: <20201123150312.55544-1-anandx.ram.moon@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i g t] tests/kms_setmode: basic Fix the testcase
 failure on 4K monitors
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
To: "Ram Moon, AnandX" <anandx.ram.moon@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Anand
> Moon
> Sent: Monday, November 23, 2020 5:03 PM
> To: igt-dev@lists.freedesktop.org; Chris Wilson <chris@chris-wilson.co.uk>
> Subject: [igt-dev] [i g t] tests/kms_setmode: basic Fix the testcase failure on
> 4K monitors
> 
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> On 4k monitors kms_setmode basic test case would like to fail with below
> assertion, by checking the expected frame time should be less than max
> scanline interval, we improve the test case so that 90% of frame times fall
> within the one scanline on each side of expected mean.
> 
> CRTC[98] [Pipe A] Mode: 3840x2160@60Hz Connectors: DP-2[330] Expected
> frametime: 16668us; measured 16672.3us +- 1.805us accuracy 0.00% [0.07
> scanlines]
> (kms_setmode:14315) CRITICAL: Test assertion failure function
> check_timings, file ../tests/kms_setmode.c:544:
> (kms_setmode:14315) CRITICAL: Failed assertion: fabs(mean - expected) <
> 1.718 * stddev
> (kms_setmode:14315) CRITICAL: vblank interval differs from modeline!
> expected 16667.6us, measured 16672us +- 1.805us, difference 4.7us (2.6
> sigma) Stack trace:
>   #0 ../lib/igt_core.c:1734 __igt_fail_assert()
>   #1 ../tests/kms_setmode.c:544 test_one_combination()
>   #2 ../tests/kms_setmode.c:834 __real_main883()
>   #3 ../tests/kms_setmode.c:883 main()
>   #4 ../csu/libc-start.c:342 __libc_start_main()
>   #5 [_start+0x2e]
> Subtest basic failed.
> **** DEBUG ****
> 
> Cc: Dorota Czaplejewicz <dorota.czaplejewicz@collabora.co.uk>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>

Seems reasonable change.

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
> 
> And all the testcase regarding kms_setmode seems to passing on 5.8.x and
> 5.10-0-rcx kernel with following mode
> 
> Mode: 1920x1080 at 60Hz Connectors: HDMI-A-2
> Mode: 1920x1080 at 60Hz Connectors: DP-1
> Mode: 1920x1080 at 60Hz Connectors: DP-2
> Mode: 2560x1440 at 60Hz Connectors: eDP-1
> Mode: 3840x2160 at 60Hz Connectors: DP-2
> ---
>  tests/kms_setmode.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
> a01010a1..d55326f2 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -525,10 +525,13 @@ static void check_timings(int crtc_idx, const
> drmModeModeInfo *kmode)
>  	 * See:
>  	 *
> https://en.wikipedia.org/wiki/Standard_deviation#Rules_for_normally_distri
> buted_data
>  	 */
> -	igt_assert_f(fabs(mean - expected) < 1.718 * stddev,
> -		     "vblank interval differs from modeline! expected %.1fus,
> measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma)\n",
> -		     expected, mean, stddev,
> -		     fabs(mean - expected), fabs(mean - expected) / stddev);
> +	igt_assert_f(fabs(mean - expected) < max(line_time(kmode), 1.718 *
> stddev),
> +			"vblank interval differs from modeline! expected
> %.1fus, measured"
> +			" %1.fus +- %.3fus, difference %.1fus (%.1f sigma,
> %.1f scanlines)\n",
> +			expected, mean, stddev,
> +			fabs(mean - expected),
> +			fabs(mean - expected) / stddev,
> +			fabs(mean - expected) / line_time(kmode));
>  }
> 
>  static void test_crtc_config(const struct test_config *tconf,
> --
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
