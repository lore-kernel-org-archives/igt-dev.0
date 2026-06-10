Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5682ACD8CB2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 15:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E43810EAC0;
	Wed, 10 Jun 2026 15:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsWvhZW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C18D10EAC0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781105395; x=1812641395;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uWesyaK3E1ualapNqUlZoVxMoCEp9KnbrmxGufbb+Yk=;
 b=GsWvhZW5uIuZaaBOX1HBODei4Q3vNoYhWQ2Qt2pKCcv8Cz23cyXWo1z6
 E94vlXuMVIZvysFp31VCUtohcpWkUT+D5tjp6A17IMc21kykqWyVuhgf3
 wld/I1xtf6Yi56sgz2Jrs0PitrADYEFMxbk+CDikP1+NRC1pLpZzZSno1
 xIEwWDsO7h98wuTsvdyCsVy+HD6t1PiN3fNF4wYGa7sTzxTQrcqGXcxS+
 glI3KJKyhJN4S6qKulx3VhwTUVp8xMceNgVeMxhl2lFby5qJCaYI6cMCu
 p68tbHdI1eFb6wwXg15rIwzOZ8vUPKTbq/ad6ovZF+M5kximpJWsFhHaI Q==;
X-CSE-ConnectionGUID: G8eLnPxlRMeHAZ24LuNMvw==
X-CSE-MsgGUID: rNNyhpFNTb6DU4m+IJTGxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81877620"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81877620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:29:55 -0700
X-CSE-ConnectionGUID: Kyu3KIEBRmiuOVhx4Or7GQ==
X-CSE-MsgGUID: VdARyLrtT+qWw0i6YSu7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="269882188"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 08:29:54 -0700
Date: Wed, 10 Jun 2026 17:29:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Distinguish dynamic subtest in
 finished messages
Message-ID: <20260610152928.yauflzchk2uf7szw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20260608193807.2616777-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608193807.2616777-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2026-06-09 at 01:08:07 +0530, Swati Sharma wrote:
> The exit_subtest() function always printed 'finished subtest' in kmsg
> and trace output regardless of whether it was a regular subtest or a
> dynamic subtest finishing. The 'starting' messages already correctly
> distinguish between the two ('starting subtest' vs 'starting dynamic
> subtest').
> 
> Fix the 'finished' messages to print 'finished dynamic subtest' for
> dynamic subtests, matching the starting message convention. This makes
> syslog parsing and test hang detection more accurate.

Should you add Closes tag here? See
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/198
Fix multiple results from one (dynamic) subtest reported

+cc Janusz
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

This could potentailly affect other CI pipelines, so
+cc Vitaly.

Regards,
Kamil

> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index dc3ac5304..a0d9c9d7d 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1733,10 +1733,12 @@ __noreturn static void exit_subtest(const char *result)
>  				*subtest_name,
>  				result,
>  				igt_time_elapsed(thentime, &now));
> -	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
> -		 command_str, *subtest_name, result);
> -	igt_trace("%s: finished subtest %s, %s\n",
> -		  command_str, *subtest_name, result);
> +	igt_kmsg(KMSG_INFO "%s: finished %s %s, %s\n",
> +		 command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
> +		 *subtest_name, result);
> +	igt_trace("%s: finished %s %s, %s\n",
> +		  command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
> +		  *subtest_name, result);
>  
>  	igt_terminate_spins();
>  
> -- 
> 2.25.1
> 
