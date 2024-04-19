Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB79C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 18:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE5710FC25;
	Fri, 19 Apr 2024 18:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="I4tGSKVX";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575F310FC25
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 18:34:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-419c8236b34so5278565e9.0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713551680; x=1714156480;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8dArLbXXyJQIDkT4eKnSB625CVcAtRyPMR1o/m8G3ls=;
 b=I4tGSKVXfiBAGN4rr+QqsHbiMfOkbYjIEwZmkI/cZ/aRG7AVh/nAMmJFxLQq4pOIiD
 cX+qPQGi4OIHDHt4ybtVMTgfgGaN+B/M5G0MN5Pd3dSRTQDtoMmVDECjX/lxKTIVd8PN
 XBtqroSUyIhDjUe49X2O0p2zzvEtNIdlV0S+KjDqkP3eUtGDlLJdcD8fmV4tF/CaSLzi
 P9V6j5ulKTZWJsCRJdb/SbdazBwglTEoGLofoShM3UiwfAv/s+ipFZiaXuNI16pQE75+
 p9L+7eV+lDngEUTPyCd7M+dX/WTjJbUWUYXbqkoIQGGn7LBzmZQewFf00nnaft2ObpeM
 aKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713551680; x=1714156480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8dArLbXXyJQIDkT4eKnSB625CVcAtRyPMR1o/m8G3ls=;
 b=aYfNCMcATxyYY52ffrZiPCrS0OlWiRN7ymOYYLYMTRUStldlIQBOzLZfslEt3kCRYy
 7XgPl5PkbaNbLzfiNwUF+EGupIMeyuNjrDQHVAUHMemAeCe/qjP79egCaeNVY9pJvqSd
 XKVlsQzVseqPiHUMkHCH5McvjcHXKcokC7GbbIcrOMdHbrYFMBzf1YuHjGZXBoUd5M6g
 tNCKE/Iz07YkZb45Tq/jRlS0BNirFGyEgJtSBrvn1PrX2ucMepfMWuaLwSQ2C8NEvr5x
 bu/+2LKxvb8/1wiE/DqE0I3QhhEvhFyGmlaSdrPPvpWv+GaTbnaXCUIrNF4BSR0DAGp5
 DC5Q==
X-Gm-Message-State: AOJu0YwKM9WlqtY1tJ/66JRo1fVCiOj39m+Edj3O323e8nJQuy8kV7Xq
 +fr2Rb3gDnefp/sL47syGW13+0bN4XejpnGS2IWx4h6/LxzkcSmRm7Yw75uiSbE=
X-Google-Smtp-Source: AGHT+IFF8J2zW+DP53eaUw3cYhNlqX/OJ2zzFdhfYXD5gU9i5kLltY2r9JRwEWb9F8AbhJQc6AemRg==
X-Received: by 2002:a05:600c:474a:b0:416:643d:862 with SMTP id
 w10-20020a05600c474a00b00416643d0862mr2348578wmo.25.1713551680349; 
 Fri, 19 Apr 2024 11:34:40 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c3b8600b0041892e839bcsm7517789wms.33.2024.04.19.11.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 11:34:40 -0700 (PDT)
Message-ID: <080cdfa1-6105-479e-8b1d-49759d5daa0e@ursulin.net>
Date: Fri, 19 Apr 2024 19:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/12] lib/igt_drm_fdinfo: Stop passing key twice
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-2-lucas.demarchi@intel.com>
 <434d02cf-c683-40e6-b2f6-3462516a104e@ursulin.net>
 <u7r2vd45ex7k5yyji3bfxysck5vtlsp233nofahzxwpcx4cqar@nffa7y555i6x>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <u7r2vd45ex7k5yyji3bfxysck5vtlsp233nofahzxwpcx4cqar@nffa7y555i6x>
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


