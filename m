Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5741DC02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 15:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A5110E6ED;
	Wed, 15 Jan 2025 15:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jok54+s3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522A310E6ED
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736953312; x=1768489312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=afXzuXpEkbpBJMz+5ymfqO0kWmSsKSnCBjNc6d2duNE=;
 b=jok54+s3QptnJXzL1w90qRfXAwxjGoFXpJUraTq7RpQqMlXRqqyVamv3
 30tvaqkAC9tm7BWSzLMwT1eMSCnsk7XXwi3fGalx75itt3z4kiYUD1OJp
 +2yzFe9sCB+4H0QaL6bWA739h9arnKR0GmmkX929V633WyndFzkQ6q4H6
 27FTQI58HBXdLIVys7D1mfji+2FICFKyNbYEmcP0iPlZ4h0pUNL7xLaUN
 pFBfZGI5ptU8YgIcHkAn69JrxcTedDxJ414iHlWr9Vt7Zqk9tagIllmls
 tXALjfZhiPFofIy2av4dFxkwrQ6l6QrESdd2iPSdw2239pPRgSignvpu5 A==;
X-CSE-ConnectionGUID: 2e2DU7VOSyGOJ1jKvzJEHw==
X-CSE-MsgGUID: +zHw0v+zTEmRSdgl4LcjKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37449602"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="37449602"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:01:52 -0800
X-CSE-ConnectionGUID: WxUt1pZGQ9+6AeW9p9ZJFw==
X-CSE-MsgGUID: Lousigk+QPimD0h16ONFCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="105113616"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 07:01:50 -0800
Date: Wed, 15 Jan 2025 16:01:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, igt-dev@lists.freedesktop.org,
 krzysztof.karas@intel.com
Subject: Re: [PATCH] tests/intel/gem_exec_balancer: Decrease required load in
 `full` test
Message-ID: <20250115150148.xuntqr2bbaznz2tv@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
References: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
 <20241217162302.u52qy7ji5zlfahm5@kamilkon-desk.igk.intel.com>
 <Z2G-ELt9yrHygP6-@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z2G-ELt9yrHygP6-@ashyti-mobl2.lan>
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

Hi,
On 2024-12-17 at 19:08:16 +0100, Andi Shyti wrote:
> Hi,
> 
> this patch is wrongly formatted:
> 
>  - where is the versioning? (git format patch -v <N>). I think
>    this is v4.
>  - where is the changelog? (please after the '---' section).
> 
> Please don't overlook at them next time.
> 
> On Tue, Dec 17, 2024 at 05:23:02PM +0100, Kamil Konieczny wrote:
> > Hi Sebastian,
> > On 2024-12-17 at 15:06:41 +0000, Sebastian Brzezinka wrote:
> > > Adjust the minimal load in the `full` test. It's a minor tolerance
> > > issue expected 90% got 86.6%.
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13003
> > 
> > Remove empty line, with this
> 
> Can you fix it before merging to avoid another resend?
> 
> In any case:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks,
> Andi
> 

Applied, thanks!

Regards,
Kamil

> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > > 
> > > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > > ---
> > >  tests/intel/gem_exec_balancer.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> > > index c3f0c938b..46ea19a2a 100644
> > > --- a/tests/intel/gem_exec_balancer.c
> > > +++ b/tests/intel/gem_exec_balancer.c
> > > @@ -1815,7 +1815,7 @@ static void full(int i915, unsigned int flags)
> > >  
> > >  		free(ci);
> > >  
> > > -		igt_assert_f(load > 0.90,
> > > +		igt_assert_f(load > 0.85,
> > >  			     "minimum load for %d x class:%d was found to be only %.1f%% busy\n",
> > >  			     count, class, load*100);
> > >  		gem_quiescent_gpu(i915);
> > > -- 
> > > 2.34.1
> > > 
