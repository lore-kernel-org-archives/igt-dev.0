Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A722C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 12:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD7610E361;
	Mon, 24 Feb 2025 12:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRmGoeN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475E310E361
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740398507; x=1771934507;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WHm12f+15zcg1Isiv34dTWvj3YVcdQ/Sv5JopMXxm7M=;
 b=eRmGoeN95EWUGTW1Ub7bPdyHcCLIJ6wGvtOOEzv2t4Hh7CkRPIZ4NRmr
 qgaUQsSfleZ/EwvmuSNS1kBAwuAktfQTIQX+W7TqfQxDdcehItfIl1alP
 zFak/ITf9iHEMYbWCGdcUtzaceymayr95ADqWnIs67z8zfRnII1Z0VF92
 ZdsjD6Tie2sfGRTgMvlr4XXhPwOuP12lYWspbfzQli9uilkMhh+7jsaMJ
 MFmmg4XuR3/1NDIbPY2zzzDGrT6CeiYA1N5gQlMp9Xm1OD/9r1NPcb1ND
 NDbiS51wS193u3OEHhXj9Ot17SHKKkTwzBH4J4tlYhUhUbEsDixdj7ASY Q==;
X-CSE-ConnectionGUID: nbXoA26UQnuKR51ECOwXUQ==
X-CSE-MsgGUID: 3s/BtagvSpWliGhNQYuvfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="63618946"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="63618946"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 04:01:47 -0800
X-CSE-ConnectionGUID: PVnNI1U2TLW51JChJYPjGQ==
X-CSE-MsgGUID: e5mcDaUqT0KBjofoe5PH2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153239364"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 04:01:45 -0800
Date: Mon, 24 Feb 2025 13:01:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com,
 lucas.demarchi@intel.com, adrinael@adrinael.net
Subject: Re: [PATCH i-g-t v2] lib/igt_core: Add ftrace logs at test boundaries
Message-ID: <20250224120142.7h3ezj53kacvouf7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com,
 lucas.demarchi@intel.com, adrinael@adrinael.net
References: <20250221223823.2336228-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221223823.2336228-1-umesh.nerlige.ramappa@intel.com>
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

Hi Umesh,
On 2025-02-21 at 14:38:23 -0800, Umesh Nerlige Ramappa wrote:
> When looking at kernel ftrace output, it would really help to see the
> test start/exit boundaries.
> 
> v2: Fix copy paste error
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index b95db1b25..9702a9417 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1324,6 +1324,7 @@ out:
>  	if (!igt_only_list_subtests()) {
>  		bind_fbcon(false);
>  		igt_kmsg(KMSG_INFO "%s: executing\n", command_str);
> +		igt_trace("%s: executing\n", command_str);
>  		print_version();
>  		igt_srandom();
>  
> @@ -1528,6 +1529,7 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
>  
>  	igt_kmsg(KMSG_INFO "%s: starting subtest %s\n",
>  		 command_str, subtest_name);
> +	igt_trace("%s: starting subtest %s\n", command_str, subtest_name);
>  	_subtest_starting_message(_SUBTEST_TYPE_NORMAL, subtest_name);
>  
>  	_igt_log_buffer_reset();
> @@ -1681,6 +1683,8 @@ __noreturn static void exit_subtest(const char *result)
>  				igt_time_elapsed(thentime, &now));
>  	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
>  		 command_str, *subtest_name, result);
> +	igt_trace("%s: finished subtest %s, %s\n",
> +		  command_str, *subtest_name, result);
>  
>  	igt_terminate_spins();
>  
> -- 
> 2.34.1
> 
