Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D53C5478C
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 15:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2B410E134;
	Fri,  1 Mar 2024 15:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zj3TALKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052F610EE15
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709306472; x=1740842472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xny5xtlgJUAFiZDV7NWLO6txkm7cJWvK7k/lb7Drfno=;
 b=Zj3TALKTPKULNoizHIq4/a4YrX2aAE4YUTA1hFYTfWlRBAsrOMUQO0qJ
 JMJzKUJywvpo3d1v1sroGLwmGaMHTAOuEwlGvCxPmLSvu2v2RFT8mtNA8
 7kP33c4VWeJxuSi3ENYHylHHu0cDz1p3kcFQec3H3hMTK0OtFxJvOAwam
 yVwk4sRc4LIERlzGHEadfH2XGZTiZ7g0c12BR78aA/wmBo+eEMM8NJk7z
 svIlc58264kIFE9VpaAMRMof+PRuyXk8KvdS93D1o5plfpQnUM3W69Fs5
 /DLC3AG0HzSCEchhNUbHaq016SbGhUYETzdPQLkJ0ImEanMyM4YgHjAxy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3699044"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3699044"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8456477"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.5.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:21:10 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v4 4/4] lib/igt_sysfs: make sure to write empty
 strings
Date: Fri, 01 Mar 2024 16:21:06 +0100
Message-ID: <2719060.uZKlY2gecq@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240228223134.3908035-4-lucas.demarchi@intel.com>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
 <20240228223134.3908035-4-lucas.demarchi@intel.com>
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

On Wednesday, 28 February 2024 23:31:34 CET Lucas De Marchi wrote:
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
> v4:
>   - Fix return code in igt_sysfs_vprintf() when fmt string is something
>     like "%c<more_fmt>", c, ..." so it still returns > 0 (Janusz)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  lib/igt_sysfs.c | 41 +++++++++++++++++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index a1ff5655d..0c5817eb1 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -348,7 +348,10 @@ int igt_sysfs_get_num_gt(int device)
>   * @data: the block to write from
>   * @len: the length to write
>   *
> - * This writes @len bytes from @data to the sysfs file.
> + * This writes @len bytes from @data to the sysfs file.  Contrary to
> + * igt_sysfs_set(), this does not automatically write a null char if len is 0.
> + * It's caller responsibility to pass the right len according to the data being
> + * written.
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
> @@ -520,17 +531,27 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>  		goto end;
>  	}
>  
> -	if (ret > sizeof(stack)) {
> -		unsigned int len = ret + 1;
> -
> -		buf = malloc(len);
> +	len = ret;
> +
> +	if (!ret) {
> +		/*
> +		 * Make sure to always issue a write() syscall, even if writing
> +		 * an empty string, otherwise values in sysfs like module
> +		 * parameters don't really get overwritten.  vsnprintf()
> +		 * guarantees to return a \0 terminated string, so just add
> +		 * that char. The return code is still the same as before, to
> +		 * abstract that from caller.
> +		 */
> +		ret = 1;
> +	} else if (ret > sizeof(stack)) {
> +		buf = malloc(len + 1);
>  		if (igt_debug_on(!buf)) {
>  			ret = -ENOMEM;
>  			goto end;
>  		}
>  
> -		ret = vsnprintf(buf, len, fmt, ap);
> -		if (igt_debug_on(ret != len - 1)) {
> +		ret = vsnprintf(buf, len + 1, fmt, ap);
> +		if (igt_debug_on(ret != len)) {
>  			ret = -EINVAL;
>  			goto free_buf;
>  		}
> @@ -538,6 +559,10 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>  
>  	ret = igt_writen(fd, buf, ret);
>  
> +	/* Caller shouldn't know about special sysfs handling, just return 0 */
> +	if (!len && ret == 1)
> +		ret = 0;
> +
>  free_buf:
>  	if (buf != stack)
>  		free(buf);
> 




