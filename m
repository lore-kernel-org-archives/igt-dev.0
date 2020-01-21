Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB166EDA4
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 16:22:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so3953042wrq.0
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 08:22:01 -0800 (PST)
Received: from [0.0.0.0] ([134.134.137.77])
 by smtp.googlemail.com with ESMTPSA id 18sm4460912wmf.1.2020.01.21.08.21.57
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jan 2020 08:21:59 -0800 (PST)
References: <20200120220320.17092-1-imre.deak@intel.com>
 <20200120220320.17092-3-imre.deak@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <8a4a73cf-e565-af8f-761a-bb205372dbb5@gmail.com>
Date: Tue, 21 Jan 2020 18:21:56 +0200
MIME-Version: 1.0
In-Reply-To: <20200120220320.17092-3-imre.deak@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/igt_fb: Fix creating FBs on
 platforms w/o HW detiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 21.1.2020 0.03, Imre Deak wrote:
> On platforms w/o HW detiling don't fail creating the FB due to the
> expected error from the set_tiling IOCTL.
> 
> Most of the tests use a cairo surface to draw, which don't depend on HW
> detiling. Other tests (using lib/igt_draw.c or drawing to the FB
> directly, like kms_draw_crc, kms_frontbuffer) are failing atm and will
> need to be fixed separately.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   lib/igt_fb.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index b5b1750e..ccb76455 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -944,9 +944,10 @@ static int create_bo_for_fb(struct igt_fb *fb)
>   
>   		if (is_i915_device(fd)) {
>   			fb->gem_handle = gem_create(fd, fb->size);
> -			gem_set_tiling(fd, fb->gem_handle,
> -				       igt_fb_mod_to_tiling(fb->modifier),
> -				       fb->strides[0]);
> +			if (gem_has_legacy_hw_tiling(fd))
> +				gem_set_tiling(fd, fb->gem_handle,
> +					       igt_fb_mod_to_tiling(fb->modifier),
> +					       fb->strides[0]);

I don't have good ideas to offer but silently ignoring gem_set_tiling at 
this place sound bit so-so to me. Maybe put igt_debug(..) message if 
this happen? Now fb->modifier will have misleading value.

>   		} else if (is_vc4_device(fd)) {
>   			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
>   
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
