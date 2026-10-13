Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9593ECC6B03
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 13:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4261D10E83B;
	Tue, 13 Oct 2026 13:23:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCDB10E0AA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791897779; x=1823433779;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/JSBxBQwmKiu9mXyE0Qk02MKactJFJ2/Jm3sSsOZ1JI=;
 b=Fzkmzhmnvtu0D/mmZKhFqY3G3e+YqgJsl1GR757pZLF013jfYm6pEq7k
 0DeADdsLAN9FGv54Tnqlg9CdlXS3rUgPvq66zokQlxxC/OD1QCuhF9ETz
 0HXoKtvd1lC6qx7s/4Yv3EUsGFKjXSVEyatZHRZX5p19jdZToPp+jFtgt
 IZyAdeqMxoDKDXA3E3LTQs2B3vO6THdFIo4tRziNbfjjWcbcEgZtgKg4E
 WyGT0Wsx94z+q/14HUvqvyEs42ojh2IcltuL8pyhGO7VKFaYvpne6o9DT
 71OABQAMK4zx0iVL6Kc6QwnUiQ8QODFJZwBiVaQh7yLZemFbaIvrsGIrZ w==;
X-CSE-ConnectionGUID: F0r69corTY6Zt964rfY3PA==
X-CSE-MsgGUID: /9Fx43XjQAKcRL4aOzYLHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="495861"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="495861"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 06:22:59 -0700
X-CSE-ConnectionGUID: sa0kNVIiRo6tlQQyXubqJw==
X-CSE-MsgGUID: tKMf6Ps8SZ2DRqyl0L1TGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="2935863"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 06:22:56 -0700
Date: Tue, 13 Oct 2026 15:22:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org, Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH v2 2/4] tests/intel/xe_wedged: Fix wedged dmesg ignore
 regex
Message-ID: <20261013132237.hlpandogbha3tjbw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org,
 Nishit Sharma <nishit.sharma@intel.com>
References: <20261009002912.1391610-1-shuicheng.lin@intel.com>
 <20261009002912.1391610-3-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009002912.1391610-3-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2026-10-09 at 00:29:10 +0000, Shuicheng Lin wrote:
> The kernel now reports the failed GT reset and the device wedge through
> SIGID-based logging:
> 
>   SIGID=106 FATAL (-ECANCELED) Tile0: GT0: GT: reset failed
>   SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!
> 
> which the existing "reset failed .-ECANCELED" and "declared device ...
> as wedged" patterns no longer match, so these expected errors are
> reported as dmesg-warn. Add patterns for the new messages.
> 
> Also fix the CAT error pattern, which never matched. The kernel reports
> it as either of:
> 
>   Tile0: GT0: Engine memory CAT error [3]: class=rcs, logical_mask: 0x1, guc_id=2
>   Tile0: GT0: Engine memory CAT error: class=ccs, logical_mask: 0x1, guc_id=5
> 
> The pattern only covered the first form, lacked the space before
> "class=", and used "\[", which igt_emit_ignore_dmesg_regex() passes to
> igt_runner through /dev/kmsg as "\x5c[" so it no longer matches a
> literal '['. Match only up to "Engine memory CAT error", which covers
> both forms. These lines are logged at info level, so this does not
> change the test result today.
> 
> v2: Simplify the SIGID patterns, match only the start of the CAT error
>     and add example lines (Kamil)
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_wedged.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 8c3c8bd36..4f5197e2a 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -41,6 +41,10 @@ static void ignore_wedged_in_dmesg(void)
>  				    "|GT[0-9A-Fa-f]*: Failed to submit"
>  				    "|Modules linked in:"
>  				    "|__pfx___drm_"
> +				    /* SIGID-based logging (newer kernels) */
> +				    "|-ECANCELED.* GT: reset failed"
> +				    "|-EIO. WEDGED: Device declared wedged"
> +				    "|IOCTLs and executions are now blocked"
>  				    "|Tile[0-9]+: GT[0-9A-Fa-f]*:$"
>  				    "|ASID: [0-9]+"
>  				    "|Faulted Address: 0x[0-9A-Fa-f]+"
> @@ -50,8 +54,7 @@ static void ignore_wedged_in_dmesg(void)
>  				    "|EngineClass: [0-9]+ [a-z]+"
>  				    "|EngineInstance: [0-9]+"
>  				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
> -				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
> -				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error");
>  }
>  
>  static void force_wedged(int fd)
> -- 
> 2.43.0
> 
