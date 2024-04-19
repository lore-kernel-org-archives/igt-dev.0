Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356AAC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 07:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12D410F066;
	Fri, 19 Apr 2024 07:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="b7Gw6Q3v";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751FD10F066
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 07:48:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso1268208f8f.1
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713512930; x=1714117730;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Co6gfGeUJxsELVGgRqudcAKEoTHtYav0+Iye5K3HGZ8=;
 b=b7Gw6Q3vhffsquytkCCTDf68ChFJF5g8yQ54x5cMCTNgsUwpTtVkIaRFvAFMivKGh9
 vkyJspzWCXxvMKB/aah885A2jy8wIDTZ5I7o9/lA9i33e6hOcgy0pZSJQojAY2DNxlZF
 +V2/oO222C5Wc3NHrffDb7lcWkHWzMZcuSj0BEb+X1P6SHrDHzwg+uxm6LVnd9z8xK9o
 0+/AS7d9CW/mTR2cuMCHEkeelojfliVTDQPraJO0NOmjsYSjhBkaiVZ7K7TPVeo3feQP
 yUeUqTKQKyt/5ew8bfE46Fk/Fokmo3YNkI17Z/8tGQbXUdK+YKUFJrWGdghJ9vaR+X69
 rlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713512930; x=1714117730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Co6gfGeUJxsELVGgRqudcAKEoTHtYav0+Iye5K3HGZ8=;
 b=Rkwi41SnA8weFDN0y8x9ug2st49h8wlkDPf3tYngGgjcKrfAMzSlb8C7YVLLSbQQaL
 9d1i1Wi7gP+DLpUfn8Q3nClPAFSaBLYvY+r91xys4wfJHaEhwQl/kKc6aL8BYsHY7Hoz
 Aex9LOqJlU5IqVSmJpXpTBm6MX0QPvkpfSMTMPRx735ECCvZhe0UGwaVVnRao2prFpqg
 WVUDVddosfZ3nwTGPBXPi+AKLAfmLXkBTBNI7dq+VYuWI0IqeEt72TYtI3nkYiPvqqLO
 2Qgn/QHtQ4QY3TeEyfNjJ0iWQKXTsshnGPrjQgXz0DDyzrwgeslJuB/MnIGz8uqPHp6z
 oXVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhJpc6eiHEI301EzpFVa7SOxsdifayY28B0X50Gp4nGeW7ZqgmeB9k3qOQ1Md/05WDX8/JvX+K0L9B2zKkfQpVPX+s+pTEB7ZZEaxgLg==
X-Gm-Message-State: AOJu0YzoW7Za99OcNFxqoBN1Y3+UFUis/9CRtHDz7iuoaZ9ocF6VJMXK
 MqY/3VPa3JOgqsprWn6Nn23VXiwrnZj8La4IYauISdudRHeg9jDwOAXlho4mqYepkluLRJv7wwv
 H
X-Google-Smtp-Source: AGHT+IF9ehZg7DL/528HFQfQ6X+/BuE0/c3bf4P5lZSfuVbtOa6J0ujOgquKby7iNUbUARLk5UVxpg==
X-Received: by 2002:a05:6000:8e:b0:346:9301:fef1 with SMTP id
 m14-20020a056000008e00b003469301fef1mr902808wrx.18.1713512930336; 
 Fri, 19 Apr 2024 00:48:50 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 u9-20020adfb209000000b0034330c9eccasm3771882wra.79.2024.04.19.00.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 00:48:50 -0700 (PDT)
Message-ID: <940ebe8a-3f16-4e1f-8215-29ef54b94a2b@ursulin.net>
Date: Fri, 19 Apr 2024 08:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 03/12] lib/igt_drm_fdinfo: Fix wrong name len assert
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-4-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240405060056.59379-4-lucas.demarchi@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 05/04/2024 07:00, Lucas De Marchi wrote:
> When parsing engine name, at this point we have something like:
> 
> 	"drm-engine-render:	232409619162 ns"
> 	            ^      ^
> 	            |      |
> 	          name     p
> 
> We are copying the engine name to the final destination, but
> strlen(name) will actually contain the entire string. Since we already
> know the name length, calculated previously, just use it for copying the
> string.
> 
> Since each name is 256-bytes long, the assert doesn't trigger easily,
> but it's better to be correct. And more efficient.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/igt_drm_fdinfo.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 7a9ae94f0..9b1776775 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -96,8 +96,9 @@ static int parse_engine(const char *name, struct drm_client_fdinfo *info,
>   
>   		if (found < 0) {
>   			assert((info->num_engines + 1) < ARRAY_SIZE(info->names));
> -			assert((strlen(name) + 1) < sizeof(info->names[0]));
> -			strncpy(info->names[info->num_engines], name, name_len);
> +			assert(name_len  < sizeof(info->names[0]));
> +			memcpy(info->names[info->num_engines], name, name_len);
> +			info->names[info->num_engines][name_len] = '\0';
>   			found = info->num_engines;
>   		}
>   	}

Ah a good fix.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Also, ideally fixes such as this and next few would be before 
refactoring in the series, but okay, not asking you to re-order.

Regards,

Tvrtko

P.S. One extra space in the assert fwiw.
