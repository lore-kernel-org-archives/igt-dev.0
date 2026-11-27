Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF28606A338
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S8hTbj/8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDB1112B84;
	Fri, 27 Nov 2026 15:06:29 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2971112B7D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 15:04:23 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-33bf40b0c8bso17425832eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 07:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795791863; x=1796396663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fImMTp8w3g3+lBvKMaVVJ9LhcuJUoyV2JmY4xKgBDq4=;
 b=S8hTbj/8BH+LGJLAuPlhlsuhYGKkCSXXjIa/+VGUk8csT+mE7z2XKKsYHn5N5ImAJ1
 71Fpa84/v2beroUNk5e30MEYPTYapZLwdzUGt4fIXibvaaZlOaurGwxIBlBBXhY6MdCA
 E2slgiVn0j9hWdx9bXKMW9HkhZj4dXVTLpdbeLNTvAZF5Xpdvxsfjl+h9CiCo2dnjWyZ
 /3bPwRth3pzZwPK/2lUDTAXCFdGbXS5ztWLBHy8E9aMasmXm87dqqPfS4AktnHT84cCc
 G/LxetkrRHhc/nyWAAbjrk8C4AQ4D8XuPA55exrBJ52kkQN+9ZQFIQq7rv4oejRheA7z
 omyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795791863; x=1796396663;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fImMTp8w3g3+lBvKMaVVJ9LhcuJUoyV2JmY4xKgBDq4=;
 b=bLawcg/extGEQz1cNCUvocGdTbTDImAD1/sLr63ekHgXBv6nEELdR7dIEEHdpxVTC4
 fBHO9FwmTOpLJBmws0lkcu0Bq8OBDcKPmHAd9ZRU491AdAfuTeZrUF28ulcwUESon0K4
 jdUBna/p8ArsluWJ9I0s8xcwqdGF6eZQnKyJYxF+doP7O2EXiCPd1vNHL/5uKcuvsGM5
 e3NXuu1EdCsbbC13bMymIfCW2Ht4wbRlljR7HfPsOk4iCLkNtHNkJpeNfb9NWvHOw6WF
 hzi932SHsR02NFpsM4+vbk5ElGcoQCQqHYWfvU87VYXIsPiD6eD1giBU8YQ5O+JvCDBv
 q5qw==
X-Forwarded-Encrypted: i=1;
 AL+hErG1rpKeQfHzrxL5J+uEeoEFwriMmaKe9N3o6Z73HJBMB+MAo8ggt1p94mCmdJ0baFgkRO8ZnChp@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/hVeqYZWpBfGQ7cJ0fDioxBkcUv0+gbA6S//5M4fRwxn8Dw9lh
 6FSPxD7MrMpRG+3wCbSU1sLDhWlZDSQaYN+x+JkY6oT5h/bj4IrR+bSs
X-Gm-Gg: AZFdTZe3jjMMpZdhgGMbu69F/2rk/e3I0z5oij/7PFNhn0iWMvwOdTnbwd9MOknn1T1
 e+a8h7s5/UEnblrSxlkU7gRD+xaj3PWh2gvFksOCmVmyHUETF5xnregNxS+eYe6Qkx/HIEZLUCu
 /QqBdqH+usNa3XYzdCRitqOBn0Wza+6wFpULhRpx/hEn1q6K+1BOJMiVLhUBJSkIlGJtq0zYytc
 Nf20M9krm6Fp7DEDGFkPHwsKmsrZZFiyOfTCPiG+HpVeBwDjhuePi/BSHePSNQgoBa2reS7nWBp
 3dOFpl/z1hokQcSsysDnaUEy6o8bXgNcPkymHbH7wSMU1qm80CWomgxV6KhEXn0cawPJvR0A4Z7
 iyRuvlqnGT0xUFgmNWwIGXi6Yf7Rrnd9hRCkwPQ4ZicwD6XT5dIPDmORS88Y8n9PSbuj6BSqI9t
 ZGvV3dKgb9MUCexZYwjtNeRJ7rfsJyd22NxUdldlyS2Ss4P83pe6+DH03+ysBGIRNOSfrBdisFE
 EkNqKZel/aTGmxWdboeqfcXvX9zj/z4ryDIPdtwNreGschUTr4tD5a+8RDNFn9qIeVV3BTvK8DH
 n+01hrXM1xeoYswC2UjYknwx7lTtqVtabwMCC1DUyzm21Zus5arTkYWXTkijmuoR8pJph1qz
X-Received: by 2002:a05:7300:5994:b0:386:a915:8b97 with SMTP id
 5a478bee46e88-386a9158dcamr21348933eec.27.1795791862907; 
 Fri, 27 Nov 2026 07:04:22 -0800 (PST)
Received: from [192.55.55.46] ([192.55.55.46])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-38567daaf70sm75147753eec.28.2026.11.27.07.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2026 07:04:22 -0800 (PST)
Message-ID: <4dabc04c-efde-4265-85fb-ebc75f2d2bc0@gmail.com>
Date: Fri, 27 Nov 2026 17:04:19 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_universal_plane: count FBs after the
 first commit
To: Luca Coelho <luciano.coelho@intel.com>, igt-dev@lists.freedesktop.org
References: <20261126093003.492469-1-luciano.coelho@intel.com>
 <20261126093003.492469-4-luciano.coelho@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261126093003.492469-4-luciano.coelho@intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 26/11/2026 10.48, Luca Coelho wrote:
> cursor_leak_test_crtc() counts the framebuffers before creating its
> own FBs and again after releasing them, and expects the same number.
> If an earlier test left an FB on screen, for instance because
> kms_cursor_crc failed before cleaning up, that FB is included in the
> first count but our first commit releases it.  The second count is
> then one lower and the test fails the count1 == count2 assertion,
> even though nothing leaked.
> 
> Take the first count after the first commit instead, after waiting
> for the same 2 vblanks as before the second count so that the old FB
> is really gone, and subtract our own FBs, which already exist at that
> point.
> 
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>   tests/kms_universal_plane.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index b01fb3d756f7..291e4a6e3422 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -650,9 +650,6 @@ cursor_leak_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   	igt_output_set_crtc(output, crtc);
>   	mode = igt_output_get_mode(output);
>   
> -	/* Count GEM framebuffers before creating our cursor FB's */
> -	count1 = intel_gem_fb_count(data);
> -
>   	/* Black background FB */
>   	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>   			    DRM_FORMAT_XRGB8888,
> @@ -684,6 +681,14 @@ cursor_leak_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   	igt_plane_set_fb(primary, &background_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
>   
> +	/*
> +	 * Count after our first commit, which releases FBs left by earlier
> +	 * tests, and don't count our own FBs.  This assumes one line per FB
> +	 * in the debugfs file, since intel_gem_fb_count() counts the lines.
> +	 */
> +	igt_wait_for_vblank_count(crtc, 2);
> +	count1 = intel_gem_fb_count(data) - (ARRAY_SIZE(cursor_fb) + 1);
> +
>   	igt_plane_set_position(cursor, 100, 100);
>   
>   	/*

