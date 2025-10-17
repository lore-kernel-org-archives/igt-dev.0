Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313DACCD195
	for <igt-dev@archiver.kernel.org>; Fri, 17 Oct 2025 08:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD30C10E15B;
	Fri, 17 Oct 2025 08:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Kirfhncb";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B56710E15B
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Oct 2025 08:25:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47117e75258so5159225e9.2
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Oct 2025 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760689526; x=1761294326;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sc/HxaWaYT7AP+1D6X1W5JJNrA8/8wyarfjWmGcT6bw=;
 b=KirfhncbomVNHbgj1w8bkak8wlzoVkNYwOfRdWJ126fX8OrZmvofgkpb2RfP0+3ZGD
 pkZB614u2oLa+rODZqLn6utVGZghBR13AjVi/vlbpAxtVXwsdeC40nUp/GhnKkY67VCq
 /JdaUTX6p7tkpIFia4WonRYB/QIK4NJRYjBUycIrzRusHCWRl+gbvUUK4xalegNep+Ef
 In2V8VoEWv+LRezA9QebWgUtp/BGicp1cYOxUtY2Lx6nNxWNCH9kf/V5jGUAq+sZKOCf
 s0ccAr+8HjAybVZ00Rp58uFOLfgLkm1eZDdLorEMq8KPaRenJqKKo14rKmdRdcKCYH1t
 TZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760689526; x=1761294326;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sc/HxaWaYT7AP+1D6X1W5JJNrA8/8wyarfjWmGcT6bw=;
 b=j7ak0XWDQ6wyzh0CnvnEzEDmpEaydJnvy5+jzRiSsQ7VsuqcKBlUqRbYKsn++PhZUG
 dJ7SlWpxrHuFjqYIkavtO63M/NTO9rtc5/LrOCGPbsKw+9+oERMCyrjL/otGU+1EYE87
 Uq/qqO+Gp0XwoVMqhYdtv7FTRGW2lKqMnwC0s6HXEUxorTXzzwi88zomfmb0oFkWsyxR
 n093/KyB46iGq3ybG05Frf9qoMwa6ntTMY4ILoA4dsKj8vi7sWj1+pXS6LTZqQDBQ2Cp
 ntfkeQn2xNRm4/NYf/FaqI3gDfZL1pAiShs1m08mpm03yyrki0vx8gp/Cq4Gdzz/gpUf
 MN4g==
X-Gm-Message-State: AOJu0Yz0Pc2u9sfkbyU2hNLJtKC0V/d5vpTa5NCp9kFrRzxqzNCOf2sV
 VFb1CUAlZ3Ue3fzGASjewyS16Hm65rSreXDKisULAcmkO+WGgLKLcHpDXll+Cg8CR0c=
X-Gm-Gg: ASbGncuXY2lN6rmBgtQXocV75Amh8IhIxHDu4XhfNKK+k4HeGqfvE4Lwd9KTKTYF1hh
 P4Duf0yAqJngKv0u7+JVk7c8FcNquy8PYxpE8npe1AmCG3h8CYZqVOs8w81Sar+7AVBUJv/1X+K
 XExYx+5TIeCz9l5WE+IjQFgsSLY6DahgXF4AUD2/+aXTH6U/pR0b5RnX/ydMft5h3TfbKGUry4O
 pifsLTsQ9rzqOawBWI30iFCeYJjUl/npRltbBGibdjrLG4E1b/+hAwOQYy6cncwkOGtAOT71w08
 1yluP01jdmW/mwRTKM2tBb3W7pRoSqs69SkrkS7KQhbKFVdKxta49olnvAoC6/wrtetVWSlXYfS
 9gHuTVRLl1xnhbE4kOEVg5jcrrSrKnpRHoSHa1f6HJlKu47FCk9bkj9d7W4OUxv0ggV30uf2gkW
 1My7+HId+L+YDXPZIrYBV/AVkZrQ==
X-Google-Smtp-Source: AGHT+IE3umqHOmNp6W04z2gX2IjROCvNYm2fy+/5I3e/R/VUPGZ3514vO6i98KK9DDplUfn+kJygbw==
X-Received: by 2002:a05:600c:548c:b0:468:9e79:bee0 with SMTP id
 5b1f17b1804b1-471177bc126mr20661345e9.0.1760689525305; 
 Fri, 17 Oct 2025 01:25:25 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144c82b8sm67596345e9.15.2025.10.17.01.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 01:25:24 -0700 (PDT)
