Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE7606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnocGXW9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E888310E068;
	Wed,  4 Nov 2026 17:21:07 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BCB10E068
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 17:20:08 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-1931ff67a29so691175c88.1
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Nov 2026 09:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793812807; x=1794417607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EX6zwdmW5JezfiK/a5uol0FdwdzAOM8dEHpaKggR8g4=;
 b=YnocGXW9V8F69xO+eiu0Uh/WBo60hY7l8aqFfCOHuX4fYiBVccSbV1Tn3+ohwN4jzb
 dlY2/oiObPZ1cHJL1tYOjKgk49W+71E9nKk4y92MZbuX6Na2AZfP5gG0f1y14Nro9P9W
 o82ffdYGR3Sx0zuHiOskZBcfM47V+ac2sU5j2LBBNkpZkjreMlB2Sls2Nb6jGpQRw6H8
 1BwbrQt8/4iKnHD3eFl36irjKoFhtSliBlA/w7EyehspfBvFt9Cu+NunoH7CPe0M2GAg
 zvc32qjQM6JR3km4hyIvqXCaPh1d3erWUrNPJbFpl0X+ICt963A14SuB/r9ywU2MLBf3
 WdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793812807; x=1794417607;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EX6zwdmW5JezfiK/a5uol0FdwdzAOM8dEHpaKggR8g4=;
 b=QnSfUtuZ654l7XpSibvBL/c6gylKaf/w7P5hmUxwe7vEeOzANmI+p0M0x+zCTBzLvs
 WDo6lK5Xm8zXQkMqBSom9H+9NiD02caiZdrhuv4+HqVh3NWPW2RxuK75zV1MjJ3jqapN
 Yu4F4nY85/X/GO7i7hYnuWRviEh0+pAwyBuEIZg50Ixmb3aKoMk0vc3OgXHoRXkDhar/
 IiT+1qGkotROBOpXeP+W2Gee9ORx4K0ieolV5jX6l7E077lSMhMDTZuIZrgku+DrSaiG
 LRyHDHJ9mcUI3KKTD48I9+ZXyAwmZHr/mYR8ehcwBt9VA7UL/+/28dUUG0hjIzK0uAWE
 lh5w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxByyK05zh9yTb+6B5gJwzWQVABditeIjoakaQczjwqW3Ecn4VkvEK/2OUbyFxZRE844H4VV6NP@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+TijjI4gbyICpp4BfITza+enrlcpYNw7bofnz2ETtOUUfHZiQC
 +XUP43UMWQqjLGEAVjoQdFTZ7ZYSGBPF1srKGDbdTXBOd8hdqrETDK+E
X-Gm-Gg: AYBFou2lYqjNFTWjPxniveAnA3rhS9BxkG5un5oxLzvMtlb8Jgw1UXE3EV8x+/lYWGp
 xoY27tIdgLwBaYp/SzBmibXqrmPHgUin+iLr2mGn/gmcTLJfe+wDseKozq7gUM1bLZWuCHlp4Tg
 ISTKVkPEyRq4hGLTqNBydEGMmgkzxB/QtQqIT7Y72NRgpH2VDUA+sxBhc2nicPiFXPiCB43xBIX
 6YKeuXjDrdClnFuWl1duHWvh+nja+05WAWg/0ZxdOeY4UE/NWvTvuiH0IlBbahN8Z5kExIJZVrs
 RLBJQxzRUHoPTR43iMsh5eXSGApu2pJ1WxwxQbs0UhyZHT3gmPF22EhuWuGe6k6EzoU+SxZcsjf
 nvmQOt2ICiwaTixARalvDuO1PbFgLDzwRjtb0DgLQW7C7wprV3Zwt152w5AiAGOaHTpZ6dnrzid
 mTRiDZxZGPdj4IgmMt4zFypr9Yvm5CVawMxAga0alvTcXzAEKxMcyJ54aVMFUdXBArvbNnw8E4N
 A9KafMmIujjqWc854CXE1/xfTNFAARCaxN3EyaOXW8NgY560+y87wmPX4mmEGsqffU3RCW6qrbj
 AaT2jwecKv3BNmzrG9kV+SPnD222k2DyyKHz0/IEijT/2awNoAZDnCwOOQIB9l0gbIFZCXc=
