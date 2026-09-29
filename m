Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F38CA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 11:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D203A10E9DB;
	Tue, 29 Sep 2026 11:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W7Uz9rwU";
	dkim-atps=neutral
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com
 [74.125.229.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F71610E9D7
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 11:13:12 +0000 (UTC)
Received: by mail-dl2-f43.google.com with SMTP id
 a92af1059eb24-1450541ab18so4451502c88.0
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790680391; x=1791285191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Vmd9Ffotaq1rtvIFIokAUs2U7kjqy9Xws62fKRy92w8=;
 b=W7Uz9rwUaAYhKbWi3s2nhxAsinu/UabCxULEYOQ9Yzs7+G14Khzkd+FFrLjLwp33cK
 ykDI2CXKLbtrMK674CNdSXtqH1n+COIjPHFatilSELTnrrfXR52ZgQpupKyWFj7VOowe
 ABOOhDiLBjbw+4HysoJLt4xUWHjdkbe+sXmmtdskbdYXpGpr6ly5sbrw3H+CqFy4r7kc
 bZhBAG23a1kTtIFvgNDTbdLCQfw+RJ5ZjuKYPZu4r5GzMswDiCJaQ3MEXtXbf9E2uSwu
 yQmpi06ORprGC96SufAMO4FtfZskeizsmc+SI5qJIZbu2vGTqdJWq9mmAYs7Otqz8iGX
 tc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790680391; x=1791285191;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Vmd9Ffotaq1rtvIFIokAUs2U7kjqy9Xws62fKRy92w8=;
 b=bsc94sfM9mbUQP8fKe0/QNl0YGVeYwdOYBxNfGjukjDwBUvyhPz64YS/5lP9zkYbdk
 yYoefCD+/gpk3MEQRh738/3+M4QXt5SgKQ/AGtua+l9lQPahoOqb9QpGTWVPKzMdJzXT
 BGdeTcl0i1Wm+0c62qp3b1O2bu8EByNzrl2XIn/ZGDAylBpezlWREex/witjou01Lq+J
 imF8MAxqNQZ0+rtLdeCEsbgIy3OanEp4RxK76EoHVfCXvilrDgrYxfXkqQMdC7tvwYTS
 CG3AjhaWH3wSIdlj6X0+oJoFliEEWsbq0HyHv/mqi+bUQhwywYVQ620YSc59WEDmRrC6
 ldDA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw3ut7ZsHvKiKhZ0vCGfSHxJeRAjZ7qL2D+AV9JBFyAuh61eILrG7tAna49f7aGlogqTw+A+byK@lists.freedesktop.org
X-Gm-Message-State: AFuF++kX7SvjDHSXSQ2k7u0GDeXf1vxPxkYhaGIQ9YwKBSpinbSI3lfv
 g19EYvabhgo5H5FR0cXnnrQnQCdliSqbPqQxs3oOxZCziRm+b/VB1B4E
X-Gm-Gg: AYBFou2bk10QSbDR5iewYW9hrStDG5IoznQ9aDcOWTTO13ajbh4sK352ltrKDRdJy+5
 8z7Hv6JS8vK0RzKZrdIfqdxDABNG7qjci3CEfkkbah2EuyapKBR9f8r9VmRilbhFRX/8RZK6xN+
 tMAJzNxlsZvPM3wFKT4ippnivnepQ6QzQFiW8Cri23r8vtz3asV4/2p7je6/4pJU9E6p4xtosn1
 jqce6TlVLJ9mB9LdUY4OCugF4Vu9HUTj+WsUYKMNWJGdxJ6lRyXeKwPp9JIE6FgRGxHCegm5quj
 CdyNQxcXLQm696ylqmCw6VKjWhKjlA6JUpY8ht13f+uFiSdQEcrmgCxRJ5TwVfVroeSUkcvbtwz
 JRz+bNWRNnv2pssms6LCNBPGjUGsTCgaLa64gEnVyE8RvgN3yjp4HWTIhG0iCNb+GT3E3g0oT6S
 xuWa2TGaDrYnt+TRvHtH04HxtBh4NCiGsBgTrh8ox0fPHgHZ/GUNl6mgN86B5HhZ1KcXFTUbE9X
 /3xLy0jQSjok7IummZ0cGw7k9XhjgoMB4J/OK0p3Q==
X-Received: by 2002:a05:7022:5f19:b0:14b:35fa:f4bc with SMTP id
 a92af1059eb24-14b35faf964mr2773588c88.36.1790680391149; 
 Tue, 29 Sep 2026 04:13:11 -0700 (PDT)
Received: from [192.55.54.45] ([192.55.54.45])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-145ac67c0ccsm31788225c88.4.2026.09.29.04.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 04:13:10 -0700 (PDT)
Message-ID: <94629d8a-649f-4bdf-9e9e-860741d7063f@gmail.com>
Date: Tue, 29 Sep 2026 14:13:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Update MAINTAINERS
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
References: <20260929105755.49524-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260929105755.49524-1-kamil.konieczny@linux.intel.com>
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

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 29/09/2026 13.57, Kamil Konieczny wrote:
> Add Swati Sharma.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0ea8f2f3..e3b810dad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4,3 +4,4 @@ Kamil Konieczny <kamil.konieczny@linux.intel.com>
>   Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>   Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
>   Karthik B S <karthik.b.s@intel.com>
> +Swati Sharma <swati2.sharma@intel.com>

