Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDA8C02198
	for <igt-dev@archiver.kernel.org>; Sat,  8 Feb 2025 13:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4C110E030;
	Sat,  8 Feb 2025 13:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXdiXARo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5919710E030
 for <igt-dev@lists.freedesktop.org>; Sat,  8 Feb 2025 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739020110; x=1770556110;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Ie0Sh45SYHAMFuCZOH4HmMxR+I2a1mnqEzUfwoRcQR0=;
 b=bXdiXARo9wgiQc7tvo5O6SmcCQT/evgD/tg0GsanthWBNQ5/SOLlGcz4
 d0k34+0XkcNipnXXMoZlnp6OGWtyYtCAD/camzHACPSZU2fJ9X73zS9Mk
 KUVEv1dMcUIzGFHIqirOdHQfolDG7QXkMhE4JXooZwWuV10OuXoTpFBFa
 9WNFHBnSkpmIpmTFckLfmlI12KS+/8oe/U1PgjiFwk5R2qNk9C0nIhbYo
 ks5+/Ate42sjKnHWtthh+I3pdwlMGSIFBz6ynEwSVy9EzcQ69D9O3zHWE
 7i0WuaUnGn7R/S01tkXnLvVkRs49XrPu/ZuyA801ARNikfgohTzzkoi5y w==;
X-CSE-ConnectionGUID: 2+4JaoTaT72hByQHm97U7A==
X-CSE-MsgGUID: Gz5+5etgQOGSLzFdP3cuVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="51042184"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; d="scan'208";a="51042184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:08:30 -0800
X-CSE-ConnectionGUID: 01SAAs7XSOiP0xLUnz3F0A==
X-CSE-MsgGUID: 5q8BvpuYTFWYEEQxGDXGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; d="scan'208";a="142638383"
Received: from arossa-mobl1.ger.corp.intel.com (HELO [10.245.98.254])
 ([10.245.98.254])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:08:30 -0800
Message-ID: <4cbd97a1-c354-415a-8d49-816d4850398b@linux.intel.com>
Date: Sat, 8 Feb 2025 14:08:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI i-g-t 08/10] runner/settings: Add helpers to serialize/parse
 array
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
 <20250207231039.2883195-10-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250207231039.2883195-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 08.02.2025 00:09, Lucas De Marchi wrote:
> Prepare parser/serialize to handle arrays.
> 

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  runner/settings.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 97b62ed36..1da005806 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -1127,6 +1127,15 @@ static ssize_t unescape_str(char *buf, size_t *n_src)
>  			fputc('\n', f);		\
>  		}				\
>  	} while (0)
> +#define SERIALIZE_STR_ARRAY(f, s, name, name_len)		\
> +	do {							\
> +		SERIALIZE_INT(f, s, name_len);			\
> +		for (int _i = 0; _i < s->name_len; _i++) {	\
> +			fprintf(f, #name "[%d] : ", _i);	\
> +			escape_str(s->name[_i], f);		\
> +			fputc('\n', f);				\
> +		}						\
> +	} while (0)
>  bool serialize_settings(struct settings *settings)
>  {
>  	FILE *f;
> @@ -1223,6 +1232,7 @@ bool serialize_settings(struct settings *settings)
>  	close(dirfd);
>  	return true;
>  }
> +#undef SERIALIZE_STR_ARRAY
>  #undef SERIALIZE_STR
>  #undef SERIALIZE_UL
>  #undef SERIALIZE_INT
> @@ -1260,9 +1270,25 @@ static char *parse_str(char **val)
>  		s->field = _f(val);		\
>  		goto cleanup;			\
>  	}
> +#define PARSE_LINE_ARRAY(s, name, val, field, field_len, _f)		\
> +	do {								\
> +		int idx;						\
> +		if (!strcmp(name, #field_len)) {			\
> +			s->field_len = parse_int(val);			\
> +			s->field = calloc(s->field_len,			\
> +					  sizeof(*s->field));		\
> +			goto cleanup;					\
> +		} else if (sscanf(name, #field "[%u]", &idx) == 1 &&	\
> +			   idx < s->field_len) {			\
> +			s->field[idx] = _f(val);			\
> +			goto cleanup;					\
> +		}							\
> +	} while (0)
>  #define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, &val, field, parse_int)
>  #define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, &val, field, parse_ul)
>  #define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, &val, field, parse_str)
> +#define PARSE_STR_ARRAY(s, name, val, field, field_len) \
> +	PARSE_LINE_ARRAY(s, name, &val, field, field_len, parse_str)
>  bool read_settings_from_file(struct settings *settings, FILE *f)
>  {
>  	char *name = NULL, *val = NULL;
> @@ -1315,9 +1341,11 @@ cleanup:
>  
>  	return true;
>  }
> +#undef PARSE_STR_ARRAY
>  #undef PARSE_STR
>  #undef PARSE_UL
>  #undef PARSE_INT
> +#undef PARSE_LINE_ARRAY
>  #undef PARSE_LINE
>  
>  /**

