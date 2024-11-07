Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68489D5D674
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 17:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083DC10E1A1;
	Thu,  7 Nov 2024 17:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2R2vhRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577BD10E1A1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 17:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731000709; x=1762536709;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x4fJHf3xBDBw5hSJDfO4I2w5vjTKhcnkAq+yXfHJbxM=;
 b=C2R2vhRC97EN7FFLZo9QFw9PGFnBPA2vZb+WJJ72fCM8f2uVnr7lUjeA
 AZ0uHa1RHaMzDXkvpy+LPlrgihqUI1Sd0AiUeQ3nAMmrB0RGGs86NVWIg
 zOD/yGuUn6dmGcs1y4O7+I0wJNxO7v/IVkxIHca2e4syRHU8cZeBawvk/
 BOHMuZjxhfBN7PP0s5+1dedhz5nU1xUjRQND3u1SRacmh+8/UzNLOM+1w
 Y3QKzKquUwRNb9aaeBBy9NgrcC2ZoLYzfypTYietpYttHDWp8gzs80VvA
 2x1IIDlX9RcgZpuiFvqbkFrChah6iwa9OMViEUkH2ZawlDA+WXDOfV2cG g==;
X-CSE-ConnectionGUID: OdMsc6Y0S1mMXpVRdXSxLQ==
X-CSE-MsgGUID: n266ro80SlSGLhiUhD12Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30281023"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="30281023"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 09:31:48 -0800
X-CSE-ConnectionGUID: m/PhcFwxT2yXRkMfZ4cZsg==
X-CSE-MsgGUID: xABzV4etTCCfszijN/P0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="84784721"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 09:31:48 -0800
Date: Thu, 7 Nov 2024 18:31:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Free log_buffer entries on exit
Message-ID: <20241107173145.avmfmvivykerfpz7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241107070208.3143050-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107070208.3143050-1-lucas.demarchi@intel.com>
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
On 2024-11-06 at 23:02:08 -0800, Lucas De Marchi wrote:
> Make sure the buffer entries are released, otherwise valgrind output
> becomes each used entry as still reachable on exit (up to 256).
> 
> Test:
> 	# valgrind --leak-check=full  ./build/tests/xe_live_ktest  --r xe_mocs
> 
> Before:
> 	==16082== LEAK SUMMARY:
> 	==16082==    definitely lost: 0 bytes in 0 blocks
> 	==16082==    indirectly lost: 0 bytes in 0 blocks
> 	==16082==      possibly lost: 0 bytes in 0 blocks
> 	==16082==    still reachable: 33,473 bytes in 59 blocks
> 
> After:
> 	==15992== LEAK SUMMARY:
> 	==15992==    definitely lost: 0 bytes in 0 blocks
> 	==15992==    indirectly lost: 0 bytes in 0 blocks
> 	==15992==      possibly lost: 0 bytes in 0 blocks
> 	==15992==    still reachable: 31,083 bytes in 42 blocks

Thank you for a patch, there are still some blocks left,
maybe because that buffer is a ring? e.g. it could have
end < start

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_core.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 407f7b551..879d1ecd8 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -469,11 +469,21 @@ static void _igt_log_buffer_append(char *line)
>  	pthread_mutex_unlock(&log_buffer_mutex);
>  }
>  
> +static void _igt_log_buffer_reset_locked(void)
> +{
> +	for (; log_buffer.start != log_buffer.end; log_buffer.start++) {
> +		free(log_buffer.entries[log_buffer.start]);
> +		log_buffer.entries[log_buffer.start] = NULL;
> +	}

Here you should use the same loop as in _dump, so

	i = log_buffer.start;
	do {
		// do ops here
		i++;
        } while (i != log_buffer.start && i != log_buffer.end);

Or even simpler, init with NULLs and then just free all?
For example, if start=2, end=1, there is still a valid pointer
at end==1

Or do one more ops for case 'end < start'

Regards,
Kamil

> +
> +	log_buffer.start = log_buffer.end = 0;
> +}
> +
>  static void _igt_log_buffer_reset(void)
>  {
>  	pthread_mutex_lock(&log_buffer_mutex);
>  
> -	log_buffer.start = log_buffer.end = 0;
> +	_igt_log_buffer_reset_locked();
>  
>  	pthread_mutex_unlock(&log_buffer_mutex);
>  }
> @@ -624,8 +634,7 @@ static void _igt_log_buffer_dump(void)
>  		i++;
>  	} while (i != log_buffer.start && i != log_buffer.end);
>  
> -	/* reset the buffer */
> -	log_buffer.start = log_buffer.end = 0;
> +	_igt_log_buffer_reset_locked();
>  
>  	_log_line_fprintf(stderr, "****  END  ****\n");
>  	pthread_mutex_unlock(&log_buffer_mutex);
> -- 
> 2.47.0
> 
