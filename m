Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9542AC47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EC810EDB3;
	Thu,  1 Feb 2024 13:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n09qcweP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FE010EDB3
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706793358; x=1738329358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g/gdzgVht+fiI6R/OekjwYTASXJ3lXi4Af6GOCeMczM=;
 b=n09qcwePGQC9LuRtU9Kj9Ab7TCo/KI60zMD6CiC0uUtGamKdpaNpp0dl
 ywbl4Pnisn88l/aV1jFHUPh7bPyOm0Hz39P14u8HXLEND7hMuN+DV1ulm
 rJ3fGru0s3/zGGW8sq507NqtTFPTUFS1pNBk9QEeyGKvc1JBElqHN+VIX
 8C2ZOjlgn9HqEP01dzzooT14fLzPwxLAekuCLqkeN0z7rL/T3rF8LLnqP
 5cbY2Ifd51ny78oQGJyyJXkiEyOus9W3h7qHtrtq5DGN9zaE+uLqy+3K4
 E/wyitjugxc3UvKxpkTafeCHz2MwqUXWWVWeE7JKY6iKuaUY1qzM0EMUM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10543636"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="10543636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:15:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="18905"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.219])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:15:56 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_sysfs: make sure to write empty strings
Date: Thu, 01 Feb 2024 14:15:53 +0100
Message-ID: <7831979.gsGJI6kyIV@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240201005115.352192-3-lucas.demarchi@intel.com>
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
 <20240201005115.352192-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Thursday, 1 February 2024 01:50:29 CET Lucas De Marchi wrote:
> 	echo -n "" > /sys/module/<modulename>/parameters/<param>
> 
> doesn't really work as it will just create a open() + close() expecting
> the file to be truncated. The same issue happens with igt as it will
> stop writing when there are 0 chars to write. Special case the empty
> string so it always write a '\0' and make sure igt_sysfs_set() accounts
> for the extra null char.
> 
> Shell example:
> 	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
> 	# cat /sys/module/firmware_class/parameters/path
> 	/foo
> 	# echo -n "" > /sys/module/firmware_class/parameters/path
> 	/foo
> 	# # make sure to actually write a \0:
> 	echo -ne "\0" > /sys/module/firmware_class/parameters/path
> 	# cat /sys/module/firmware_class/parameters/path
> 	/foo

Still not overwritten?  Isn't that a mistake?

> 
> Same thing happens when testing igt_sysfs_set():
>        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
>        igt_sysfs_set(dirfd, "path", "");
> 
> Previously it was not really setting the param.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_sysfs.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 567b4f6d5..814220ddb 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -406,7 +406,7 @@ int igt_sysfs_read(int dir, const char *attr, void 
*data, int len)
>   */
>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>  {
> -	int len = strlen(value);
> +	int len = strlen(value) + 1;
>  	return igt_sysfs_write(dir, attr, value, len) == len;
>  }
>  
> @@ -513,8 +513,16 @@ int igt_sysfs_vprintf(int dir, const char *attr, const 
char *fmt, va_list ap)
>  		return -errno;
>  
>  	va_copy(tmp, ap);
> -	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
> +	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);

Looks not related.

>  	va_end(tmp);
> +
> +	/*
> +	 * make sure to always issue a write() syscall, even if writing an 
empty string,
> +	 * otherwise values in sysfs like module parameters don't really get 
overwritten
> +	 */
> +	if (igt_debug_on(ret = 0))
> +		return igt_writen(fd, "", 1);

I think users may know that an empty string is going to be written, then may 
expect return value of 0, not 1.  Also, what value should we return to the 
user if (unlikely) we got 0 from igt_writen()?  write(2) says: "If count is 
zero and fd refers to a file other than a regular file, the results are not 
specified."

While resolving two instances of one and the same issue, you use two different 
approaches:
1) always increase the number of characters to be written by 1 when writing 
   strings, so at least the terminating null byte is always written,
2) divert to a separate call to igt_writen() that writes just the terminating 
   null byte when the string to be written is empty.
While both methods can work correctly, I think it would be more clear if you 
selected one of them and stuck to it, or provide a justification if not.

Thanks,
Janusz


> +
>  	if (igt_debug_on(ret < 0))
>  		return -EINVAL;
>  
> 




