Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB4389D81
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 19:49:48 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z5so27176edd.3
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 11:49:48 -0800 (PST)
Message-ID: <e932b0cd-d354-ac8a-b5e8-3f214e0a4c1f@gmail.com>
Date: Tue, 16 Nov 2021 21:49:39 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <20211108052836.374567-1-ananya.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20211108052836.374567-1-ananya.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: MPO subtest-
 mixing pixel formats and tiling on different planes.
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
Cc: kunal1.joshi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 8.11.2021 7.28, Ananya Sharma wrote:
>   Added P010 pixel format with already existing pixel formats like RGB565, XRGB8888, NV12.
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/kms_rotation_crc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 1497120c..9c208315 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -666,7 +666,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   	 * case with tiling are 2 bpp, 4 bpp and NV12.
>   	 */
>   	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
> -		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12};
> +		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12, DRM_FORMAT_P010};

I suspect for this to work you will also need to change in 
test_multi_plane_rotation(..) in inner loops anywhere comparison for 
DRM_FORMAT_NV12 take into account P0xx format in some way with 
igt_format_is_yuv_semiplanar(..). Some of those inner loop rules are 
excluding, some including.

I think otherwise those runtime cached crcs will cause mismatches

/Juha-Pekka

>   
>   	static struct {
>   		igt_rotation_t rotation;
> 
