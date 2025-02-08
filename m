Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2833C02198
	for <igt-dev@archiver.kernel.org>; Sat,  8 Feb 2025 13:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D76610E030;
	Sat,  8 Feb 2025 13:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Scu0kQyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEFC10E030
 for <igt-dev@lists.freedesktop.org>; Sat,  8 Feb 2025 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739020090; x=1770556090;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=zT3XTSeytDpujws9kp0KGGmDR7BfLJTKO83hs98nHqU=;
 b=Scu0kQyx/LxPRG7sJPXqvaGWKsBUiZsOPLdDBZC3gayeOzSkJLLIbxv6
 eeun0OOJfFgHAU56avnrvyo06qm5uC8JGTP7jIvYOs5GOf6G9Ry412XXA
 RdCWeHArSOI1/tjhd80YOzSFa3gFzmbENdZ58G3C5zhVi+b6T51jjgLbi
 +NH7jPBp/h/CM/0Lo7Md0m8ZLO9UnD7LrjCg6rNX2S5Mk7YQ/jXcpN4PT
 DlrmmqYEX4Sqwqg0S9BUkRtEfdzMqKilapIVGJdnNEltznImZI9Hd4cen
 BpjbkbJucTWLIVY9BRwkX3Daq7vqk0dGZjzaXwA1Ga3CC6lqiUdxFHruo w==;
X-CSE-ConnectionGUID: QIhzwfk4SCy2+a1y4clguQ==
X-CSE-MsgGUID: H60pgOy2T3y1+PViQbd2zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39560930"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; d="scan'208";a="39560930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:08:10 -0800
X-CSE-ConnectionGUID: R/u7n9HvQ5WQ4Uz+2obmNg==
X-CSE-MsgGUID: ERGkLQMuRg6dR11K8gJxeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111604902"
Received: from arossa-mobl1.ger.corp.intel.com (HELO [10.245.98.254])
 ([10.245.98.254])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:08:09 -0800
Message-ID: <5ad10ad0-ab40-4f7c-b528-8c18e1fa4c48@linux.intel.com>
Date: Sat, 8 Feb 2025 14:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI i-g-t 07/10] runner: Fix use of newline on arguments
To: igt-dev@lists.freedesktop.org
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
 <20250207231039.2883195-9-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250207231039.2883195-9-lucas.demarchi@intel.com>
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
> Another fix is that now we just skip null values on the serialization
> side.  Previously it would serialize "(null)" and then load that string
> instead of NULL. Add code_coverage_script to the runner_test to cover
> that, which would previously fail.
> 

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  runner/runner_tests.c |  1 +
>  runner/settings.c     | 85 +++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 83 insertions(+), 3 deletions(-)
> 
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index 8441763f2..93b3ebc9f 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -200,6 +200,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
>  	igt_assert_eq(one->use_watchdog, two->use_watchdog);
>  	igt_assert_eqstr(one->test_root, two->test_root);
>  	igt_assert_eqstr(one->results_path, two->results_path);
> +	igt_assert_eqstr(one->code_coverage_script, two->code_coverage_script);
>  	igt_assert_eq(one->piglit_style_dmesg, two->piglit_style_dmesg);
>  	igt_assert_eq(one->dmesg_warn_level, two->dmesg_warn_level);
>  	igt_assert_eq(one->prune_mode, two->prune_mode);
> diff --git a/runner/settings.c b/runner/settings.c
> index 693c5484e..97b62ed36 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -7,6 +7,7 @@
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <getopt.h>
> +#include <inttypes.h>
>  #include <libgen.h>
>  #include <limits.h>
>  #include <stdio.h>
> @@ -1052,10 +1053,80 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
>  	return true;
>  }
>  
> +/*
> + * Serialize @s to @f, escaping '\' and '\n'. See unescape_str()
> + */
> +static void escape_str(const char *s, FILE *f)
> +{
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
> + *
> + * Escape chars using the form '\x<hex>h' so they don't interfere with the line
> + * parser.
> + *
> + * Return the number of chars saved in buf and optionally
> + * the number of chars scanned in @n_src if that is non-nul.
> + */
> +static ssize_t unescape_str(char *buf, size_t *n_src)
> +{
> +	size_t dst_len = 0;
> +	char *s = buf;
> +
> +	while (*s) {
> +		char next = *(s + 1);
> +
> +		if (*s != '\\') {
> +			buf[dst_len++] = *s++;
> +		} else if (next == 'x') {
> +			unsigned long num;
> +
> +			s += 2;
> +
> +			num = strtoul(s, &s, 16);
> +			/* cover both error due to overflow or invalid char */
> +			if (num > UINT8_MAX || *s != 'h')
> +				return -EINVAL;
> +
> +			buf[dst_len++] = num;
> +			s++;
> +		} else {
> +			return -EINVAL;
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
> +
>  #define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #name, s->name)
>  #define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
>  #define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
> -#define SERIALIZE_STR(f, s, name) SERIALIZE_LINE(f, s, name, "%s")
> +#define SERIALIZE_STR(f, s, name) do {		\
> +		if (s->name) {			\
> +			fputs(#name " : ", f);	\
> +			escape_str(s->name, f);	\
> +			fputc('\n', f);		\
> +		}				\
> +	} while (0)
>  bool serialize_settings(struct settings *settings)
>  {
>  	FILE *f;
> @@ -1171,9 +1242,17 @@ static char *parse_str(char **val)
>  {
>  	char *ret = *val;
>  
> -	*val = NULL;
> +	/*
> +	 * Unescaping a string is guaranteed to produce a string that is
> +	 * smaller or of the same size. Just modify it in place and leak the
> +	 * buffer
> +	 */
> +	if (unescape_str(ret, NULL) >= 0) {
> +		*val = NULL;
> +		return ret;
> +	}
>  
> -	return ret;
> +	return NULL;
>  }
>  
>  #define PARSE_LINE(s, name, val, field, _f)	\

