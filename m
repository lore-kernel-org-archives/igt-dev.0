Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DB310E27A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Dec 2021 08:03:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w16so18177322edc.11
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Dec 2021 00:03:31 -0800 (PST)
Message-ID: <d8aa806f-7653-4c02-69e4-ca075d192cba@gmail.com>
Date: Thu, 23 Dec 2021 10:03:24 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <20211220125741.283879-1-ananya.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20211220125741.283879-1-ananya.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_rotation_crc: MPO
 subtest-mixing of pixel format and tiling on different planes.
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
To: Ananya Sharma <ananya.sharma@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Your change look ok to me. This entire subtest start to look bit messy 
but it was like that already before your patch, will need to do some 
cleanup later.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 20.12.2021 14.57, Ananya Sharma wrote:
> P010 pixel format is newly added to the already existing list of pixel formats(RGB565,XRGB8888,NV12).
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/kms_rotation_crc.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 37f6abe9..3f716002 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -683,7 +683,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   	 * case with modifier are 2 bpp, 4 bpp and NV12.
>   	 */
>   	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
> -		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12};
> +		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12, DRM_FORMAT_P010};
>   
>   	static struct {
>   		igt_rotation_t rotation;
> @@ -769,14 +769,13 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   						 * no need to redo comparison image and
>   						 * just use stored crc.
>   						 */
> -						if (p[0].format != DRM_FORMAT_NV12 &&
> -						    p[1].format != DRM_FORMAT_NV12 &&
> +						if (!igt_format_is_yuv_semiplanar(p[0].format) && !igt_format_is_yuv_semiplanar(p[1].format) &&
>   						    crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
>   							retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
>   							have_crc = true;
> -						} else if (p[0].format == DRM_FORMAT_NV12 &&
> -							   p[1].format != DRM_FORMAT_NV12 &&
> -							   lastroundjformat != DRM_FORMAT_NV12 &&
> +						} else if((p[0].format == DRM_FORMAT_NV12 || p[0].format == DRM_FORMAT_P010) &&
> +							   p[1].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_P010 &&
> +							   lastroundjformat != DRM_FORMAT_NV12 && lastroundjformat != DRM_FORMAT_P010 &&
>   							   planeconfigs[i].rotation == lastroundirotation &&
>   							   planeconfigs[j].rotation == lastroundjrotation) {
>   							/*
> @@ -837,7 +836,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   										   flipsw,
>   										   &retcrc_sw);
>   
> -							if (p[0].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12)
> +							if (!igt_format_is_yuv_semiplanar(p[0].format) &&!igt_format_is_yuv_semiplanar(p[1].format))
>   								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
>   								= retcrc_sw;
>   						}
