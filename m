Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D22606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hK9hUwRS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A9D10E314;
	Mon, 26 Oct 2026 13:59:35 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9661910E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 13:58:02 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-15dd124bbe7so579079c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 06:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793023082; x=1793627882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2HQDI3wUlYZqWdByu2HTBqiLyXmzVZ/ceA1IpXgg/fY=;
 b=hK9hUwRS1obA+C8FHu1VhJ2uzFz9Bxv9y3wgKalKv9zOET4gXFk7UcOSULDsFoeUZj
 UNE7kRkZGB3HOweswZqC/IbYK0xh4Y85tjLUN1ebHEgiEAV7OfRs/jjBpEppTdmxbbm4
 HGO1RNgT/5N2mg6yftp5CvOKdUarf4l+OVI4MVjccB+XLzPQWWejxTonYZZHUjoq3cJ9
 xxrpuZT/ajy6dm+QNkfZtN8T9LV9JQOMGxoXzL1Xl6VgNklBw/vW6G7+FSi6bXTECqeJ
 9YSFdoCIgpSSjFtJcIf0LM18rXkCi59Q3jXlp+G6KJCFxn4uS5fKnaLKDlAOfQw57ZVc
 VSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793023082; x=1793627882;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2HQDI3wUlYZqWdByu2HTBqiLyXmzVZ/ceA1IpXgg/fY=;
 b=iLH8jDTw/twjwJAMqQMnexukfyT5JcLq9cwkoIgFNTS6djr78WLHcemhZdS1xtEFfq
 UCgOXQYuOauUlQmfgPgL1rsQvXQ02qp3BdoKdxPJ+xJ40Xj2zhj31rOeE39hEu3CN1hQ
 ITM6eYxAsAAK6K2ZIxpfo70s0fWFGmYexSY7h/5WuGxuAYmS7vXv3WAdMU7mBgAbpti1
 zxVXwhc9BcEW6kGxn9m3rIr3sBpfBYb6ZcvQGOQoXCMbrg3XvjQvbD1p1oeOAcbUMBt0
 USFaKFK0IudiEiYQSGWomBQBfE+PSDBBOHCw0kOUJnJVK+HNFBaHmgTDXkSvGJTs41vR
 FBjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxkioqmtEorLUeJTJpVrUhh1c1hhW+hgd5UnNWHC04N3KrMcf+J3AZMgFew6PhYJgIh4nAkCMGD@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJfvoxvCVyChKhxh2PZRymfVNvLrQfTAsibL1RIFB/UON4hpTjv
 7/U3M/AJPdaPUyMCK8IsKRpjBCjLS4SiFhUwqWZOIAHTAtfLwZTQsyFZ
X-Gm-Gg: AYBFou1SjVwe/PKemndje7ohsKFNFZ2e77+3MoAMfQGHxgZFw4jH24YWcXSw6p1gkJx
 I5n4HQ2G36aObZkb+Pa0NTNw2c8T2X8s6nwk1Urgb+UPx0lmxV/eE34fVuSi1GkNDpjMdAsnhWZ
 z50KsRrJsUAyod3o3AqSP0Qm8PryEIp+84i+YhTEVXUsQZbRWKM/OqwtnFwZ/cqKKRFH4/IKBOL
 9uutTF3ot03z9iXHIsXx+1OtQH13KbnNOlpwrUiTccC7M8qNDIHASKVX/NkiQ5qGsyKwYsHvqVh
 zyOo09fzwqJHJaxz30m4vpbAEgBzKZQ9lxxExREMnFfCuOoFnhZBumF12G7V0U0Kf5JthmhvC+a
 pXTGBLR7Dfk1BNIhKw+XPtDwUW5lqB1I1VWvGHJlyLZoaY+8Mk1ZejmCvXmTQuZSHEVdm8FPTBD
 N3lXJzqXes3luS6x9dhMnFJ+sf5dKBWALMbR6NWbzDe54bR1mBFAytX2FE2oll2MQCViToWlY/E
 SzlArTpfId9ulDo3PfkEselnKSMZfC+s70bmpNGYLKNyDQps0GIDVYCRu5s4fzX943bSDidunWN
 a7k6J9H5c58OjAeeKY2FEIw=
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id
 a92af1059eb24-1992a250624mr10434969c88.1.1793023081699; 
 Mon, 26 Oct 2026 06:58:01 -0700 (PDT)
Received: from [192.55.54.41] ([192.55.54.41])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-198a249c331sm52766050c88.17.2026.10.26.06.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 06:58:01 -0700 (PDT)
Message-ID: <73736ac4-3b94-4d50-8f22-837f9b25ceed@gmail.com>
Date: Mon, 26 Oct 2026 15:57:58 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/9] tests/kms_plane_scaling: run plane-*-max-crc on
 all pipes
To: Luca Coelho <luca@coelho.fi>, igt-dev@lists.freedesktop.org
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-6-juhapekka.heikkila@gmail.com>
 <6e6da087e47e1f3182526316e508dd9e72e53bdf.camel@coelho.fi>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <6e6da087e47e1f3182526316e508dd9e72e53bdf.camel@coelho.fi>
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



