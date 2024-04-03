Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A184FCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 16:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2DF112C54;
	Wed,  3 Apr 2024 16:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="MJBR0OA3";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93DA112BFB
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 16:13:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-416244fd0a2so5629495e9.3
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Apr 2024 09:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1712160812; x=1712765612;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I5vys3sA+BXJEkcEy0ZsR8XAzshqY3/IX3SZlZ11hn4=;
 b=MJBR0OA3eO0WnkXfY5+WyBBNO7Vdr2Ivph64Vpn5QR5hHN7kelzl7ebAOBN9ICQUqt
 gLMVdvWsvgy5/Ra4yj17/IEZeXsVBShpC9cDl+ptVsVX4w5cD501nZywgA06FWeo9VMg
 1HgclIbvUW84yOPt5E5cbp/DKtrtABnViazGL1CsBLLyAnhj/FR+qiBtvdXnnQg/QDgS
 5wrrRFocqF8p9VfnOHUHCyIvCoVS3H+oTZEWOYDQuVMiK38cl5N42a0KEvqtd4XGusvF
 oiqKkj0trHp+0i+Y9mEZdhyJ4/n4/7KxsGzReyZ/5BLlvvqT5hl1GZiHl8kYXLVf2xtl
 +Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712160812; x=1712765612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I5vys3sA+BXJEkcEy0ZsR8XAzshqY3/IX3SZlZ11hn4=;
 b=TBtiZXzkbsveTWgX2eHNzece9EQ1KRv5H3iKR9zJE8qGGjKa2QFttYyo9BldSYrJf+
 UYw5f5hdCOCyje+uLVTXq+ooCk+AET/abjC23n76IJehbolUjTbHKyabHt8kTEGIW7Mp
 PvSkyQPRB9IZqctORdzfOQA1Iahqif1QTGgO4hyUXCE3W6rrtf3ia8yjUlFmfruxeMea
 qQvmhSBvHK+1UMuv5qWNNMnRci8NmmvZmOGavOBV9ewTmEdIjOPGr+7SuDKKWVWNu1A0
 38EF6ENOda8YeL3wZXUtVKCv+BNMoN4NV686S7iyQw39rJI7J35wCVsb7nzzJyRVms9i
 3gTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCEVuHZqjcaO91xFl6eBtUthUnIkF9un25SL0KnclmOtQnbUNd8jYH0TI4VYbd6Rul812AW5XxQAMNuZr9KmmTJ92liNjrHQKGIX8h1Q==
X-Gm-Message-State: AOJu0YzCkSYcdHjyV8MNDl6iMe4u5oGQd4z3DPJKR6bOg+yTJNRWlav8
 0/19vBrb46aFaDrosKvhKu4YzL8wdTpFEGUpdDeKEeljySLlItesLVCb2IHbg3g=
X-Google-Smtp-Source: AGHT+IHMInFxT/T6PECjgKXAUBehfUIpIYg5lqdM5zgg8LcQYzhBYOBREV7cNdk66Ha2uCrh73/bHw==
X-Received: by 2002:a05:600c:55c9:b0:414:cc98:6093 with SMTP id
 jq9-20020a05600c55c900b00414cc986093mr101382wmb.10.1712160811684; 
 Wed, 03 Apr 2024 09:13:31 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b004156d3a512bsm8028168wmo.23.2024.04.03.09.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 09:13:31 -0700 (PDT)
Message-ID: <45549368-702f-4292-846b-a9438a852f50@ursulin.net>
Date: Wed, 3 Apr 2024 17:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/8] gputop: Free clients on exit
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-5-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240402221716.1840148-5-lucas.demarchi@intel.com>
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


On 02/04/2024 23:17, Lucas De Marchi wrote:
> So it's easily checked with valgrind if we there's something leaking.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   tools/gputop.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 71e28f43e..b13044b50 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -293,5 +293,7 @@ int main(int argc, char **argv)
>   		usleep(period_us);
>   	}
>   
> +	igt_drm_clients_free(clients);
> +
>   	return 0;
>   }

Indeed.. intel_gpu_top even has it already which makes me think for some 
reason I forgot to test with Valgrid when adding memory stats. Strange 
becasuse previously when working on these tools I found it 
indispensable. Anyway, thanks for fixing it!

Reviewed-by: Tvrtko Ursulin <tursulin@ursulin.net>

Regards,

Tvrtko
