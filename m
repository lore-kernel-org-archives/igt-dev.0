Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD06C02193
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 09:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3757F10E169;
	Fri, 31 Jan 2025 09:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvXobxcF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570B810E169
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738315298; x=1769851298;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mYAwuu/OP68/MSA2NrXdOZzz4x1/BE4F4rNgtXxUxbg=;
 b=HvXobxcF8MFdfjnFIf9kUFKyMbL+K9D44jIuTdqWpycrCvL7OWGmZVAr
 PwGtoYVEnxx3hD8q9/HRbv+CEaMvhJRPcfnzG/882D8nXw3JYh8WRbUkJ
 rFKPMo+bQw5x4sWb2HDaJnH+dU7+gvC0axUoPd50b+IUccTlDlUZeJpGt
 FXG+WceoGiOOqzSEnOYonSCeh8MdE+2t3OnehiTWVwWx5bP4k+eiYrycu
 p3AIhOkQk5DrTJC/RcQS0cRdSiAuIfFeSrDj/kG4b5d4JjsqKTmLzGIEt
 nsd+gKXHgNHsaSOGF2brFYvuhhpzKqHzmanB7LZGUYhqYt3gK52qBdBLJ A==;
X-CSE-ConnectionGUID: i5mBstA8SKGS9dy5Cq9t+A==
X-CSE-MsgGUID: MVKmR8ElSSqgfU+i2/FjEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38762075"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="38762075"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 01:21:38 -0800
X-CSE-ConnectionGUID: c/JHUxD+QGSI+e7kZSe+2g==
X-CSE-MsgGUID: 3PlaF03XTUyLbhi9ka9bJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114576324"
Received: from kvaradha-mobl.amr.corp.intel.com (HELO [10.245.118.246])
 ([10.245.118.246])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 01:21:36 -0800
Message-ID: <9d00ce60-74a0-4392-87e8-9107a76e644d@linux.intel.com>
Date: Fri, 31 Jan 2025 10:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 07/10] runner: Fix use of newline on arguments
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-8-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250130172149.3657144-8-lucas.demarchi@intel.com>
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



On 30.01.2025 18:21, Lucas De Marchi wrote:
> Currently there's no support for newlines on arguments passed to runner.
> However it's also a silent failure:
> 
> 	# igt_runner --test-list '/tmp/test
> 	list2.txt' build/tests/ /tmp/results
> 
> 	# head /tmp/results/metadata.txt
> 	disk_usage_limit : 0
> 	test_list : /tmp/test
> 	list2.txt
> 	name : results
> 	...
> 
> 	# ./build/runner/igt_resume /tmp/results
> 	[9840425.334900] All tests already executed.
> 	resume failed at generating results
> 	Done.
> 
> Embedding a newline like this is very dubious for test-list, but it's
> used for e.g. hooks. In future we will add the command line to the
> metadata and possibly migrate the hooks, so add support for
> escaping/unescaping the string on save/restore.
> 
> The method chosen is slightly different than the one used for hooks:
> instead of adding a escape char and keeping the char escaped, this just
> prefers using an hex representation of the char with a \x<HEX>h
> sequence. This makes it easier when unescaping since the reader can
> continue reading one line per iteration. In future this can also be
> adopted by the hooks or even migrating the hooks to use metadata.txt.
> 
> For compatibility with previous parsing, it still prints "(null)" for
> NULL pointers: ideally there would be nothing printed to avoid the
> special case for this string.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  runner/settings.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 693c5484e..b527c01d9 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -1052,10 +1052,79 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
>  	return true;
>  }
>  
> +/*
> + * Serialize @s to @f, escaping '\' and '\n'. See unescape_str()
> + */
> +static void escape_str(const char *s, FILE *f)
> +{
> +	if (!s) {
> +		fputs("(null)", f);
> +		return;
> +	}
> +
> +	while (*s) {
> +		size_t len = strcspn(s, "\\\n");
> +
> +		if (len > 0) {
> +			fwrite(s, len, 1, f);
> +			s += len;
> +		}
> +
> +		if (*s) {
> +			fprintf(f, "\\x%xh", *s);
> +			s++;
> +		}
> +	}
> +}
> +
> +/*
> + * Unescape a '\' and '\n': undo escape_str

Nit: there is a specific format for documenting new functions. I have the impression
that the arguments are not properly documented.

> + *
> + * Exacpe chars using the form '\x<hex>h' so they don't interfere with the line
> + * parser.
> + *
> + * Return the number of chars saved in buf and optionally
> + * the number of chars scanned in @n_src if that is non-nul.
> + */
> +static size_t unescape_str(char *buf, size_t *n_src)
> +{
> +	size_t dst_len = 0;
> +	char *s = buf;
> +
> +	while (*s) {
> +		char next = *(s + 1);
> +
> +		if (*s != '\\') {
> +			buf[dst_len++] = *s++;
> +		} else if (*s == '\\' && next == 'x') {
> +			s += 2;
> +			buf[dst_len++] = strtoul(s, &s, 16);
> +			if (*s != 'h') {
> +				/* this shouldn't happen */
> +				return 0;
> +			}
> +			s++;
> +		} else {
> +			return 0;
> +		}
> +	}
> +
> +	buf[dst_len] = '\0';
> +
> +	if (n_src)
> +		*n_src = s - buf;
> +
> +	return dst_len;
> +}

Have you considered  json_tokener_parse() / json_object_get_string() ?
Glib' g_strescape () / g_strcompress() ? Not a fan of Glib,
but it is currently used anyway. Or even libcurl' curl_easy_escape() /
curl_easy_unescape()? Meson probes for the lib, but I did not see it in use.

My point being that it would be better to reuse instead of reinventing this
wheel. If you prefer to use your own, please add unit testing, I found at least
one issue:

Lorem ipsum dolor sit amet
Lorem ipsum dolor sit amet (26)

Lorem \xZZh ipsum dolor sit amet
Lorem  (0)

Lorem \x41h ipsum dolor sit amet
Lorem A ipsum dolor sit amet (32)

I guess you want to check strtoul() output for errors(can it cause an infinite
loop on error?), check buffer limits to prevent writing past allocated size,
and using error code such as -1 instead of failing with 0.

> +
>  #define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #name, s->name)
>  #define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
>  #define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
> -#define SERIALIZE_STR(f, s, name) SERIALIZE_LINE(f, s, name, "%s")
> +#define SERIALIZE_STR(f, s, name) do {	\
> +		fputs(#name " : ", f);	\
> +		escape_str(s->name, f);	\
> +		fputc('\n', f);		\
> +	} while (0)
>  bool serialize_settings(struct settings *settings)
>  {
>  	FILE *f;
> @@ -1171,6 +1240,12 @@ static char *parse_str(char **val)
>  {
>  	char *ret = *val;
>  
> +	/*
> +	 * Unescaping a string is guaranteed to produce a string that is
> +	 * smaller or of the same size. Just modify it in place and leak the
> +	 * buffer
> +	 */
> +	unescape_str(ret, NULL);
>  	*val = NULL;
>  
>  	return ret;

