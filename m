Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CDE6E80B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 05:04:48 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Wed, 7 Jul 2021 05:04:40 +0000
Message-ID: <68956fef62aa4191a9ae077da11a6820@intel.com>
References: <20210706212749.27996-1-swati2.sharma@intel.com>
In-Reply-To: <20210706212749.27996-1-swati2.sharma@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cdclk: Minor fix
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
To: "Sharma, Swati2" <swati2.sharma@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Sharma, Swati2 <swati2.sharma@intel.com>
> Sent: Wednesday, July 7, 2021 2:58 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: [igt-dev][PATCH i-g-t] tests/kms_cdclk: Minor fix
> 
> Driver still works in a such way that we never reduce CDCLK, but always only
> increase it. That was done in order to avoid continuous CDCLK switching,
> 
> So, in case if new CDCLK is 307200 and there is no change in CDCLK beacuse of
> above stated driver optimization; pass the test else check lt condition.

As discussed on offline chats, enhance this test to lower modes for all connectors in order
to lower cd clock and get a proper DVFS behavior, along with the above mentioned kernel change.

But for now, this change helps avoid getting false failure reports, so:
Reviewed-by: Uma Shankar <uma.shakar@intel.com>

> 
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_cdclk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cdclk.c b/tests/kms_cdclk.c index d2a9fa5f..818cbfd5 100644
> --- a/tests/kms_cdclk.c
> +++ b/tests/kms_cdclk.c
> @@ -31,6 +31,7 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling");
>  #define HDISPLAY_4K     3840
>  #define VDISPLAY_4K     2160
>  #define VREFRESH	60
> +#define MAX_CDCLK_4K    307200
> 
>  /* Test flags */
>  enum {
> @@ -228,7 +229,8 @@ static void test_mode_transition(data_t *data, enum pipe
> pipe, igt_output_t *out
>  	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
> 
>  	/* cdclk should bump */
> -	igt_assert_lt(cdclk_ref, cdclk_new);
> +	if (cdclk_new != MAX_CDCLK_4K)
> +		igt_assert_lt(cdclk_ref, cdclk_new);
> 
>  	/* cleanup */
>  	do_cleanup_display(display);
> --
> 2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
