Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C7606A325
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rqlSdtZx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5DC10E8F0;
	Fri, 20 Nov 2026 13:37:37 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C34410E8F0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 13:35:17 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-8a594d313a3so682371b3a.1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 05:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795181717; x=1795786517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UdszhSLuxxVQsAc/57KXdyBOWdONOCqk1UkirW5j09U=;
 b=rqlSdtZxYyaOiYUnYH6VzRgHd9kkS82yAXOythwyepcXCBGc1FfKfR9zMh8OGAp8kh
 0I1AS2TGvewqvjoF/qcKUVDTepJO8FpGmwTduhBa7pYiFSKmB1OwQEVBn14awFVmetd0
 RXijP+AiiLZj4k6KS7H4dyQvobKDvmknnm0qPoXSOeyMZG9D+F2Hxc06GdiIATswCW30
 qbWwRe5YIYr1ogAQZel/8gdBz6zxrlFVsGFSFs0pBxXTCnK0eIJITNf6qc701bcO1ZTe
 LcWfcZpm/zRNDuQf08rSlpCK8skZaCi2tsy8Xa2RORRel/zUAPShDBNFhKABghmL9WTV
 ZACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795181717; x=1795786517;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UdszhSLuxxVQsAc/57KXdyBOWdONOCqk1UkirW5j09U=;
 b=DxyJZqVkt08+g3rpDVUeFHaYx0GPB4KnfpDs+BaBycqCllHL1sD6XiXe8cg0hcQXJT
 VYUZMNuY3bzAOIz2MLFgBgBdkGtjb4pWUSQvhD35d5YytSLZDhBsYa/ENHTB+sGA7Kzz
 cEdQHyLPEU2qZcHHU9ePPmCqvphn6irEJe9d/z3AYqgoCC6YQNgAdyolEm8QkAlArCvT
 PmD7/tbkXLMn+3IvMLtB7+FFKVrviCBl+8/bvWkqnOIYwlIG3LYNkmmGcsEHUNd8hgkt
 wNp0QBbODyuzsBMKy7DT2OSWBRbw9YwYAi+BYVigzgaiTQCy+DWh7AEVPSTAywU6eYIb
 Y9ww==
X-Forwarded-Encrypted: i=1;
 AL+hErEB6sINnuMA775fwuJu2OxwCSUUQZUZ9/azzRwPyk/9MqfoEmXqHmSkhLX0eTzifAuUMwhVz6qh@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9oloUI1OpstxS9JsEns5ilPCNqSlai2Ujd57BAXyl9+A+blMv8
 UsNcXe5s93E9SrOq3C6y/BarJ63s63LKdERzFutIXGs0rCYn6l1tqjs5
X-Gm-Gg: AZFdTZd6DHsuHhWdgE5vOwXeqLcjWoHB0v/GJ9Lqse4U+EV7qRxjXWFmOD96tdnlYh4
 CO8i54rKiaJFNHhY7KKzTL7n1B6LMn3rw3BX7BLH0JdHpYIAsaNrO5RSPQ+ATmNS2EYc8O84nMG
 HC3x2fWSNnOMx+jOvtpk2lzFs5SRqWRFmcMct+9sh7Hw2N2j16XRgTdlqbTj34rWiRirX8C1Z8I
 mGcHIKDuwf1n2d3LMNO4+Ft8UDk+tUaWKFrVGLA/UF77UvUnhwaLfRoOKKYTSbA2UpdjGsgC5KJ
 D+Zr9jKTiMC6spYGczfINpqJ/BNb2C8DVneNe5b4ykQwtfoQ9+8YyHZPbm5bf+rdKibWvXm6fuS
 j9f5Bw1RuVKvvcyFyKdAWguZhr1Exf/tXrGUDS1obpK5w0MZ8qDwOgkVV/8wQOfNaN4WBJ3uVDR
 cqfGrSSZyg+xKa9VKpIxsT94KOtTzGfSDhMki3d0PoVanI8c4yBl+O1NOE7eyc72vcPAlIzU1R4
 1xY9N6FoPIdDi7Gox9cVL69/6TRXY/4QqpuRIfP6Nm2Hav+QupMhuJoAgGxslt3biZAWTOraOPc
 H7coGHWsB5uBbh4UEVFLd0PLTYRjkXnB6i8WrvFZUtGQdYgmhmgoP5Wn+Bjb9LPM+bW71AUJTh9
 CZnWxe9MllsxRkZkavzr1vQ==
X-Received: by 2002:a05:6a00:39a6:b0:89e:f8e9:205f with SMTP id
 d2e1a72fcca58-8c87c76a3d2mr3174436b3a.32.1795181716738; 
 Fri, 20 Nov 2026 05:35:16 -0800 (PST)
Received: from [134.134.139.73] ([134.134.139.73])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8c87285c14fsm1509793b3a.15.2026.11.20.05.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 05:35:16 -0800 (PST)
Message-ID: <cc49a3d4-55f9-44d6-8369-1873cded71a8@gmail.com>
Date: Fri, 20 Nov 2026 15:35:13 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tools/intel_tiling_detect: Enable Tile64
 detection
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261118122619.206753-4-zbigniew.kempczynski@intel.com>
 <20261118122619.206753-6-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261118122619.206753-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 18/11/2026 14.26, Zbigniew Kempczyński wrote:
> Enable Tile64 in detection tool to check what hw blits are supported
> in the hardware.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tools/intel_tiling_detect.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
> index 951e2eecd04..7b13fdcfe8d 100644
> --- a/tools/intel_tiling_detect.c
> +++ b/tools/intel_tiling_detect.c
> @@ -347,7 +347,7 @@ static bool try_tile[NUM_REFS] = {
>   	[I915_TILING_Y] = true,
>   	[I915_TILING_4] = true,
>   	[I915_TILING_Yf] = true,
> -	[I915_TILING_64] = false,
> +	[I915_TILING_64] = true,
>   };
>   
>   int main(int argc, char *argv[])

