Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415656E8C4
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Mar 2021 12:34:07 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 30 Mar 2021 12:34:04 +0000
Message-ID: <82eb1d95afcd4383ac8a15e2a2d64e48@intel.com>
References: <20210325171222.26283-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210325171222.26283-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip_scaled_crc: skip test if
 no requested mode and exceed cdclk limits
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

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-
> Pekka Heikkila
> Sent: Thursday, March 25, 2021 7:12 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_scaled_crc: skip test if no
> requested mode and exceed cdclk limits
> 
> If there was no requested 640p or 1080p mode available in connector and
> flipping to scaled fb fail with einval assume cdclk limits were exceeded and
> skip test instead of failing.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  tests/kms_flip_scaled_crc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c index
> c41709b68..35417396e 100644
> --- a/tests/kms_flip_scaled_crc.c
> +++ b/tests/kms_flip_scaled_crc.c
> @@ -204,6 +204,9 @@ static void test_flip_to_scaled(data_t *data, uint32_t
> index, enum pipe pipe,
> 
>  	igt_require_f(ret != -ERANGE,
>  		      "Platform scaling limits exceeded, skipping.\n");
> +	igt_require_f(!(ret == -EINVAL && !modetoset),
> +		      "No %dp and default mode too big, cdclk limits exceeded.
> Skipping.\n",
> +		      data->attemptmodeheight);
>  	igt_assert_eq(ret, 0);
> 
>  	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
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
