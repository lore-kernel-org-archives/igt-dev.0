Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66963606A320
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG4JBCn3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C2210E151;
	Tue, 10 Nov 2026 19:50:22 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C04210E151
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 19:49:17 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3b12cb3c37bso1272249a91.2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 11:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794340157; x=1794944957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YDY/iyeaEn3SVEmJ0YWU7e/A4W9A98AXEyaRxhC7zbg=;
 b=AG4JBCn3LCz3ZC6hKmPvtXLgzV9Hb94X2QnWyCCqMbf/+mMvLwokzXNlYsYnif8NPF
 mKJvP0MWpX6DjDgJckuEy1DnYQC5WJJ2cMzF7nMgFsvOqtwxpTnJ4IXOmuMpdTPWX7yl
 njxU2ZPxt42Z6HZBPxEF2F2sDM2A+GPmhqMt3Yz6WiavBylz0jx51HJTX7PtuLw6j6sd
 BYa/DDnITR8r8qx3IF7VXE9IYtaRQ++7UvOcrQXV2IUnmu1LVOqrovfwg4+Jd+Jy3HGl
 fLgBHmcZaJ4aorVhFUPnkh/odAms3vUweGMONOz63xWA+CsOqdbi1CaM5HbsKVcotVt3
 vXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794340157; x=1794944957;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YDY/iyeaEn3SVEmJ0YWU7e/A4W9A98AXEyaRxhC7zbg=;
 b=BlIylIR+rd/Y90H9XP8HuBgBWCEeCtRYXxo/6XNHworbevK9SP8rSehD/skEP/6QUL
 dkADHSE4ai+cHQPWtAmcIQBRSle9yJGgb4R94OZ6Uv03tia5RhmAdQx0MIhcLa190vJE
 QNJRlvotTyOQP6JmC/f0j23dcdfpVy5dSNNhFq+nv0Ailzx2+tvNQvby7cNfCIUb3syG
 y99I9u/0fiWI8N3iL6OElwPT66WwBPFa3XMGM4nDEgR+bAvEnZiThclQQi/rYQlIFL4t
 q9wY3Oh4kAD5WvNKjpvQfeDPPINB94XliZMT4ApDd5f/muGtfSKWlhAKHDXdmtWlWooD
 4W6w==
X-Forwarded-Encrypted: i=1;
 AL+hErFdNW1dpl8VEIz3dVjsLGACO3g6xNCQlBarMnB+V5Vu/ZK9n6VLRsUNBfMORz5uPmDiocu0MQ04@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+RYeRI1pr7hO8LnTcdmgt6F71+LHLXVMwHg4KwIAv/6hdshSET
 69HIUF54lL3+gQ72A5OR17p0OTfOn9Vd0NuBZ3cpDueUIDDB32c4sxd2
X-Gm-Gg: AYBFou1dJpdwpC5txnd+0WZ5LfQKE5xqwIqXnly3byFbPLPz60b8U9KM0e4UhSUaFdW
 z0AQDyNxKaMtAs9yaV0x2Xc155dfJh51oqmzXy00DLG0UO6tLj9C0aJ+l55sSTs4YVnWcYt149V
 97Ejz+VPc4bv7mta8YqGwelLeq0ASHLi0yjmKfE/hSLDEuPYFnbdjN++mM3C1+p7yc9s5vEsC8G
 o6cs2Xd4NHmJNIYOJQbJC3CuiYY/+gJg58LuJAIWJF9djdpYwn3GvLlTAL0PRlL9p/SWpPWQzfS
 NJMP4Jwg/JKtQoFz3A1RqrR+AP4OdoqHzQW8zVi+/3th3nwUtWV+5+uVy+456D/M+JFghAGLLSt
 AopnU9nrZQD+LaDkjAAZV7XI+X1PRJWHU0JhEWzXED1ETLDG6F4eIb1pIkK5AJrLkYu+20GUrUi
 Or2MkZ8XXvGdBZIwKjk+vu6qZsFd1b2wCSskO9YdPTTSE2ZUsIZibCrEtWNry0Y5ybNhyClxjRf
 0fRWASeprV1cdybWc+bAU34isSUjwriPZ7DRrR7axBzLWEyD6qdmgMSl3C1S/KIVfQ3o7PT8Q4K
 vHY+bZesM2Y5MFBfCi2YyAARg/IAmQjyDXwCVEJ22HrzVf5cN7r4S0X5cW9TeApT/zR16x1buNM
 8
