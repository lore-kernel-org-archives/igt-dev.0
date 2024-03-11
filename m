Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7C9C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 12:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B4710EC93;
	Mon, 11 Mar 2024 12:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipsO2GTF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A82C10EC93
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710161130; x=1741697130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZKHBNIU6yVxhs2PdmMQLgDxyuXnFCMt6g9dWegSEEOI=;
 b=ipsO2GTF3c8p9QA4PvM1Jt6gDZ+MVT19YbZCqFt2NRbNw/m77ZDtJOSa
 A16doUNDXGSvP87DnQrDvVePe/jAw5KnlYxIEzWo0fxfmGPr0wLWumua+
 7EJTdtN2da1KoCaf30giEv3Ci7uoZTCdPfhfeRhp1X2EmT088dNBHdggJ
 MFZ+RY23LBzF6DSuMvUWdPIq1BwZZqi49f2JXNspIKEnmjGMRETL9OHyX
 nzlXVAt57FaqQVMkfwA4KVOg5M/aD6QqZ0NCZZ1AsvF3Dqjwx6sIG478/
 N6Omqg+tmAsyo4GYcbSmfulhmF4iSGa5CupUbwfBnA3qTiGB8XWFaNvhH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4996709"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4996709"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 05:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15804612"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:45:18 -0700
Date: Mon, 11 Mar 2024 13:44:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3] lib/igt_kmod: Allow to load kunit from alias
Message-ID: <20240311124458.s6qjnwvrqqzx7g4n@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240308193149.2220807-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240308193149.2220807-1-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-03-08 at 11:31:49 -0800, Lucas De Marchi wrote:
> Instead of only allowing to load the from the module name, also allow it
> from alias by using kmod_module_new_from_lookup(). With that a user can
> have their on aliases and the kernel can also export a compat alias for
> future module renames.
> 
> There was a bug in libkmod <= 29 that would make
> kmod_module_new_from_lookup() return prematurely after a failed alias
> lookup when we don't have a modules.alias file in the modules dir. So
> add a workaround to check for -ENOSYS return code too. It should still
> be compatible with what we are doing here.
> 
> v2: Fallback to kmod_module_new_from_name() since the kmod ctx is also
>     used on builder machines to determine the test lists.
> v3: Add workaround to bug in libkmod
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index cc242838f..d581f9073 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1443,6 +1443,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  int igt_ktest_init(struct igt_ktest *tst,
>  		   const char *module_name)
>  {
> +	struct kmod_list *l = NULL;
>  	int err;
>  
>  	memset(tst, 0, sizeof(*tst));
> @@ -1453,9 +1454,25 @@ int igt_ktest_init(struct igt_ktest *tst,
>  
>  	tst->kmsg = -1;
>  
> -	err = kmod_module_new_from_name(kmod_ctx(), module_name, &tst->kmod);
> -	if (err)
> +	err = kmod_module_new_from_lookup(kmod_ctx(), module_name, &l);
> +
> +	/*
> +	 * Check for -ENOSYS to workaround bug in kmod_module_new_from_lookup()
> +	 * from libkmod <= 29
> +	 */
> +	if (err < 0 && err != -ENOSYS) {
>  		return err;
> +	}

You do not need braces here. With that fixed:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +
> +	/*
> +	 * Lookup may not resolve to a module when used to just list subtests,
> +	 * where module is not available. Fallback to _new_from_name().
> +	 */
> +	if (!l)
> +		return kmod_module_new_from_name(kmod_ctx(), module_name, &tst->kmod);
> +
> +	tst->kmod = kmod_module_get_module(l);
> +	kmod_module_unref_list(l);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
