Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F756C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 18:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F055010FFC2;
	Fri, 19 Apr 2024 18:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Y3WSvtXi";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F40710FFC2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 18:32:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-419ca3f3ee3so4440875e9.3
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 11:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713551574; x=1714156374;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QbJnEcTyQTqcX9oDhfc/wLstZbR4wVVqBU3wSfhf1+k=;
 b=Y3WSvtXifdao6ELW+KIkWeMyA5ug7tVyqwHoPjSKF7bz1AAhcV22GVsNh8WpKyOMaK
 PQSIo4CZiCjupC6nSo6ZWnenLIOK1KppZc3TJlbp9t3Hu9KqitVkcWzJ8eGqEOG2cDRo
 LgxhWura26pTDH4Gpa91Ac/Jl0YDTLqGATGkPd619RgVxbHg6MEqmHvnYY4WdM9pPakK
 +sDcNOZ+Z/f7YsRxhepM3bXKnOBRwZilKcGReVYX8sWR7qZiiMVvLu3QO/LX7C/gPgI+
 LQs+1GtVVVw6Is/zOnrk6EqoH/GtXe5JJDh4zZ7Yx9PeHfu2Q1OaxtjJlhn5fku18SCm
 O6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713551574; x=1714156374;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QbJnEcTyQTqcX9oDhfc/wLstZbR4wVVqBU3wSfhf1+k=;
 b=aIzM9/uyt8lGPMxp3BiLUfAmCXYJ7QOljSD7FZksry0crXYYFCMdtwowdxt8kkj0zY
 exHGdbl7qOuXLU4qygkiDMgFjWBk6cp6CDveATEMbTznDSqm7Egkl+bwYDKWeAPjkOQU
 X0NF5sLPtY2OVtfYbH+XJejgZe8fK52QRrDwqsX+0UK/MhzzRSf7h8ZRZdlzvS2uP+fJ
 qhgRYdjG/VFDlFXZsalI0OJiY6eZPcXewMGxSyS9celJ6lh2bUU00OK2WRjmLUT56W7Y
 sZ7VPb6Wpg+N85fJhAFsoF6gX/FKuhVj+5P8O3lEPPdB5jE3+zGDKnZ/JPH7JLHEV7UQ
 +WLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfiZjusxqGd0yhBpdtCNqB58TNxr5ZbuKezW5DF5p96es1KDHsfFUusgcFcpT1T4+IoAN38BKIcfIUeVp2fkDY+uLkXko8lkuW6459hg==
X-Gm-Message-State: AOJu0YzFAVHIivxm7+cQ1tvIWXzB6/0uh3J90wxA9hFyd44KYpbrKRxu
 mqGKrZ6lE1VjWDraIENRgdbAZIApincywVmmbwQGXrNqm5HiaWbPykKpVboCpi0=
X-Google-Smtp-Source: AGHT+IFhkquec+I/L0MxXvo5xGdY7xJexuPgaIfaCJYb0gVCTkW1Nq8TU8d+q9OhfdUhME652zWVjA==
X-Received: by 2002:a05:600c:4e8b:b0:418:e2e4:a84c with SMTP id
 f11-20020a05600c4e8b00b00418e2e4a84cmr2060691wmq.30.1713551574096; 
 Fri, 19 Apr 2024 11:32:54 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 bd27-20020a05600c1f1b00b00419d47edc51sm890457wmb.47.2024.04.19.11.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 11:32:53 -0700 (PDT)
Message-ID: <43cef231-92ae-4eb5-aabe-a4ae350ba486@ursulin.net>
Date: Fri, 19 Apr 2024 19:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 07/12] lib/igt_drm_fdinfo: Parse unit for engine
 utilization
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-8-lucas.demarchi@intel.com>
 <ZiGjOeB2CSO7a/wO@orsosgc001>
 <36580d4b-f9c7-40f9-8b4a-16ff3b625036@ursulin.net>
 <y7fso2phqvfqlcuedtrpuni5tk6ztgfqa3gr6id2fnn2l4r27r@2lymyjdniuv2>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <y7fso2phqvfqlcuedtrpuni5tk6ztgfqa3gr6id2fnn2l4r27r@2lymyjdniuv2>
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


