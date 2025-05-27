Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CE8C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 16:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94DB10E52D;
	Tue, 27 May 2025 16:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LO3rGYhd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675E310E526
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362439; x=1779898439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LWF5avwpRZn55asGWewu+W9CPDs8qVV32QkoUiKcVyQ=;
 b=LO3rGYhdkcZbpbPQhH1+Yd4y+PS26E73w6I6zTPIDpuLKxrtNRNOAATN
 /LrM4VcyEn+uDw0RujCzRMem74LvTITTb5kbEsgxsD8PnKtCF6ttiM5H1
 M3NetujA59uXyPtJUdYcxsRXQgiKdWsjgKZ2khCkOgxRCsvfVKNQUDgry
 pMOqkxyAge3yPB5yoojpTIBVTaQ6dKi2PEfo/rltd3kbmp3nrOcY1vtZx
 Tc1gUwCvK6KE9bPzGWw9u53S/u1d6O2VC1P6JR/Va9D3oapEUCoyP+kwF
 E/kLbaRlOGgnp/1ekdyueYxAep4gESSFpQSuArlaOPeRcsD7oSKUyUINI A==;
X-CSE-ConnectionGUID: 0EhJ8YgSSNGKfy/3KG1nFg==
X-CSE-MsgGUID: TG3/xbPdQB6DfLs4R4Bwyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50417411"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50417411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:13:58 -0700
X-CSE-ConnectionGUID: YMoozy9qSwS9DuRyzfXmKA==
X-CSE-MsgGUID: 2VLf2w0BREmGot7GODONHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="173839565"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:13:57 -0700
Date: Tue, 27 May 2025 18:13:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH i-g-t v4 4/9] lib/igt_perf: fixup scan formatting for
 files in lib
Message-ID: <20250527161354.3jhv7igf7ai7puel@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
 <20250527120421.79026-5-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527120421.79026-5-jan.sokolowski@intel.com>
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

Hi Jan,
On 2025-05-27 at 12:04:16 +0000, Jan Sokolowski wrote:

please improve subject (follow guide for 1/9 patch)

> Compiling on other architectures than x86-64 causes a lot
> of scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. SCNx64.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  lib/igt_perf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index fb2b73915..2b7170094 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -5,6 +5,7 @@
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/stat.h>
> +#include <inttypes.h>

Still in wrong place, place it in alphabeticall order,
before limits.h

>  #ifdef __linux__
>  #include <sys/sysinfo.h>
>  #include <sys/sysmacros.h>
> @@ -157,7 +158,7 @@ int perf_event_config(const char *device, const char *event, uint64_t *config)
>  		return -EINVAL;
>  
>  	buf[bytes] = '\0';
> -	ret = sscanf(buf, "event=0x%lx", config);
> +	ret = sscanf(buf, "event=0x%" SCNx64, config);

This is ok.

Regards,
Kamil

>  	if (ret != 1)
>  		return -EINVAL;
>  
> -- 
> 2.34.1
> 
