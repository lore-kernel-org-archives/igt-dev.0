Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A33899FF
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 12:41:18 +0000 (UTC)
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Date: Mon, 9 Nov 2020 12:41:16 +0000
Message-ID: <23cb64e30135aec96344044b0d8bacf22eb8b3b3.camel@intel.com>
References: <20201107111544.65260-1-chris@chris-wilson.co.uk>
 <20201109115410.249678-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201109115410.249678-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Content-ID: <3DCBBABFE49AC84C9CE87B453C025D4F@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr: Check for available
 modesetting support
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks you for fixing it.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On Mon, 2020-11-09 at 11:54 +0000, Chris Wilson wrote:
> Check that there is a valid output/mode combo before trying to
> dereference them.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2212
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/kms_psr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> index af81a259b..4b7513d7e 100644
> --- a/tests/kms_psr.c
> +++ b/tests/kms_psr.c
> @@ -411,8 +411,14 @@ static void setup_test_plane(data_t *data, int
> test_plane)
>  
>  static void test_setup(data_t *data)
>  {
> +	igt_require_f(data->output,
> +		      "No available output found\n");
> +	igt_require_f(data->mode,
> +		      "No available mode found on %s\n",
> +		      data->output->name);
>  	if (data->op_psr_mode == PSR_MODE_2)
>  		igt_require(data->supports_psr2);
> +
>  	psr_enable_if_enabled(data);
>  	setup_test_plane(data, data->test_plane_id);
>  	igt_assert(psr_wait_entry_if_enabled(data));
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