On 19/04/2024 17:21, Lucas De Marchi wrote:
> On Fri, Apr 19, 2024 at 08:58:25AM GMT, Tvrtko Ursulin wrote:
>>
>> On 18/04/2024 23:48, Umesh Nerlige Ramappa wrote:
>>> On Fri, Apr 05, 2024 at 01:00:51AM -0500, Lucas De Marchi wrote:
>>>> Kernel adds a " ns" at the end of engine utilization. Make sure we 
>>>> parse
>>>> it so we don't fail if there's another suitable unit chosen by the
>>>> driver or another format.
>>>>
>>>> This prepares the ground for xe driver which will use 2 timestamps
>>>> rather than 1 with a different unit, to make sure it's compatible with
>>>> SR-IOV so we don't have to handle the conversion between GPU and CPU
>>>> clock domains.
>>>>
>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> ---
>>>> lib/igt_drm_fdinfo.c | 22 +++++++++++++++-------
>>>> 1 file changed, 15 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>>> index 5f05f210e..1541a62c9 100644
>>>> --- a/lib/igt_drm_fdinfo.c
>>>> +++ b/lib/igt_drm_fdinfo.c
>>>> @@ -63,9 +63,10 @@ static const char *ignore_space(const char *s)
>>>>
>>>> static int parse_engine(const char *name, struct drm_client_fdinfo 
>>>> *info,
>>>>             const char **name_map, unsigned int map_entries,
>>>> -            uint64_t *val)
>>>> +            uint64_t *val, const char **unit)
>>>> {
>>>>     const char *p;
>>>> +    char *end_ptr;
>>>>     size_t name_len;
>>>>     int found = -1;
>>>>     unsigned int i;
>>>> @@ -103,8 +104,15 @@ static int parse_engine(const char *name, 
>>>> struct drm_client_fdinfo *info,
>>>>         }
>>>>     }
>>>>
>>>> -    if (found >= 0)
>>>> -        *val = strtoull(p, NULL, 10);
>>>> +    if (found < 0)
>>>> +        return found;
>>>> +
>>>> +    *val = strtoull(p, &end_ptr, 10);
>>>> +    if (p == end_ptr)
>>>> +        return -1;
>>>> +
>>>> +    if (unit)
>>>> +        *unit = end_ptr;
>>>>
>>>>     return found;
>>>> }
>>>> @@ -212,7 +220,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, 
>>>> struct drm_client_fdinfo *info,
>>>>     while ((l = strtok_r(_buf, "\n", &ctx))) {
>>>>         uint64_t val = 0;
>>>>         size_t keylen;
>>>> -        const char *v;
>>>> +        const char *v, *unit;
>>>>         char *end_ptr;
>>>>         int idx;
>>>>
>>>> @@ -237,15 +245,15 @@ __igt_parse_drm_fdinfo(int dir, const char 
>>>> *fd, struct drm_client_fdinfo *info,
>>>>             strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>>>>         } else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
>>>>             idx = parse_engine(l + keylen, info,
>>>> -                       name_map, map_entries, &val);
>>>> +                       name_map, map_entries, &val, NULL);
>>>>             if (idx >= 0) {
>>>>                 info->capacity[idx] = val;
>>>>                 num_capacity++;
>>>>             }
>>>>         } else if (strstartswith(l, "drm-engine-", &keylen)) {
>>>>             idx = parse_engine(l + keylen, info,
>>>> -                       name_map, map_entries, &val);
>>>> -            if (idx >= 0) {
>>>> +                       name_map, map_entries, &val, &unit);
>>>
>>> Should we ignore spaces in unit and then do a strcmp(unit, "ns")? OR 
>>> are we sure that there is just one space prior to unit here?
>>
>> Any type and number of whitespace shouldbe handled.
> 
> I can change this in igt, but...
> 
>>
>> I guess in drm-usage-stats.rst this needs to be improved:
>>
>> """
>> - Whitespace between the delimiter and first non-whitespace character 
>> shall be
>>  ignored when parsing.
>> - Keys are not allowed to contain whitespace characters.
>> - Numerical key value pairs can end with optional unit string.
>> """
>>
>> Perhaps append:
>>
>> - Whitespace between the value and the unit shall be ignored when 
>> parsing.
> 
> that would break userspace. Both nvtop and htop already do a strcmp
> with " ns". nvtop seems to use it for specific platforms (so as long as
> we don't change the existing one, it wouldn't break), but htop just
> handles that as "GPUs in Linux".

The joys of text formats failing to deliver flexibility. Might as well 
use binary..

Strictly speaking changing the spec would not break anything, as long as 
existing kernel side implementation stays. It would just ensure future 
implementation (on both sides) can be flexible and have been warned.

Regards,

Tvrtko
