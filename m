Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7F5C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 19:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE9410E0E1;
	Mon, 29 Jun 2026 19:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ss3Nk5fQ";
	dkim-atps=neutral
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFAA10E9EF
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 19:28:57 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-30df5854e1eso1236801eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782761337; x=1783366137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kf5mUW3J9wStDDGBtHQXi1HH+uIFI+rJ5Ie+1b1AzmQ=;
 b=Ss3Nk5fQVEJ7HLdERjZy2t9esr8pSSnCNZxmVu66iKijpRkEh6GygGTRH06U/FH5I4
 mlNhPPMYWlZ8k9lIvtBWo5CIYnsAinzuGlQE/tiAGTccwyNoIEmgnOrISJP3ZBQL/Xdk
 RuK/bc9jc0fivRZQIgJ0sKByCrjnTK/hVz35vFHyeRejfZjADjKS1T8FZgQRoDZuu8ft
 EYYGRi7iWKFTnTkeuptT8s7l3W1uA/pIhsO/qVE6xb9aXuSsw0TL0fKZR/AsyNXKJOmX
 KgOQS68PMW76f/tv2OZvIvMozIQIWSEijG0c3uFJXwhE9HGzjapJLmpo4oculcIke9Fz
 inyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782761337; x=1783366137;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kf5mUW3J9wStDDGBtHQXi1HH+uIFI+rJ5Ie+1b1AzmQ=;
 b=WWvjfMm9JEMAeFWbqIifcQlmfoLH/Owdk/Gvlu7iI0WQpU4tQ3v3ZJjiEnuUVVl9yT
 Niimajlmm7/SHSaDf3/WXL0LmDBoyAQQC89hqCt1beZauDrLNHU2VyhWpJoyBYQyV2xI
 BnLtUdw0qoBVTPK4kLIyzFFxmHBKjNKnM0NyiHCK+PsW/q3lYoqNqTXnsG1Dq7DMsv7m
 3Lq3RH7W8dD5pQ/PkdgP2z5NnEfUaMT+pdMsfMrQ4dwAYGPHqdswXLVFtsCWYrTf3Ybr
 JsGTf91YJcr13HIByv54m6D3t3wZpJeVNn+gXHGQNiTJ8ZTnrIVuiLohTriyS3trIyh0
 EPpQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+/kK0wIpYvKhgi++l0LdsKAFKCKo0f4Adylq0vUcPj9d45/KxtDT1+gYRqOptKtlQk+1Ow4s9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ1J7UlgrQzAiMwZdb2OL2gx19WrIqj9sWZPP71K9JV1GrFzFj
 oNetobBFZwyHxmNW8Bt8dxoCxaBQXae6RR6GB9OluBNEE6zqDy6bpyvl
X-Gm-Gg: AfdE7cngHzH6vx1owQCkelbCIqkpvqbr76BTw1aMv66eMnrWNrL+UDhqhNch5b0ThOP
 79LFq+OSergjmMQr1+7sYqtskTQvee/9baNFZ+TYPth/U19uLZbgqKhBmg2LEvKqq9neCs1ZKpV
 XzXpa/UHcULm5Nkk+9W1ZgfCUwylh9d1LjpUz5WoHl6ZqpUwJzFM2Elfn3av5oZ8v5yjvvESZuK
 sKLhV+QU7IJdWbNoIUrHT9jIU3RGqSPVF6mxYet6VJQytayu69jB7i078Rek4FhGCd5QqjR5ONI
 7IdfgwSz+He4YgYyBeIji0mpBQUmfruLfzpXhEL13v2lrDe6DmLRIHC4ErtAfknOgal/iEwVEwR
 ArUzrj5hGzcg/dLT7l/Qh2vN11nmH9TjscJ/1IHhMfppvHbmcqSjH57RUl5iNfw5DEdsLM+Ge8s
 7xjac0OhpJ5lRJfWEtKqcBmC/cEfkVOEvYyhl4iUsl9+VaNNeRD148PMJ7bvGg1kfg1w==
X-Received: by 2002:a05:693c:62cb:b0:30c:b63e:bb8e with SMTP id
 5a478bee46e88-30ee1884e6dmr333542eec.20.1782761336646; 
 Mon, 29 Jun 2026 12:28:56 -0700 (PDT)
Received: from [192.55.54.47] ([192.55.54.47])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30ee3170ef9sm560412eec.16.2026.06.29.12.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 12:28:56 -0700 (PDT)
Message-ID: <ae1eb7d5-2563-42fd-8026-6856395ba364@gmail.com>
Date: Mon, 29 Jun 2026 22:28:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel/kms_pipe_stress: fix plane
 source crop and separate cursor loop
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, chaitanya.kumar.borah@intel.com
References: <20260602162422.3360253-1-sowmiya.s@intel.com>
 <20260602162422.3360253-3-sowmiya.s@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260602162422.3360253-3-sowmiya.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This original test look bit messy to my eye but I think this change does 
