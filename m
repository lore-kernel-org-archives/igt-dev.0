Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3CFC5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF25E10E0BC;
	Tue, 27 Aug 2024 17:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tkw13ebH";
	dkim-atps=neutral
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B8210E0BC
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:46:14 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-371a6fcd863so3253719f8f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724780773; x=1725385573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7LK5ZixOnf1iiSgZGrMrTPWom4KeqndiQzb+7T4R7Iw=;
 b=Tkw13ebHPfEUIdHGSW+a/fTRhz+NPXBY0EH2YQIBU/eO2reW/dyhwQAMwDTFSxWXCm
 8wlD30iZX8eoLByUIkLmEtXWm+PLwvjm9lM5A/EXHutT1nlSaqam9BZ2Z/K6W1Q8WbUC
 md2DV8JzErZpz90VdLctNWnS1ZDkS6qeBuGB5Eb35JtaSJdLBfPCTJ2c/cHpeKzzl1yD
 aTsJKTta7rKu/9IXwAiRGQdP2LXIUd7W4/4D1fK382UVryK4y+IxNkAdW8fS1XqHJXtq
 R9asruotwIy/R7SqvY3zjQFSUEGpbt9Ha1uK8ykETueieg/a3vgNKp7nLOPgDvYu+Zpc
 2mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724780773; x=1725385573;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7LK5ZixOnf1iiSgZGrMrTPWom4KeqndiQzb+7T4R7Iw=;
 b=W4ALqDxnobbktH1XoetCKk02RiFDQLPM8o37chcRh+7iN1djtZzp14gTCFLzPoZB87
 b7nY17fiFiRBaC+KpscJukcHieyDEukQhjHP+5+Y54qRxvcDHKwM6H+Dw5yNvrF7tZqG
 Nv21N1r9n1Z1m14Vl9EqKQx+m3eF8LKMGSgADUlz6oWcF7Xrkk1KMMYNXABitO+aQou8
 eI765YTkvcaKT4GWMpCTLzSGRsVvErwY3q3GjuDT4vfmW2ooymX264TeZxqklRg3FF/i
 rBIjlzW7B2C2+sUfHZq/u0yXPZQJ5TOWwv2U+QAlr8OPA8g/loruktMB6ZRl0j+FM7h9
 tR2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpsk/9Qn+MNCK6CchGdgxEpmxcfvHH7NCEotx+YKqwYyKlIJWpVqV88N4r1gBHIBjMnZbOEZE5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXRBuu3cHhF9NGxN4AGGY06BITN+0EcRCrOdatUjSOq3Qem8gI
 sCxjSVR12NNYgatEp74GhpHHNRrBiYok83eiAhPyyKjIr+uNf3fNSjTD8pkvbhQ=
X-Google-Smtp-Source: AGHT+IFQ6CCSHlfSH4yCmxc18YyKW4AwnCdCG0la+bhBRdRu1oYaBYYTWxKV67+dDeUVafxvuTVm1g==
X-Received: by 2002:adf:8bd2:0:b0:368:6f30:ddf1 with SMTP id
 ffacd0b85a97d-373118e4003mr8536567f8f.59.1724780772618; 
 Tue, 27 Aug 2024 10:46:12 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3730813c520sm13597457f8f.39.2024.08.27.10.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:46:12 -0700 (PDT)
Message-ID: <fa5200d2-a7a8-4860-b0f0-87c074b43d23@gmail.com>
Date: Tue, 27 Aug 2024 20:46:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 31/37] tests/kms_plane: Skip 10bpc formats with
 media compression
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-32-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-32-ville.syrjala@linux.intel.com>
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

On 3.7.2024 2.28, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The VEBOX just hangs if we try to use a 10bpc format.
> Skip 10bpc with media compression as that would require
> using the VEBOX.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/kms_plane.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 8b6fc1cf6aa4..6b5fb7266ef3 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1011,6 +1011,11 @@ static bool skip_format_mod(data_t *data,
>   	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
>   		return true;
>   
> +	/* VEBOX just hangs with an actual 10bpc format */
> +	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
> +	    igt_reduce_format(format) == DRM_FORMAT_XRGB2101010)
> +		return true;
> +
>   	/* test each format "class" only once in non-extended tests */
>   	if (!data->extended && modifier != DRM_FORMAT_MOD_LINEAR) {
>   		struct format_mod rf = {

