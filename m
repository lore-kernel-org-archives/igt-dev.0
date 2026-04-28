Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F313FF8868
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 09:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7A610EA74;
	Tue, 28 Apr 2026 09:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wmxv8wvq";
	dkim-atps=neutral
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEDA10EA74
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 09:07:56 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-35fb16e56efso7320057a91.2
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777367276; x=1777972076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BdKG3lebBHmEDxpdhQAtCr6FlpnaTqUznw32u/BrDhI=;
 b=Wmxv8wvqdVd6pZewbollA7sy99sTePrWvRh8/gehuGjCTC3DNaGSDYdqzQFoVWjRxy
 +i/zyE8CHhpsNs8AV/18wkd09iIYD0gmKjoJNWLkV3S5DbGYOg+IF2ncFwE2o5cyJfX6
 tm7wdDz0RyiHNTO1AI9WM+wj3By8z5tX6djp0Y2RLakMOfnBPq98EDbT55lPcZn5JIV4
 0EsR2iLRXDaaoWJcEYswMSrUIqsfPqOberDiVbu7Js6O7kVOBO3OM/ouHJhFHOnrHYvq
 xewXFIldS4P0NA1t98Ap155PyaJK6ISJ414yxO6WHWanJj1zUjREgaMiZM70dLjHuO9y
 htbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777367276; x=1777972076;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BdKG3lebBHmEDxpdhQAtCr6FlpnaTqUznw32u/BrDhI=;
 b=CzMokCz5scpyUBYipy8r7HPbGuCql51u09OeK/ZSHNRnAmb7PsGOOIg304K96SfqDA
 BhXhr02gz91C0ZW3foNrG+vL9n79BWMyP+wZsl3hMyTxdeIwb/unpVDe3K4hnqQ+1/Sy
 /jHL+8Bqjel/78HXsEXWK9pTJmk5xdyQRMJr3a05TTZtLiDD6Daq++iac8UFUSt+fvEE
 FAqVLhxsS4UBa+ZexgNt+wutyI3CByFfXZ55IU3YFugbS1+VSPsaID9uwgbIB/Od/dem
 ryFyA6s/3Artc+grhgJunVL4oaIhRY89CPEq4OtKQ2qR3NAo8oU9pLh//Bs92uXPpzno
 vBBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/GplRi4Lm0YELadLdqHtb3TvfA+zO6oSulxnzXXTlRBNB/1TfVwAenRo9O4QxcVDDCuZ/A/7OZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdSqz8dtrX/eblkhgSt1RkbagJkfavFAijF2aWOZemhZ6jZ7XA
 LxWrd7ODLQVmJiytUHI1OnmvkBDexrK5PsIFFFb8qb+Kp7J/tdDIXb+b
X-Gm-Gg: AeBDietClBnKQNDlRGOhAPTXWNJVse1PUp/BtZmthT4kbroBTSTu8hSEjpJ2tzhmlGc
 y0jRpC6RWHBWoNcVFEJ+5rgdNB1DgTVG8BKzE/ZLyl+3CQdn63xbYkwqkLNsaatf0yeGsximCrf
 Bnk7zW18T+HQNhp9EsDgixtq5++X0AtVOUFdQrf2eTwE19+A5rajPjbC24jCjKbaMKqzIMcorW2
 9dYSCSnQzsjLi4+vn7V+SCCHUxnw3h10XJjXQ2g9NzJ7qN9T5siQfLNKsNo9qZ7nA8yKmLdcjMg
 YWbVq9MXvBf/Y3fwuwWvhfl9o8ZT0P6MDpcGJyoncPb0uVgcgX6jFUNoSehAYteWPN4f6nbHkMQ
 TJd2PuMWOsZFNiGT7U/BvPLcFlwozg761XUEOwGCj7+DlqKWGJN3eh1GuWUS/HQMptDfOsHXCS1
 MQ9Hxo4gL8XILeOADHVQEJmuNKZ8+yGDMqIAyW3ELC83wx1mx6wRnf8fHslRsWZdTPcM7bvy40D
 JRKhY7zSg==
X-Received: by 2002:a17:90a:f950:b0:35f:b137:5a63 with SMTP id
 98e67ed59e1d1-36491f6ca72mr2652907a91.5.1777367276135; 
 Tue, 28 Apr 2026 02:07:56 -0700 (PDT)
Received: from [134.134.137.74] ([134.134.137.74])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36490cb3f98sm735205a91.13.2026.04.28.02.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 02:07:55 -0700 (PDT)
Message-ID: <b538a92a-1e68-4166-be1f-741c1a90320d@gmail.com>
Date: Tue, 28 Apr 2026 12:07:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_hdmi_inject: Retry ELD check to avoid
 transient audio races
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com
References: <20260427105856.133153-1-jeevan.b@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260427105856.133153-1-jeevan.b@intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 27/04/2026 13.58, Jeevan B wrote:
> ELD population can lag HDMI audio enable on some platforms.
> Retry once to avoid spurious test failures.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_hdmi_inject.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> index 00eb5e4a4..f388a84c3 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -200,7 +200,13 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
>   	 * Test if we have /proc/asound/HDMI/eld#0.0 and is its contents are
>   	 * valid.
>   	 */
> -	igt_assert(eld_has_igt());
> +	if (!eld_has_igt()) {
> +		igt_info("HDMI audio enabled but ELD not visible yet; retrying\n");
> +		usleep(200 * 1000);
> +
> +		igt_assert_f(eld_has_igt(),
> +			     "HDMI ELD missing after retry\n");
> +	}
>   
>   	igt_remove_fb(drm_fd, &fb);
>   