Message-ID: <90674e7c-c6cf-4fa4-a21f-2808e9835b92@ursulin.net>
Date: Fri, 17 Oct 2025 09:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: Add iteration option -n
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Simon Fairweather <simon.n.fairweather@gmail.com>
References: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
 <vf4drxg7dt5etivlwlgvbrxomkodvwrfpjm4jplicb3udecki4@uv5s3zp6t274>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <vf4drxg7dt5etivlwlgvbrxomkodvwrfpjm4jplicb3udecki4@uv5s3zp6t274>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 17/10/2025 08:29, Krzysztof Karas wrote:
> Hi Kamil and Simon,
> 
>> When using option -J or -c default is looping forever until user
>> break process. Lets introduce new option -n <number> and break
>> printing after reaching given number of iterations.
>>
>> v2: corrected whitespaces, extended description (Kamil)
>>
>> Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
>> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   tools/intel_gpu_top.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 54e71e559..4bcac4b47 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -1051,6 +1051,7 @@ usage(const char *appname)
>>   		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
>>   		"\t[-p]            Default to showing physical engines instead of classes.\n"
>>   		"\t[-m]            Default to showing all memory regions.\n"
>> +		"\t[-n]            Specify number of iterations. Can be used with -J or -c.\n"
> I built this tool with the proposed change and found out that -n
> applies regardless of -J or -c being added - it gives an overall
> timeout for the application. If this is what you were aiming
> for, then I'd rephrase:
> "Specify number of iterations. Can be used with -J or -c."
> to something like:
> "Specify application runtime: n * refresh period (-s option)."
> or:
> "Specify application runtime n * refresh period (-s option).
> Useful with -J and -c options."
> if you want to hint it's usage.
> 
>>   		"\n",
>>   		appname, DEFAULT_PERIOD_MS);
>>   	igt_device_print_filter_types();
>> @@ -2618,9 +2619,11 @@ int main(int argc, char **argv)
>>   	struct igt_device_card card;
>>   	char *codename = NULL;
>>   	struct timespec ts;
>> +	int iteration_value, iteration_count = 0;
>> +	bool iteration_check = false;
> I think iteration_check flag is redundant here, because you
> could use iteration_value as the indicator:
>   1) set iteration_value to 0
>   2) if -n is used overwrite the variable to whatever user wants
>   3) check later if the variable has value
>   4) a) if it does then increment iteration_count
>      b) if not then just spin indefinitely
> 
>>   	/* Parse options */
>> -	while ((ch = getopt(argc, argv, "o:s:d:mpcJLlh")) != -1) {
>> +	while ((ch = getopt(argc, argv, "o:s:d:n:mpcJLlh")) != -1) {
>>   		switch (ch) {
>>   		case 'o':
>>   			output_path = optarg;
>> @@ -2631,6 +2634,10 @@ int main(int argc, char **argv)
>>   		case 'd':
>>   			opt_device = strdup(optarg);
>>   			break;
>> +		case 'n':
>> +			iteration_check = true;
>> +			iteration_value = atoi(optarg);
>> +			break;
>>   		case 'p':
>>   			physical_engines = true;
>>   			break;
>> @@ -2858,6 +2865,12 @@ int main(int argc, char **argv)
>>   		if (disp_clients != iclients.clients)
>>   			free_display_clients(disp_clients);
>>   
>> +		if (iteration_check) {
>> +			iteration_count++;
>> +			if (iteration_count >= iteration_value)
>> +				stop_top = true;
>> +		}
> As I mentioned above, this is not tied to -c or -J in any way,
> so it applies a limit in main execution loop regardless of other
> options.
> I think the current idea is good, so its usage is not limited to
> the -c/-J opts, but the explanation in "--help" section should
> be changed.

+1 to all comments from Krzysztof.

Otherwise wanted to say that there is also the man page which needs to 
be updated.

Regards,

Tvrtko

> 
>> +
>>   		if (stop_top)
>>   			break;
>>   
>> -- 
>> 2.51.0
>>
> 

