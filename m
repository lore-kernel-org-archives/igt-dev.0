Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE2EC5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 10:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C17510E803;
	Thu,  5 Jun 2025 10:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwtSEVPU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CC210E803
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749117728; x=1780653728;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5506CHk4a/0ljKIzWR5FVbltjmU3/DFy1p3FBD7zpmc=;
 b=fwtSEVPUkuyczEhHqei9f1vaJY/nzUrQGQBbQE7Ulkjibp8B5J5orD9A
 fUnVvWtykCXodu8RltcCrufqusPehK13yPbNrAMFZyeyRnv8z0T2t0kk0
 /P71Fd/GJSSinTMfzssjzG4NB8WJeLJMAJ019C+y+Kzl3f8kE0hWP9OTI
 /yXglUTD2+ODMTc2EGsEH9L8GH5JQr68bXo/sFwnc7yT1fJ8WNzdGX98r
 n8F+lCPzCg7kA4AhcAS2cypVfr1YwWSDD2CruzxnXfTWJejvB6KUGCCN6
 92JEK1IGWPsFqeIkXQBNPKSh7y1AtpLEenCKduUD+jkB6mhhfdFpsqIQl Q==;
X-CSE-ConnectionGUID: t/Tt/Z2UTvSwkGnJXy0IbA==
X-CSE-MsgGUID: TNs+NvOWRPOyiBdJstsVIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51100997"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="51100997"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:02:08 -0700
X-CSE-ConnectionGUID: pKeKG9o0QeWQaFVoPbKxxg==
X-CSE-MsgGUID: gasxyA6MSw2AbpF9r4QbLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="176414406"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 03:02:06 -0700
Date: Thu, 5 Jun 2025 12:02:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v15 3/9] lib/igt_aux: Handle absence of libproc2 in Android
Message-ID: <20250605100203.jzgovjrkwhq2beg3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
 <20250604171656.31559-4-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250604171656.31559-4-jeevaka.badrappan@intel.com>
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
On 2025-06-04 at 17:16:50 +0000, Jeevaka Prabu Badrappan wrote:
> Handle the absence of libproc2 in Android by conditionally including
> libproc2 headers and function calls based on the definition of
> HAVE_LIBPROC2. This ensures compatibility by only compiling
> libproc2-related code when the library is available.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_aux.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 2905824a5..5c2679812 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -55,7 +55,7 @@
>  
>  #ifdef HAVE_LIBPROCPS
>  #  include <proc/readproc.h>
> -#else
> +#elif HAVE_LIBPROC2
>  #  include <libproc2/pids.h>
>  #endif
>  
> @@ -1289,7 +1289,7 @@ struct igt_process {
>  #ifdef HAVE_LIBPROCPS
>  	PROCTAB * proc;
>  	proc_t *proc_info;
> -#else
> +#elif HAVE_LIBPROC2
>  	struct pids_info *info;
>  	struct pids_stack *stack;
>  #endif
> @@ -1305,7 +1305,7 @@ static void open_process(struct igt_process *prcs)
>  	prcs->proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
>  	igt_assert_f(prcs->proc != NULL, "procps open failed\n");
>  	prcs->proc_info = NULL;
> -#else
> +#elif HAVE_LIBPROC2
>  	enum pids_item Items[] = { PIDS_ID_PID, PIDS_ID_EUID, PIDS_ID_EGID, PIDS_CMD };
>  	int err;
>  
> @@ -1327,7 +1327,7 @@ static void close_process(struct igt_process *prcs)
>  	closeproc(prcs->proc);
>  	prcs->proc_info = NULL;
>  	prcs->proc = NULL;
> -#else
> +#elif HAVE_LIBPROC2
>  	procps_pids_unref(&prcs->info);
>  	prcs->info = NULL;
>  #endif
> @@ -1351,7 +1351,7 @@ static bool get_process_ids(struct igt_process *prcs)
>  		prcs->egid = prcs->proc_info->egid;
>  		prcs->comm = prcs->proc_info->cmd;
>  	}
> -#else
> +#elif HAVE_LIBPROC2
>  	enum rel_items { EU_PID, EU_EUID, EU_EGID, EU_CMD }; // order at open
>  
>  	prcs->tid = 0;
> -- 
> 2.49.0
> 
