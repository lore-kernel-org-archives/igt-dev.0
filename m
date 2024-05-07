Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4D3C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 12:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C83B10F48B;
	Tue,  7 May 2024 12:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VA64MkuH";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6E210F48B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 12:59:34 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55ffso17572205e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 07 May 2024 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715086773; x=1715691573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gPF7LPrtKF6WWhxjWFKJjAoNTx25VFT1FExG+NSm1qw=;
 b=VA64MkuHopEYQBBNp0ZSeOktpFKpA2BD04S0gra1YBEUPNkrQl/DwkTwJXldNgyr07
 bylphBa2tvbX89hvRXEOwMAzXHqKNfqARJhQLvtjMioIISJ6/6Hd925lzXg4Q+HdcpQ+
 i5jjeemf2HDUwq6Yt7sv1QdCl23HnaoQ5IUkL/XDrqpSaYy1IpQdy6kyg2qIlrbpRPWt
 8ufX5cz0dzQgROgb15xl0NoyPnE3Iyrfq6awUNmnTJqjNc09kNf2WnX6ERUzwxRXdIfe
 OVnHEku4SEbEj1jmvnK+G9x+cnZDL1kX2kRwQ9bI72TTcBfMRPq3Ewi+f+ieoh/hqWtT
 YjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715086773; x=1715691573;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gPF7LPrtKF6WWhxjWFKJjAoNTx25VFT1FExG+NSm1qw=;
 b=KFtT8NRm42UdbhjzF9NoNdNEofJn/uJrYvLfLH57o79gHmAsoDVkbhUGC3PTWu57YF
 Yg5T6QeBvGKKC5NeSXdaiMTnrMnT6RHl9fAUtTAE6qcaqtUTzTYiPnFLyNlDzWaplUE9
 NTGAA2s0VcLNtBaeMfW1c04RKAIOcrN9HGPaAFkbtq9H3ZKRiome4ltsbovkZx8MsEvF
 AIcutZeqummbKUfiDp0Y3UbtHodgFuxG4Oml3ydCAb+hp6wOpI4jtqhTThZtAsgmSwfW
 PC2iwGeNOVqURhyonyL98BInt95C+dSC6UGcE/kWkfxEXiI50jPcs0vNRGcdW8/+Gv9Q
 a8fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2hiqueldabW/Nh0At+EySCKQ7vWDL3i44YZ+4uHsxb9DwleosmDdi/qcIIjnSMThJZd1C912h1ILMTnOs43Lcd0fkefFP4b/+2zwTfg==
X-Gm-Message-State: AOJu0YwMfTAi2xG6/WMZ5f8aN2G9OgJ3KvuwlLeaIK/rT7zAqKn6r9Jn
 W5Nt1zeno7ODuUcoTKm89uD08c9qAeXgD5kLgcgsuYg99FytAiAuUU0cXKgqAAqyQg==
X-Google-Smtp-Source: AGHT+IH+2Elr0cVqFbt6mPZUDdP0jnTO9ibTJcM3ZplH9sBpLGDcQzl8ey6l4Nk5sw5gN/lIY9RNrA==
X-Received: by 2002:a05:600c:4f49:b0:41b:e55c:8dc1 with SMTP id
 5b1f17b1804b1-41f2db24fd7mr20515895e9.20.1715086772611; 
 Tue, 07 May 2024 05:59:32 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 f19-20020a05600c4e9300b0041bab13cd60sm23449213wmq.3.2024.05.07.05.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 05:59:32 -0700 (PDT)
Message-ID: <4996210e-3377-4dc9-8806-e8bec462028f@gmail.com>
Date: Tue, 7 May 2024 15:59:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 06/11] lib/rendercopy_gen9: Allow to use all
 tilings on flatccs platforms
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
 <20240507075836.259581-7-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240507075836.259581-7-zbigniew.kempczynski@intel.com>
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

On 7.5.2024 10.58, Zbigniew Kempczyński wrote:
> Instead of limiting compression to Tile4 lets enable it for any
> tiling when platform has flatccs area. For integrated leave Tile4
> condition to properly configure compression on those platforms.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   lib/rendercopy_gen9.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 7c7563d50c..c73f815efc 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -268,7 +268,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
>   		}
>   
> -		if (HAS_4TILE(ibb->devid)) {
> +		if (HAS_4TILE(ibb->devid) || HAS_FLATCCS(ibb->devid)) {

Is this change needed? What that HAS_4TILE checks here is if there is 
need to use members of below structure which are post dg2, hence named 
these members dg2. Currently all platforms to my knowledge that need to 
use these dg2 members are with tile4 but not all of them are having 
flatccs.

>   			ss->ss7.dg2.memory_compression_type = 0;
>   			ss->ss7.dg2.memory_compression_enable = 0;
>   			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;

