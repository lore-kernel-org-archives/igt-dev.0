Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB6D10E555
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 13:31:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40839652b97so52752235e9.3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 05:31:09 -0800 (PST)
Message-ID: <52b339f1-72da-4ad0-ac28-0a033acaf3f7@gmail.com>
Date: Wed, 15 Nov 2023 15:31:01 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231115130237.1522518-1-bhanuprakash.modem@intel.com>
 <20231115130237.1522518-2-bhanuprakash.modem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231115130237.1522518-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t V2 1/4] tests/intel/kms_fbt: Use blitter as a
 default draw method
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

On 15.11.2023 15.02, Bhanuprakash Modem wrote:
> As Rendercopy support in IGT is not present for few latest
> platforms, use Blitter as default draw method.
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Jouni Högander <jouni.hogander@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 60a469901..eac33f48b 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1236,12 +1236,12 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
>   			for (r_ = 0; r_ <= r; r_++)
>   				draw_rect_igt_fb(pattern, &tmp_fbs[r],
>   						 igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
> -						 IGT_DRAW_PWRITE : IGT_DRAW_RENDER,
> +						 IGT_DRAW_PWRITE : IGT_DRAW_BLT,
>   						 r_);
>   	} else {
>   		for (r = 0; r < pattern->n_rects; r++)
>   			draw_rect_igt_fb(pattern, &tmp_fbs[r], igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
> -					 IGT_DRAW_PWRITE : IGT_DRAW_RENDER, r);
> +					 IGT_DRAW_PWRITE : IGT_DRAW_BLT, r);
>   	}
>   
>   	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
