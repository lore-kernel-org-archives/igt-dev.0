Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EB7C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 11:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B11D10E36C;
	Mon, 17 Jun 2024 11:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SetKrn02";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C188410E367
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 11:16:37 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42121d27861so33147625e9.0
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718622996; x=1719227796; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=k/hk7m5AxYVTkO2emQH1vySaahhMDTp2qLq3L9EN1og=;
 b=SetKrn02AFkk9TlLFGwGZ+S/0uEk+sw7ucrtlGrji2DcHh2WuNnvOwX7py07C5VUWS
 K/ufM3dQJsNx4bi4HZQfAWwCLw94gbjbVod5dqi7tYm2VD8yHqNt66z0vEFItgHqze5E
 hk1L6oix7odROi4uI0GHmMBTy6I9TBXe0h5uXPeWV0YlFq664cuNlGfTzH4kcr9YR41T
 /ptghCjE4RVmOICr3lCheZDRikvq/QxpZShHShxGCXfrxNxuGUpL3lCc9564LZaYgD8o
 TRCGiNgIvESNg+0vNx4Lajri2uaWUX7UVOb5Ngo3KSXO42Ph7PbIgXjw5s7iqwR59Ega
 kqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718622996; x=1719227796;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k/hk7m5AxYVTkO2emQH1vySaahhMDTp2qLq3L9EN1og=;
 b=o9aCC5RXTI4uXjsOXQUewFuAEQnRRDGlVE+AhQh+mjq+V+sp4oAO5r27ohji55Un4k
 wiCUkpPPDIGKPoTCicPviG3xlLqPi+c5MJQMkyaW7S41IVADcl9kVOQ2ak4ItSLxM9L4
 ZwWuPQoZ6RZq0l24sLLqXV4yd7waQJbXL1zS1HnhmHzvK0EW2Vi47LgBT590ueyfOK36
 I/34XF3Qiu4tkN3zCnOPpUg7PVWLpAwhhi5eBULSezR7OExgLX8JCzTOLngU4oynixBV
 q8MjWEJipO1jIGKIPi6WtZO62qnJBUPHJgTuaf4rqA8BrZIaugjKbquUeQ8P7CSWUjnF
 63eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOfS3mKakQCM3bja6oLtcENo/OhZpOvT0fmEVjbzfxCO21wofcYuQP0G31yWAVKoYI+oQJO99XTQDVPnqF3sD6PLazqtmW09LEh60DCw==
X-Gm-Message-State: AOJu0YyrrJ80SiEI4OnC4Y4Gxj/fWmO7gskkwpzLwMFz6HmSaTM9AS20
 WJmSWWiimrJ4NaPEge2wQeFJBN9AbVBpJF6lkzz4VMbS87aKxk22
X-Google-Smtp-Source: AGHT+IF/nbiFIvHAJ6+q2NFnLUOMXmN249aviIaftiQFv9SG0KJ00pfryWuxnmW1kSYHprBE++yUFA==
X-Received: by 2002:a05:600c:474d:b0:421:b79:93fd with SMTP id
 5b1f17b1804b1-42304825cd7mr64744795e9.21.1718622995881; 
 Mon, 17 Jun 2024 04:16:35 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4229207d1a7sm115506945e9.1.2024.06.17.04.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:16:35 -0700 (PDT)
Message-ID: <e943de57-8bfd-4553-8c04-8da2715f691f@gmail.com>
Date: Mon, 17 Jun 2024 14:16:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 06/12] lib/intel_blt: Add Yf tiling in block-copy
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-7-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-7-zbigniew.kempczynski@intel.com>
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

On 27.5.2024 10.33, Zbigniew Kempczyński wrote:
> For TGL and DG1 I've noticed we have Yf, not Tile4 specified in the
> documentation.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_blt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index a8433387d2..d1200ca862 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -555,6 +555,7 @@ static int __block_tiling(enum blt_tiling_type tiling)
>   	case T_XMAJOR: return 1;
>   	case T_YMAJOR: return 1;
>   	case T_TILE4:  return 2;
> +	case T_YFMAJOR: return 2;
>   	case T_TILE64: return 3;
>   	default:
>   		break;

