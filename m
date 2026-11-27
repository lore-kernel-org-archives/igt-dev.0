Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490E606A697
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 15:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5d3OR4e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F43112B34;
	Fri, 27 Nov 2026 15:04:36 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A13112B34
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 15:03:29 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-386c71feeeaso4725540eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 07:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795791809; x=1796396609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=81FVIqjxM9WJCQi8wQx5QrbiqFVgsS26rqwYy7GZwKE=;
 b=F5d3OR4eUzRBgFfm4+TpXNxPjhA/ziATFeYDb/60ukRQlszcwgB7TINs0MXpFga1XD
 h7DyZSeNBkkJu6rVQFrXLNUOw6JgcSLHhnPKy5pXzdcYkveY+DMbX0IasG5DE5GdGRod
 rVJPBx+RhaDeVhG8CHOBXcBX2wnk8UU6A1r4utz+eTihdKXS7mEo+JA8yUGUBkWTfXO6
 Qf4XobektIFT2IHm0h/BeuYIDjB4G/jaqWfJ4QYhXrT/X0jZYO+lf01WOGHrsT6gucgD
 ngh0okMHgcfg3ZPVbiAFIwgtgS5D0pZ4j/Cjy0PBDLrLBzTNAwwVBd7C90/KuM02Eyu+
 5N5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795791809; x=1796396609;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=81FVIqjxM9WJCQi8wQx5QrbiqFVgsS26rqwYy7GZwKE=;
 b=i2fJc51IuDI3LmYQuiPdWq/mF4UyCm9yY2B064ffGCTmc/N1pF5dWqqzzauQJtqCcl
 b8NZUzBFxoI1n5gHfLAKn02/9sXh3qX46agWxgwWV9rYbCcWy1iLY8ky7zNhE4MmBdhq
 74yKhlt7pUssrAmomWt9sj1CosfMU1GpE6mN+pfV2lircun3S1DzHcj09kSUM03GOrOb
 NZ92y/VCDQDSD8mF3Z/oBKpvd9/plb88KQCYzS033u/t1Ytu3EVDfRRM3f0B/GISeaLs
 kJ2VgFEvtEKoJeVwnlB1riPgkUomnSnvK6WjX9x9TeL25XULvDTEx52JHZLg9q9/w/eB
 POBA==
X-Forwarded-Encrypted: i=1;
 AL+hErGnGWDXvX7cMxu1MBiKrXZEQ+GdLKwkYvAeqPBXVP5GjfxYyZnqGykSYa/D7ysY/m54jdazRYNA@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/kAtkN0scXatSbGdU+RpqH+UUfwe2B+yOiSBk8rFVXKIp2UyW9
 WyHRMHgqziy9cBXRt6wswl4/O5d6LfoucXlRKcjiOSv5W5gtyzwUEkjq
X-Gm-Gg: AZFdTZeBh1mSgZrjOSjEfrRXTcER8L795KoxqBkdmvLYzSRzpCea4BR1kCMu0DCBfP/
 pksL9PZTq8GDAs0sLUIzah9Bj5eNAncBD43wr4Z9GzZPP8ICBQqcBaMrZnz9ZMgM1AJyFGfJNoB
 9mHCAnhCzPgv6XhTzf9+Ug9g1OyGLZ5qvIURCTJ5IcZcmNWXH5DQKFGBHOUhLrsOyxV1TzCyEmk
 i7HaM2K0rmfMAbblpw6lW4tweUAoQtb9AFwE/PAvszWAje1uJERBLvykiKgOke3HlE6+Wu1k72g
 9OsR4StNBr86A6HaclCcBNlXAecyQsb53Qk4OZucDXLQLnLenn6GLzetdQABfBvon8qOhpdDFx6
 EdtSG/w7Sqdala9DsQDIpVW+nXgvSEBr1Fy1UaOlv5K66hWrf94QnbPovcpYrh3AHN7BddFF7GL
 S80QaCSYtQMmR2ZAR5Eqvq0z1w/gL/Bo9m6yOJyecdNOhNCXO87fuEJrWoWQfUxH5IUGdX5aRKl
 HwetffHsrw/2zbZqREO/v+2OXjHS/D4b/3uVOqkSbPkpns653LKfaIQpBlwWT/+KVZdxAZ5n64G
 6/rHF/IC/EpL0a8TAkPyAnngCQojmoW4R6DIZzwh8Ek0jls4iWQsQHIsdETn3Q81ipx/yKTVior
 h+GW+RBEMp8ePd4664w==
X-Received: by 2002:a05:7300:bf11:b0:36a:15cb:30bf with SMTP id
 5a478bee46e88-3856fe5971amr26281972eec.13.1795791808652; 
 Fri, 27 Nov 2026 07:03:28 -0800 (PST)
Received: from [192.55.55.46] ([192.55.55.46])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55681301asm57869582c88.8.2026.11.27.07.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2026 07:03:28 -0800 (PST)
Message-ID: <97a2e9a8-5be6-44fb-a78b-26639a16782f@gmail.com>
Date: Fri, 27 Nov 2026 17:03:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/kms_universal_plane: remove redundant
 is_intel_device() check
To: Luca Coelho <luciano.coelho@intel.com>, igt-dev@lists.freedesktop.org
References: <20261126093003.492469-1-luciano.coelho@intel.com>
 <20261126093003.492469-2-luciano.coelho@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261126093003.492469-2-luciano.coelho@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

look ok
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 26/11/2026 10.48, Luca Coelho wrote:
> cursor_leak_test_crtc() already calls igt_require_intel() at the
> start, so the is_intel_device() check before the vblank wait is
> always true.  Remove it.
> 
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>   tests/kms_universal_plane.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index ec2d070acddc..b01fb3d756f7 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -716,9 +716,7 @@ cursor_leak_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   	 * Therefore add 2 vblank wait to ensure that all cursor-related
>   	 * framebuffers can be removed before counting the framebuffer.
>   	 */
> -	if (is_intel_device(display->drm_fd))
> -		igt_wait_for_vblank_count(crtc,
> -					  2);
> +	igt_wait_for_vblank_count(crtc, 2);
>   
>   	/* We should be back to the same framebuffer count as when we started */
>   	count2 = intel_gem_fb_count(data);