On 19/04/2024 17:35, Lucas De Marchi wrote:
> On Fri, Apr 19, 2024 at 08:42:50AM GMT, Tvrtko Ursulin wrote:
>>
>> On 05/04/2024 07:00, Lucas De Marchi wrote:
>>> Change strstartswith() so it also returns the length, which then can be
>>> used inside the branch when it matches. A good compiler shall optimize
>>> out the strlen call since the argument is a constant literal.
>>>
>>> With this, the find_kv() is not needed anymore and the difference with
>>> regard the other branches can be summarized with a new ignore_space()
>>> helper and the fact it matches the entire key by appending the ':'. The
>>> helper is added on top of the file so it can be reused later.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  lib/igt_drm_fdinfo.c | 87 +++++++++++++++++++++++---------------------
>>>  1 file changed, 45 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>> index 18dbb5d0b..bfc946f24 100644
>>> --- a/lib/igt_drm_fdinfo.c
>>> +++ b/lib/igt_drm_fdinfo.c
>>> @@ -53,6 +53,14 @@ static size_t read_fdinfo(char *buf, const size_t 
>>> sz, int at, const char *name)
>>>      return count > 0 ? count : 0;
>>>  }
>>> +static const char *ignore_space(const char *s)
>>> +{
>>> +    for (; *s && isspace(*s); s++)
>>> +        ;
>>> +
>>> +    return s;
>>> +}
>>> +
>>>  static int parse_engine(char *line, struct drm_client_fdinfo *info,
>>>              size_t prefix_len,
>>>              const char **name_map, unsigned int map_entries,
>>> @@ -104,23 +112,6 @@ static int parse_engine(char *line, struct 
>>> drm_client_fdinfo *info,
>>>      return found;
>>>  }
>>> -static const char *find_kv(const char *buf, const char *key, size_t 
>>> keylen)
>>> -{
>>> -    const char *p;
>>> -
>>> -    if (strncmp(buf, key, keylen))
>>> -        return NULL;
>>> -
>>> -    p = buf + keylen;
>>> -    if (*p != ':')
>>> -        return NULL;
>>> -
>>> -    for (p++; *p && isspace(*p); p++)
>>> -        ;
>>> -
>>> -    return *p ? p : NULL;
>>> -}
>>> -
>>>  static int parse_region(char *line, struct drm_client_fdinfo *info,
>>>              size_t prefix_len,
>>>              const char **region_map, unsigned int region_entries,
>>> @@ -205,6 +196,11 @@ out:
>>>          }                            \
>>>      } while (0)
>>> +#define strstartswith(a, b, plen__) ({                    \
>>> +        *plen__ = strlen(b);                    \
>>> +        strncmp(a, b, *plen__) == 0;                \
>>> +})
>>
>> Did it have to be a macro for optimization to work?
> 
> if it's a function, it won't be handled as a string literal anymore and
> may be a real strlen() call.  The compiler may or may not detect that.
> 
>>
>>> +
>>>  unsigned int
>>>  __igt_parse_drm_fdinfo(int dir, const char *fd, struct 
>>> drm_client_fdinfo *info,
>>>                 const char **name_map, unsigned int map_entries,
>>> @@ -222,31 +218,39 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, 
>>> struct drm_client_fdinfo *info,
>>>      while ((l = strtok_r(_buf, "\n", &ctx))) {
>>>          uint64_t val = 0;
>>> +        size_t keylen;
>>>          const char *v;
>>>          int idx;
>>>          _buf = NULL;
>>> -        if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
>>> -            strncpy(info->driver, v, sizeof(info->driver) - 1);
>>> -            good++;
>>> -        }  else if ((v = find_kv(l, "drm-client-id",
>>> -                     strlen("drm-client-id")))) {
>>> -            info->id = atol(v);
>>> -            good++;
>>> -        } else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
>>> -            /* optional */
>>> +        if (strstartswith(l, "drm-driver:", &keylen)) {
>>> +            v = l + keylen;
>>> +            v = ignore_space(v);
>>> +            if (*v) {
>>> +                strncpy(info->driver, v, sizeof(info->driver) - 1);
>>> +                good++;
>>> +            }
>>> +        }  else if (strstartswith(l, "drm-client-id:", &keylen)) {
>>> +            v = l + keylen;
>>> +            v = ignore_space(v);
>>> +            if (*v) {
>>> +                info->id = atol(v);
>>> +                good++;
>>> +            }
>>> +        } else if (strstartswith(l, "drm-pdev:", &keylen)) {
>>> +            v = l + keylen;
>>> +            v = ignore_space(v);
>>
>> Removing find_kv looks like a slight negative, given how now all 
>> branches have to repeat v =  + keylen; v = ignore_space(v).
> 
> the ignore_space() is later removed (my bad on the patch split here
> since I only noticed later when converting to strtoull())
> 
>>
>> I wonder if it would work by extending find_kv to allow prefix 
>> matching mode, something like this (only two branches show to 
>> illustrate the modes):
>>
>> ...
>>         } else if ((v = find_kv(l, "drm-pdev", MATCH_FULL, &keylen))) {
> 
> with the downside that then there will be a real strlen() on the key.

I thought you said it worked. And I thought I tried and saw it working. 
Bummer..

> I can try playing with the patches to bring find_kv() back.

If you don't see any readability savings by the end of the series then 
don't bother.

Regards,

Tvrtko
