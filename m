Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA0CC5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C9210E3AE;
	Tue, 27 Aug 2024 16:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GjaGDlAE";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A4910E3AE
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:55:53 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so50491695e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724777752; x=1725382552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FY858mX1jtuGYD7F3iG0Z+cOD2JGI4SZnS0wG0PHqf0=;
 b=GjaGDlAEU/gYm7WaKZn2YeTYHbfLz1T7VKKmI0XjQZ78W0lJA8iJn5a8n+CfGa5x8b
 h/tTnYOe6fBvLK96kw7MgLHBe67WFIJJYQX7lWf2iXuf+NGzWZS/6Vaj1AdfujWG0RBP
 8+wbr0ibgcbtzMcyI+4t/Myr9Tc/N3CwD1wYZI78NgDmzWLbASJs1B4OhSMdpiV1Hl7A
 W6Un4wjYsQ7nKlV7uxnfrPnBDtH4kuGFNVh/dN43hLYVyYgLXVwpopxDnyW3mFFBGKmG
 ffPGZaTIhHdLW7hF8507XcsDqz6sMJQ/H2Sc+sD/uY3pfBl2iuA75IVPCiIUsYakYTDs
 07oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724777752; x=1725382552;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FY858mX1jtuGYD7F3iG0Z+cOD2JGI4SZnS0wG0PHqf0=;
 b=ZemM4yuYt+QUx7bBQUyytKfMILQko8vwZ6l63nAgVqZOO4Z/VcpiDkOL/l84oJNcZC
 lhBD20aztp2GsTkO2V/SAVw4Yib5TYVd62R7fAbpvKEYlUifH8LTBIxfUfz2V2yiYNuM
 B7EFe0npIFLTxErb+o3dLLTqeeRN6R8ajFu9GYFbF//toPEn/FmeT+rcCf9jqQf/j3pX
 T2iFCQWYZq8Q1P/ENyi6tIKtg8KACgz/hH7PlFVd5fSBeCqJxZz53v87V6oqklQtSJ/C
 mS2zqrw4Ow7lcKzaHYtc4XhrB8FC7yQUh/3aeFyQ8T8gOb1g+VsRh7BWI9cupMJdPqau
 l6vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/izZm2ruUo69geEK0+dk5ZmjfRi9CIb3z5qxYGswMNdOWMH25diJ+kHQ16UAXBUoGuPiZ3UeI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC0IFCeWOgL6ppblZ/MN3wtBTx0rd/U7qbVmwpu5rAZW6We6ON
 nnYDOTkEsVQ9xfBnbjhPaXenvf/MVbPKW5qu7S4xMLlBjg0RjRmg
X-Google-Smtp-Source: AGHT+IGyxZibccpTGMennup2fPmee0xFpOpJ88XXkIDe6Ndp5HopPJdWebHGiYFp4FduPVqmBq1mRA==
X-Received: by 2002:a05:600c:3c89:b0:427:b995:5bd0 with SMTP id
 5b1f17b1804b1-42acc8ff81emr95779745e9.23.1724777751794; 
 Tue, 27 Aug 2024 09:55:51 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac500e119sm194211425e9.0.2024.08.27.09.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:55:51 -0700 (PDT)
Message-ID: <c55abd24-bb92-440a-8665-7d64f3bb480d@gmail.com>
Date: Tue, 27 Aug 2024 19:55:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 23/37] lib/igt_fb: Fix planar block copy
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-24-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-24-ville.syrjala@linux.intel.com>
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
> The block copy code tries to handle planar formats by blitting
> each color plane separately. But it incorrectly picks some of
> the parameters (size, bpp, etc.) from the first color plane
> instead of the one it's actually copying. Pick the parameters
> from the correct color plane.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index c0b157ee44fa..64be4bffdea8 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2802,7 +2802,8 @@ static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *
>   		       igt_fb_is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
>   		       igt_fb_is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
>   
> -	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
> +	blt_set_geom(blt, stride, 0, 0,
> +		     fb->plane_width[plane], fb->plane_height[plane], 0, 0);
>   	blt->plane_offset = fb->offsets[plane];
>   
>   	return blt;
> @@ -2848,9 +2849,10 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>   	return blt;
>   }
>   
> -static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
> +static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
> +					int color_plane)
>   {
> -	switch (fb->plane_bpp[0]) {
> +	switch (fb->plane_bpp[color_plane]) {
>   	case 8:
>   		return CD_8bit;
>   	case 16:
> @@ -2995,19 +2997,19 @@ static void do_block_copy(const struct igt_fb *src_fb,
>   	igt_assert(src && dst);
>   
>   	blt_copy_init(src_fb->fd, &blt);
> -	blt.color_depth = blt_get_bpp(src_fb);
> +	blt.color_depth = blt_get_bpp(src_fb, i);
>   	blt_set_copy_object(&blt.src, src);
>   	blt_set_copy_object(&blt.dst, dst);
>   
>   	if (blt_uses_extended_block_copy(src_fb->fd)) {
>   		blt_set_object_ext(&ext.src,
>   				   blt_compression_format(&blt, src_fb),
> -				   src_fb->width, src_fb->height,
> +				   src_fb->plane_width[i], src_fb->plane_height[i],
>   				   SURFACE_TYPE_2D);
>   
>   		blt_set_object_ext(&ext.dst,
>   				   blt_compression_format(&blt, dst_fb),
> -				   dst_fb->width, dst_fb->height,
> +				   dst_fb->plane_width[i], dst_fb->plane_height[i],
>   				   SURFACE_TYPE_2D);
>   		pext = &ext;
>   	}

