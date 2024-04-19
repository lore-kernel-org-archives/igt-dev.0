Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605D7C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 07:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD2D10E599;
	Fri, 19 Apr 2024 07:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="QpEG05EW";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281AA10E599
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 07:42:53 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-418bbc690e1so14522785e9.2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 00:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713512571; x=1714117371;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ATg5w/4oB2udkJwFKOVZWe/V7X6BFJ3ki3erKh65SvM=;
 b=QpEG05EW7zu0AFoQCKVXPq8CAP1807g+reh89PQgMwWnW/5/DjcR426kfE/NKkwAck
 98SetqlGfDVMqnvCjKJQS9oXkGfMm9N4N8oG8pIY9M0MdTRdaktAiE/MgwPR3duIWkP2
 pwijG64NlDEf5uezrL8vEIdHsggI3R3FZboe0W6oTLTkYbxPnHIBKtvjKsgP1FcSjyau
 CBvgBVV2fwTdyVmON6ZKo8U8z8mipyPGPhTp9KqQFFQfRovEI/WrANmrbKvICuCSdBXc
 noaTYXrsb7zlvHvL18bnRBSN8E7+oo5HzKkC3jEdSAHGbvz0Q4vwYvCV0ilEJmcC2XwJ
 LIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713512571; x=1714117371;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ATg5w/4oB2udkJwFKOVZWe/V7X6BFJ3ki3erKh65SvM=;
 b=NXYnNEHBEZ4lXUL7f/5+lp+uNF6blcsAqW5nTSM77nPY7uIp5loPXCNzkTFjAUzwzc
 UVNtPi2fEL2k2oibCRLn6DAY6F2PWkIElUD1ClmGtaXCC0wTBs4k1a/dYAC9f/7xfNvY
 DEBis7980EqqiY0HWHTgNIyw1XtHm0Sgh+FXKgIgymuczW/LMTW/Xl7yuB5/aPw+irav
 VwgHodK4NYy6R8fp6be+HHxMj1+OBYZL/nc14TF4RkH4iGosDd39vLuIqnRksID+i4xk
 l182WvIY/gDACT4VpJLdgqNKaQ2CHJPVlPVTCFBTq0Hx6qNHr6VjLW0sUR88vYPI5Llf
 1+3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsbljqU+BanKPeg9m1b6P33DTJw6v88bSTUGtwfCs8ua4yKtCtYLGeK/5KDjoknJPGhkX6EA6XsAg7xRMVs500Qpl/9uQj19hss1RoPw==
X-Gm-Message-State: AOJu0YxscKIePPKnV4/LMzRaTYP0NtXb+UkDeZbFmzkkextFecN2doew
 M8hYw53yetREgFmPJpKZ5Rb1ivyS1QGDoToBwWrId4uyJzWWL/5YYjsLH19nCYI=
X-Google-Smtp-Source: AGHT+IEDLvWekqJuPtachxPO4tXvL7lOS5/z7Da89WfS4ak33ix/m8NCQ7NVeuq2NJiVuJT73vXSrw==
X-Received: by 2002:a05:600c:154f:b0:417:fbc2:caf8 with SMTP id
 f15-20020a05600c154f00b00417fbc2caf8mr819764wmg.23.1713512571132; 
 Fri, 19 Apr 2024 00:42:51 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c4f5600b004148d7b889asm9380812wmq.8.2024.04.19.00.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 00:42:50 -0700 (PDT)
Message-ID: <434d02cf-c683-40e6-b2f6-3462516a104e@ursulin.net>
Date: Fri, 19 Apr 2024 08:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/12] lib/igt_drm_fdinfo: Stop passing key twice
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-2-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240405060056.59379-2-lucas.demarchi@intel.com>
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


On 05/04/2024 07:00, Lucas De Marchi wrote:
> Change strstartswith() so it also returns the length, which then can be
> used inside the branch when it matches. A good compiler shall optimize
> out the strlen call since the argument is a constant literal.
> 
> With this, the find_kv() is not needed anymore and the difference with
> regard the other branches can be summarized with a new ignore_space()
> helper and the fact it matches the entire key by appending the ':'. The
> helper is added on top of the file so it can be reused later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/igt_drm_fdinfo.c | 87 +++++++++++++++++++++++---------------------
>   1 file changed, 45 insertions(+), 42 deletions(-)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 18dbb5d0b..bfc946f24 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -53,6 +53,14 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
>   	return count > 0 ? count : 0;
>   }
>   
> +static const char *ignore_space(const char *s)
> +{
> +	for (; *s && isspace(*s); s++)
> +		;
> +
> +	return s;
> +}
> +
>   static int parse_engine(char *line, struct drm_client_fdinfo *info,
>   			size_t prefix_len,
>   			const char **name_map, unsigned int map_entries,
> @@ -104,23 +112,6 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
>   	return found;
>   }
>   
> -static const char *find_kv(const char *buf, const char *key, size_t keylen)
> -{
> -	const char *p;
> -
> -	if (strncmp(buf, key, keylen))
> -		return NULL;
> -
> -	p = buf + keylen;
> -	if (*p != ':')
> -		return NULL;
> -
> -	for (p++; *p && isspace(*p); p++)
> -		;
> -
> -	return *p ? p : NULL;
> -}
> -
>   static int parse_region(char *line, struct drm_client_fdinfo *info,
>   			size_t prefix_len,
>   			const char **region_map, unsigned int region_entries,
> @@ -205,6 +196,11 @@ out:
>   		}							\
>   	} while (0)
>   
> +#define strstartswith(a, b, plen__) ({					\
> +		*plen__ = strlen(b);					\
> +		strncmp(a, b, *plen__) == 0;				\
> +})

