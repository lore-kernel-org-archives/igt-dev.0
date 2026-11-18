Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A520606A330
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SwIQuzeN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F4610FA50;
	Wed, 18 Nov 2026 11:00:50 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1480A10FA50
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 10:59:50 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2efdbab4e03so3448985ad.1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 02:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794999589; x=1795604389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dS18SUr04BVoOOrXIPisF1lDHUPV5ts5aRHmXwYmbAU=;
 b=SwIQuzeNy3M8bLwEzVaecMYmsFGqaDa7jcVNYzi+ustJMsCnCYbrRDAu2bC5qr6IIH
 aGe+jFe+OSOHosOZqJHHOK2l4OPRL3xX0QvS2tNq948fW2PlcfZq3TlSjiopVqGbFFZS
 MvgNZWXZiYW4s6H7O7DyCduS2k8psfi/MyHO6gzTFneshbgP4w1yIO0aNTx7Beh/g3+5
 +v8T+kyZ6mQYmHC/iUsGNjvY4thA6I2d/JMP396seUrK7SlpH9UsI2v1CaPr+ui7znhi
 sxXj94IrbnYHHQtksm8Aa11xMybMd60hQGslskn8NbEPQ6YqFbFNm/URq1VtJE4oUsUm
 swZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794999589; x=1795604389;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dS18SUr04BVoOOrXIPisF1lDHUPV5ts5aRHmXwYmbAU=;
 b=uYqbVhorM3d/YCXCQzAMLsduhdmUYmy8OkD7g+A/2IRdsQYXhavkretaKWh7Wl1Tge
 h+baGgv3hRq2xvTGgjxwKJaTIvvXNa2BOTmwu7F2uNZyq+HvKPTGSf2UdV3bpNY6z4jH
 mVoRvUcqM3+8edvfiwAawOZ7kOXSqCJel5tQhlmKmQ9fTkHRmkLMWjIZDRicdzCYwJkX
 HDsxDS7TMNB50wo/lhl0K0mTBiLhI+4ui3aCYwfYCscM/I2amEva93861AamLEEXVP0b
 9Xhgxw0vKTthdNT+9Th9Jc5Sl4hEoS48wpDbT/8WZFlxYKYeInpHN3OIWVj3VYg4kxxS
 27Kw==
X-Forwarded-Encrypted: i=1;
 AL+hErFNnbz5qjZnz4Yo9PNB+A/SNvOYrw4TyQv2w83hsq4e2pNQ+g3WVi4QZgQTprBT0ggFMf0oQFKL@lists.freedesktop.org
X-Gm-Message-State: APuU4Z81ybaTSdlVxScOT9GHsRVsZoGYS6frDGBkhGLBtIIhUauBZi43
 tysc1KKhzmclSKWrZVeSR7ikWcFxG5HdhnbcttKzTATb8ZXN14HeOPOb
X-Gm-Gg: AZFdTZdfnLx1ptI7tWqmbgM1yMtEPF4UVxbK9Hmu746fsjvej+/3IBbD++xnpyetkmX
 gm1YozR78bSx7WjZoTz8LXede5wKA20JsxW7pVq7YAAIcL2B4RITUAQ/gED+o+f3xJR4g5OoJAP
 4DULoopDbxc70kDXwk+4E4Qp7JgzcVFS9XxYfb5+MrLKKTlBASA61sncSYiGbVKSceH2u6yStxV
 Kol+5rbRhfOEkxaEZuxg4VHlscYzfjqjibNg7nJLytEKmWxXYlu21CtIzAEJehLNdGRE1FuXDxX
 yerZkqjKY2Y2o/AH+JwyPZz5cxxgoQw5IOKx+hb4aAxAA8GyUl/7UzEKZqz1Iv8zkrlKgAwY1KU
 o2AsMxXb7pQC/CFkTHjNPOdVQVuYgcGsOctO1IDnxY8Mxak//CXfXwYcVmXmppWlXEbj+rfWgov
 laGfbBhIpS3aH2sWIt69zDyvulKYLLGlsBO8IOs5tVfLfXKXjQv2AgY6JX+44JMqGhrHNzssr+8
 b7h2L3ib6OHwKLY2Z41/7Y2vOrzEeU+xbVHryVASZ2vnnlVZ5se1q6L38V2JVXupehqlEULy3DR
 ECOTTK5Qyd2FXqYEpL6Se6HfrZz6BrxVz3gZVLdXjvSLhLZvL02kYIl8GFxL94XXE6jsD9ez
X-Received: by 2002:a17:902:cf4c:b0:2df:8382:918b with SMTP id
 d9443c01a7336-2eff6f8039fmr22333195ad.0.1794999589418; 
 Wed, 18 Nov 2026 02:59:49 -0800 (PST)
Received: from [192.55.55.44] ([192.55.55.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2eff61170a3sm11469865ad.25.2026.11.18.02.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 02:59:48 -0800 (PST)
Message-ID: <edb1cff8-bc8d-4e7f-8994-caf9074ff644@gmail.com>
Date: Wed, 18 Nov 2026 12:59:45 +0200
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

Hi, I requested the ci results for your change. Once see ci results I 
can review.

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

