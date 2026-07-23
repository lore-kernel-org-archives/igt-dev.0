Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73573C531D2
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 14:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D11E10E331;
	Thu, 23 Jul 2026 14:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIZqoAiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1328F10F138
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784816760; x=1816352760;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iSgBOafIinji02fhasuoFDxFxRLOdRNgtQUCY0o49g0=;
 b=fIZqoAivh12T+c4ci/0aGSaso7uFf+02Du7z5bMuICbK1JEl2syg4N+x
 xwwDnrZdvWBYMy6UytTHt3w+ZxFNqxPClBLo5Apozd+ObQKP15GhSK5do
 mgY6vgvmjcY/G8eXhTdmERMuFroee8/o18gnHt4eI5YsW0FM3iY/MjEVH
 FgSeRFUfDF3o0kDBNWFJ6fVmQmTEFymjBBObjzCXlIPZvrgIl2A6iztJu
 iX+m67bpEIFhelBBq3IK5C3jIK6RIZOrnomtVDAEE+LYIBM+xNRbYRG5j
 BTwcyMWsEnw7txrY79BexUc2mRr+p4r/pUG3UFDZlKQUyEfXGepCT6Ziq Q==;
X-CSE-ConnectionGUID: AD+mu0K8RY6DsJxMFj0QoA==
X-CSE-MsgGUID: l5nE1POpRaGOmQpxwxSKFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85323934"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85323934"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:26:00 -0700
X-CSE-ConnectionGUID: biH3+7cBQ7mlQ7Rhpvf8Rw==
X-CSE-MsgGUID: Mdcy/7QtSOGr5RWbBKllaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="263389010"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 07:25:58 -0700
Date: Thu, 23 Jul 2026 16:25:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 priyanka.dandamudi@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_threads: ignore expected hang
 timeout
Message-ID: <20260723142536.tygckacog3jdhqex@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@intel.com
References: <20260723023251.4522-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723023251.4522-1-himanshu.girotra@intel.com>
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

Hi Himanshu,
On 2026-07-23 at 08:02:51 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> The hang subtests hang a queue and reset to recover. Jobs that were
> queued but never started are logged by the KMD at warn level as
> "Check job timeout: ... not started".
> 
> This warn is expected, but CI flags warn-level dmesg lines and fails
> the subtest even though it passes. Whitelist it for the hang subtests.

s/Whitelist/Ignore/

> 
> v2: Rework description and comment to be generic (Priyanka,Kamil)
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 0480df779..2974fc312 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1468,6 +1468,16 @@ static void threads(int fd, int flags)
>  	pthread_barrier_destroy(&barrier);
>  }
>  
> +/*
> + * Hang subtests reset the GPU to recover, so jobs that never started are
> + * logged as "Check job timeout: ... not started". This warn is expected;
> + * whitelist it to avoid spurious dmesg-warn failures in CI.

s/whitelist/ignore/

> + */
> +static void ignore_multi_queue_hang_warnings_in_dmesg(void)
> +{
> +	igt_emit_ignore_dmesg_regex("Check job timeout: .*not started");
> +}
> +
>  int igt_main()
>  {
>  	const struct section {
> @@ -1735,6 +1745,9 @@ int igt_main()
>  				igt_assert(!(s->flags & BALANCER));
>  			}
>  
> +			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))

Why not simpler:
			if (s->flags & (MULTI_QUEUE | HANG))



Regards,
Kamil

> +				ignore_multi_queue_hang_warnings_in_dmesg();
> +
>  			threads(fd, s->flags);
>  		}
>  	}
> -- 
> 2.50.1
> 
