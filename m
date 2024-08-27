Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC54C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1BA10E3C5;
	Tue, 27 Aug 2024 17:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e9mmgbJN";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9D410E3C5
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:10:02 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so47987405e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724778601; x=1725383401; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=N7CkPVUxb8Mlld4TNOzNdTDg2yJPWXksjMLY4aiv108=;
 b=e9mmgbJNiZFndqpVxZRSDaj4IqL2hCnC9yZx4tpQzOJ5xL8hqJMli5VAMCL0VYPuP8
 yPKNMqbD4CArNuALmhXCqsKM0bIDWqj2VKDgER13QFIDDFhcrcduGBUbVqZWTniIO/hc
 5pq7WEJjnYHplsRFbRFkvHQvgPeXO58XmIiEpfMAO2CRk+5QmuicEFLldJVonPIxVeIK
 Uam5KN/LNXGajibh/hQtDpeEqaBi0cz61+YMLJMHX8f+GKMJhR7VlBGgdDDUKYWzWZSX
 C9N31v1ibf34rgTpB7U6XDhicdbAu4BH8UhiMo6kcifEz2mIRTfTrEGo94RUQ1m0HZA5
 FxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724778601; x=1725383401;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N7CkPVUxb8Mlld4TNOzNdTDg2yJPWXksjMLY4aiv108=;
 b=rrERzJMKzYAb3s0+lHTosWDA6aAt4A9ePXGVS4VDrTUAnqjd0S3NmRhIoG5WSWrWT4
 2t3DxswGvkbSsFnat5ZRb/CEfylAjtjUEHKwppdvPe9uB3eLfcb7lXanBxciuCsiE3Qr
 XWsXGQtqWsq9qySZorp3vU1nR5728Cza+p2HVSNJJUDcZ3WH+v+fCtF3b66rVaNYLGLH
 aLKMcUjrvtxWcz77qT5ZEtCaVlNi/x0zDoauOEE8eS9k2N9bEoEt2iDPxmFWHYvsfoyY
 vRBnCc0W7cxwJ0BlHZNwRAcxVnYoqedSqcB4wCPru4RlYXIWSpF9pI77uhNYmoK9HfUj
 d3Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6uogMUtVMeQTngSwY2KGdK9OpZOV4fF1DZBaAKCiVocwRCXampdZ/+aQx1ww7hrO6WNyeOm03@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeXxikhWb/tR5PBu39L//NJT15dxSV4WHmqPFVbsxfPAfRl/zi
 PR3V0N5YMtG2mvRIRGIywKFfVRWcxbh5GgjqC/TTFa90ODGiHHS0
X-Google-Smtp-Source: AGHT+IFvJLyQcog21mBUg9Zbk7/WAGFlAB3Qv2zsJltzP5Bfy/PRDl2S84dlGI5BMHqMuKee1k4Eyg==
X-Received: by 2002:a05:600c:8a1:b0:426:6e86:f82 with SMTP id
 5b1f17b1804b1-42acd57c066mr104342445e9.22.1724778600787; 
 Tue, 27 Aug 2024 10:10:00 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42abefc626fsm230475365e9.31.2024.08.27.10.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:10:00 -0700 (PDT)
Message-ID: <baf9551d-753b-4fab-b1a9-6213af8953dd@gmail.com>
Date: Tue, 27 Aug 2024 20:09:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 26/37] lib/igt_fb: Assert that we have no clear
 color when using the bltter
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-27-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-27-ville.syrjala@linux.intel.com>
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
> The blitter code doesn't know how to deal with the clear color
> currently. There is some preliminary code to simply skip the clear
> color buffer for dg2, but that would just result in bogus rendering
> if we even had to deal with fast cleared stuff.
> 
> Rip out the dg2 stuff, and just assert that we should never get
> here with a clear color modifier.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5a1f3d5d8207..ab04733fef61 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -3027,19 +3027,18 @@ static void blitcopy(const struct igt_fb *dst_fb,
>   	const intel_ctx_t *ictx = NULL;
>   	intel_ctx_t *xe_ctx = NULL;
>   	struct intel_execution_engine2 *e;
> -	/* To ignore CC plane */
> -	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
> -	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
>   	bool is_xe = is_xe_device(dst_fb->fd);
>   
>   	igt_assert_eq(dst_fb->fd, src_fb->fd);
> -	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
> +	igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
> +	igt_assert(!igt_fb_is_gen12_rc_ccs_cc_modifier(src_fb->modifier));
> +	igt_assert(!igt_fb_is_gen12_rc_ccs_cc_modifier(dst_fb->modifier));
>   
>   	setup_context_and_memory_region(dst_fb, &ctx, &ahnd, &mem_region,
>   					&vm, &bb, &bb_size, &ictx,
>   					&exec_queue, &xe_ctx);
>   
> -	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
> +	for (int i = 0; i < dst_fb->num_planes; i++) {
>   		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
>   		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
>   		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);

