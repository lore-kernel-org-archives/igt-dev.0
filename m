Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F41C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC4210E3DB;
	Tue, 27 Aug 2024 17:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cLp97MUR";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F7E10E3DB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:39:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42ab97465c8so49809935e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724780366; x=1725385166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vYVPttO6oGL+g75Q4HZuPO32b4VsObm0kIYkup2VqRM=;
 b=cLp97MURKehM7DbT4OsVmQ5us2ejBEpIiC9UyOgcz4PrI+bhb0Vy5xU+xWololW10n
 kZ1eoc6wKzLWOe61wlArjUmDObDGCFm33ErnqcbuSOjRi+vTRO3ZBrJNkAZmzdmASEEt
 eNAkfw+HHfaOrEqDBgCPIPQizsTc+fP5j5cYgIfIup43XMQtqVuUGG+kf/PRlcvDhH6U
 RpspmqO4Wo9NxasAIL6xP8d3PnB2ah188OylYq4wuNf3S6hBrF/D40VIJ1Xhm4LxVHud
 GlXNRmwe5aNVDMLZow+SABUXwrESpW4o5+GgzhOcmsupC2JeLDDNWrCoHUjiShqn1N+6
 hjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724780366; x=1725385166;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vYVPttO6oGL+g75Q4HZuPO32b4VsObm0kIYkup2VqRM=;
 b=OK50XIjk7NTwAfvHRhBoN84ojCMzQ8Jzh1NrirRKGA5XEa+iVnkINvdWp8yG0/HRQ3
 8JDVHHBOQHtouQvDvdgOe955MYxoapoPvrXiDLjpX/bpMu2nU0ww0t/Tk9JIYkUVVb3f
 pfGbUDkiKng5bXR4v2WdFFpgd50cMd7Vpdza0duq6zwifrKxjM//dAyupGbP4SkI1Z3J
 nKDwMnyv+fUuzxlGwJrOp8hQ/HX4cbxNqjk7ZgwCN1F/GfoHAvhlfhat2AybzUckf8ey
 3/cq5yba2/HEY1DXG0XQDY1y3Whm3aGARonF+lfkJG5p+vqqO2TkSyy+uYNfSPyH6BT+
 KUSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAOcl5f/rztAV2vOE8ufmomTUYxOP6OGrtAziX5Le68aZ3v+nSweW2JOnOYLZPh/A+evUTYEA3@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv7K4E8sf97kslTz6zJRyI6zmIWulKjJVKA4TuTwz5RSHzOcLz
 VKrTk9upqDQBUKXhE28KQAc2AzyTNJnAJQ90jwYKIhiytoF4XA2uivkN2Txwntc=
X-Google-Smtp-Source: AGHT+IGDIi+aHLircEczDDBkPTVqtwSvgSEynO+Cyc922mHH0M41y1DqEWobuggBZ5n0SWpkjeAKdw==
X-Received: by 2002:a05:600c:35c6:b0:426:6667:5c42 with SMTP id
 5b1f17b1804b1-42acc8d494fmr101592525e9.4.1724780365692; 
 Tue, 27 Aug 2024 10:39:25 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac517f9basm191419055e9.39.2024.08.27.10.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:39:25 -0700 (PDT)
Message-ID: <219f7f3b-ac5e-4863-8a6f-88c1dd75244e@gmail.com>
Date: Tue, 27 Aug 2024 20:39:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 28/37] lib/vebox: Add 10bpc support
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-29-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-29-ville.syrjala@linux.intel.com>
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

I don't see this being fixed anywhere as supported list seems unknown.

/Juha-Pekka

On 3.7.2024 2.28, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add specific 10bpc support for VEBOX.
> 
> FIXME: This just hangs the VEBOX :(
>         Bspec did have some notes that this is only
>         supported for IECP on earlier platforms, but
>         that restriction is no longer listed for more modern
>         stuff, but maybe it's still there?
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/veboxcopy_gen12.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
> index af52a96578d9..fedefb0842a2 100644
> --- a/lib/veboxcopy_gen12.c
> +++ b/lib/veboxcopy_gen12.c
> @@ -29,6 +29,7 @@
>   #define YCRCB_NORMAL	0
>   #define PLANAR_420_8	4
>   #define PACKED_444A_8	5
> +#define R10G10B10A2_UNORM	7
>   #define R8G8B8A8_UNORM	8
>   #define PACKED_444_16	9
>   #define PLANAR_420_16	12
> @@ -168,6 +169,8 @@ static uint32_t compression_format(int format, struct intel_buf *buf)
>   	switch (format) {
>   	case R16G16B16A16:
>   		return 0x1;
> +	case R10G10B10A2_UNORM:
> +		return 0xe;
>   	case R8G8B8A8_UNORM:
>   		return 0xa;
>   	case PLANAR_420_8:
> @@ -344,7 +347,8 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
>   	case 32:
>   		igt_assert(!src->format_is_yuv_semiplanar);
>   		format = src->format_is_yuv ? PACKED_444A_8 :
> -					      R8G8B8A8_UNORM;
> +			 src->depth == 30 ? R10G10B10A2_UNORM :
> +					    R8G8B8A8_UNORM;
>   		break;
>   	case 64:
>   		igt_assert(!src->format_is_yuv_semiplanar);

