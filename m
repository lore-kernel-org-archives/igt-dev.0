Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AFBCD5BD2
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 09:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BED10FBB4;
	Fri, 29 May 2026 09:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J39BArr5";
	dkim-atps=neutral
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FA410FBB3
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 09:22:42 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-3045c195251so7604517eec.1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780046562; x=1780651362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Of6Pqqxo1Hu7GbnRtutO9exnEx6QgeVzE0tgsBftj7k=;
 b=J39BArr5iyuMURarCQiW2jKzUrMZ5oZGuigNubXie09Z0bMJmVu8VhXcpl5N2Xr0lQ
 zgxwLRlDsaIuQCbEobDq2mrcLJP0UcdBtZrexEkJgaGLKq4SoKexWAmDSY9clkMak0yr
 SCIRanS90yarE7scnFpn3a/8U3a1A/N1GH5h63VK54oTtH9ZZZ22Bfr0BQ6/70Bj2Klm
 MfxEIFaTlcx/vNvnpkrR1zof0O4bF2ms42lGbZLENumRDVDlzMW0iKodvgVuBTInyqsy
 /XY5KV5iO4n0nYUGmT+/Z/mI7IFP/Y97shr6EaakoUt/cANm0q7m/MPMshiLgsqq+ozF
 Ir3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780046562; x=1780651362;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Of6Pqqxo1Hu7GbnRtutO9exnEx6QgeVzE0tgsBftj7k=;
 b=hd5ktbJqjAKuo46j4S7coqVjlOfP6WapOkScyaq7D6Mq1tNuWH2esAgKnYRaRWj9KD
 T5DFUQxvJbu0HPXck6PQ8I9KZrUEhLdz77R67anCZXxrbW365tbR7EpG1ajHvjgdTT4K
 4628idLRk2BANgJaQoNnyeGhfOnHjT2xR9cn5PNuu5zuvtOhxvW4t59gXD3eKh87uqcu
 IxtHkFPWYN7aa2L1MPGWEDb2cHg4GStvk4u+OJEDoAtUN9OdV1CrpPB2G5AmhnL3uipl
 5IqqngYRNn+AitNA+9FC/uRQoSu2h5MS1IuQVE7Juo/DPXPgolkaha5MAQfk/B4fEZhp
 mJUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Ja4YvlNURjuBl17oG9caes8NyrqCfF9tO7pho8yqa6sdSVtZkh59sBqFvAasm4WenHVS5c5Dh@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz68ZPw5NwYmK5RWhyRxTuflSfu77vYzfOTDZjqAuI6+Ok6RRjG
 ip/M4dX6NmAvIS+62DQTUbBE4zWltX/srr6QAvstorPUdxysuaIfRjUxnrPdyTY9
X-Gm-Gg: Acq92OFzaWoJTq1EZ7eU5XHS7IGSgHOqqodz6wV+bA1vNg5DP1k5/+0jRBJ6JoE6pVu
 ZtQoysbPfhe97ZlV6ljlvoRBEcFYm+mey+ARBCUarwcy/FbNLGepYHyapEDSBlsTq0zXSzM+om7
 zgXla4tnSIqS4izuvKEED92fxJ6rLb2T0jrPzGyyxKG2Xz2dK4iGKfabMRvYPawCuvKpUKi11b7
 1YzVe/oR+iqwrb420WR7wagqpgVydzSOAIjYTMq67wQduHhsrF00xxW04lwTBLoK1XSh3KohPYx
 4mnV/fuSzcV2ecoLNPovcvHQXthGeua8NLgHv+ZtbRwBzHV8tnk/da/Dvf/ZJWE20EToYx8T+qU
 n1pl6HahpqiPOXNFGO2KluKEtlWBlIp3FLnmKHk8bKIeY8Gj5K0WfaTPybBcGQaIyo/16OCgWD9
 JYE4aYOTIpMYStXheQszF3zCKs3FZA8vNR7I/r6FlrF2G6hVqc89v5+2LshjOuDXbNJtpYg8tkk
 s36
