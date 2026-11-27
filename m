Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44965606A321
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 15:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9nIK66i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2942112B34;
	Fri, 27 Nov 2026 15:05:31 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03F6112B34
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 15:03:54 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-38699cf08dfso10331135eec.1
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 07:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795791834; x=1796396634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jUyqf200CrIpGz+1nDQzLVNJfgDu0z+WTdn1fnqW0CA=;
 b=F9nIK66in0XfH3C1Iz75hE0eG0vdNYC5J19TTENGsP/GdMVtFMp0YkVtpYwD8wIQhs
 hofDAEmHkFVJNjaDDewnun1oMyfr1HBpDljKINR0UD0IWgjhOcxUmEnm8Y08jYIcOWpP
 +NrS9e9gqAhn+0kSOL/niZJijVzJYRYVZ9KaXUO2GXB8lv7JlS1TNrASNn/xXDGA8QNM
 r6FtsrNFSv7HiWxQ1dfRRvSNMVtAs4EylXcIqohgl+t5BuPkMNizPnen/5BmPNMF7GkE
 QxsUxTqdpBnaAZn1yhFr478JC/9GS0Hw4os8QaISxJOee+PlClqPmBUU5Arq92UEV0Fg
 /fiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795791834; x=1796396634;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jUyqf200CrIpGz+1nDQzLVNJfgDu0z+WTdn1fnqW0CA=;
 b=HVIj+UjYq5mxThGIuBru4wD18oqM0nSrCkCIN4vuKLQq96AaaaSN7BeFEz80LluGp6
 bQGf5rxHz5Y/oyQyuh7CflRN1gZCmK3t0FKJfHX0yrAHJ4OT6WKQPLwk+hkwp8XPHox9
 KMYTzYiazni7ewPmDI3il+PpOoDLx0DV7vdTGG9YOwRUMjhMST4ePAVMaAwuxRe+VEs1
 2aik6x9GTGbuaki6Dhywn12L7mo9DDf5ndd+H1Lwt8nPi3cr9+TFyVrSi+i/1MF+F28I
 3CMz2PqLySrqTX5PDkAwkTyFqXChbV5yLaKdibEejEutMXfqSbX7hDQdiTJiY7qqDvC8
 Rczg==
X-Forwarded-Encrypted: i=1;
 AL+hErH2vYbcEyKz/zVkkAd6XzJx7jJ5VBxJlGs44TyDFGcW+jRCpWfsSsX5B92a8Rla69/+bENYk5u+@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+Fx0FCP9YsdV72UJeK3EHijUB6lmW/7gYc9vDlt8ea/ARNOCEn
 dTx1rLehAFDL/fSnMbSXfvxQLcbluN6rjORa296xeZy3XM0gw1JyAmQj
X-Gm-Gg: AZFdTZetIiySdBoQXfpSt/usvXKaN+L94+NVLcPk3j2osx4anGYM/4+ss+BpbcVBn9d
 jQAKJ6UdS4umk8nnPljbrWQnnEPv9FJgPT4JsAC8k7q1ed7qrMzsRNKqGYfZNVl1Rork1lmgZZv
 KzzqXPxcX3A0g5pVWgtKUNyWM0kRRRZEVuh5g1BWmvYTcx6x8uTVNc6B4kuK1hOUkflYKNTMIuL
 qHbA3zBLlFOubIbL17PbxGpeDwiimNMlhoC1fG+BEq1AauCiHGYbbM72gNjMRwURj7vd+l04EhA
 eKUVZdFY91dH/bSJPOcczjAFSuhuOy7O0huoHf7wAiPrSdiiX7+tJOGLWPPwwaR3DiRr0Dwm8Ps
 mXAVtOsQ1+y6vLODg+X+xEwAAvQ+bJxWC6RuzvpI7lY4rI4cpjCrBcDFGL2y8iI7Bw6HN/hIYeX
 qvmjnOUqS3cB3zF29u5yL1rVTj/K2qSDKN17VpuR4v8PJmzRpclFzdt/Qpvh/y/wb0+WGQV0+Sj
 7yQtQwhaqd2Jz5nwU2sfYoVCNsTd8tIc4Mm2hnWY1wwprsq3zJHDqqKQdmCPFCCvl6z/xnO/E4w
 14YpFcK6imrtnrXlwOJ6LsP+uXFFuRVPyXftnof9drgfQ45pVqEwHIX314ffWhvGQbzaefxH
X-Received: by 2002:a05:7300:d509:b0:385:ac93:91f4 with SMTP id
 5a478bee46e88-385ac939fc3mr31037762eec.26.1795791833869; 
 Fri, 27 Nov 2026 07:03:53 -0800 (PST)
Received: from [192.55.55.46] ([192.55.55.46])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-38566cd4efesm76569475eec.12.2026.11.27.07.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2026 07:03:53 -0800 (PST)
Message-ID: <acf5a98e-a45d-4fe1-920f-285620f53a20@gmail.com>
Date: Fri, 27 Nov 2026 17:03:50 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/kms_cursor_crc: clean up after a failed
 subtest
To: Luca Coelho <luciano.coelho@intel.com>, igt-dev@lists.freedesktop.org
References: <20261126093003.492469-1-luciano.coelho@intel.com>
 <20261126093003.492469-3-luciano.coelho@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261126093003.492469-3-luciano.coelho@intel.com>
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
> When a subtest fails, for instance on a CRC mismatch, it exits
> before calling cleanup_crtc().  The cursor and its FB are then still
> on screen when the test ends, so the next test that counts
> framebuffers, such as kms_universal_plane@cursor-fb-leak, finds one
> FB more at the start than at the end.
> 
> To fix this, call cleanup_crtc() from prepare_crtc() and at the end of
> the test if pipe_crc is still set, because that means the previous
> subtest didn't clean up.  Also use igt_display_reset() in
> cleanup_crtc(), so the cursor plane is reset as well and not only the
> output and the primary plane.  The igt_pipe_crc_free() in
> prepare_crtc() is unnecessary now, since cleanup_crtc() already frees
> the CRC.
> 
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>   tests/kms_cursor_crc.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 6334f8f775c8..a060f8e24f6d 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -565,8 +565,8 @@ static void cleanup_crtc(data_t *data)
>   	cairo_surface_destroy(data->surface);
>   	data->surface = NULL;
>   
> -	igt_output_set_crtc(data->output, NULL);
> -	igt_plane_set_fb(data->primary, NULL);
> +	/* Reset all planes, so the cursor FB doesn't stay attached */
> +	igt_display_reset(display);
>   	igt_display_commit(display);
>   
>   	igt_remove_fb(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
> @@ -581,6 +581,10 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
>   	cairo_t *cr;
>   	igt_output_t *output = data->output;
>   
> +	/* Clean up after a failed subtest */
> +	if (data->pipe_crc)
> +		cleanup_crtc(data);
> +
>   	igt_display_reset(display);
>   
>   	/* select the pipe we want to use */
> @@ -609,8 +613,6 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
>   	igt_display_commit(display);
>   
>   	/* create the pipe_crc object for this pipe */
> -	if (data->pipe_crc)
> -		igt_pipe_crc_free(data->pipe_crc);
>   	data->pipe_crc = igt_crtc_crc_new(data->crtc,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
> @@ -1321,10 +1323,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		run_tests_on_pipe(&data);
>   
>   	igt_fixture() {
> -		if (data.pipe_crc != NULL) {
> -			igt_pipe_crc_stop(data.pipe_crc);
> -			igt_pipe_crc_free(data.pipe_crc);
> -		}
> +		if (data.pipe_crc)
> +			cleanup_crtc(&data);
>   
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);

