Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41AEC54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 11:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E3210E115;
	Thu, 29 Feb 2024 11:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gx3BOi5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A6B10E115
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 11:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709204790; x=1740740790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o1nIoNm8AZTFUJ2e72xXELm/JGKWqUNrwlk2H3eXKZY=;
 b=Gx3BOi5mOVp3p+EicuQwgZnKeVRfwQ5Jd+5Gb0VCKwl7ZzP/gV67LvJp
 mgKybvroxDCozM9aU6KPdkjEa6bxIuwBNJJ1AMEy0Eyz9FOfeppoUuDEx
 +S7VpeF5jTyY2Uarm1cJfOqeVcb9/KTPg59KwPMLbQMB4Evp05s8fpG5v
 85/6cBCp0wPb3nf1ACE0lXm/WGN/Vk894ESOhF1rC9GPEMUL/4tcueqK6
 vp7DVRKwI0rgE1fh41rETjzzyUs4xczisikWZtiWIbv++Kd1Pa8QWkaEa
 SBhRnzpyXV4ewq8MtgSVMAKH9SJjoFGNhBL0actEmMtKgFqsVkAiCPPky g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7495028"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7495028"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:06:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8150481"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.24.92])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:06:27 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v4 2/4] lib/igt_sysfs: stop leaking fd on write
 failures
Date: Thu, 29 Feb 2024 12:06:24 +0100
Message-ID: <2538584.Sgy9Pd6rRy@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240228223134.3908035-2-lucas.demarchi@intel.com>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
 <20240228223134.3908035-2-lucas.demarchi@intel.com>
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

On Wednesday, 28 February 2024 23:31:32 CET Lucas De Marchi wrote:
> Make sure to close the fd before returning.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_sysfs.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 2b0225138..2997925e5 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -515,29 +515,36 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>  	va_copy(tmp, ap);
>  	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
>  	va_end(tmp);
> -	if (igt_debug_on(ret < 0))
> -		return -EINVAL;
> +	if (igt_debug_on(ret < 0)) {
> +		ret = -EINVAL;
> +		goto end;
> +	}
>  
>  	if (ret > sizeof(stack)) {
>  		unsigned int len = ret + 1;
>  
>  		buf = malloc(len);
> -		if (igt_debug_on(!buf))
> -			return -ENOMEM;
> +		if (igt_debug_on(!buf)) {
> +			ret = -ENOMEM;
> +			goto end;
> +		}
>  
>  		ret = vsnprintf(buf, ret, fmt, ap);
>  		if (igt_debug_on(ret > len)) {
> -			free(buf);
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto free_buf;
>  		}
>  	}
>  
>  	ret = igt_writen(fd, buf, ret);
>  
> -	close(fd);

How about moving the code that opens the fd from the top of the body of this 
function to just in front of the call to igt_writen(), and keeping this 
close() here?  That way we wouldn't need the end: section of the error unwind 
path, nor those two jumps to it.

Thanks,
Janusz


> +free_buf:
>  	if (buf != stack)
>  		free(buf);
>  
> +end:
> +	close(fd);
> +
>  	return ret;
>  }
>  
> 