Did it have to be a macro for optimization to work?

> +
>   unsigned int
>   __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   		       const char **name_map, unsigned int map_entries,
> @@ -222,31 +218,39 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   
>   	while ((l = strtok_r(_buf, "\n", &ctx))) {
>   		uint64_t val = 0;
> +		size_t keylen;
>   		const char *v;
>   		int idx;
>   
>   		_buf = NULL;
>   
> -		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
> -			strncpy(info->driver, v, sizeof(info->driver) - 1);
> -			good++;
> -		}  else if ((v = find_kv(l, "drm-client-id",
> -					 strlen("drm-client-id")))) {
> -			info->id = atol(v);
> -			good++;
> -		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
> -			/* optional */
> +		if (strstartswith(l, "drm-driver:", &keylen)) {
> +			v = l + keylen;
> +			v = ignore_space(v);
> +			if (*v) {
> +				strncpy(info->driver, v, sizeof(info->driver) - 1);
> +				good++;
> +			}
> +		}  else if (strstartswith(l, "drm-client-id:", &keylen)) {
> +			v = l + keylen;
> +			v = ignore_space(v);
> +			if (*v) {
> +				info->id = atol(v);
> +				good++;
> +			}
> +		} else if (strstartswith(l, "drm-pdev:", &keylen)) {
> +			v = l + keylen;
> +			v = ignore_space(v);

Removing find_kv looks like a slight negative, given how now all 
branches have to repeat v =  + keylen; v = ignore_space(v).

I wonder if it would work by extending find_kv to allow prefix matching 
mode, something like this (only two branches show to illustrate the modes):

...
		} else if ((v = find_kv(l, "drm-pdev", MATCH_FULL, &keylen))) {
			/* optional */
			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
		} else if (find_kv(l, "drm-engine-capacity-", MATCH_PREFIX)) {
			idx = parse_engine(l, info, keylen,
					   name_map, map_entries, &val);
			if (idx >= 0) {
				info->capacity[idx] = val;
				num_capacity++;
			}
...

?

Regards,

Tvrtko

>   			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
> -		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
> -			idx = parse_engine(l, info,
> -					   strlen("drm-engine-capacity-"),
> +		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
> +			idx = parse_engine(l, info, keylen,
>   					   name_map, map_entries, &val);
>   			if (idx >= 0) {
>   				info->capacity[idx] = val;
>   				num_capacity++;
>   			}
> -		} else if (!strncmp(l, "drm-engine-", 11)) {
> -			idx = parse_engine(l, info, strlen("drm-engine-"),
> +		} else if (strstartswith(l, "drm-engine-", &keylen)) {
> +			idx = parse_engine(l, info, keylen,
>   					   name_map, map_entries, &val);
>   			if (idx >= 0) {
>   				if (!info->capacity[idx])
> @@ -256,25 +260,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   				if (idx > info->last_engine_index)
>   					info->last_engine_index = idx;
>   			}
> -		} else if (!strncmp(l, "drm-total-", 10)) {
> -			idx = parse_region(l, info, strlen("drm-total-"),
> +		} else if (strstartswith(l, "drm-total-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>   					   region_map, region_entries, &val);
>   			UPDATE_REGION(idx, total, val);
> -		} else if (!strncmp(l, "drm-shared-", 11)) {
> -			idx = parse_region(l, info, strlen("drm-shared-"),
> +		} else if (strstartswith(l, "drm-shared-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>   					   region_map, region_entries, &val);
>   			UPDATE_REGION(idx, shared, val);
> -
> -		} else if (!strncmp(l, "drm-resident-", 13)) {
> -			idx = parse_region(l, info, strlen("drm-resident-"),
> +		} else if (strstartswith(l, "drm-resident-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>   					   region_map, region_entries, &val);
>   			UPDATE_REGION(idx, resident, val);
> -		} else if (!strncmp(l, "drm-purgeable-", 14)) {
> -			idx = parse_region(l, info, strlen("drm-purgeable-"),
> +		} else if (strstartswith(l, "drm-purgeable-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>   					   region_map, region_entries, &val);
>   			UPDATE_REGION(idx, purgeable, val);
> -		} else if (!strncmp(l, "drm-active-", 11)) {
> -			idx = parse_region(l, info, strlen("drm-active-"),
> +		} else if (strstartswith(l, "drm-active-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>   					   region_map, region_entries, &val);
>   			UPDATE_REGION(idx, active, val);
>   		}