what it says and is all ok.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 02/06/2026 19.24, Sowmiya S wrote:
> Pass 3/4 destination size as initial source crop to
> universal_plane_set_fb() to avoid an immediate
> downscale. Keep source in sync with igt_fb_set_size()
> in the reduction loop so the downscale ratio never
> exceeds the hardware limit (~3x).
> 
> Move cursor handling out of the overlay loop into a
> dedicated second for_each_plane_on_crtc loop with a
> DRM_MODE_ATOMIC_TEST_ONLY commit. If the test commit
> rejects the cursor (e.g. unsupported format or modifier),
> disable it gracefully so the final commit with only overlay
> planes can succeed.
> 
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 110 +++++++++++++++++++++-------------
>   1 file changed, 68 insertions(+), 42 deletions(-)
> 
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 8724a674c..a84433b9d 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -425,57 +425,83 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>   	if (!data->num_planes[crtc->pipe] || !new_mode)
>   		return 0;
>   
> -	for_each_plane_on_crtc(crtc,
> -			       plane) {
> +	/* Set up overlay/primary planes up to the configured limit. */
> +	for_each_plane_on_crtc(crtc, plane) {
>   		int plane_width, plane_height;
> -		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
> -			cursor_plane_set_fb(plane,
> -					    &data->cursor_fb[crtc->pipe],
> -					    cursor_width, cursor_height);
> -			plane_width = cursor_width;
> -			plane_height = cursor_height;
> -		} else {
> -			universal_plane_set_fb(plane,
> -					       &data->fb[crtc->pipe * MAX_PLANES + i],
> -					       mode->hdisplay, mode->vdisplay);
>   
> -			plane_width = (mode->hdisplay * 3) / 4;
> -			plane_height = (mode->vdisplay * 3) / 4;
> +		if (plane->type == DRM_PLANE_TYPE_CURSOR)
> +			continue;
>   
> -			ret = try_plane_scaling(data, plane, plane_width, plane_height);
> +		plane_width = (mode->hdisplay * 3) / 4;
> +		plane_height = (mode->vdisplay * 3) / 4;
>   
> -			while (ret) {
> -				if (plane_width <= cursor_width || plane_height <= cursor_height)
> -					break;
> +		/*
> +		 * Set the source crop to match the initial destination
> +		 * size (no upscaling).  Keeping source == destination
> +		 * prevents the downscale ratio from exceeding the
> +		 * hardware limit (~3×) when the destination is halved
> +		 * in the reduction loop below.
> +		 */
> +		universal_plane_set_fb(plane,
> +				       &data->fb[crtc->pipe * MAX_PLANES + i],
> +				       plane_width, plane_height);
>   
> -				plane_width /= 2;
> -				plane_height /= 2;
> +		ret = try_plane_scaling(data, plane, plane_width, plane_height);
>   
> -				ret = try_plane_scaling(data, plane, plane_width, plane_height);
> +		while (ret) {
> +			if (plane_width <= cursor_width || plane_height <= cursor_height)
> +				break;
>   
> -				igt_info("Reduced plane %d size to %dx%d\n",
> -					 plane->index, plane_width, plane_height);
> -			}
> -			if (ret) {
> -				igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
> -					 crtc->pipe);
> -				data->num_planes[crtc->pipe] = i;
> -				igt_info("Max num planes for pipe %d set to %d\n",
> -					 crtc->pipe, i);
> -				/*
> -				 * We have now determined max amount of full sized planes, we will just
> -				 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
> -				 * Don't destroy cursor_fb as will take care about it at the end.
> -				 */
> +			plane_width /= 2;
> +			plane_height /= 2;
> +
> +			/* Keep source crop in sync with the reduced destination. */
> +			igt_fb_set_size(&data->fb[crtc->pipe * MAX_PLANES + i],
> +					plane, plane_width, plane_height);
> +
> +			ret = try_plane_scaling(data, plane, plane_width, plane_height);
> +
> +			igt_info("Reduced plane %d size to %dx%d\n",
> +				 plane->index, plane_width, plane_height);
> +		}
> +		if (ret) {
> +			igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
> +				 crtc->pipe);
> +			data->num_planes[crtc->pipe] = i;
> +			igt_info("Max num planes for pipe %d set to %d\n",
> +				 crtc->pipe, i);
> +			/*
> +			 * We have now determined max amount of full sized planes, we will just
> +			 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
> +			 * Don't destroy cursor_fb as will take care about it at the end.
> +			 */
> +			igt_plane_set_fb(plane, NULL);
> +			cleanup_plane_fbs(data, crtc, i, MAX_PLANES);
> +		}
> +
> +		if (++i >= data->num_planes[crtc->pipe])
> +			break;
> +	}
> +
> +	/*
> +	 * Always attempt to enable the cursor plane.  First validate it with
> +	 * a TEST_ONLY commit: some format/modifier combinations (e.g.
> +	 * XRGB8888, 4-tiled) are not accepted by the cursor hardware.
> +	 * If the test commit rejects the cursor, gracefully disable it so
> +	 * the final actual commit with only overlay planes can succeed.
> +	 */
> +	for_each_plane_on_crtc(crtc, plane) {
> +		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
> +			cursor_plane_set_fb(plane,
> +					    &data->cursor_fb[crtc->pipe],
> +					    cursor_width, cursor_height);
> +			if (igt_display_try_commit_atomic(&data->display,
> +							  DRM_MODE_ATOMIC_TEST_ONLY |
> +							  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL)) {
>   				igt_plane_set_fb(plane, NULL);
> -				cleanup_plane_fbs(data,
> -						  crtc,
> -						  i,
> -						  MAX_PLANES);
> +				igt_info("Cursor fb not supported by hw (format/modifier), disabling\n");
>   			}
> -
> -			if (++i >= data->num_planes[crtc->pipe])
> -				break;
> +			break;
>   		}
>   	}
>   

