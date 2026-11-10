Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E809606A323
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 20:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWIxS75x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4053410E381;
	Tue, 10 Nov 2026 20:00:18 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6837010E35B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 19:59:10 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-cdb15cd8558so1056662a12.2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 11:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794340750; x=1794945550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UFEbym2F4W93N5Vekr3pkZuCqAxkZY3ztZaJ6Mh0/SQ=;
 b=bWIxS75xUgHUqBDDZRWydIpnUcEr+f7p9yW993wC+n8HLMtDG5uKjIn5FlyQEI6aFx
 v5excVkD3dMetQ5FyfPZ/3mz9TqyayQnFAj+p2zb1RbjQlG7zpQGMDNVLKKprp5DPGZ/
 yA7vKFU7D7dNKFQwWU7j3RUwIKZ0rhh8bxofUH0tZm005jjb285mviyXWDK7WeAH/eCz
 +Mk8VxW6bUYApbg8poOcZTrwguNsKYdKOkn9kjxHLdC52dr/sBr3voA4qfyG38Hbh2gM
 lfYoNGCtPyOAMkfVDHjY79uDIsTG7suiJmXYVQTRRFu2ujCnSiAtDo9R1rU3Tzh5oF42
 /ZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794340750; x=1794945550;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UFEbym2F4W93N5Vekr3pkZuCqAxkZY3ztZaJ6Mh0/SQ=;
 b=xA21dg5gh1oBGqXZT/15vPW12NnUlBT1b4ohT3HGntY2tVkxJFgmlXPWFwoh3x9efc
 RujFV+0Ho81CZ4kmcO97VpWb9GlYosZ+UD8B+gyVvOVRdk5FsfrHCOuysO+bcdfZYebz
 M0sBPjJJPNdqKpYabZ8RMgbtcxVJ1/Rthma/pXuqTF62SQogHF4WKG74NxpnGkDAKj0g
 gXUr08vIvoF1rnZqdTuvWnctdFoW3lLWD8AnTQjxA9GjIftlumTJb3M9equB5q2MC5kh
 mHzECEFYvGt50T9EQfPUWhy/lwYk8u9kK3PVTprlo60pBuPyxtVs7ifXdT/p8kMaKe7H
 vRMA==
X-Forwarded-Encrypted: i=1;
 AL+hErEJEX68BYpseng+R+kTYZAGyxVQzItfR6ntN9awKPs7ndk/cJtr/ERHpBAjibvT6VuyytHKKBrK@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8825rsEC1V8WjnBtcQFTrOpHHhdMi87CMCg1gJgSOMUSBoesNP
 niQuvG7mUiKYTGAxbfBhlmzqZfUOHIxrnuAFGRrgnvqq/iR58/XlwPLT
X-Gm-Gg: AYBFou1UAzbotCoGuVXc/GYCqMI2gYYthHcCA14Gr+VIaHaht3qYZH1xV/ZPDv1dYHT
 9Cqbhpp8qUplcS+1e+pbZR1LVSHzt8tzLa5y6dj2jqYaOYNnU+HVA+JMYalORNahmQTFG95Iev/
 6uNO9QOXVfw9jJ8/dBzIPYV3Xifi4BEDDgpkrZu/oVwia8SEbgPtZNRgi06iZg/ST+dnomlZJ3B
 mMVvd8Q388+RDQyYVG5sLke0MmLfVOTCX8iT8CI1Cp+SsTdgCHdu+xBGmHF4/1ycSqYQGbcoiPi
 9qZyOu4nkAKN+j2Qjj0WFoI7NtQvEiIlwUgb/tkZ85o+5KiygiRGqHx/ikGNT64MMeF9esX55PS
 GvR3TlhAXNq8kUtUDaJfj/Pp4OrGz/dmQ1d+5b4FpBQOaUhSOyORGqGXYd45j8H0DeRDiAAzhwQ
 oycHTOV4oVMle0iUMr+hu9FQ+pPZoIWCoD4Z0LTW8E6ggpuoI/M12UjCG525IlZ8nMAMQsvXMK9
 Ha2lG7EWjmCLCkT9ThqZR0sgHdFRtbwtOmLyAFmd0zwPS0mSg4DHssC3gjtZ4jG9aTLH2hALYkK
 PZ/a6rdfrSZlSifR1bgj8UHNoVVIWw43fjm5P1RCL0EK1MQeB7llda+Sbl3Ug/LVn/S+OmJ5OcY
 d
X-Received: by 2002:a17:90b:5344:b0:3a0:d265:3647 with SMTP id
 98e67ed59e1d1-3b182e107e7mr40265a91.8.1794340749776; 
 Tue, 10 Nov 2026 11:59:09 -0800 (PST)
Received: from [134.134.139.77] ([134.134.139.77])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b17db569cbsm1061050a91.9.2026.11.10.11.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 11:59:09 -0800 (PST)
Message-ID: <c36d7032-baf8-4e5c-8249-d58d78342220@gmail.com>
Date: Tue, 10 Nov 2026 21:59:04 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 9/9] tests/kms_hdr: run on 3 outputs when testing
 suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
References: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
 <20261106180849.156578-10-michal.grzelak@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261106180849.156578-10-michal.grzelak@linux.intel.com>
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

On 06/11/2026 20.08, Michał Grzelak wrote:
> Each suspend test is executed per output. Limit number of outputs tested
> to 3 by default. Add command-line option enabling execution on every
> output.
> 
> v3->v4
> - declare `data' as static (Thasleem)
> - add parenthesis around check (Thasleem)
> 
> v2->v3
> - add patch
> 
> Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> ---
>   tests/kms_hdr.c | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index e23d5e4691..43f7191c75 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -74,6 +74,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>   
>   #define BACKLIGHT_PATH "/sys/class/backlight"
>   
> +#define OUTPUT_LIMIT 3
> +
>   /* HDR test formats: 10bpc + FP16 */
>   static const uint32_t hdr_test_formats[] = {
>   	DRM_FORMAT_XRGB2101010,
> @@ -110,6 +112,7 @@ typedef struct data {
>   	int w;
>   	int h;
>   	igt_fb_t afb;
> +	bool all_outputs;
>   } data_t;
>   
>   /* Common test cleanup. */
> @@ -250,6 +253,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> +	int output_count = 0;
>   
>   	igt_display_reset(display);
>   
> @@ -273,6 +277,11 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> +		if (!data->all_outputs && (flags & TEST_SUSPEND) && output_count >= OUTPUT_LIMIT)
> +			continue;
> +
> +		output_count++;
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output,
>   					    crtc);
> @@ -674,10 +683,27 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	}
>   }
>   
> -int igt_main()
> +static int opt_handler(int opt, int opt_index, void *opt_data)
>   {
> -	data_t data = {};
> +	data_t *data = opt_data;
> +
> +	switch (opt) {
> +		case 'o':
> +			data->all_outputs = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
>   
> +static const char help_str[] = "  -o \tRun on all outputs instead of 3 when testing suspend.\n";
> +
> +static data_t data = {};
> +
> +int igt_main_args("o", NULL, help_str, opt_handler, &data)
> +{
>   	igt_fixture() {
>   		data.fd = drm_open_driver_master(DRIVER_ANY);
>   

