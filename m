Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506A3D0C600
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 11:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0285610E051;
	Fri, 25 Oct 2024 11:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D7t3MMM4";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE5910E051
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 11:38:29 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37d4821e6b4so1220633f8f.3
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729856308; x=1730461108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UvPzRJO2QqnrCkS27N0axBkE6j0HXDbW1nuGVltJxEY=;
 b=D7t3MMM48WgW3CaAUBjJNu0JdmojYniNvmPHbvLcny4K0XJfA8brZYJy7DX/I0PmeD
 zQ2JwoFsDTPw6YKopVdlO/uGZ+PebcRNQ1KKpK7q6Hyj4iKIFNIN8XiIBwaSE0epmMIE
 EIFaDuIcW/2jOeDc9ePzstMkJlTAO3akKVP81fQ00CdHUN+JG6H8w/bES0tjLsDTIvcy
 l8j8AnQhn6nZIIEnZ3G5hMgVPKa/essLlaDH+gYv+iy9mYW4qJr1lGnPMtz88C0YcGBI
 WdGRcbxAZe/o/pM0Fj+kSDFKjBrllSie2YPx1EQjq9/ibQDUbgP8HYXiVlN+gIlQ4ml4
 gsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729856308; x=1730461108;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvPzRJO2QqnrCkS27N0axBkE6j0HXDbW1nuGVltJxEY=;
 b=MMaD0s20vy+9KotvhK093cRBC7Qh69zoaB6dYsQgf6nyjZVzKNVVPXQx58echcwnRP
 4FI/a0hxM45s26IGGXNKDhTvu9aQ9rs98pglFc73OdeSmvCFIBAF9CS8F+Whv8d7UThF
 CH3Yex50g5atPB2bmoqzIDlWjyImecFXFdC3F5KTXdJC4Km/PC2TKymsC6GYmdYbMupY
 nq6mjKrhj4vojCNx2M7UYvxvywFrUrf6ewDzHDoqJo0ITx91ijXIlTwhh5E6wX0VxXYh
 +rEP3K55acx5h/TV7KjhE8KyhRUdbbnDeE4rUKqazSKV5t2+pHQkcMPgvlh6XO1yR1+j
 M1Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM15pXFYnRqZ8fCbx+aFr/sr754B9OTlGSB+NB15dmhyox/8LovDqdZRKCjPxAIX3RblFtRp0C@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy60teddc341BVInrKh9bxD6GMrNrxR1/R3OgQ2BtzbGy1I0DQE
 0fesBsZPOIAGbF3PYH2rOkWURyLI91ddTfY/vgkpEp1pvEI3YVlOdagRv9BvlhqdaQ==
X-Google-Smtp-Source: AGHT+IGWZTzA/1qdXmUyMgIBfrNKT+NVga9yTYzBC7dBALKEa7TW+5R2AXQNMYxYeO6OwvHQeI94Ng==
X-Received: by 2002:adf:e5c1:0:b0:37d:4f1b:35b with SMTP id
 ffacd0b85a97d-3804589d1e5mr3943566f8f.34.1729856307901; 
 Fri, 25 Oct 2024 04:38:27 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b920easm1285887f8f.97.2024.10.25.04.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 04:38:27 -0700 (PDT)
Message-ID: <e26eb908-57e1-4682-8ba0-761440c32ef8@gmail.com>
Date: Fri, 25 Oct 2024 14:38:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Use linear instead of
 x tiled
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241023060740.2573443-1-jouni.hogander@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20241023060740.2573443-1-jouni.hogander@intel.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 23.10.2024 9.07, Jouni Högander wrote:
> PTL doesn't support x tiled format and older platforms (display version <
> 9) do not have FBC support for linear. There is no specific reason to use x
> tiled format in this testcase: switch to linear format except on older
> platforms.
> 
> v2: use x tiled for display version < 9
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/intel/kms_fbcon_fbt.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index 6d134ea62..ab4819d23 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -221,7 +221,9 @@ static void set_mode_for_one_screen(struct drm_info *drm,
>   
>   	buffer_id = igt_create_fb(drm->fd, mode->hdisplay, mode->vdisplay,
>   				  DRM_FORMAT_XRGB8888,
> -				  I915_FORMAT_MOD_X_TILED, &drm->fb);
> +				  intel_display_ver(intel_get_drm_devid(drm->fd)) < 9 ?
> +				  I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR,
> +				  &drm->fb);
>   	igt_draw_fill_fb(drm->fd, &drm->fb, 0xFF);
>   
>   	igt_info("Setting %dx%d mode for %s connector\n",

