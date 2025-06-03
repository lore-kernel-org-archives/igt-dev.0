Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39C6C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9876910E6F6;
	Tue,  3 Jun 2025 15:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfOYtPTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84C910E62A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748965200; x=1780501200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8bY8dsRkdjKfKDzWDklw/ZslMifnKQw9pjWIRAJnXpk=;
 b=gfOYtPToAWrNliQvn/g/ww1ACCoKhx4ISIvHwkmzyPvyF0eny5f1F8rL
 RC9XX2aFh4gnMOK6GTNvYL26FuCq8a/HdzIIrCL+mHSt3K56XF/w0SDfG
 bix+N3rTp25VgpJyJC+VqM7xFUjhldPJUFgBWlH46XdkaiL923stfFCl3
 y6DtbmJTZat2aCiVr18fSxD/CsRZWcAw8F/dgTcKXck/yLtm4RW3nP5ii
 OJ6xx54AxqtGEB7m1NOmdT7iashKPYhG7MPbdocBM/Zm2SLviC9YQr2ov
 9uWRqBCpHAlL8LcH71SxbiarQryvxUAm0JP55JkFTWn5BFbtlmceKaypR g==;
X-CSE-ConnectionGUID: Hb5S4OjiS1Cj7SJi1Elqww==
X-CSE-MsgGUID: o5LTX1LrS+Cc6hSTox4dBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62403681"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="62403681"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:39:59 -0700
X-CSE-ConnectionGUID: sm4j4pI4RS+iSJYlmStkNg==
X-CSE-MsgGUID: W5thXIgZRrq/l01yFhXk9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149778884"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:39:57 -0700
Date: Tue, 3 Jun 2025 17:39:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 05/11] lib/igt_aux: Include local igt procps
 header for Android
Message-ID: <20250603153955.y6czcxkgi7dsyxpr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
 <20250602192515.95309-6-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602192515.95309-6-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-06-02 at 19:25:09 +0000, Jeevaka Prabu Badrappan wrote:
> As procps is not available in Android, added local stub procps header
> to build igt for Android. Inclusion of libproc2/pids.h is now
> conditional, based on the HAVE_LIBPROC2 definition, ensuring that it
> is only included when the library is available.

imho no need for explanation, so 2nd sentence could be deleted.
I guess that neither libprocps nor libproc2 are available on
Android.

> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_aux.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 2905824a5..83809e770 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -55,8 +55,12 @@
>  
>  #ifdef HAVE_LIBPROCPS
>  #  include <proc/readproc.h>
> -#else
> +#elif HAVE_LIBPROC2
>  #  include <libproc2/pids.h>
> +#else
> +#  ifdef ANDROID
> +#    include "android/procps.h"
> +#  endif
>  #endif
>  
>  #include <dirent.h>
> -- 
> 2.49.0
> 
