Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B37810E33C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 08:48:55 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z5so84917871edd.3
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 00:48:54 -0800 (PST)
Message-ID: <e7d5f380-cec6-a7e7-d9ee-a8c7bd160c73@gmail.com>
Date: Thu, 16 Dec 2021 10:48:47 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <20211215164610.236302-1-ananya.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20211215164610.236302-1-ananya.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_rotation_crc- MPO subtest:
 Mixing up of pixel formats and tiling on different planes.
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

Hi Ananya,

you will need to include p0xx changes also to that check where is 
checked if p[0] .. p[1] are / are not NV12, that check you had attempted 
in earlier version of your patch.

P0xx are similar planar formats as NV12 hence color ramps will fail crc 
checks unless handled for that optimization check. If p0xx are not 
considered on those checks p0xx will be handled as packed rgb format 
without color ramps found on p0xx and thus fail crc.

/Juha-Pekka

On 15.12.2021 18.46, Ananya Sharma wrote:
>   already existing pixel format RGB565, XRGB8888, NV12. New addition of P010 pixel format.
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/kms_rotation_crc.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 1497120c..7d813598 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -666,7 +666,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   	 * case with tiling are 2 bpp, 4 bpp and NV12.
>   	 */
>   	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
> -		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12};
> +		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12, DRM_FORMAT_P010};
>   
>   	static struct {
>   		igt_rotation_t rotation;
> @@ -751,8 +751,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   						 * no need to redo comparison image and
>   						 * just use stored crc.
>   						 */
> -						if (p[0].format != DRM_FORMAT_NV12 &&
> -						    p[1].format != DRM_FORMAT_NV12 &&
> +						if (!igt_format_is_yuv_semiplanar(p[0].format) && !igt_format_is_yuv_semiplanar(p[1].format) &&
>   						    crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
>   							retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
>   							have_crc = true;
> @@ -819,7 +818,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   										   flipsw,
>   										   &retcrc_sw);
>   
> -							if (p[0].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12)
> +							if (!igt_format_is_yuv_semiplanar(p[0].format) &&!igt_format_is_yuv_semiplanar(p[1].format))
>   								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
>   								= retcrc_sw;
>   						}
