Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16687F4BB6F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 18:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD66910E5F0;
	Tue, 24 Feb 2026 18:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqA0X6Th";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6310210E5F0
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 18:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771957795; x=1803493795;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hENu2pId12JpXyEGtP9c1kSAwUx+aoM1RhtcItBrWCI=;
 b=FqA0X6Thqn1WzXmtKxIWzxAj27JAHFAjU1KIGyhHYAHX08Bj1YNFHGus
 zYWn+cInNIRaCYhI0QYxYCcj5lSi9rBIf+Fd5kg1k2PSe7rLt2/IttkBh
 VVjJygYYS+TPy3ouAiwtAMBu9KzxWwwBkW5OvX4TyaZf48t1p2qZnxkjm
 ToXkB8Jl9T37O07n7ojMbla0tUI3ecX2TD1A1iSXfUvEab7m+FV8kjfGn
 onHSjxTY6rWYEpxGIPFj/SM5x5btccCIHS+9R8IaNRt2czsy9PzuNs50P
 wFzW7k9ocLfNVOtr2sTdrII8uNah4lHwPEJq7uTXEpz+yMw6L0S7jDEa8 A==;
X-CSE-ConnectionGUID: CwHdxfclQr+SLAAHCg0zAg==
X-CSE-MsgGUID: /VOzrL/OQm6ki+FZPsxc6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84442883"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="84442883"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:29:54 -0800
X-CSE-ConnectionGUID: EISfHY/aQZO7toPywYOCkg==
X-CSE-MsgGUID: 5Q/fJ6cES+KmX/xi/9A72g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="238988692"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 10:29:53 -0800
Date: Tue, 24 Feb 2026 19:29:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, sashamcintosh@google.com
Subject: Re: [PATCH i-g-t] tests/kms_colorop: Include local glib header for
 Android
Message-ID: <20260224182951.zgjwbno22g5mwo5o@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 sashamcintosh@google.com
References: <20260223164151.3307217-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223164151.3307217-1-markyacoub@google.com>
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

Hi Mark,
On 2026-02-23 at 11:41:51 -0500, Mark Yacoub wrote:
> From: Sasha McIntosh <sashamcintosh@google.com>
> 
> igt-gpu-tools requires glib.h, which on Android is provided via a local
> header in the android/ directory.
> 
> Signed-off-by: Sasha McIntosh <sashamcintosh@google.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/kms_colorop.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 876f089fd..bb15350ef 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -6,7 +6,11 @@
>  #include "sw_sync.h"
>  #include "kms_colorop_helper.h"
>  
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  
>  /**
>   * TEST: kms colorop
> -- 
> 2.53.0.345.g96ddfc5eaa-goog
> 
