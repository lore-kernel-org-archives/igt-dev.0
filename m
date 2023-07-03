Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C8F10E233
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jul 2023 19:34:12 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b5c231c23aso77680861fa.0
 for <igt-dev@lists.freedesktop.org>; Mon, 03 Jul 2023 12:34:12 -0700 (PDT)
Message-ID: <606ab4a2-eacd-4f79-0f65-3984f0c939e7@gmail.com>
Date: Mon, 3 Jul 2023 22:34:00 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
References: <20230703190052.14865-2-arthurgrillo@riseup.net>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230703190052.14865-2-arthurgrillo@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: Add check for intel device
 on use_enginecopy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: tales.aparecida@gmail.com, andrealmeid@riseup.net
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Arthur,

thanks for the patch. Seems I had missed this when I was enabling 
blitter to do more on Intel devices.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 3.7.2023 22.00, Arthur Grillo wrote:
> Certain tests (eg: kms_plane) are failing on vkms due to an assert in
> intel_get_drm_devid which checks for an intel device.
> 
> Add check for intel device before calling intel_get_drm_devid.
> 
> Fixes: 422557124731 ("lib/igt_fb: include lib/intel_blt functions to blitter path")
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>   lib/igt_fb.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 9529d198a..a8988274f 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2526,6 +2526,9 @@ static bool blitter_ok(const struct igt_fb *fb)
>   
>   static bool use_enginecopy(const struct igt_fb *fb)
>   {
> +	if (!is_intel_device(fb->fd))
> +		return false;
> +
>   	if (!is_xe_device(fb->fd) && blitter_ok(fb))
>   		return false;
>   
