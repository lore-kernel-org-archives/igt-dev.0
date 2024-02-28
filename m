Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7A0C54E41
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 11:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B64810E424;
	Wed, 28 Feb 2024 11:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2NEoL76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0587D10E3D6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 11:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709118812; x=1740654812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yaj/GHxcNHL5CPTOOSJWAxvCkX5iuoygs+OcRH1VdaY=;
 b=g2NEoL76sxA3hG9ZbrljGTWCJFcdMcO4ci9tBdjOEWmUgR6D4Ws3cBM3
 CtL524CTsC1YkrmwdbGKIF2BEFXWdCTer7YmVQGr4BUHfyIJ2hzE3YZHV
 H2vAdkmGY1jP3PpndtCuWAnOIGCY6A1BBQYZQogexvuaRMGTVmftonzaq
 r49quYgJnJljqdbzNtnEZdAhjGKYhFytFTOitKh4JAd47e6OigQA5j7MV
 iLrhdVqnr8JXjedw+dP71oqckeRoYVkD71yjysDZLSPQnJA5xy9ySGJqg
 E8ItWHUAzOTtw0htEbNQeimaXZS+4LUjpE7Y0reXTTViuTMXMa3GnLGl6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3674299"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3674299"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 03:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12123750"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.24.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 03:13:29 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 3/3] lib/igt_sysfs: make sure to write empty
 strings
Date: Wed, 28 Feb 2024 12:13:22 +0100
Message-ID: <4978543.0VBMTVartN@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240228063211.3662862-3-lucas.demarchi@intel.com>
References: <20240228063211.3662862-1-lucas.demarchi@intel.com>
 <20240228063211.3662862-3-lucas.demarchi@intel.com>
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

Hi Lucas,

On Wednesday, 28 February 2024 07:32:11 CET Lucas De Marchi wrote:
> echo -n "" > /sys/module/<modulename>/parameters/<param>
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
> 
> Same thing happens when testing igt_sysfs_set():
>        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
>        igt_sysfs_set(dirfd, "path", "");
> 
> Previously it was not really setting the param.
> 
> v2:
>   - Fix return code from igt_sysfs_vprintf() to differentiate between
>     writing 1 or 0 chars (Janusz)
>   - Document the behavior of igt_sysfs_set() as being a higher-level
>     than igt_sysfs_write().
> v3:
>   - Partial "back to v1": include the \0 in the write only when writing
>     an empty string: there are some files in sysfs like pm_test that
>     don't like
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_sysfs.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 2997925e5..2d574cc17 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -349,6 +349,9 @@ int igt_sysfs_get_num_gt(int device)
>   * @len: the length to write
>   *
>   * This writes @len bytes from @data to the sysfs file.
> + * Contrary to igt_sysfs_set(), this does not automatically add a null char to

Should now read something like "this does not automatically write a null char 
if len is 0", I believe.

> + * terminate the data. It's caller responsibility to pass the right len
> + * according to the data being written.
>   *
>   * Returns:
>   * The number of bytes written, or -errno on error.
> @@ -407,6 +410,14 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>  {
>  	int len = strlen(value);
> +
> +	/*
> +	 * Always write at least 1 char, the null byte, otherwise it
> +	 * won't write anything on sysfs.
> +	 */
> +	if (!len)
> +		len = 1;
> +
>  	return igt_sysfs_write(dir, attr, value, len) == len;
>  }
>  
> @@ -506,7 +517,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>  {
>  	char stack[128], *buf = stack;
>  	va_list tmp;
> -	int ret, fd;
> +	int ret, fd, len;
>  
>  	fd = openat(dir, attr, O_WRONLY);
>  	if (igt_debug_on(fd < 0))
> @@ -520,8 +531,18 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>  		goto end;
>  	}
>  
> -	if (ret > sizeof(stack)) {
> -		unsigned int len = ret + 1;
> +	if (!ret) {
> +		/*
> +		 * Make sure to always issue a write() syscall, even if writing
> +		 * an empty string, otherwise values in sysfs like module
> +		 * parameters don't really get overwritten.  vsnprintf()
> +		 * guarantees to return a \0 terminated string, so just add
> +		 * that char. The return code is still the same as before, to
> +		 * abstract that from caller.
> +		 */
> +		len = 1;
> +	} else if (ret > sizeof(stack)) {
> +		len = ret + 1;
>  
>  		buf = malloc(len);
>  		if (igt_debug_on(!buf)) {
> @@ -536,7 +557,11 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>  		}
>  	}
>  
> -	ret = igt_writen(fd, buf, ret);
> +	ret = igt_writen(fd, buf, len);
> +
> +	/* Caller shouldn't know about special sysfs handling, just return 0 */
> +	if (ret == 1 && buf[0] == '\0')
> +		ret = 0;

Hmm, now we no longer support writing data with null character embedded at 
position 0.

How about keeping the original length of the resulting string in len? 
Seems easy to get with your code slightly modified:

  
 -	if (ret > sizeof(stack)) {
 -		unsigned int len = ret + 1;
++	len = ret;
 + 	if (!ret)
 +		/*
 +		 * Make sure to always issue a write() syscall, even if writing
 +		 * an empty string, otherwise values in sysfs like module
 +		 * parameters don't really get overwritten.  vsnprintf()
 +		 * guarantees to return a \0 terminated string, so just add
 +		 * that char. The return code is still the same as before, to
 +		 * abstract that from caller.
 +		 */
 +		ret = 1;
 +	} else if (ret > sizeof(stack)) {
-+		len = ret + 1;
- 
- 		buf = malloc(len);
+-
+- 		buf = malloc(len);
++ 		buf = malloc(len + 1);
  		if (igt_debug_on(!buf)) {
+ 			ret = -ENOMEM;
+ 			goto end;
+ 		}
+ 
+ 		ret = vsnprintf(buf, ret, fmt, ap);
+-		if (igt_debug_on(ret > len)) {
++		if (igt_debug_on(ret > len + 1)) {
+ 			ret = -EINVAL;
+ 			goto free_buf;
+ 		}

and then:

  	}
  
--	ret = igt_writen(fd, buf, ret);
-+	ret = igt_writen(fd, buf, len);
+ 	ret = igt_writen(fd, buf, ret);
 +
 +	/* Caller shouldn't know about special sysfs handling, just return 0 */
-+	if (ret == 1 && buf[0] == '\0')
++	if (!len && ret == 1)
 +		ret = 0;

Thanks,
Janusz


>  
>  free_buf:
>  	if (buf != stack)
> 




