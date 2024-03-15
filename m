Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B49C54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 06:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8E510FA32;
	Fri, 15 Mar 2024 06:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NoCCM3WK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F76010FA32
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 06:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710483363; x=1742019363;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H697GChBkvLnXyQ5SVGg/JJ9QLYt/9dvgmBbuR/ElAY=;
 b=NoCCM3WKbxQeS8wes2AZuh+l/6FwrldH6QBj10kq451snTz90MAR+zXb
 gSeGHxk1a3mzZBx/2mA9WjouxccQ1kNdri7Jx3Jb8LrVXgUpMjOzImFl8
 WbjbLfa7awa7XlH7MKHXNtjBn3vjFVKyhGUkTKCHrbih4gVrNPShzOyz+
 kHIT04/vOyCj+wI143rdm39vdDQKh20Cm1oLLoBhE+8/LUdrRG2duPvqJ
 o9500aWYeyIyDz5QdiivR0LDqzGOJ0r1aRLkHuQHC50dSYB2N8FkCNFIk
 UK6hQ/g5Zm/gX0rUfimVzLTZrtAD1Dc5fS3PJH7NpLLzPwc0jQun5E6CE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="8278328"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="8278328"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="13012814"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:15:55 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 81239580DA4;
 Thu, 14 Mar 2024 23:15:54 -0700 (PDT)
Date: Fri, 15 Mar 2024 07:15:51 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3] lib/igt_kmod: Allow to load kunit from alias
Message-ID: <20240315071551.0661aad9@maurocar-mobl2>
In-Reply-To: <20240308193149.2220807-1-lucas.demarchi@intel.com>
References: <20240308193149.2220807-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri,  8 Mar 2024 11:31:49 -0800
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

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

Hmm... if the bug is not present anymore on more modern libkmod versions,
shouldn't the code be verifying the libkmod version?

Also, better to add a link to the bug inside the comment, in case the
workaround would require maintenance in the future.

With that, feel free to add my:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> +	if (err < 0 && err != -ENOSYS) {
>  		return err;
> +	}
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
