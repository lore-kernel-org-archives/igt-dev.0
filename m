Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B85C87FD2
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 08:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC2710E396;
	Mon, 11 Aug 2025 08:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="1gG+T4vt";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FE410E396
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 08:38:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b78d337dd9so2470334f8f.3
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1754901505; x=1755506305;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xZwQDIS1bNah1tiaboFo4/Ob1kVdmdgnpyg6l7dHKaM=;
 b=1gG+T4vtwTLLGBlTk3vl9iH2GsCAiH/czDWMnDW0M4VsiKYOczq6TAoOV1yRM8Qz/7
 lUB2QFSU1+yFckfLbLmFRIQBheKaa7gRiakJsHOjIeD533XiR7KgfkvPpkCgOfAP3ERQ
 Zpi62F+IgmqIviMfSTKviN+isQa1eTePVYlC/8XSfWoifdCDVjlmx+9wU+8Rw93LMlGE
 YFJBrYKQUu9Af6EW2YHDkuyI1HO7atk9FymLrh0/CN/Hnrzdr3tQfygJ2iIfNQ7gL6dW
 G91/gt78Ke75d0HYy7EZljVzgQA7uJGGYbHdYAcHHqRQt9RWV3D0kekgb2GrdDyal+4O
 pRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754901505; x=1755506305;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xZwQDIS1bNah1tiaboFo4/Ob1kVdmdgnpyg6l7dHKaM=;
 b=i+BF16SE05SsReZlwq4szUS3crtcIOjG2+FdlUY7nTiHLfr6pDQvXugv0PvA2JiZSB
 asZVq01I3nuubjbS3Y8d+zW3JUg8A8w/Pi6c9W1LanedWK1h/iRR5Ohu9b/USVpfLtAd
 h8W6crK9+uY22ACxvViCPwNasERpikGJxsFEzzbX1JS8Ho8VLbId7VtQLlJoCBN7RR5B
 /8Z4IibLr0dBBv+Y5AqW7iqlD5mHzk4+57EUT+YBLTGSoBGPYQRoFO2+jWwIUVjf4QFI
 tIMUPWImHgayIxpN2sQXag7TdM0gG/AvJxMmIDuSNOkZmrYGWQzz7bIRopA3r2VZ4UCD
 2d8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2PiXHzs6LIFSyV4vi6lwNS1oL5wLvOavShPVkR7q0Doh83gD6TrJDzcjYdgV/AhZKONZX+RDk@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/zo6aVjhaMmJWwWW2ptYp831hOncNqcIga9HgHX+Vx2iKIBOA
 YFI3NSTMhxXa6aV33IwkZPStfp5cJMNozSvC0In22Llc/pcuhq55eeJlKPQeZMEnREI=
X-Gm-Gg: ASbGncsehJDuo+d1gfH6noW7GDvosQNblPux5/a24dHPHjc2kfjl6gRDZh6kAwiCjll
 DIsbQSPLSaxkvUiwq7w4u1BytEDD1NIU2KSxxY7yQyT78YvawOQAW3shRdrIYriXCRecrNpG3zI
 9duAkLeDdpr0l86z4Gh+QYknfSao+9x58FiHBP4DRX/OSNhUuCJZxZ6pCRG6q2cEBPVO+tdPJw8
 XDk6GG6feK+0o9XEtoUuFXaTYUpU6qYlFMhyrcXDnwP3hytRwhpB1GoXXIpi9BF02sBL0ZQNcGw
 kOidF0Tcr+WKk/76387H4Jf964u8lYYvzIqRR1oAtDKfEnUmIMPvcAE1ew1ZA2gwLHCSRuRZtoT
 rPmW8UCNPxcBeOIqpZ2dqSQj+Fln3HGg/seo=
X-Google-Smtp-Source: AGHT+IG1wq5sR67olc31QHIyKq2/a5Lt19lRFPecHHxNzHkfysLg1R+UWx4GdsLfyN6fg9iBv1OfYQ==
X-Received: by 2002:a5d:64ef:0:b0:3b6:12d9:9f1b with SMTP id
 ffacd0b85a97d-3b900b2de3amr9579113f8f.22.1754901505231; 
 Mon, 11 Aug 2025 01:38:25 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e6867193sm243926055e9.6.2025.08.11.01.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:38:24 -0700 (PDT)
Message-ID: <7b81801d-42aa-4364-b0a1-e5a50d817cd1@ursulin.net>
Date: Mon, 11 Aug 2025 09:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel/veboxcopy: Respect buffer MOCS index
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, igt-dev@lists.freedesktop.org
Cc: Imre Deak <imre.deak@intel.com>,
 =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>,
 Mika Kahola <mika.kahola@intel.com>
References: <20250722073906.99759-1-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250722073906.99759-1-tvrtko.ursulin@igalia.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 22/07/2025 08:39, Tvrtko Ursulin wrote:
> Set the MOCS indices in surface state from the source and
> destination buffers. So far it was done only for the input
> buffer and only for 4Tile formats. Always setting it alings
> with how rendercopy does it and it fixes the AuxCCS tests on
> ADL when target is of the MC flavour.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> ---
> Lets see what the CI will think of this change.

CI is happy. Any takers for review?

Regards,

Tvrtko

> Curiously the AuxCCS tests where target is RC, so rendercopy
> which does set the MOCS correctly is used, are still flaky so
> that sounds like a different problem.
> ---
>   lib/veboxcopy_gen12.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
> index 4e3aefaf1f44..2193433a1c00 100644
> --- a/lib/veboxcopy_gen12.c
> +++ b/lib/veboxcopy_gen12.c
> @@ -258,6 +258,8 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
>   
>   	if (HAS_4TILE(ibb->devid))
>   		tc->tc1_2.input_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
> +	else
> +		tc->tc1_2.input_mocs_idx = src->mocs_index;
>   
>   	tc->tc1_2.input_tiled_resource_mode = src->tiling == I915_TILING_Yf;
>   
> @@ -278,6 +280,8 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
>   			dst->compression == I915_COMPRESSION_RENDER;
>   	}
>   
> +	tc->tc3_4.output_mocs_idx = dst->mocs_index;
> +
>   	if (HAS_4TILE(ibb->devid))
>   		tc->tc3_4.output_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
>   

