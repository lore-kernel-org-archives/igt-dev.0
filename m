Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268BCCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 17:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE9D1127FC;
	Wed,  3 Apr 2024 17:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOlJhE7k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F87E1127FC
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712166974; x=1743702974;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bEp/1JlSVOrTVZ6PpCf0InZpEiIeQZIX9VRuOZfVzJk=;
 b=kOlJhE7kVVPBWEuAM0c8DkZLABDfEhj9ndvsm27ZeIdA8FlzQuYbuoC+
 vMF5YDqtwxnypXsW1RFwQkDlygd9PMcsJ59w8XmJNPN0VyUkS1P1Bud5r
 wm5gLwH4K9ZrC8NLkXSs1cl08r7r7fXMcjXG670gcCRps7hn8eRs7jopo
 mSLDY4pG2+tuWtjIt70teWOa9jjZ0NIV4o7QJarzZaEAAbM1Axnm5S/If
 QzfWJpkWKLgWUqM5dunS/SixSHcF+m3/jTKUypIgpCW/H9xohhajsnsXI
 s1r9TnJclxN8wI9LKtUq71Mjo99ZIWFgJ9AQvj+xoSRpAVodtK2H58FJk g==;
X-CSE-ConnectionGUID: R8xEawqHSEe5erH1xnJ28w==
X-CSE-MsgGUID: psticKfPShuglzTX/qasPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18149189"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18149189"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:56:08 -0700
X-CSE-ConnectionGUID: Cxyme9NtSqe8srtTH+f7yw==
X-CSE-MsgGUID: zO1WIJqDQsyMibCXvxewHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="55967010"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:56:07 -0700
Date: Wed, 3 Apr 2024 19:56:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 6/8] lib/igt_drm_fdinfo: Stop passing key twice
Message-ID: <20240403175603.7gdw67wcyv77gn2t@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-7-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-7-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-04-02 at 15:17:14 -0700, Lucas De Marchi wrote:
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
>  lib/igt_drm_fdinfo.c | 84 +++++++++++++++++++++++++-------------------
>  1 file changed, 48 insertions(+), 36 deletions(-)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 15f71e172..a0b41e956 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -53,6 +53,14 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
>  	return count > 0 ? count : 0;
>  }
>  
> +static const char *ignore_space(const char *s)
> +{
> +	for (; *s && isspace(*s); s++)
> +		;
> +
> +	return s;
> +}
> +
>  static int parse_engine(char *line, struct drm_client_fdinfo *info,
>  			size_t prefix_len,
>  			const char **name_map, unsigned int map_entries,
> @@ -104,21 +112,12 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
>  	return found;
>  }
>  
> -static const char *find_kv(const char *buf, const char *key, size_t keylen)
> +static const char *ignore_space(const char *s)
--------------------- ^

This should be removed from here, not added.

Regards,
Kamil

>  {
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
> +	for (; *s && isspace(*s); s++)
>  		;
>  
> -	return *p ? p : NULL;
> +	return s;
>  }
>  
>  static int parse_region(char *line, struct drm_client_fdinfo *info,
> @@ -205,6 +204,11 @@ out:
>  		}							\
>  	} while (0)
>  
> +#define strstartswith(a, b, plen__) ({					\
> +		*plen__ = strlen(b);					\
> +		strncmp(a, b, *plen__) == 0;				\
> +})
> +
>  unsigned int
>  __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>  		       const char **name_map, unsigned int map_entries,
> @@ -222,30 +226,39 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>  
>  	while ((l = strtok_r(_buf, "\n", &ctx))) {
>  		uint64_t val = 0;
> +		size_t keylen;
>  		const char *v;
>  		int idx;
>  
>  		_buf = NULL;
>  
> -		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
> -			strncpy(info->driver, v, sizeof(info->driver) - 1);
> -			good++;
> -		}  else if ((v = find_kv(l, "drm-client-id", strlen("drm-client-id")))) {
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
>  			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
> -		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
> -			idx = parse_engine(l, info,
> -					   strlen("drm-engine-capacity-"),
> +		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
> +			idx = parse_engine(l, info, keylen,
>  					   name_map, map_entries, &val);
>  			if (idx >= 0) {
>  				info->capacity[idx] = val;
>  				num_capacity++;
>  			}
> -		} else if (!strncmp(l, "drm-engine-", 11)) {
> -			idx = parse_engine(l, info, strlen("drm-engine-"),
> +		} else if (strstartswith(l, "drm-engine-", &keylen)) {
> +			idx = parse_engine(l, info, keylen,
>  					   name_map, map_entries, &val);
>  			if (idx >= 0) {
>  				if (!info->capacity[idx])
> @@ -255,25 +268,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>  				if (idx > info->last_engine_index)
>  					info->last_engine_index = idx;
>  			}
> -		} else if (!strncmp(l, "drm-total-", 10)) {
> -			idx = parse_region(l, info, strlen("drm-total-"),
> +		} else if (strstartswith(l, "drm-total-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>  					   region_map, region_entries, &val);
>  			UPDATE_REGION(idx, total, val);
> -		} else if (!strncmp(l, "drm-shared-", 11)) {
> -			idx = parse_region(l, info, strlen("drm-shared-"),
> +		} else if (strstartswith(l, "drm-shared-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>  					   region_map, region_entries, &val);
>  			UPDATE_REGION(idx, shared, val);
> -
> -		} else if (!strncmp(l, "drm-resident-", 13)) {
> -			idx = parse_region(l, info, strlen("drm-resident-"),
> +		} else if (strstartswith(l, "drm-resident-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>  					   region_map, region_entries, &val);
>  			UPDATE_REGION(idx, resident, val);
> -		} else if (!strncmp(l, "drm-purgeable-", 14)) {
> -			idx = parse_region(l, info, strlen("drm-purgeable-"),
> +		} else if (strstartswith(l, "drm-purgeable-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>  					   region_map, region_entries, &val);
>  			UPDATE_REGION(idx, purgeable, val);
> -		} else if (!strncmp(l, "drm-active-", 11)) {
> -			idx = parse_region(l, info, strlen("drm-active-"),
> +		} else if (strstartswith(l, "drm-active-", &keylen)) {
> +			idx = parse_region(l, info, keylen,
>  					   region_map, region_entries, &val);
>  			UPDATE_REGION(idx, active, val);
>  		}
> -- 
> 2.43.0
> 
