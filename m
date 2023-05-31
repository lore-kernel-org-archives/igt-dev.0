Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261FC10E491
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 08:10:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5147f5efeb5so8880483a12.0
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 01:10:56 -0700 (PDT)
Message-ID: <2e738b13-0afb-c049-1fff-c6108a23cdac@gmail.com>
Date: Wed, 31 May 2023 11:10:46 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230529121143.327907-1-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230529121143.327907-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_rotation_crc: enable and
 optimize test for sim
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

look ok to me. While pushing you could fix typo from commit message, 
"PO10" -> "P010".

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 29.5.2023 15.11, Swati Sharma wrote:
> To reduce execution time in simulation dropping RGB565 and PO10
> formats (coverage is not compromised, we do have NV12 and RGB888
> formats being validated).
> Also, skipping buffered CRC reusecrcfromlastround() in simulation.
> 
> v2: -Add checks inside multiplaneskiproundcheck() and
>       reusecrcfromlastround() (JP)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_rotation_crc.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 28b4fd27..0a22cc22 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -719,6 +719,16 @@ static bool multiplaneskiproundcheck(data_t *data, planeinfos p[2])
>   	if (!igt_plane_has_rotation(p[1].plane, p[1].fbinfo->rotation))
>   		return false;
>   
> +	if (igt_run_in_simulation() &&
> +	   (multiplaneformatlist[p[0].formatindex] == DRM_FORMAT_P010 ||
> +	    multiplaneformatlist[p[0].formatindex] == DRM_FORMAT_RGB565))
> +		return false;
> +
> +	if (igt_run_in_simulation() &&
> +	   (multiplaneformatlist[p[1].formatindex] == DRM_FORMAT_P010 ||
> +	    multiplaneformatlist[p[1].formatindex] == DRM_FORMAT_RGB565))
> +		return false;
> +
>   	return true;
>   }
>   
> @@ -765,6 +775,9 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
>   				  int lastroundp0rotation,
>   				  int lastroundp1rotation)
>   {
> +	if (igt_run_in_simulation())
> +		return false;
> +
>   	if (planarcheck != 1)
>   		return false;
>   
