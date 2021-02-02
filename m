Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1F16E0EE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Feb 2021 11:03:41 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 2 Feb 2021 11:03:38 +0000
Message-ID: <d322e6ad5fa34951b21da9bfbe324036@intel.com>
References: <20210201184041.30451-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210201184041.30451-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip_scaled: on mode
 selection choose mode with lowest vertical refresh
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
> Sent: Monday, February 1, 2021 8:41 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_scaled: on mode selection
> choose mode with lowest vertical refresh
> 
> Use mode with lowest vertical refresh to keep needed cdclk down.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  tests/kms_flip_scaled_crc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c index
> f77484063..c41709b68 100644
> --- a/tests/kms_flip_scaled_crc.c
> +++ b/tests/kms_flip_scaled_crc.c
> @@ -174,9 +174,12 @@ static void test_flip_to_scaled(data_t *data,
> uint32_t index, enum pipe pipe,
>  	for (int i = 0; i < output->config.connector->count_modes; i++) {
>  		if (output->config.connector->modes[i].hdisplay == data-
> >attemptmodewidth &&
>  		   output->config.connector->modes[i].vdisplay == data-
> >attemptmodeheight) {
> +			if (modetoset &&
> +			    modetoset->vrefresh < output->config.connector-
> >modes[i].vrefresh)
> +				continue;
> +
>  			modetoset = &output->config.connector->modes[i];
> -			break;
> -		   }
> +		}
>  	}
> 
>  	if (!modetoset)
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
