Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83F606A331
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nL6k9hfn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533E3112A89;
	Fri, 20 Nov 2026 14:03:53 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2814B112A61
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 14:02:48 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-1a8cc11ac42so1199999c88.0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 06:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795183367; x=1795788167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wtg9VK6oBQDcKVP88VoR8+HJJRJ8RfvXieY+MuDhlfE=;
 b=nL6k9hfnozm3OBvlwpE5rdC/A7Uz5uyCOKq76+MWM1bhZMja5JepVBTQoIPaUs6tGG
 rA6GRCKXQBfmElhLph/o9FjPSCWnaPF9EU6ibjtavWfwLt2A6W7lPqy1M0c2V3Mnrv3a
 YmaB4Fxnbkv7zRVv1o1cwNVAzl2/sfJQWTVnxvRO2rsielT7ssv1OSu8k8ghGGlbvIew
 VjLPwy6SiEnIKD0kSS0WYFupiGRqZCulQLGAiTbNe9pk5KGBNVjVl9kYekDLvvUpVxYK
 Y4jTCVtDmRKdy8NHkQaSy/1OQa8kGpPpiQLEzhkkAx2pZwGKQQ0d70HQBH8BNpscjlXJ
 W/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795183367; x=1795788167;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wtg9VK6oBQDcKVP88VoR8+HJJRJ8RfvXieY+MuDhlfE=;
 b=Ru7B1Z2A+caCQYmheT5EdNVhK59v/BsmuzAOOXouYQmjfVe82hZRMji3fN/Jhkl7ox
 rzkI5/7GLnqGHMCkEk7V9LIgOjaosDFmyV0ocPUx3jan13IZzpEzyXXbr3vrUk84qNRL
 7oFsiCYlstndmW5ccpjHUKDQYGgk4oBPdfxi0EdQG3t7i7CQnTwINlywRnp4lodJMf/Y
 ynqjhgoJjRCanMn5VkakIrs36tVA7Af9U7inS9cCu7fgeDrToonvBQDgJZSOmtWyODTf
 kFVMdwM1XffXiA/wf7V17ZMzU6qGvEWYdKXaAW8mZVhvpZqKkMfX/GFHbUasaDZAy94x
 KOjQ==
X-Forwarded-Encrypted: i=1;
 AL+hErECmfxwZMOG5rfFfVQJw/jwKj7yv5Y8udxc1rrWjraJ5ppBbj+XNtN7uDfD8Qm/BRYTSqaLmxRh@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+z50K4rV58r4/0ZXl2IhUI/CpaZNUymUr2qCTwaF1wSlnAYnjs
 sc0yrfMTP27c2KAqae1WZDeugURWN2qz9zU1XxRSUyO0qS1k/W1T/aP2
X-Gm-Gg: AYBFou0bwpXPstXvBPTUqtEdlrnraqHwJpOY4ppY8S7UYKt+gRmn+MoDguF4srFytAA
 6B3noF2l0CkMaav/iFCOB1N5LbOiYjIhAt/Ils453VEZqj5/Yq+Uxv4jD+1QSrniqcuCt3FXG36
 Ei9RLPfBxdVuHAyEUi7lT2S3pYIPKQaj1R8LKjFRVu4ihtd1UEHgW3osqt9GoE+2QHOM8IF1/Up
 d/4vz32WuP31Q/TIT2hygWXmTcOBeNjW43/DyKmOZG7ASe+td4UT0v2r1hYu/H7xVFZhCOdjsyh
 XoEqgcHSHvF+jADG+RIp9Ih4Bx3ZTHYSHGo6Xh35X/5LK4CvUDUx6UCZgFGODG8VYhp3PbFvLmi
 we5B+hDHwYyU4xclQOufBXr9a53mQUa3uW0kbVBKHfg/lmZoO49EnqUypleBWQoJYuwhjbtezM4
 K1Z2uey1Vk1LTGRbftWgGcwq1RrIX7CnMtAvQ8wnxLPyWWQKGpTLoqfbgIcq059hKKT127ckpxP
 WKmL1ks45PrXcj2CoRy8mgTubBGcto9bB1rPxwxjOmUvy26yjX6RzjSF3LV8YoOtSapyhMKtuSA
 v2hZ7fabrR83YdwJtZKD0lh1JV5jYmpIFa+9OXaYGtvR1486RTrLXndZUxdbt67j8SpEGLLj
X-Received: by 2002:a05:7022:4196:b0:1b2:3b5b:b80b with SMTP id
 a92af1059eb24-1b55689ee3amr4690796c88.8.1795183367121; 
 Fri, 20 Nov 2026 06:02:47 -0800 (PST)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55682d301sm7157872c88.10.2026.11.20.06.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 06:02:46 -0800 (PST)
Message-ID: <424a48b2-4f44-4f0b-97a4-aab35c5153eb@gmail.com>
Date: Fri, 20 Nov 2026 16:02:42 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: Try all blend modes when resetting it
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
References: <20261117103356.303340-1-zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261117103356.303340-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Look ok

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

If nobody else get to merge this I'll merge it on Monday when I have 
access to my machine.

/Juha-Pekka

On 17/11/2026 12.33, Icenowy Zheng wrote:
> Since Linux 7.3, the pixel blend mode property of planes would be
> present (and required when the plane supports formats w/ alpha) even
> when Pre-multiplied isn't supported, which leads to assertion failure in
> igt_plane_reset().
> 
> Add logic to try all possible values for this property mimicking the
> logic of kernel deciding the default value.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>   lib/igt_kms.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 915c6a8a2..789da08b3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2644,6 +2644,22 @@ static int get_drm_plane_type(int drm_fd, uint32_t plane_id)
>   	return DRM_PLANE_TYPE_OVERLAY;
>   }
>   
> +static void igt_plane_reset_blend_mode(igt_plane_t *plane)
> +{
> +	bool result;
> +
> +	result = igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Pre-multiplied");
> +	if (result)
> +		return;
> +
> +	result = igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
> +	if (result)
> +		return;
> +
> +	result = igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
> +	igt_assert(result);
> +}
> +
>   static void igt_plane_reset(igt_plane_t *plane)
>   {
>   	igt_display_t *display = plane->crtc->display;
> @@ -2679,7 +2695,7 @@ static void igt_plane_reset(igt_plane_t *plane)
>   		igt_plane_set_prop_value(plane, IGT_PLANE_ROTATION, IGT_ROTATION_0);
>   
>   	if (igt_plane_has_prop(plane, IGT_PLANE_PIXEL_BLEND_MODE))
> -		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Pre-multiplied");
> +		igt_plane_reset_blend_mode(plane);
>   
>   	if (igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
>   		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xffff);

