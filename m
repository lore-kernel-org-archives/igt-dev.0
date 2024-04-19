Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC7CC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 07:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A410E10E5C6;
	Fri, 19 Apr 2024 07:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="s5iWRbdp";
	dkim-atps=neutral
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5111710FDC4
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 07:58:28 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2da88833109so24379461fa.0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713513506; x=1714118306;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6oHTdQDFlQ+kU7NgH5XA39TUGz7mu5W6+TFqUsjHaMg=;
 b=s5iWRbdp+WJo99PMhJ10G+Lqugv5+xNpX+cYd1G+jMiJYUZAbZ10j7YLczuIp2OgQl
 8WB6SSAdUfhLSIwpZBamsOgMQw5rsOgBbGWe+5wgWQgDn8+0uvy2b4DY3j6zRs3fNV5Z
 NYDQpFrbH+Ah34wyv4alB1fQS/J7kRtkFQ6iDIwXacbgiRdGZ0tkPotIG+lELtdPPF0D
 w6MQcoqM7oLjJFTX5sltKVOx3t4K1SrqRfueE3gliACTJMYM90XDIxXFqvlife+l3j5b
 1AH7UJPNrYRvte/cmaK3WExJ6byIkBmJRNDdU1cgllsWuFy5v1uZN4ws6eaJ1mjhquFt
 JPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713513506; x=1714118306;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6oHTdQDFlQ+kU7NgH5XA39TUGz7mu5W6+TFqUsjHaMg=;
 b=q3wLoH8+XBWEYsFqIU9Pp0qlLFVaNoiKSkVP0qFnCSDLA0/pjfCzRhoCg4Zi8SYBLM
 OnoTTcykadTLOyjyI5c/a7yil4ZZzAUCKy9eiSM0gRay9Q61Uav/u6DNXq9pZ4VVbeO8
 4kjzZjr+ThQoho00zEGJ/cX7wMWAT5Y8WXWgm0FPNiIMUUOyByQYzLGPH5POIWMvJlBt
 pIY3wMnwZ6zF7X6Hh+oXBuXP20HpSXRndsOnR916rD+yVOVqoXKaQCiVGd0YU4TfuCWc
 jtdGlLkFzh8auu/XcP9EEYTQx0LMDiyuG0WqLeR6s6owl0tQmQTa5kGA4JWBdEeqe8d6
 VURQ==
X-Gm-Message-State: AOJu0Yw9bgHfwKMJO7FBeJ8HHSbc1xTSQlKyTrDYPsnXlnBuy1AFtrH8
 wm9IetP6nMT2o9y3/qFZzDpgnsrvB8cN4V5F2XbyjHPt3S4XHebZDhiiPGmTYsA=
X-Google-Smtp-Source: AGHT+IHsp4IYyTccxs7N7JuU6izyH2E2llvWTdn7Bj3pcPhwPBPKK0JA+bhjEAXB8Uf4PVzpfVm/OA==
X-Received: by 2002:a2e:7011:0:b0:2d8:a98d:19b with SMTP id
 l17-20020a2e7011000000b002d8a98d019bmr803498ljc.21.1713513506082; 
 Fri, 19 Apr 2024 00:58:26 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c470c00b00416a43d60e6sm9326327wmo.39.2024.04.19.00.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 00:58:25 -0700 (PDT)
Message-ID: <36580d4b-f9c7-40f9-8b4a-16ff3b625036@ursulin.net>
Date: Fri, 19 Apr 2024 08:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 07/12] lib/igt_drm_fdinfo: Parse unit for engine
 utilization
Content-Language: en-GB
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-8-lucas.demarchi@intel.com>
 <ZiGjOeB2CSO7a/wO@orsosgc001>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <ZiGjOeB2CSO7a/wO@orsosgc001>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 18/04/2024 23:48, Umesh Nerlige Ramappa wrote:
> On Fri, Apr 05, 2024 at 01:00:51AM -0500, Lucas De Marchi wrote:
>> Kernel adds a " ns" at the end of engine utilization. Make sure we parse
>> it so we don't fail if there's another suitable unit chosen by the
>> driver or another format.
>>
>> This prepares the ground for xe driver which will use 2 timestamps
>> rather than 1 with a different unit, to make sure it's compatible with
>> SR-IOV so we don't have to handle the conversion between GPU and CPU
>> clock domains.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> lib/igt_drm_fdinfo.c | 22 +++++++++++++++-------
>> 1 file changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>> index 5f05f210e..1541a62c9 100644
>> --- a/lib/igt_drm_fdinfo.c
>> +++ b/lib/igt_drm_fdinfo.c
>> @@ -63,9 +63,10 @@ static const char *ignore_space(const char *s)
>>
>> static int parse_engine(const char *name, struct drm_client_fdinfo *info,
>>             const char **name_map, unsigned int map_entries,
>> -            uint64_t *val)
>> +            uint64_t *val, const char **unit)
>> {
>>     const char *p;
>> +    char *end_ptr;
>>     size_t name_len;
>>     int found = -1;
>>     unsigned int i;
>> @@ -103,8 +104,15 @@ static int parse_engine(const char *name, struct 
>> drm_client_fdinfo *info,
>>         }
>>     }
>>
>> -    if (found >= 0)
>> -        *val = strtoull(p, NULL, 10);
>> +    if (found < 0)
>> +        return found;
>> +
>> +    *val = strtoull(p, &end_ptr, 10);
>> +    if (p == end_ptr)
>> +        return -1;
>> +
>> +    if (unit)
>> +        *unit = end_ptr;
>>
>>     return found;
>> }
>> @@ -212,7 +220,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, 
>> struct drm_client_fdinfo *info,
>>     while ((l = strtok_r(_buf, "\n", &ctx))) {
>>         uint64_t val = 0;
>>         size_t keylen;
>> -        const char *v;
>> +        const char *v, *unit;
>>         char *end_ptr;
>>         int idx;
>>
>> @@ -237,15 +245,15 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, 
>> struct drm_client_fdinfo *info,
>>             strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>>         } else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
>>             idx = parse_engine(l + keylen, info,
>> -                       name_map, map_entries, &val);
>> +                       name_map, map_entries, &val, NULL);
>>             if (idx >= 0) {
>>                 info->capacity[idx] = val;
>>                 num_capacity++;
>>             }
>>         } else if (strstartswith(l, "drm-engine-", &keylen)) {
>>             idx = parse_engine(l + keylen, info,
>> -                       name_map, map_entries, &val);
>> -            if (idx >= 0) {
>> +                       name_map, map_entries, &val, &unit);
> 
> Should we ignore spaces in unit and then do a strcmp(unit, "ns")? OR are 
> we sure that there is just one space prior to unit here?

Any type and number of whitespace shouldbe handled.

I guess in drm-usage-stats.rst this needs to be improved:

"""
- Whitespace between the delimiter and first non-whitespace character 
shall be
   ignored when parsing.
- Keys are not allowed to contain whitespace characters.
- Numerical key value pairs can end with optional unit string.
"""

Perhaps append:

- Whitespace between the value and the unit shall be ignored when parsing.

Regards,

Tvrtko

> 
> Either ways,
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Umesh
> 
>> +            if (idx >= 0 && !strcmp(unit, " ns")) {
>>                 if (!info->capacity[idx])
>>                     info->capacity[idx] = 1;
>>                 info->busy[idx] = val;
>> -- 
>> 2.44.0
>>
