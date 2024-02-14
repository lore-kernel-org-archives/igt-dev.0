Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72DAC48BC4
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 12:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8693810E1EB;
	Wed, 14 Feb 2024 12:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hG/2Kvzw";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722C010E219
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 12:12:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-411e5f21c0bso4912655e9.0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 04:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707912754; x=1708517554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vgtcGVgDyf9fU2KxotDK7h4ok+fJGQ82X77PsqUjjXk=;
 b=hG/2KvzwfZGKntOmcUUiG3CspPEYngt49O4x2yT85NCB8lOcmQEeaAoYoyvmbweEOs
 iI76o6hUSr/ndHRt9LjaKbitJpEsnRYMHyXPcxEDdgaD6ARVe9W/tM55zeox4BSeCggK
 8TKRF9FTKPedamAdhozJ6JhimDIZ9b2FY4rrK0eN1q/ziaDpWi9UmafRW1dFcTGWSMGo
 v7fgGf6Iulfz7xEhuU/Or5VS6l5sAmjAmFD//28rVgItwjAvOd6Rl6MNjyEPP6nIAZ0q
 3yhETtgy5Rl6oPvP5SvYuusaufLlSDa8GDYzHfRaPGt4K14pSrflD0vsqrbo/YFTEzDS
 h2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707912754; x=1708517554;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vgtcGVgDyf9fU2KxotDK7h4ok+fJGQ82X77PsqUjjXk=;
 b=K8BbDuSV36yC1OwHJnTe0gH9xhoNkd8Sxr1Q0d3C2cfw/vKEPWji5Bo4gGLfreyFzu
 OE/74hLCyTnJG/ut8ouRzRzBFb9ITfAMja4bDMIirKVO1PUQsHqWda/pV1Ciin1wgZBT
 +94orEp9hJpX19a8nhfd+37Mh9LG8faxbh95dD8AjNAHqD/oO8y4xZYtC0DRBPSk3naB
 cn44bl5GRD5cG6XiGi/AD4R6Xhjpu+XPGGiJ0CcVuye31LKUVrdEeh9eT5niaTJQ7XQM
 UNpt5N/vJTh/LerVluNLuIvq0ufEGY6TOw6ih77fmcvAPWP0nmcxdi42NKZWQ5l4lgju
 yW8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqgvqjXtjeOzouXc2oxjyCDGDhkXZ6WVTfVyLM+3vNZc0aFRQTEw2Jy65CLLXfv5Sgv0nWXxXto9/c9t3IeXeGVqcgfceA97Cg7L0hAA==
X-Gm-Message-State: AOJu0YwdZjyCKtiU0CqAF7AKqIKbyGEW5htBtfY0phbIXpHED1FuASlv
 Ng5V6S0h1wPIYN/ZBUYEuAhoFC5CWaZLsQD/7hCIxMHm4eN82zyX
X-Google-Smtp-Source: AGHT+IGD2tNpE+oHjdG3/EAndKzeMruHd9RQzna/SfCZASuPFO61NFpbWIgrnnjRN51PJADySXK1wQ==
X-Received: by 2002:a5d:55d2:0:b0:33c:eca2:c59d with SMTP id
 i18-20020a5d55d2000000b0033ceca2c59dmr1075624wrw.45.1707912753439; 
 Wed, 14 Feb 2024 04:12:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8+WeGf4tFgLLUy5IlmaU5Y/YQqoATG1mKyfF0rrcNcmSIE1hUHanav+aT7xPeg5EmthAZaEPIagKa8430TXHg/atTzt/pB2Fh4EBIoURUpsJ0bNGAhZ22HP4HLV/jmLaktPfQZt5RYubMCJJa/h1Diomu/UCPIfYd
Received: from [0.0.0.0] ([134.134.137.86])
 by smtp.googlemail.com with ESMTPSA id
 b10-20020adff24a000000b0033ae4a3b285sm12077620wrp.36.2024.02.14.04.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 04:12:33 -0800 (PST)
Message-ID: <1563b978-f776-44cf-bdb0-be6d67ca077c@gmail.com>
Date: Wed, 14 Feb 2024 14:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tests/kms_plane: Restricting number of pixel
 formats for simulation
Content-Language: en-US
To: "Samala, Pranay" <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, Samala@freedesktop.org
References: <20240214085328.2024-1-pranay.samala@intel.com>
 <20240214085328.2024-2-pranay.samala@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240214085328.2024-2-pranay.samala@intel.com>
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

Hi Pranay,

On 14.2.2024 10.53, Samala, Pranay wrote:
> The pixel-format subtest runs on all pixel formats, reducing it to single
> format to reduce execution time on simulation.
> 
> Cc: B S, Karthik <karthik.b.s@intel.com>
> Cc: B, Jeevan <jeevan.b@intel.com>
> 
> Signed-off-by: Samala, Pranay <pranay.samala@intel.com>
> ---
>   tests/kms_plane.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 406aecc04..fbffc3cb0 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1081,6 +1081,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   		    f.modifier == ref.modifier)
>   			continue;
>   
> +		if (f.format != DRM_FORMAT_XRGB8888 && igt_run_in_simulation())
> +			continue;
> +

I don't think this is very good move when idea of this test is to try 
out pixel formats. This test will secure the plumbing for these 
different pixel formats will stay good hence at least for each bpp and 
planar groups should run some test. With this change would be checked 
reference format matches with itself.

/Juha-Pekka

>   		/* test each format "class" only once in non-extended tests */
>   		if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
>   			struct format_mod rf = {

