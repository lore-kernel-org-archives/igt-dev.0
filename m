Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F77710E233
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jul 2023 19:47:49 +0000 (UTC)
Message-ID: <b2cb18a8-b60e-7d4c-c577-cdccae32fd06@riseup.net>
Date: Mon, 3 Jul 2023 16:47:41 -0300
MIME-Version: 1.0
To: Arthur Grillo <arthurgrillo@riseup.net>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
References: <20230703190052.14865-2-arthurgrillo@riseup.net>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230703190052.14865-2-arthurgrillo@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: Add check for intel device
 on use_enginecopy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tales.aparecida@gmail.com, andrealmeid@riseup.net
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Arthur,

On 7/3/23 16:00, Arthur Grillo wrote:
> Certain tests (eg: kms_plane) are failing on vkms due to an assert in
> intel_get_drm_devid which checks for an intel device.
> 
> Add check for intel device before calling intel_get_drm_devid.
> 
> Fixes: 422557124731 ("lib/igt_fb: include lib/intel_blt functions to blitter path")
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra

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
