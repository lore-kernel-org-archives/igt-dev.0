Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E09E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 17:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6BC10E2B5;
	Mon,  9 Dec 2024 17:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbkHppVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA00A10E2B6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733765477; x=1765301477;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g86Yko85PocMLXCI2iGYqETcpafXo+y1O/nZojYY5kg=;
 b=bbkHppVt3j1d8p4tRMgxL2zI9vGPW4tRW+Mg6AiYAuA5rpOABJEYIVL1
 HBmE518+tXqB5u4znSMdm+YC4XoDr/mtXmEUnEQDHGeUEFWjbrlBQuFKH
 VT+bO3aetKIwJrKH3zbP5KJaOgXXlORR7O9U525VXZBlUU5rrwolBNrdS
 tFuXS2k8pLg7vIsfn9zxCJ5+8yr35RW5Eqtz9gXDMwno99rshqQrCO9aT
 D6+1qmym9GlzWgo+Lxsi+4yvyFkhNMRMNqPoUQgqUVr6BWrkuebnRqc0C
 wFY4Kb1GQf/UmOQTZ0McCQBLefezP9mpP9TUEZ9KNlWqDlkwZZq7j5r1t w==;
X-CSE-ConnectionGUID: ZLLzQrScRiylWsMAzklOKg==
X-CSE-MsgGUID: pwox2mCiTWe7zSVK1lZkww==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33415576"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="33415576"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 09:31:17 -0800
X-CSE-ConnectionGUID: LcVfELO6QZqjpBG0oHhPHA==
X-CSE-MsgGUID: /+aezwqPTqCjlJt6pZA9fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95208255"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 09:31:15 -0800
Date: Mon, 9 Dec 2024 18:31:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/2] Revert "tests/intel/xe_sysfs_timeslice_duration:
 Restore preempt timeout"
Message-ID: <20241209173113.uwm35ukncv2qlvy6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241206215459.128077-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241206215459.128077-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-12-06 at 21:54:58 +0000, Jonathan Cavitt wrote:
> This reverts commit f33842ab06b7470c9c9ec482bfd123b2d58507af.
> 
> The commit refers to the wrong link in the Closes field, so that needs
> to be changed.

Nak, as discussed offline imho we should live with wrong 'Closes' tag,
just make sure you correct this in GitLab issues. You could also send
replay to original wrong merged patch so it will be possible to find-out
later on lore.kernel.org

Regards,
Kamil

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_sysfs_timeslice_duration.c | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
> index 752672691f..899093a9df 100644
> --- a/tests/intel/xe_sysfs_timeslice_duration.c
> +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> @@ -115,11 +115,10 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
>  static void test_timeout(int fd, int engine, const char **property, uint16_t class, int gt)
>  {
>  	uint64_t delays[] = { 1000, 50000, 100000, 500000 };
> -	unsigned int saved, old_pt;
> +	unsigned int saved;
>  	uint64_t elapsed;
>  	uint64_t epsilon;
>  
> -	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &old_pt) == 1);
>  	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1) == 1);
>  	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
>  	igt_debug("Initial %s:%u\n", property[0], saved);
> @@ -141,9 +140,6 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
>  	}
>  
>  	set_timeslice_duration(engine, saved);
> -	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us", "%u", old_pt));
> -	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
> -	igt_assert_eq(saved, old_pt);
>  }
>  
>  #define	MAX_GTS	8
> @@ -163,7 +159,6 @@ igt_main
>  	int gt_count = 0;
>  	int fd = -1, sys_fd, gt;
>  	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
> -	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
>  	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
>  	int *engine_list[MAX_GTS];
>  
> @@ -189,8 +184,6 @@ igt_main
>  			while (list[i] != -1) {
>  				igt_require(igt_sysfs_scanf(list[i], "timeslice_duration_us", "%u",
>  							    &tds[gt_count][i]) == 1);
> -				igt_require(igt_sysfs_scanf(list[i], "preempt_timeout_us", "%u",
> -							    &pts[gt_count][i]) == 1);
>  				i++;
>  			}
>  
> @@ -222,16 +215,8 @@ igt_main
>  			while (list[j] != -1) {
>  				unsigned int store = UINT_MAX;
>  
> -				igt_sysfs_printf(list[j], "preempt_timeout_us",
> -						 "%u", pts[i][j]);
> -				igt_sysfs_scanf(list[j], "preempt_timeout_us",
> -						"%u", &store);
> -				igt_abort_on_f(store != pts[i][j],
> -					       "preempt_timeout_us not restored!\n");
> -
> -				store = UINT_MAX;
>  				igt_sysfs_printf(list[j], "timeslice_duration_us",
> -						 "%u", tds[i][j]);
> +						"%u", tds[i][j]);
>  				igt_sysfs_scanf(list[j], "timeslice_duration_us",
>  						"%u", &store);
>  				igt_abort_on_f(store != tds[i][j],
> -- 
> 2.43.0
> 
