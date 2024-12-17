Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D4AE77184
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 19:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6ADC10E641;
	Tue, 17 Dec 2024 19:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iiw2vnvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF00310E641
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734462450; x=1765998450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ckuUIsgbGkLouECLnFQHvEPEcUkftAhlhR7XAXRjya4=;
 b=Iiw2vnvicj1VpCOAkwkQ2I9OV4TJ4/5gIDvVHcn15FYqq8rDXZnHcKMi
 lqxaX+nNkL7EYYOSh7iOOaaPawZxm4561dd+AH/IiCNXWa26CtwAhk8y1
 0BKRmLobltDmvrYH0wBbubEf8s8r6BUMt9PHFXO1kRq6nxQHDp39ZEil/
 MMJQsl4cn+yMYyHPeaG8Y5wNP+N1cLpMZxQ4PNnPr9uJ/3axkKILf4wIH
 XJkIcZ0qyVbCN+QsLRUOUmBfVfePaPxASGbCU+C0fg9mtSlfXNgeHN+MS
 05PMvHQBz5JFCr7uuggz0hE76lmYPOLrASPCydnHe6AlpDdlFn0aK40ST Q==;
X-CSE-ConnectionGUID: xroiMuGxTUOvO9DXYzf8Lw==
X-CSE-MsgGUID: j14yioiSQF+Kr4dKZTEm7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34942388"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34942388"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:07:29 -0800
X-CSE-ConnectionGUID: v0H8J+qvTVaa8Ln1BAJ7Vw==
X-CSE-MsgGUID: oHEPpqAQTUuP54O72JttwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="98199962"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 11:07:27 -0800
Date: Tue, 17 Dec 2024 20:07:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
Subject: Re: [PATCH] tests/intel/gem_exec_balancer: Decrease required load in
 `full` test
Message-ID: <20241217190711.zbj5pnznlzdn2yx6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
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

Hi Andi,
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

Yes I could do it at merge time,

Regards,
Kamil

Btw such performace measuring is prone to some random noise,
when something on DUT will hog system.

Regards,
Kamil

> 
> In any case:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks,
> Andi
> 
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
