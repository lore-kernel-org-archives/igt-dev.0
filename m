Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0CECCD1BF
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 13:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D3A10E04F;
	Thu, 23 Oct 2025 13:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="LsVGbjSs";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC9910E04F
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 13:55:48 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4711f3c386eso6501135e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 06:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761227747; x=1761832547;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ypSJUAPOGc7vump620amc0x8+4rUyTUWYkIT2LNoX1Y=;
 b=LsVGbjSs9782TKn/Ft/SC8uF0LjDv2yPvaDi1sLRR83JITX/tscZHB7s0dRt+sI53M
 YLZp+Ips6wHMJO/oDsNZkAHsLcErAohw9tpmQLZoVM1RJkvIm6qe4vWcqB+7MO+O6xna
 VdnGJxcwCto5r0qTge6L7LIWEmg3y1TPi+ey/7JHRhqD5U5QnefRpIvJBYFPgIHmuSoe
 IsQVvctzGXkr9B4G10EJ5/HWBP1/fdurhRKDRZp4drLdoH2n9F9GW63B464c+NZSbvzb
 SRAwUvKGxysd+tvYdUWVDtc35AJzzXWIu7abifpD8uA+HfBKyBLo5E17b2n2mIlzccbM
 yI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761227747; x=1761832547;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ypSJUAPOGc7vump620amc0x8+4rUyTUWYkIT2LNoX1Y=;
 b=rHjykx4mQwOEKGKuJDj+4ZN+J0lTUJZj6zFGNZ12ZSREVoxud2pp/cdfRAW3DcQ+Zi
 La++yl0Ke0O+wy6/i96bsYJE7m2z8ePp871YRrk4QQ3xQCNYOTbC0G/ZA+4wMhsaNoOR
 EvZdfphU8Bvko2wkFrOWml7Wok9Z4WojScB54XOGZh+3Y/PRZTh4mKGclz1+/Ydqf/IQ
 izdejj678ofbxqS0DOfAkxBNMFdbvbxPOlVgxzQ8fMRhOnsT9Vx+ckMUXg5kqG/MPszU
 HmVonJSP0HB09weSzqtWUlE8jEQojwe+hl9mY55zaSHiCtAyDl5NpsRMqZeO4bhDxBen
 NhqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDhj/oG1EbZb5zutXW+qmn+CgDZnWsbg1fghcEY1ziusUZVg9W61TJs7QhANAlr3gt1doNyJTE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEpagdN+mByq/jIoDDtrUitOePkfJ5PvN57xuDj0NJmbHUVivR
 BWRlLei7YW4Q1nQ2tMaB0j31CBAkZCunCqDbEu8Ybgsi+jQ/F+wVaFjyiwCEr1r+0Yw=
X-Gm-Gg: ASbGncsK+BDyipTSq6K0/AXRtmD+ckIuA6Bh5VTjxCKOjfRNn7NhFRWyn7/jaFoGFVg
 HxBeMkN8012IvbR4z4nCRBRYMeR7s21qPbUi5cKhwzfQUS9gNlOxP7EqlCzd7x7j351l8u/Vpni
 NM9KTTSkNFR0SMxjQdrkoHJnOP5eUBfX1bT19RcIlLWD2xcGFyI63WBEvMS6Ae4CqVIeUIMeFF0
 y6DRn7RI8Bi5cWWHxCnsqnUAKtEXyl0pc9uN5dpZd4jyhFpZHUqEg1oyFzBffBsGZLi/mdqcWFr
 mqF52Z+spTitVb5P7JJgjizorcvwbLB/0wYK+4VT4e27ZAj3AAOhV25IzttT3JJpCI4p4bowU9J
 t+fmTneoj/GHFSaNJIfIyb3KHPSKIqt7jHF+HH6DeC8kyM6QOrfUD/exg8zxVgAlpOCeFhffhnl
 BIaJ7PCp4xxq/Fqyg7bT0aWu6UyA==
X-Google-Smtp-Source: AGHT+IGC0hWFns1ZohzV/tNhHl8dQNGVjRTxxFifjMm+HmTfJPypXlBiqKGbGkL78NdPLlXw1O/5Ww==
X-Received: by 2002:a05:600c:4e86:b0:471:13fc:4ad3 with SMTP id
 5b1f17b1804b1-4711787847bmr216476715e9.2.1761227746678; 
 Thu, 23 Oct 2025 06:55:46 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898cce3bsm4057076f8f.38.2025.10.23.06.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 06:55:46 -0700 (PDT)
Message-ID: <631b387f-6f05-45be-b01f-a80dccab186b@ursulin.net>
Date: Thu, 23 Oct 2025 14:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] intel_gpu_top: Add usage note about i915
 compatibility and Xe driver transition
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 krzysztof.karas@intel.com, dmitry.v.rogozhkin@intel.com
References: <cover.1761225010.git.sebastian.brzezinka@intel.com>
 <26d376252a4ebc1ca256e476bba0b42611769225.1761225010.git.sebastian.brzezinka@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <26d376252a4ebc1ca256e476bba0b42611769225.1761225010.git.sebastian.brzezinka@intel.com>
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


On 23/10/2025 14:21, Sebastian Brzezinka wrote:
> Updated the usage output to include a note clarifying that intel_gpu_top
> is intended for Intel GPUs supported by the i915 kernel driver (Gen2
> through Gen12/Xe-LP). For newer GPUs such as Xe-HPG and Xe2, users are
> advised to use gputop, which supports the newer Xe kernel driver.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>   tools/intel_gpu_top.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 1bd88ba7c..0d0d03717 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1067,6 +1067,12 @@ usage(const char *appname)
>   		"\t[-m]            Default to showing all memory regions.\n"
>   		"\n",
>   		appname, DEFAULT_PERIOD_MS);
> +
> +	printf("Note:\n"
> +		"\tThis tool is designed for Intel GPUs supported by the i915 kernel driver,\n"
> +		"\tincluding Gen2 through Gen12 (Xe-LP). For newer GPUs such as Xe-HPG and\n"
> +		"\tXe2, users should consider using gputop, which supports the newer\n"
> +		"\tXe kernel driver.\n\n");

Man page already says the tools reads _i915_ performance counters and if 
I run it with xe loaded I get this:

$ sudo tools/intel_gpu_top
No device filter specified and no discrete/integrated i915 devices found

So it is kind of clear already.

Downside of the message you add is that gputop currently does not do 
anything Intel specific, no? And there are some files called xe_gputop.c 
so what is with those? Are they orphans? Anyway, downside of the message 
is that you have to update it if it won't be gputop but xe_gputop or 
whatever.

Overall intel_gpu_top could have easily be made support both drivers but 
what do I know.

Regards,

Tvrtko

>   	printf("To access interactive help, press 'h' while the application is running.\n");
>   	show_help_screen();
>   	igt_device_print_filter_types();

