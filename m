Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A681BC47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3585810EDA2;
	Thu,  1 Feb 2024 13:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoS8ytuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B583310EDA2
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706793129; x=1738329129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8kOmtDqW6fFxHofqbFd+QMABTpm+X5t1jDNlHG4AEUM=;
 b=PoS8ytuCODj2hGDQ2bCmsDlXpNBFN4I1JuqoXjxBtxTaI5hcGGcvwt5P
 xIYXfgB4WkaSzIrtIWicucU2fZ6kjbe7Sb729DjgOOMa0ov8xZPC5/Qkq
 LBRM0UV42I6j3gPVg5T55badODVRJHMCMewWZ4/lHHGB5iHL36SucuVqC
 tRxv2+XBpvc5GnCzzf9e0hBFVLak1yg70rFP0NfEE9ivMpDSarY0kCjh1
 v9O4sxqbnjlAguvBU+LrHvNSsdxh2wS/LymlD3Su+n0azlaSVtHKyyBBB
 29ZpRZftMtxGVStTzziPL0HLWHHIGYj8NpkvWr7mEsyTSiQSjbCGfwYzv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="89510"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="89510"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:12:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788928916"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="788928916"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 05:12:07 -0800
Date: Thu, 1 Feb 2024 14:12:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/igt_sysfs: make sure to write empty strings
Message-ID: <20240201131204.7dlfp2ny46stzc2y@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240201005115.352192-3-lucas.demarchi@intel.com>
 <20240201031156.352973-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240201031156.352973-1-lucas.demarchi@intel.com>
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
On 2024-01-31 at 19:11:56 -0800, Lucas De Marchi wrote:
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
> index 567b4f6d5..64c2aaabb 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -406,7 +406,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
>   */
>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>  {
> -	int len = strlen(value);
> +	int len = strlen(value) + 1;
>  	return igt_sysfs_write(dir, attr, value, len) == len;

Why not adding write "\n" at end?

>  }
>  
> @@ -513,8 +513,16 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>  		return -errno;
>  
>  	va_copy(tmp, ap);
> -	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
> +	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
------------------- ^^^^^
Nice catch and looks like a separate bug fix, please send
as separate patch.

Regards,
Kamil

>  	va_end(tmp);
> +
> +	/*
> +	 * make sure to always issue a write() syscall, even if writing an empty string,
> +	 * otherwise values in sysfs like module parameters don't really get overwritten
> +	 */
> +	if (igt_debug_on(ret == 0))
> +		return igt_writen(fd, "", 1);
> +
>  	if (igt_debug_on(ret < 0))
>  		return -EINVAL;
>  
> -- 
> 2.43.0
> 
