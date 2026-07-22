Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29890C44539
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 10:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB31D10ED12;
	Wed, 22 Jul 2026 10:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ej5uaC+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C253910ED12
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784714559; x=1816250559;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WumqjCFYTVHdpATtQ1XXbTiMNAKmNoQCqWTyf3/Tgmc=;
 b=ej5uaC+SFLFNQXZDvlFJD83DyZbm1mdnc/RFOFlGLaPfkXrHnO2bzx5t
 lVmARXLgKPBjoRapvnPPok08Al21DGbFQDFKbE2k57A8IOsgHqkLhIvOv
 u7NGsKsJEnWPJjro1tT1/SbhzDnhnlw4RGarvCSwlEYgmSHN1rHlOawrD
 DtXP/B5erLLX85V+hpO/caigroSDpe/S8exuayr/9xy62lbpbGc40G5T8
 pJoI4zhICZhxY3z7VSFt4aS+UVtKBsS6Evi+SGVcFlnk45opc6BszpCxW
 odsFNXap1ZQv302u+Gk9gkug2epRJx9Zkrji5u00Cg9Sk6TBGSieGr9+J A==;
X-CSE-ConnectionGUID: uGkLbIkRRBScCK7J5ykUBA==
X-CSE-MsgGUID: 7ALGPriiRveDBXAmAPnI6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85199287"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85199287"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:02:39 -0700
X-CSE-ConnectionGUID: IqQq9/SZQi+TRDueBHbnSA==
X-CSE-MsgGUID: 7iveJQ8UQ/iTuxptKf/Z3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="256813736"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 03:02:39 -0700
Date: Wed, 22 Jul 2026 12:02:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_threads: whitelist expected
 multi-queue hang dmesg warns
Message-ID: <20260722100235.o2zhf7et3xnyiteu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org
References: <20260721130405.25573-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721130405.25573-1-himanshu.girotra@intel.com>
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
On 2026-07-21 at 18:34:05 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>

please make subject little shorter, imho better:

[PATCH i-g-t] tests/intel/xe_exec_threads: ignore multi-queue hang dmesg warns

> 
> Multi-queue hang subtests hang one queue and reset the whole group.
> Sibling jobs that never started get logged by the KMD as
> "Check job timeout: ... not started" at warn level, which shows up as a
> dmesg-warn in CI even though the test passes.
> 
> These warnings are expected for multi-queue hangs (single-queue hangs
> don't hit this path), so whitelist them when the subtest has both
> MULTI_QUEUE and HANG set.
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 0480df779..21529e863 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1468,6 +1468,19 @@ static void threads(int fd, int flags)
>  	pthread_barrier_destroy(&barrier);
>  }
>  
> +/*
> + * Multi-queue hang subtests hang one queue of a group. The group's queues
> + * are scheduled together, so sibling jobs stay queued behind the hung one and
> + * never start; when the TDR resets the group, the KMD reports each unstarted
> + * sibling as "Check job timeout: ... not started". These warns are expected
> + * (single-queue hangs don't hit this path); whitelist them to avoid spurious
> + * dmesg-warn in CI.
> + */
> +static void ignore_multi_queue_hang_warnings_in_dmesg(void)
> +{
> +	igt_emit_ignore_dmesg_regex("Check job timeout: .*not started");
> +}
> +
>  int igt_main()
>  {
>  	const struct section {
> @@ -1735,6 +1748,9 @@ int igt_main()
>  				igt_assert(!(s->flags & BALANCER));
>  			}
>  
> +			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))

or just:
			if ((s->flags & (MULTI_QUEUE | HANG))

See also note from Priyanka.



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
