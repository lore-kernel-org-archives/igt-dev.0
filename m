Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE88E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3355C10EA4A;
	Tue, 17 Dec 2024 18:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfSJrB8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BA910EA4A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734458902; x=1765994902;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=U6Q+lHqg7O+frLRGcxGx4QxGEGMnTrETNrUNqsjJQQ4=;
 b=hfSJrB8uWMxRLcB+owIWioJ5eq88jWkIjoHRUcIUeBtHjRT5jBjFI4Av
 yYdGfeRHyU0RHkcmEitBZJ6y5uNmvbd+zKJ+avuH/bSXXuoXbQhzuY4QK
 sadzPXueVpea8eyOq4lCFLoroHjqViBkeCHrXBwUUh3ibnQG9tJ3ZLyDS
 dxI2bWNVYxo2qHmfWAoEQqrwWjYoSML71iji+mo7BiXYRfraZFqQ4uLQY
 A8YMzrLNZyCl+uXMdglOCFwThLT7lCiOYUczMzKEFZxa86uazOsZ5JeJQ
 0QvHkSKhfnhy1iHN7VOrXt9Y0TVAfToiW32vmkLoGiK1snqwFFXbDgpUx Q==;
X-CSE-ConnectionGUID: n+HNBFpPRGuRKQXDWCTnQA==
X-CSE-MsgGUID: magOFYLbQouCXv33nU525g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46309384"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="46309384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:08:22 -0800
X-CSE-ConnectionGUID: 2oaUUXEzSNi1BKySjpn2KA==
X-CSE-MsgGUID: UacNwKTDT3yZSS3E06iWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97478548"
Received: from carterle-desk.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.58])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:08:20 -0800
Date: Tue, 17 Dec 2024 19:08:16 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
Subject: Re: [PATCH] tests/intel/gem_exec_balancer: Decrease required load in
 `full` test
Message-ID: <Z2G-ELt9yrHygP6-@ashyti-mobl2.lan>
References: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
 <20241217162302.u52qy7ji5zlfahm5@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217162302.u52qy7ji5zlfahm5@kamilkon-desk.igk.intel.com>
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

this patch is wrongly formatted:

 - where is the versioning? (git format patch -v <N>). I think
   this is v4.
 - where is the changelog? (please after the '---' section).

Please don't overlook at them next time.

On Tue, Dec 17, 2024 at 05:23:02PM +0100, Kamil Konieczny wrote:
> Hi Sebastian,
> On 2024-12-17 at 15:06:41 +0000, Sebastian Brzezinka wrote:
> > Adjust the minimal load in the `full` test. It's a minor tolerance
> > issue expected 90% got 86.6%.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13003
> 
> Remove empty line, with this

Can you fix it before merging to avoid another resend?

In any case:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> > 
> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > ---
> >  tests/intel/gem_exec_balancer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> > index c3f0c938b..46ea19a2a 100644
> > --- a/tests/intel/gem_exec_balancer.c
> > +++ b/tests/intel/gem_exec_balancer.c
> > @@ -1815,7 +1815,7 @@ static void full(int i915, unsigned int flags)
> >  
> >  		free(ci);
> >  
> > -		igt_assert_f(load > 0.90,
> > +		igt_assert_f(load > 0.85,
> >  			     "minimum load for %d x class:%d was found to be only %.1f%% busy\n",
> >  			     count, class, load*100);
> >  		gem_quiescent_gpu(i915);
> > -- 
> > 2.34.1
> > 
