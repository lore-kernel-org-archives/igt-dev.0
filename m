Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C87BC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 12:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021FE10EBA6;
	Fri,  1 Mar 2024 12:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S4gs/FIx";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4307410EBA6
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 12:28:09 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-412c34a73aeso7925585e9.0
 for <igt-dev@lists.freedesktop.org>; Fri, 01 Mar 2024 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709296087; x=1709900887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VntHmUmOeuE7JVnZwZoBJcdq5Ajk6saQqnKO1ZyXgV4=;
 b=S4gs/FIx8pxYE1cuGlCRFoK/146ZiW4JF3b9FEDTPK8DdS6OaD2MmsGk+lTpEciPqJ
 9FVo8CHRP/ITNIgkL0QdSxSgYQS6CWj1Fa3gEs6UkWcvEvzLeVBSisffES5xdpdJeWyb
 gryK+4RO5EN05UHGAr60lmHcL0ZZ/KM6Y/iltT3RJMngSRizFMO35j5jG5ADHqIfUhao
 a/e6L5kUVvLOOroy/zkfwNEbM0QvxSlhTsAITdt/G1BINIvjKOkm9FB5Ra0lbZAXEOKf
 QvDJWJREEAuNB9Y65WTYlto+yvIq9AQEA/2THyQpp+tq4nhPXkwBVIJfaBp/b8H1kiqx
 HeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709296087; x=1709900887;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VntHmUmOeuE7JVnZwZoBJcdq5Ajk6saQqnKO1ZyXgV4=;
 b=bWTsCBSycZKcECcGLFfG9Ycjzf+11Q8ImhMU77I7/QwLiukj8BSOE1q3Stxl0P/JWC
 3EN7ku2iU6Q9i6+K6s2iP9J6d1epyb3g0TbbNgUCK+OkMtYwvjZ+nP0njvuFoVR3+gZ8
 3nfx4jhAW7ZL5mAusuFSQA8M4VyCi3nludf9l/DjlOumhZ/tbetAKSDaV/i9DIX/V3uj
 yTXscxCape4vZ1VGcL1+2dfnDjVzcrtTZWP2MYJr0Z/eSMEicpI8TojIeFqnGGqnSsDB
 CY8OXpJPOBCiRqTdmW0HWAPv1oTEIFWYSbMxQDuXfAURPToFYZrusRPIJMnU/zNywPgj
 PiVg==
X-Gm-Message-State: AOJu0YyW2/PzM8MHx8kOOn51/0/BnZ3cUQlg8d5GQ7Tsg307mVJHhCSq
 pxkxb5kR+srlkdagT3SrEgh9BjiJ/TLV3cfPFkWZdMD++CRsOhQPgDZAxZBAX28=
X-Google-Smtp-Source: AGHT+IHwymG5wqYcIlIYiVeiCu09COHfqF7uPdwv5eI+V9TSMRcZM+MLdwFdPB9G8PxokBb5DU8p/g==
X-Received: by 2002:a05:600c:4591:b0:412:985b:a1c2 with SMTP id
 r17-20020a05600c459100b00412985ba1c2mr1386241wmo.14.1709296086688; 
 Fri, 01 Mar 2024 04:28:06 -0800 (PST)
Received: from [0.0.0.0] ([134.134.139.71])
 by smtp.googlemail.com with ESMTPSA id
 s16-20020a05600c45d000b00412b67388f0sm7570404wmo.6.2024.03.01.04.28.04
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 04:28:06 -0800 (PST)
Message-ID: <f2e34c61-2dac-4db6-be44-371abad1adcd@gmail.com>
Date: Fri, 1 Mar 2024 14:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_fb: on Xe device don't apply legacy blitter
 rules
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20240228143904.859714-1-juhapekka.heikkila@gmail.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240228143904.859714-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Those ci listed issues don't seem to have anything to do with this change.

On 28.2.2024 16.39, Juha-Pekka Heikkila wrote:
> On Xe device legacy blitter size rules don't need to be applied
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/igt_fb.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 65e0638c2..0ac2a76b0 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2513,6 +2513,9 @@ static bool blitter_ok(const struct igt_fb *fb)
>   	     is_gen12_mc_ccs_modifier(fb->modifier))
>   		return false;
>   
> +	if (is_xe_device(fb->fd))
> +		return true;
> +
>   	for (int i = 0; i < fb->num_planes; i++) {
>   		int width = fb->plane_width[i];
>   