X-Received: by 2002:a17:90b:3c8f:b0:3a4:ba6e:65c9 with SMTP id
 98e67ed59e1d1-3b166d34af5mr3353659a91.59.1794340156636; 
 Tue, 10 Nov 2026 11:49:16 -0800 (PST)
Received: from [134.134.137.74] ([134.134.137.74])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b17e1fd5bfsm932540a91.13.2026.11.10.11.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 11:49:16 -0800 (PST)
Message-ID: <67597ea8-fdac-4223-893b-2ccd891a9439@gmail.com>
Date: Tue, 10 Nov 2026 21:49:11 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 1/9] tests/kms_async_flips: split outer test loop
 into two
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
References: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
 <20261106180849.156578-2-michal.grzelak@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261106180849.156578-2-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

look ok to me

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 06/11/2026 20.08, Michał Grzelak wrote:
> for_each_crtc_with_valid_output() iterates over every crtc with
> connected output. Split it into two loops. This is needed to handle
> cases per output.
> 
> v3->v4
> - break outer loop as well (Thasleem)
> - add missing space (Thasleem)
> 
> Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> ---
>   tests/kms_async_flips.c | 63 ++++++++++++++++++++++-------------------
>   1 file changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index ef4b28eb52..8884efd8ba 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -877,39 +877,44 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   	if (data->atomic_path)
>   		require_atomic_async_cap(data);
>   
> -	for_each_crtc_with_valid_output(display, crtc, data->output) {
> -		data->crtc = crtc;
> -		igt_display_reset(display);
> +	for_each_connected_output(display, data->output) {
> +		for_each_crtc(&data->display, crtc) {
> +			if (!igt_crtc_connector_valid(crtc, data->output))
> +				continue;
>   
> -		igt_output_set_crtc(data->output,
> -				    crtc);
> -		if (!intel_pipe_output_combo_valid(display))
> -			continue;
> +			data->crtc = crtc;
> +			igt_display_reset(display);
>   
> -		test_init(data);
> +			igt_output_set_crtc(data->output,
> +					    crtc);
> +			if (!intel_pipe_output_combo_valid(display))
> +				continue;
>   
> -		if (data->linear_modifier)
> -			data->modifier = DRM_FORMAT_MOD_LINEAR;
> -		else
> -			data->modifier = default_modifier(data);
> -
> -		igt_require(igt_format_mods_has_modifier(&data->plane->format_mods_async,
> -							 data->modifier));
> -
> -		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> -			      data->output->name) {
> -			/*
> -			 * FIXME: joiner+async flip is busted currently in KMD.
> -			 * Remove this check once the issues are fixed in KMD.
> -			 */
> -			igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
> -				      "Skipping, async flip not supported on joiner mode\n");
> -			test_init_fbs(data);
> -			test(data);
> +			test_init(data);
> +
> +			if (data->linear_modifier)
> +				data->modifier = DRM_FORMAT_MOD_LINEAR;
> +			else
> +				data->modifier = default_modifier(data);
> +
> +			igt_require(igt_format_mods_has_modifier(&data->plane->format_mods_async,
> +								 data->modifier));
> +
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      data->output->name) {
> +				/*
> +				 * FIXME: joiner+async flip is busted currently in KMD.
> +				 * Remove this check once the issues are fixed in KMD.
> +				 */
> +				igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
> +					      "Skipping, async flip not supported on joiner mode\n");
> +				test_init_fbs(data);
> +				test(data);
> +			}
> +			/* Restrict to single pipe in simulation */
> +			if (data->single_pipe)
> +				return;
>   		}
> -		/* Restrict to single pipe in simulation */
> -		if (data->single_pipe)
> -			break;
>   	}
>   }
>   

