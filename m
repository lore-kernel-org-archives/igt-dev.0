Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3046EB68
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Apr 2021 10:26:40 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Fri, 16 Apr 2021 10:26:01 +0000
Message-ID: <aacca01484364b9e915113de8e2ce104@intel.com>
References: <20210414082556.14053-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210414082556.14053-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Let's not create
 full screen framebuffers in a loop
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Seems valid change.

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-
> Pekka Heikkila
> Sent: Wednesday, April 14, 2021 11:26 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Let's not create full
> screen framebuffers in a loop
> 
> Avoid creating full screen size fbs in a loop just to throw them away.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_cursor_crc.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c index
> 2619e15e0..1463c5b3f 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -492,13 +492,6 @@ static void test_cursor_opaque(data_t *data)
>  	test_cursor_alpha(data, 1.0);
>  }
> 
> -static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w,
> int cursor_h) -{
> -	prepare_crtc(data, data->output, cursor_w, cursor_h);
> -	testfunc(data);
> -	cleanup_crtc(data);
> -}
> -
>  static void create_cursor_fb(data_t *data, int cur_w, int cur_h)  {
>  	cairo_t *cr;
> @@ -567,6 +560,16 @@ static void require_cursor_size(data_t *data, int w,
> int h)
>  	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w,
> h);  }
> 
> +static void run_test(data_t *data, void (*testfunc)(data_t *), int
> +cursor_w, int cursor_h) {
> +	if (data->fb.fb_id != 0)
> +		require_cursor_size(data, cursor_w, cursor_h);
> +
> +	prepare_crtc(data, data->output, cursor_w, cursor_h);
> +	testfunc(data);
> +	cleanup_crtc(data);
> +}
> +
>  static void test_cursor_size(data_t *data)  {
>  	igt_display_t *display = &data->display; @@ -687,7 +690,6 @@ static
> void run_size_tests(data_t *data, enum pipe pipe,
>  				      w, h);
>  		}
>  		create_cursor_fb(data, w, h);
> -		require_cursor_size(data, w, h);
>  	}
> 
>  	/* Using created cursor FBs to test cursor support */
> --
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
