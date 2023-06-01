Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB8410E21A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 08:08:33 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5149bdb59daso853747a12.2
 for <igt-dev@lists.freedesktop.org>; Thu, 01 Jun 2023 01:08:33 -0700 (PDT)
Message-ID: <3a533248-c958-927f-1b7e-89647df5b8c8@gmail.com>
Date: Thu, 1 Jun 2023 11:08:25 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230530051852.342524-1-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230530051852.342524-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: make test name
 uniform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 30.5.2023 8.18, Swati Sharma wrote:
> Rename "upscale" test to "upscale-factor" to align with rest of
> the tests.
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_plane_scaling.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 0e7cd4a2..77bb905b 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -312,7 +312,7 @@ const struct {
>   	},
>   	{
>   		"Tests downscaling (scaling factor 0.25) and upscaling (scaling factor 0.25) of 2 planes.",
> -		"planes-downscale-factor-0-25-upscale-0-25",
> +		"planes-downscale-factor-0-25-upscale-factor-0-25",
>   		0.25,
>   		0.25,
>   		TEST_PLANES_DOWNSCALE_UPSCALE,
> @@ -333,7 +333,7 @@ const struct {
>   	},
>   	{
>   		"Tests downscaling (scaling factor 0.5) and upscaling (scaling factor 0.25) of 2 planes.",
> -		"planes-downscale-factor-0-5-upscale-0-25",
> +		"planes-downscale-factor-0-5-upscale-factor-0-25",
>   		0.5,
>   		0.25,
>   		TEST_PLANES_DOWNSCALE_UPSCALE,
> @@ -354,7 +354,7 @@ const struct {
>   	},
>   	{
>   		"Tests downscaling (scaling factor 0.75) and upscaling (scaling factor 0.25) of 2 planes.",
> -		"planes-downscale-factor-0-75-upscale-0-25",
> +		"planes-downscale-factor-0-75-upscale-factor-0-25",
>   		0.75,
>   		0.25,
>   		TEST_PLANES_DOWNSCALE_UPSCALE,