X-Received: by 2002:a05:7300:a483:b0:304:2cc9:2ba8 with SMTP id
 5a478bee46e88-304eb21755dmr942714eec.30.1780046561667; 
 Fri, 29 May 2026 02:22:41 -0700 (PDT)
Received: from [192.55.54.47] ([192.55.54.47])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2eb24fsm918917eec.7.2026.05.29.02.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 02:22:41 -0700 (PDT)
Message-ID: <b16d9f1b-068e-4331-9dc9-88d65dd70ae6@gmail.com>
Date: Fri, 29 May 2026 12:22:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 04/25] lib/kms: Pass struct igt_format_mods to
 igt_parse_format_mod_blob()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-5-ville.syrjala@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 12/05/2026 15.21, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Pass the entire format_mods struct to igt_parse_format_mod_blob()
> instead of of the individual pieces. Not as messy and fragile as
> the current approach.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b60bfa033bcd..6b42c50e9273 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6183,34 +6183,36 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
>   }
>   
>   static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blob_data,
> -				      uint32_t **formats, uint64_t **modifiers, int *count)
> +				      struct igt_format_mods *format_mods)
>   {
>   	const struct drm_format_modifier *m = modifiers_ptr(blob_data);
>   	const uint32_t *f = formats_ptr(blob_data);
>   	int idx = 0;
>   
> -	*count = igt_count_plane_format_mod(blob_data);
> -	if (*count == 0)
> +	format_mods->count = igt_count_plane_format_mod(blob_data);
> +	if (format_mods->count == 0)
>   		return;
>   
> -	*formats = calloc(*count, sizeof((*formats)[0]));
> -	igt_assert(*formats);
> -	*modifiers = calloc(*count, sizeof((*modifiers)[0]));
> -	igt_assert(*modifiers);
> +	format_mods->formats = calloc(format_mods->count,
> +				       sizeof((format_mods->formats)[0]));
> +	igt_assert(format_mods->formats);
> +	format_mods->modifiers = calloc(format_mods->count,
> +					 sizeof((format_mods->modifiers)[0]));
> +	igt_assert(format_mods->modifiers);
>   
>   	for (int i = 0; i < blob_data->count_modifiers; i++) {
>   		for (int j = 0; j < 64; j++) {
>   			if (!(m[i].formats & (1ULL << j)))
>   				continue;
>   
> -			(*formats)[idx] = f[m[i].offset + j];
> -			(*modifiers)[idx] = m[i].modifier;
> +			format_mods->formats[idx] = f[m[i].offset + j];
> +			format_mods->modifiers[idx] = m[i].modifier;
>   			idx++;
> -			igt_assert_lte(idx, *count);
> +			igt_assert_lte(idx, format_mods->count);
>   		}
>   	}
>   
> -	igt_assert_eq(idx, *count);
> +	igt_assert_eq(idx, format_mods->count);
>   }
>   
>   static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
> @@ -6249,7 +6251,7 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   		return;
>   
>   	blob_data = (const struct drm_format_modifier_blob *)blob->data;
> -	igt_parse_format_mod_blob(blob_data, &plane->format_mods.formats, &plane->format_mods.modifiers, &plane->format_mods.count);
> +	igt_parse_format_mod_blob(blob_data, &plane->format_mods);
>   	drmModeFreePropertyBlob(blob);
>   
>   	if (igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
> @@ -6259,7 +6261,7 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   			return;
>   
>   		blob_data = (const struct drm_format_modifier_blob *)blob->data;
> -		igt_parse_format_mod_blob(blob_data, &plane->format_mods_async.formats, &plane->format_mods_async.modifiers, &plane->format_mods_async.count);
> +		igt_parse_format_mod_blob(blob_data, &plane->format_mods_async);
>   		drmModeFreePropertyBlob(blob);
>   	}
>   }