X-Received: by 2002:a05:7022:b0c4:b0:1af:2ba7:e44b with SMTP id
 a92af1059eb24-1af2ba7e498mr22014750c88.3.1793812807127; 
 Wed, 04 Nov 2026 09:20:07 -0800 (PST)
Received: from [192.55.55.42] ([192.55.55.42])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b245c2d69asm8534125c88.11.2026.11.04.09.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 09:20:06 -0800 (PST)
Message-ID: <767915da-88d9-468b-b021-33046119a3c8@gmail.com>
Date: Wed, 4 Nov 2026 19:20:02 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 5/9] tests/intel/kms_ccs: split outer test loop
 into two
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
References: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
 <20261013161013.1364753-6-michal.grzelak@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261013161013.1364753-6-michal.grzelak@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 13/10/2026 19.10, Michał Grzelak wrote:
> for_each_crtc_with_valid_output() iterates over every crtc with
> connected output. Split it into two loops. This is needed to handle per
> output and per crtc cases.
> 
> v4->v5
> - fix indentation (Thasleem)
> 
> Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 58 +++++++++++++++++++++----------------------
>   1 file changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 4d0bda6a78..1a922792c5 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -1152,47 +1152,47 @@ static void test_output(data_t *data, const int testnum)
>   					      "Older than Xe2 platform needed.\n");
>   			}
>   
> -			for_each_crtc_with_valid_output(&data->display, crtc,
> -							data->output) {
> -				data->crtc = crtc;
> -				igt_display_reset(&data->display);
> +			for_each_connected_output(&data->display, data->output) {
> +				for_each_crtc(&data->display, crtc) {
> +					if (!igt_crtc_connector_valid(crtc, data->output))
> +						continue;
>   
> -				igt_output_set_crtc(data->output,
> -						    crtc);
> -				if (!intel_pipe_output_combo_valid(&data->display))
> -					continue;
> +					data->crtc = crtc;
> +					igt_display_reset(&data->display);
>   
> -				igt_dynamic_f("pipe-%s-%s",
> -							    igt_crtc_name(crtc),
> -							    data->output->name) {
> -					int valid_tests = 0;
> +					igt_output_set_crtc(data->output, crtc);
> +					if (!intel_pipe_output_combo_valid(&data->display))
> +						continue;
>   
> -					if (data->flags == TEST_RANDOM)
> -						igt_info("Testing with seed %d\n", data->seed);
> +					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
> +						int valid_tests = 0;
>   
> -					if (data->flags & TEST_ALL_PLANES) {
> -						igt_display_require_output_on_crtc(crtc);
> +						if (data->flags == TEST_RANDOM)
> +							igt_info("Testing with seed %d\n", data->seed);
>   
> -						for_each_plane_on_crtc(crtc,
> -								       data->plane) {
> -							if (skip_plane(data, data->plane))
> -								continue;
> +						if (data->flags & TEST_ALL_PLANES) {
> +							igt_display_require_output_on_crtc(crtc);
>   
> +							for_each_plane_on_crtc(crtc, data->plane) {
> +								if (skip_plane(data, data->plane))
> +									continue;
> +
> +								for (int j = 0; j < ARRAY_SIZE(formats); j++) {
> +									data->format = formats[j];
> +									valid_tests += test_ccs(data);
> +								}
> +							}
> +						} else {
>   							for (int j = 0; j < ARRAY_SIZE(formats); j++) {
>   								data->format = formats[j];
>   								valid_tests += test_ccs(data);
>   							}
>   						}
> -					} else {
> -						for (int j = 0; j < ARRAY_SIZE(formats); j++) {
> -							data->format = formats[j];
> -							valid_tests += test_ccs(data);
> -						}
> +						igt_require_f(valid_tests > 0,
> +							      "no valid tests for %s on pipe %s\n",
> +							      ccs_modifiers[i].str,
> +							      igt_crtc_name(crtc));
>   					}
> -					igt_require_f(valid_tests > 0,
> -						      "no valid tests for %s on pipe %s\n",
> -						      ccs_modifiers[i].str,
> -						      igt_crtc_name(crtc));
>   				}
>   			}
>   		}

