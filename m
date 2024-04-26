Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E58C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7F71122A5;
	Fri, 26 Apr 2024 11:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="COItlxr0";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD171122A5
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:16:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso15227925e9.2
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 04:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1714130206; x=1714735006;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c7qwVswqYeVOBj9UQVkXikNSCVGfjlu2d/j3ySLjzuU=;
 b=COItlxr0gjhCp38YkMlaOz9ZbzuJLpwAJ3Sa/iNo1KSX9KsmAZjZWFnaI2SOpCWPOe
 Tco7SVkbVY0bQybMlvcQG5ioNAKi+hzmL/mBrRF/EeovU0V571tdMsaMpmSqqFtVJjYc
 sxBxYOAqddSVroUBi/1yVHlxCcJYvFotFYI1nampBCN5Ib514A1twpuuQSJSThb12mQH
 47TnocpI84k3F8vls6DK5iGVv+9pMClnSzmZj7Sv51ZFijCumLcauNgjNK7Wt/IYHDgK
 aL8XutwNN6GI7bX7alwlDUpeTgTJqEKEOj5EeEIS3DVzawqyfvmHqWpdw2jyxx4Xh4pd
 QwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714130206; x=1714735006;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c7qwVswqYeVOBj9UQVkXikNSCVGfjlu2d/j3ySLjzuU=;
 b=w+1ksaJVxD32z3d0hkR4E8E0V8tBTw9eB6sdgYWtEE9bTO4Jfdvo4WuaTD1LUySkzP
 VvVHUM831ft7sI+bXICVKEFzkkIMaHY3mzsliAoUVfyaJkRaGMlKsgVorzTku8OMCHbh
 lZJi4ilKqULbY5jLrBOmfL10kVcb+MlQFQBrdmasLMgCHAEK25WYGhUSrN917zKYbgqF
 IAu1X5jfKlTcnnSfBO+DWHxKP9sQgi5cYsy/2xazq9fpbeziupTVlqJ9Gsw75A9NC1yH
 Gpy5pseiCr6LaMCyKH5XMLAfLddZSjrrrbjI76LZR95d6DAQeKejAri5FHQWkhOzPq1f
 Tg8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0IAi6Zzo9HPhkS4w4KTUGJG0+A8s3FG/uiXo22T2a4afz9k4I/j3B4NsWdUgF/36XrRel65xbwo2emx+jUVZy6+pfuMwKy3H/iKJ/4w==
X-Gm-Message-State: AOJu0Yygm3GpRptS02CCcBi4/WM191mJBr9K4tHN/1XbBAuV67dqEf0a
 zTHW1Ag6Yaknt2ICq5qvqMkLTe8Quw5jSxrEdilF60pNaeFJZlTLwS1oK95G/XwUvL3WiMMsPzj
 P
X-Google-Smtp-Source: AGHT+IF6LgzURvPZCiKV6KMu1/9GYCKRTlzEdm5zuF+4N5BIbOtxpqvcLxvsjTNJfpAO6HzWQCKhUg==
X-Received: by 2002:a05:600c:310d:b0:419:f447:c323 with SMTP id
 g13-20020a05600c310d00b00419f447c323mr1626283wmo.27.1714130206338; 
 Fri, 26 Apr 2024 04:16:46 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a05600c1c0200b0041ac3e13f1esm12289412wms.37.2024.04.26.04.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 04:16:45 -0700 (PDT)
Message-ID: <59e98551-79d2-40fc-93c6-863f26499d3c@ursulin.net>
Date: Fri, 26 Apr 2024 12:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 17/21] gputop: print percentage number
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
 <20240423234431.1959354-18-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240423234431.1959354-18-lucas.demarchi@intel.com>
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


On 24/04/2024 00:44, Lucas De Marchi wrote:
> Besides printing the bar, also print the raw number for easy
> visualization of small quantities. While at it, make sure gputop still
> works with small console widths.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   tools/gputop.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 9edb76acc..820a1b553 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -42,17 +42,19 @@ static void n_spaces(const unsigned int n)
>   
>   static void print_percentage_bar(double percent, int max_len)
>   {
> -	int bar_len, i, len = max_len - 2;
> +	int bar_len, i, len = max_len - 1;
>   	const int w = 8;
>   
> -	assert(max_len > 0);
> +	len -= printf("|%.1f%% ", percent);
> +
> +	/* no space left for bars, do what we can */
> +	if (len < 0)
> +		len = 0;
>   
>   	bar_len = ceil(w * percent * len / 100.0);
>   	if (bar_len > w * len)
>   		bar_len = w * len;
>   
> -	putchar('|');
> -
>   	for (i = bar_len; i >= w; i -= w)
>   		printf("%s", bars[w]);
>   	if (i)

Works for me I think. Maybe specify the width of the non-decimal part so 
it is nicely aligned for all rows (%3.1f).

Btw there's also the alternative way how intel_gpu_top does it, where it 
kind of overlays the percentage over the bar. "Kind of" because if 
splats a bit over short percentage bars so I was never fully happy with it.

Regards,

Tvrtko
