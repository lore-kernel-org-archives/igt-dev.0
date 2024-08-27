Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81A0C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1F610E37C;
	Tue, 27 Aug 2024 16:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZnepoqa";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAEE10E388
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:25:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-371bb8322b2so3095360f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724775953; x=1725380753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/SuP2V1sZ4HM+QTM5PMDntLy9Xl8EbxK9Y9CVFV7cbs=;
 b=UZnepoqa8zNGnjA+KclwTeHpb1XZphY7K44BWv2xCqzISgcN7ZydXo+q/llE9Y1pFG
 YUWTT8N09hGj1SSbegPzJaufWAg9gmmNNmRckzBgt1vLmPB83170+pczy/+z9Y3Sxcd9
 8XkUT8m6Akfqf/vGzuWRPcaMVZM1nVxnljjYanyFuy2gFqVWbIXMtl9JB2M/44CM0X5l
 plDL/MgtM2TNKXbjwHXWwS+qjNBWLtTBxyO2XjIPNWbp6XZJ5yiOrnKUh46ZnNAEFxnN
 fm4z5N94fL8XL3ecUPHKtDEj/iVm8V8hS5qspHbDzfU8v0ROxLZdFK+lq0iXehFJJ50W
 mecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724775953; x=1725380753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/SuP2V1sZ4HM+QTM5PMDntLy9Xl8EbxK9Y9CVFV7cbs=;
 b=TB/k5EKqYVlOeMpclMrPhgVkRClaMRhZi0RaQm7CKAT5GK7qWOqgHRaN6sAwq911dD
 iSHFqwUjl6i+0lsA5CRsL5ksSXHeMxX1v4AMYAsk3akeUtH3yB0VhOzCHbQ4HJQp2ZB5
 aFNBvMwiPPeUO2htoKg6zXxs2cjgMqy6WPSOPfIYFtw2huzNSjbQlITefabROZrnCF17
 Y0OJ+unu9KSCRuUDlNcpicNgt8JqkR5/3SGfM4KSr8sWhmSEhf3PH5EcJYb7mK4Kc0Ox
 09iHAQt+ebnVld0rjSvXekJcvNHS/F4G8seqLJ/rVhcQppNX2deqw71Y7tnVyVnZL02I
 nQaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZHSEeBkJurdBvZWCgRKNHw1CXC2Ian5XE/CUIxQrqUlsSn9eLtMtLk2DuHH9CxfwmuhA4Sgx7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZTAOYR9ZXVG4728HwvC9yNZFSg+waqk053VSEeBpYIsD3dgS3
 MPTCa1zWPYej8m149zQUoFoAZU2Xiuu2fQscsqTdLiOWuyZjPVfmd/B8r+GEZxs=
X-Google-Smtp-Source: AGHT+IF1fU1XFDhzMn1plnFxE6RxnC+A8Me7Hp4xzcfYJ4wnlb0oxANmejLjk0AKuaO9kFdu8ICprw==
X-Received: by 2002:a5d:6d4e:0:b0:36b:ea2d:fd5a with SMTP id
 ffacd0b85a97d-3748c88a52emr1779694f8f.22.1724775952873; 
 Tue, 27 Aug 2024 09:25:52 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42b9d945144sm25209185e9.0.2024.08.27.09.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:25:52 -0700 (PDT)
Message-ID: <441701a0-66d8-4b87-8c31-7dde15df4ea7@gmail.com>
Date: Tue, 27 Aug 2024 19:25:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 13/37] lib/rendercopy: Use the proper compression
 format for 16bpc on dg2/lnl+
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-14-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-14-ville.syrjala@linux.intel.com>
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

On 3.7.2024 2.27, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Setup the dg2/lnl+ compression format correctly for 16bpc formats.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/rendercopy_gen9.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index b871a4b3dae1..ae4bb2606125 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -149,6 +149,8 @@ static const uint32_t xe2_render_copy[][4] = {
>   static uint32_t lnl_compression_format(const struct intel_buf *buf)
>   {
>   	switch (buf->bpp) {
> +	case 64:
> +		return 0x7; /* CMF_R16_G16_B16_A16 */
>   	case 32:
>   		if (buf->depth == 30)
>   			return 0x3; /* CMF_R10_G10_B10_A2 */
> @@ -163,6 +165,8 @@ static uint32_t lnl_compression_format(const struct intel_buf *buf)
>   static uint32_t dg2_compression_format(const struct intel_buf *buf)
>   {
>   	switch (buf->bpp) {
> +	case 64:
> +		return 0x5;
>   	case 32:
>   		if (buf->depth == 30)
>   			return 0xc;

