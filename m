Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA44F10E215
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 07:55:50 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96f99222e80so630368766b.1
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 00:55:50 -0700 (PDT)
Message-ID: <8750acbd-7a00-4477-adf3-c3bbefbc8e45@gmail.com>
Date: Mon, 29 May 2023 10:55:41 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230525114729.298274-1-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230525114729.298274-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: enable and
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

On 25.5.2023 14.47, Swati Sharma wrote:
> Added 2 checks. First, if rotation is supported by plane or not
> before creating fb. This is generic change to optimize test.
> Second check, is to reduce execution time in simulation
> by dropping RGB565 and PO10 formats (coverage is not
> compromised, we do have NV12 and RGB888 formats being validated).
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_rotation_crc.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 28b4fd27..07040e31 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -847,9 +847,17 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   			p[0].fbinfo = &planeconfigs[i];
>   			pointlocation(data, p, mode, 0);
>   
> +			if (!igt_plane_has_rotation(p[0].plane, planeconfigs[i].rotation))
> +				continue;
> +
>   			for (k = 0; k < ARRAY_SIZE(multiplaneformatlist); k++) {
>   				p[0].formatindex = k;
>   
> +				if (igt_run_in_simulation() &&
> +				   (multiplaneformatlist[k] == DRM_FORMAT_P010 ||
> +				    multiplaneformatlist[k] == DRM_FORMAT_RGB565))
> +					continue;
> +
>   				for (j = 0; j < ARRAY_SIZE(planeconfigs); j++) {
>   					p[1].fbinfo = &planeconfigs[j];
>   					pointlocation(data, p, mode, 1);
> @@ -857,6 +865,14 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   					for (l = 0; l < ARRAY_SIZE(multiplaneformatlist); l++) {
>   						p[1].formatindex = l;
>   
> +						if (!igt_plane_has_rotation(p[1].plane, planeconfigs[k].rotation))
> +							continue;
> +
> +						if (igt_run_in_simulation() &&
> +						   (multiplaneformatlist[k] == DRM_FORMAT_P010 ||
> +						    multiplaneformatlist[k] == DRM_FORMAT_RGB565))
> +							continue;
> +
>   						if (!multiplaneskiproundcheck(data, p))

Looking at those new rules for skipping round I think they could all be 
put inside this multiplaneskiproundcheck(..) so the main loop would be 
less cluttered.

>   							continue;
>   
> @@ -872,7 +888,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   
>   							retcrc_sw = crclog[logindex];
>   							have_crc = true;
> -						} else if(reusecrcfromlastround(p, lastroundjformat,
> +						} else if(!igt_run_in_simulation() &&
> +							  reusecrcfromlastround(p, lastroundjformat,
>   										lastroundirotation,
>   										lastroundjrotation)) {

Here also simulation check could go into reusecrcfromlastround(..). 
Otherwise thing look ok to me.

/Juha-Pekka

>   							/*