On 19/10/2026 14.50, Luca Coelho wrote:
> On Thu, 2026-10-15 at 16:16 +0300, Juha-Pekka Heikkila wrote:
>> Instead of testing only the pipe driving the highest native resolution,
>> run the max scaling crc tests on every pipe that has a scaler, each with
>> the valid output that has the largest native mode on that pipe.
>>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   tests/kms_plane_scaling.c | 82 +++++++++++++++------------------------
>>   1 file changed, 31 insertions(+), 51 deletions(-)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 4118f0dd1..14298df3c 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -1127,7 +1127,8 @@ test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
>>   	uint32_t format;
>>   
>>   	plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
>> -	igt_require(plane);
>> +	if (!plane)
>> +		return;
> 
> Wouldn't it be cleaner to test this earlier and skip it as a dynamic
> subtest instead of hiding this skip in here?

Now that you mentioned .. igt_crtc_get_plane_type() cannot return null 
hence this check is useless, I'll just drop it.

> 
>>   
>>   	igt_vec_init(&tested_formats, sizeof(uint32_t));
>>   
>> @@ -1768,47 +1769,42 @@ crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
>>   	return ret;
>>   }
>>   
>> -static bool
>> -find_native_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
>> -			    igt_output_t **found_output)
>> +static igt_output_t *
>> +scale_output_for_crtc(data_t *d, igt_crtc_t *crtc)
>>   {
>>   	igt_display_t *display = &d->display;
>> -	igt_crtc_t *crtc;
>> -	igt_output_t *output;
>> +	igt_output_t *output, *best = NULL;
>>   	uint64_t best_area = 0;
>>   
>> -	*found_crtc = NULL;
>> -	*found_output = NULL;
>> -
>> -	for_each_crtc_with_valid_output(display, crtc, output) {
>> -		drmModeModeInfo *mode;
>> -		uint64_t area;
>> +	if (igt_crtc_num_scalers(crtc) < 1)
>> +		return NULL;
>>   
>> -		if (!crtc_output_combo_valid(display, crtc, output))
>> -			continue;
>> -		if (igt_crtc_num_scalers(crtc) < 1)
>> -			continue;
>> +	for_each_valid_output_on_crtc(display, crtc, output) {
>> +		drmModeModeInfo *mode = &output->config.default_mode;
>> +		uint64_t area = (uint64_t)mode->hdisplay * mode->vdisplay;
>>   
>> -		mode = &output->config.default_mode;
>> -		area = (uint64_t)mode->hdisplay * mode->vdisplay;
>> -		if (area <= best_area)
>> +		if (area <= best_area ||
>> +		    !crtc_output_combo_valid(display, crtc, output))
>>   			continue;
>>   
>>   		best_area = area;
>> -		*found_crtc = crtc;
>> -		*found_output = output;
>> +		best = output;
>>   	}
>>   
>> -	if (!*found_crtc)
>> -		return false;
>> +	return best;
>> +}
>>   
>> -	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
>> -		  "max scaling testing\n",
>> -		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
>> -		  (*found_output)->config.default_mode.hdisplay,
>> -		  (*found_output)->config.default_mode.vdisplay);
>> +static void
>> +test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir dir)
>> +{
>> +	igt_crtc_t *crtc;
>>   
>> -	return true;
>> +	for_each_crtc(&d->display, crtc) {
>> +		igt_output_t *output = scale_output_for_crtc(d, crtc);
>> +
>> +		if (output)
>> +			test_scale_max_crc(d, crtc, output, modifier, dir);
>> +	}
>>   }
>>   
>>   static int opt_handler(int opt, int opt_index, void *_data)
>> @@ -2115,17 +2111,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   				     "output matches an unscaled reference using "
>>   				     "CRCs.");
>>   			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
>> -						   scale_modifiers[m].name) {
>> -				igt_crtc_t *sel_crtc;
>> -				igt_output_t *sel_output;
>> -
>> -				igt_require(find_native_res_crtc_output(&data,
>> -									&sel_crtc,
>> -									&sel_output));
>> -
>> -				test_scale_max_crc(&data, sel_crtc, sel_output,
>> -						   modifier, SCALE_DOWN);
>> -			}
>> +						   scale_modifiers[m].name)
>> +				test_scale_max_crc_pipes(&data, modifier,
>> +							 SCALE_DOWN);
>>   
>>   			igt_describe("Probe the maximum horizontal and vertical "
>>   				     "plane upscaling factor for each supported "
>> @@ -2133,17 +2121,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   				     "output matches an unscaled reference using "
>>   				     "CRCs.");
>>   			igt_subtest_with_dynamic_f("plane-upscale-max-crc-%s",
>> -						   scale_modifiers[m].name) {
>> -				igt_crtc_t *sel_crtc;
>> -				igt_output_t *sel_output;
>> -
>> -				igt_require(find_native_res_crtc_output(&data,
>> -									&sel_crtc,
>> -									&sel_output));
>> -
>> -				test_scale_max_crc(&data, sel_crtc, sel_output,
>> -						   modifier, SCALE_UP);
>> -			}
>> +						   scale_modifiers[m].name)
>> +				test_scale_max_crc_pipes(&data, modifier,
>> +							 SCALE_UP);
>>   		}
>>   	}
>>   

